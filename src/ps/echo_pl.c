/* Zynq bare-metal Phase2 AXI-Lite driver; interface compatible with echo_pl.h.
 * REGMAP 0x00030001, 1024 baseline Q2 / 640 template Q14 / 256 results Q16.
 * This file intentionally contains no UART, UI, or TDR diagnosis logic.
 */
#include <stddef.h>
#include <stdint.h>

#include "echo_pl.h"
#include "echo_mmio.h"
#include "echo_pl_regs.h"

#define BASELINE_WORDS       1024u
#define TEMPLATE_WORDS       640u
#define COMMIT_POLL_LIMIT    200000u

static uintptr_t pl_base;
static int initialized;

static uint32_t reg_read(uint32_t offset)
{
    return mmio_read32(pl_base, offset);
}

static void reg_write(uint32_t offset, uint32_t value)
{
    mmio_write32(pl_base, offset, value);
}

static uint32_t crc32_byte(uint32_t state, uint8_t value)
{
    state ^= (uint32_t)value;
    for (unsigned i = 0u; i < 8u; ++i)
        state = (state & 1u) ? ((state >> 1) ^ UINT32_C(0xEDB88320))
                             : (state >> 1);
    return state;
}

static uint32_t crc32_coeff(uint32_t state, uint16_t word)
{
    state = crc32_byte(state, (uint8_t)(word & 0xffu));
    return crc32_byte(state, (uint8_t)((word >> 8) & 0xffu));
}

int echo_init(uintptr_t base)
{
    initialized = 0;
    uint32_t version = mmio_read32(base, ECHO_REG_VERSION);
    if (mmio_read32(base, ECHO_REG_IP_ID) != ECHO_IP_ID_VALUE ||
        (version != ECHO_IP_VERSION_PHASE2 && version != ECHO_IP_VERSION_PN17))
        return -1;
    pl_base = base;
    initialized = 1;
    return 0;
}

int echo_get_status(struct echo_status *status)
{
    if (!initialized || status == NULL)
        return -1;
    status->raw = reg_read(ECHO_REG_STATUS);
    status->last_error = reg_read(ECHO_REG_LAST_ERROR);
    return 0;
}

int echo_start(void)
{
    if (!initialized)
        return -1;
    reg_write(ECHO_REG_CONTROL, ECHO_CTRL_START);
    return 0;
}

int echo_clear_status(void)
{
    if (!initialized)
        return -1;
    reg_write(ECHO_REG_CONTROL, ECHO_CTRL_CLEAR_STATUS);
    return 0;
}

int echo_configure_pulse(uint8_t mode, uint8_t width)
{
    if (!initialized || (mode != 2u && mode < 5u) || mode > 7u ||
        width < 1u || width > 32u || (mode == 7u && (width & 1u)))
        return -1;
    if (reg_read(ECHO_REG_STATUS) & ECHO_STATUS_BUSY)
        return -2;
    uint32_t config = (uint32_t)mode | ((uint32_t)width << 8);
    reg_write(ECHO_REG_PULSE_CONFIG, config);
    return reg_read(ECHO_REG_PULSE_CONFIG) == config ? 0 : -3;
}

int echo_configure_waveform(int pn_enable)
{
    if (!initialized || (pn_enable != 0 && pn_enable != 1)) return -1;
    uint32_t version = reg_read(ECHO_REG_VERSION);
    if (version == ECHO_IP_VERSION_PHASE2) return pn_enable ? -3 : 0;
    if (version != ECHO_IP_VERSION_PN17 ||
        !(reg_read(ECHO_REG_CAPABILITIES) & ECHO_CAP_PN127_50M)) return -3;
    if (reg_read(ECHO_REG_STATUS) & ECHO_STATUS_BUSY) return -2;
    reg_write(ECHO_REG_WAVEFORM_CONFIG, (uint32_t)pn_enable);
    return reg_read(ECHO_REG_WAVEFORM_CONFIG) == (uint32_t)pn_enable ? 0 : -4;
}

int echo_get_transaction_count(uint32_t *count)
{
    if (!initialized || count == NULL)
        return -1;
    *count = reg_read(ECHO_REG_TRANSACTION_COUNT);
    return 0;
}

