#ifndef ECHO_CALIBRATION_H
#define ECHO_CALIBRATION_H

#include <stdint.h>
#define ECHO_AVERAGE_SAMPLES 1024u
#define ECHO_TEMPLATE_SAMPLES 640u

/* Call only with two 32-frame acquisitions of the same clock/cable setup:
 * zero-output baseline (mode 2), then a pulse with a known matched load.
 * Both arrays are signed ADC Q2 codes from echo_read_average_frame().
 * Baseline is copied verbatim; the first 640 baseline-subtracted reference
 * samples are normalized to Q14 for the existing PL correlator.
 */
int echo_make_calibration(const int16_t *zero_q2,
                          const int16_t *matched_pulse_q2,
                          int16_t *baseline_q2,
                          int16_t *template_q14);

#endif
