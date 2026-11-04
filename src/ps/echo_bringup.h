#ifndef ECHO_BRINGUP_H
#define ECHO_BRINGUP_H

#include <stdint.h>
#include "echo_hw_info.h"

/* Only read-only interface checks; no coefficient writes or START commands. */
struct echo_bringup_report {
    struct echo_hw_info actual;
    uint32_t mismatch;
    uint32_t status;
    uint32_t last_error;
};

/*
 *  0: identity, configuration, and initial status are valid
 * -1: invalid arguments
 * -2: wrong PL IP identity
 * -3: version / configuration mismatch
 * -4: driver / MMIO initialization failure
 * -5: ADC not ready
 * -6: PL still busy (processing or acquisition)
 * -7: PL LAST_ERROR is nonzero
 */
int echo_bringup(uintptr_t base,
                 const struct echo_hw_info *expected,
                 struct echo_bringup_report *report);

#endif