int echo_get_frame_count(uint32_t *count)
{
    if (!initialized || count == NULL)
        return -1;
    *count = reg_read(ECHO_REG_FRAME_COUNT);
    return 0;
}

int echo_read_average_frame(int16_t *dst, size_t capacity)
{
    if (!initialized || dst == NULL || capacity < BASELINE_WORDS)
        return -1;
    uint32_t status = reg_read(ECHO_REG_STATUS);
    if (status & ECHO_STATUS_BUSY)
        return -2;
    if (!(status & ECHO_STATUS_DONE) ||
        (status & (ECHO_STATUS_CLIP | ECHO_STATUS_AVG_OVERFLOW |
                   ECHO_FRAME_ERROR)))
        return -3;
    if ((reg_read(ECHO_REG_AVERAGE_VALID) & 2u) == 0u ||
        reg_read(ECHO_REG_FRAME_COUNT) != 32u ||
        reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -3;
    uint32_t tx_before = reg_read(ECHO_REG_TRANSACTION_COUNT);
    for (uint32_t i = 0u; i < BASELINE_WORDS; ++i) {
        reg_write(ECHO_REG_AVERAGE_ADDR, i);
        if ((reg_read(ECHO_REG_AVERAGE_VALID) & 1u) == 0u)
            return -4;
        dst[i] = (int16_t)(uint16_t)reg_read(ECHO_REG_AVERAGE_DATA);
    }
    if (tx_before != reg_read(ECHO_REG_TRANSACTION_COUNT) ||
        reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -5;
    return 0;
}

/* Phase2 uses separate *COUNT and *CRC registers for load completion.
 * The ADDR readback saturates at the final valid index, NOT N or L.
 */
static int load_table(const int16_t *data, size_t count,
                      size_t required_count, uint32_t addr_reg,
                      uint32_t data_reg, uint32_t count_reg,
                      uint32_t crc_reg, uint32_t complete_bit)
{
    if (!initialized || data == NULL || count != required_count)
        return -1;
    if (reg_read(ECHO_REG_STATUS) & ECHO_STATUS_BUSY)
        return -2;
    if (reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -5;

    reg_write(addr_reg, 0u);
    uint32_t crc = UINT32_C(0xffffffff);
    for (size_t i = 0u; i < count; ++i) {
        uint16_t word = (uint16_t)data[i];
        reg_write(data_reg, (uint32_t)word);
        crc = crc32_coeff(crc, word);
    }
    crc = ~crc;

    if (reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -5;
    if (reg_read(count_reg) != required_count ||
        (reg_read(ECHO_REG_COEFF_STATUS) & complete_bit) == 0u)
        return -3;
    if (reg_read(crc_reg) != crc)
        return -4;
    return 0;
}

int echo_load_baseline(const int16_t *data, size_t count)
{
    return load_table(data, count, BASELINE_WORDS,
                      ECHO_REG_BASELINE_ADDR, ECHO_REG_BASELINE_DATA,
                      ECHO_REG_BASELINE_COUNT, ECHO_REG_BASELINE_CRC,
                      ECHO_COEFF_BASELINE_COMPLETE);
}

int echo_load_template(const int16_t *data, size_t count)
{
    return load_table(data, count, TEMPLATE_WORDS,
                      ECHO_REG_TEMPLATE_ADDR, ECHO_REG_TEMPLATE_DATA,
                      ECHO_REG_TEMPLATE_COUNT, ECHO_REG_TEMPLATE_CRC,
                      ECHO_COEFF_TEMPLATE_COMPLETE);
}

static int commit_one(uint32_t command, uint32_t bank_bit,
                      uint32_t accepted_bit, uint32_t rejected_bit)
{
    uint32_t bank_before = reg_read(ECHO_REG_STATUS) & bank_bit;
    reg_write(ECHO_REG_CONTROL, command);
    /* The PL processes commit asynchronously: do not read once and fail. */
    for (uint32_t poll = 0u; poll < COMMIT_POLL_LIMIT; ++poll) {
        uint32_t status = reg_read(ECHO_REG_STATUS);
        uint32_t coeff = reg_read(ECHO_REG_COEFF_STATUS);
        if (reg_read(ECHO_REG_LAST_ERROR) || (coeff & rejected_bit))
            return -5;
        if (((status & bank_bit) != bank_before) &&
            (coeff & accepted_bit))
            return 0;
    }
    return -4;
}

int echo_commit_coefficients(void)
{
    if (!initialized)
        return -1;
    if (reg_read(ECHO_REG_STATUS) & ECHO_STATUS_BUSY)
        return -2;
    if (reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -5;
    if (reg_read(ECHO_REG_BASELINE_COUNT) != BASELINE_WORDS ||
        reg_read(ECHO_REG_TEMPLATE_COUNT) != TEMPLATE_WORDS ||
        (reg_read(ECHO_REG_COEFF_STATUS) &
         (ECHO_COEFF_BASELINE_COMPLETE | ECHO_COEFF_TEMPLATE_COMPLETE)) !=
         (ECHO_COEFF_BASELINE_COMPLETE | ECHO_COEFF_TEMPLATE_COMPLETE))
        return -3;

    int rc = commit_one(ECHO_CTRL_BASELINE_COMMIT,
                        ECHO_STATUS_BASELINE_BANK,
                        ECHO_COEFF_BASELINE_COMMIT_ACCEPTED,
                        ECHO_COEFF_BASELINE_COMMIT_REJECTED);
    if (rc != 0)
        return rc;
    rc = commit_one(ECHO_CTRL_TEMPLATE_COMMIT,
                    ECHO_STATUS_TEMPLATE_BANK,
                    ECHO_COEFF_TEMPLATE_COMMIT_ACCEPTED,
                    ECHO_COEFF_TEMPLATE_COMMIT_REJECTED);
    if (rc != 0)
        return rc;
    return (reg_read(ECHO_REG_STATUS) & ECHO_STATUS_COEFF_VALID) ? 0 : -6;
}

int echo_read_results(int64_t *dst, size_t capacity)
{
    if (!initialized || dst == NULL || capacity < ECHO_RESULT_COUNT)
        return -1;

    uint32_t status = reg_read(ECHO_REG_STATUS);
    if (!(status & ECHO_STATUS_DONE) || (status & ECHO_STATUS_BUSY))
        return -2;
    if ((status & (ECHO_STATUS_CLIP | ECHO_STATUS_AVG_OVERFLOW |
                   ECHO_STATUS_CORR_OVERFLOW | ECHO_FRAME_ERROR)) ||
        reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -3;
    if (((status & ECHO_STATUS_RESULT_MASK) >> ECHO_STATUS_RESULT_SHIFT) !=
        ECHO_RESULT_COUNT ||
        reg_read(ECHO_REG_RESULT_COUNT) != ECHO_RESULT_COUNT ||
        reg_read(ECHO_REG_FRAME_COUNT) != 32u)
        return -4;

    uint32_t tx_before = reg_read(ECHO_REG_TRANSACTION_COUNT);
    for (uint32_t i = 0u; i < ECHO_RESULT_COUNT; ++i) {
        /* AXI write response waits for the PL result snapshot to settle. */
        reg_write(ECHO_REG_RESULT_ADDR, i);
        if ((reg_read(ECHO_REG_RESULT_VALID) & 1u) == 0u)
            return -3;
        uint32_t lo = reg_read(ECHO_REG_RESULT_DATA_LO);
        uint32_t hi = reg_read(ECHO_REG_RESULT_DATA_HI);
        dst[i] = (int64_t)(((uint64_t)hi << 32) | (uint64_t)lo);
    }

    status = reg_read(ECHO_REG_STATUS);
    if (tx_before != reg_read(ECHO_REG_TRANSACTION_COUNT) ||
        !(status & ECHO_STATUS_DONE) || (status & ECHO_STATUS_BUSY))
        return -5;
    if ((status & (ECHO_STATUS_CLIP | ECHO_STATUS_AVG_OVERFLOW |
                   ECHO_STATUS_CORR_OVERFLOW | ECHO_FRAME_ERROR)) ||
        reg_read(ECHO_REG_LAST_ERROR) != 0u)
        return -3;
    if (((status & ECHO_STATUS_RESULT_MASK) >> ECHO_STATUS_RESULT_SHIFT) !=
        ECHO_RESULT_COUNT ||
        reg_read(ECHO_REG_RESULT_COUNT) != ECHO_RESULT_COUNT ||
        reg_read(ECHO_REG_FRAME_COUNT) != 32u)
        return -4;
    return 0;
}
