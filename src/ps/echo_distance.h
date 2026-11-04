#ifndef ECHO_DISTANCE_H
#define ECHO_DISTANCE_H

#include <stdint.h>
#include "echo_result.h"

/*
 * TDR timing calibration. All fields must come from the current
 * hardware configuration and measurements, not from test defaults.
 */
typedef struct {
    uint32_t sample_rate_hz;   /* Effective rate of the 256 correlation points */
    uint32_t lag_min;          /* True lag of correlation[0] */
    double propagation_m_s;   /* Measured wave propagation speed */
    double fixed_delay_s;     /* Calibrated t0, including template time origin */
} echo_distance_cal_t;

typedef struct {
    uint32_t lag;             /* Integer lag: lag_min + peak.index */
    double arrival_time_s;    /* (lag + fractional_lag) / sample_rate_hz */
    double roundtrip_time_s;  /* arrival_time_s - fixed_delay_s */
    double distance_m;        /* propagation_m_s * roundtrip_time_s / 2 */
} echo_distance_t;

/*
 * Convert a detected correlation peak to a physical cable distance.
 * fractional_lag is a per-measurement, sub-sample correction in [-0.5, +0.5].
 * Pass 0.0 when no validated interpolation is available (M6.1 default).
 *
 * Return 0 on success; -1 invalid peak/arguments;
 * -2 invalid calibration/correction; -3 nonphysical/overflowed delay.
 * No calibration is performed here. Negative calculated distances are rejected.
 */
int echo_peak_to_distance(const echo_peak_t *peak,
                          const echo_distance_cal_t *cal,
                          double fractional_lag,
                          echo_distance_t *out);

#endif /* ECHO_DISTANCE_H */
