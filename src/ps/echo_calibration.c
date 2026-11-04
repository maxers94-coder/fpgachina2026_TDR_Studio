#include <stddef.h>
#include <stdint.h>
#include "echo_calibration.h"

int echo_make_calibration(const int16_t *zero_q2,
                          const int16_t *matched_pulse_q2,
                          int16_t *baseline_q2,
                          int16_t *template_q14)
{
    if (zero_q2 == NULL || matched_pulse_q2 == NULL ||
        baseline_q2 == NULL || template_q14 == NULL)
        return -1;
    int32_t peak_abs = 0;
    for (uint32_t i = 0; i < ECHO_TEMPLATE_SAMPLES; ++i) {
        int32_t delta = (int32_t)matched_pulse_q2[i] - (int32_t)zero_q2[i];
        int32_t magnitude = delta < 0 ? -delta : delta;
        if (magnitude > peak_abs) peak_abs = magnitude;
    }
    if (peak_abs < 8) return -2; /* reference essentially absent */
    for (uint32_t i = 0; i < ECHO_AVERAGE_SAMPLES; ++i)
        baseline_q2[i] = zero_q2[i];
    for (uint32_t i = 0; i < ECHO_TEMPLATE_SAMPLES; ++i) {
        int64_t scaled =
            ((int64_t)matched_pulse_q2[i] - (int64_t)zero_q2[i]) * 16384;
        /* C division truncates toward zero; half-divisor gives nearest. */
        scaled += scaled < 0 ? -(peak_abs / 2) : (peak_abs / 2);
        template_q14[i] = (int16_t)(scaled / peak_abs);
    }
    return 0;
}
