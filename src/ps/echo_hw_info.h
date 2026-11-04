#ifndef ECHO_HW_INFO_H
#define ECHO_HW_INFO_H

#include <stdint.h>

/* Values are the actual values read from the PL register interface. */
struct echo_hw_info {
    uint32_t ip_id;
    uint16_t hw_version;
    uint16_t regmap_version;
    uint16_t n;
    uint16_t m;
    uint16_t l;
    uint16_t k;
    uint32_t sample_rate_hz;
};

enum echo_hw_mismatch {
    ECHO_HW_MISMATCH_HW_VERSION = 1u << 0,
    ECHO_HW_MISMATCH_REG_VERSION = 1u << 1,
    ECHO_HW_MISMATCH_N = 1u << 2,
    ECHO_HW_MISMATCH_M = 1u << 3,
    ECHO_HW_MISMATCH_L = 1u << 4,
    ECHO_HW_MISMATCH_K = 1u << 5,
    ECHO_HW_MISMATCH_SAMPLE_RATE = 1u << 6
};

/*
 * Return:
 *  0  Match
 * -1  Invalid argument
 * -2  IP_ID mismatch: wrong AXI slave or incompatible IP
 * -3  One or more version/configuration mismatches (*mismatch nonzero)
 *
 * The expected values must be agreed with the PL team before a board run.
 * On a mismatch, refuse to load coefficients or start a transaction.
 */
int echo_hw_check(uintptr_t base,
                  const struct echo_hw_info *expected,
                  struct echo_hw_info *actual,
                  uint32_t *mismatch);

#endif /* ECHO_HW_INFO_H */
