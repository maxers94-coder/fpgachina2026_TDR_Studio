#ifndef ECHO_LOCATOR_H
#define ECHO_LOCATOR_H
#include <stdint.h>
/* PS-HMI-13, exploratory open-end TDR locator. 200 MSPS; calibrated from
 * the 10m and 15m nominal cable lengths, not a qualified accuracy spec. */

 typedef enum {
    ECHO_LOCATOR_NONE  = 0,
    ECHO_LOCATOR_OPEN  = 1,
    ECHO_LOCATOR_SHORT = 2
} echo_locator_kind_t;


typedef struct {
    int found;
    echo_locator_kind_t kind;
    float delay_samples;
    float distance_m;
    float echo_peak_q2;
    float fit_r2;
    float input_dc_q2;
} echo_locator_result_t;
/* 0: computation performed, inspect found; -1: invalid arguments. */
int echo_locator_run(const int16_t raw_q2[1024], echo_locator_result_t *out);
#endif
