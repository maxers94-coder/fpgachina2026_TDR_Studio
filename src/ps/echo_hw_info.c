#include "echo_hw_info.h"
#include "echo_mmio.h"
#include "echo_pl_regs.h"

int echo_hw_check(uintptr_t base,
                  const struct echo_hw_info *expected,
                  struct echo_hw_info *actual,
                  uint32_t *mismatch)
{
    if (expected == 0 || actual == 0 || mismatch == 0)
        return -1;

    *mismatch = 0u;

    /* Read identity first. Do not trust other registers if this fails. */
    actual->ip_id = mmio_read32(base, ECHO_REG_IP_ID);
    actual->hw_version = 0u;
    actual->regmap_version = 0u;
    actual->n = 0u;
    actual->m = 0u;
    actual->l = 0u;
    actual->k = 0u;
    actual->sample_rate_hz = 0u;

    if (actual->ip_id != ECHO_IP_ID_VALUE)
        return -2;

    uint32_t version = mmio_read32(base, ECHO_REG_VERSION);
    uint32_t nm = mmio_read32(base, ECHO_REG_CONFIG_N_M);
    uint32_t lk = mmio_read32(base, ECHO_REG_CONFIG_L_K);

    actual->hw_version = (uint16_t)(version >> 16);
    actual->regmap_version = (uint16_t)version;
    actual->n = (uint16_t)nm;
    actual->m = (uint16_t)(nm >> 16);
    actual->l = (uint16_t)lk;
    actual->k = (uint16_t)(lk >> 16);
    actual->sample_rate_hz = mmio_read32(base, ECHO_REG_SAMPLE_RATE_HZ);

    if (actual->hw_version != expected->hw_version)
        *mismatch |= ECHO_HW_MISMATCH_HW_VERSION;
    if (actual->regmap_version != expected->regmap_version)
        *mismatch |= ECHO_HW_MISMATCH_REG_VERSION;
    if (actual->n != expected->n)
        *mismatch |= ECHO_HW_MISMATCH_N;
    if (actual->m != expected->m)
        *mismatch |= ECHO_HW_MISMATCH_M;
    if (actual->l != expected->l)
        *mismatch |= ECHO_HW_MISMATCH_L;
    if (actual->k != expected->k)
        *mismatch |= ECHO_HW_MISMATCH_K;
    if (actual->sample_rate_hz != expected->sample_rate_hz)
        *mismatch |= ECHO_HW_MISMATCH_SAMPLE_RATE;

    return (*mismatch == 0u) ? 0 : -3;
}
