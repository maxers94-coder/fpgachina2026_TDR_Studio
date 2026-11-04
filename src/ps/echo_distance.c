#include <math.h>
#include <stdint.h>

#include "echo_distance.h"

#define ECHO_CORRELATION_COUNT 256u

int echo_peak_to_distance(const echo_peak_t *peak,
                          const echo_distance_cal_t *cal,
                          double fractional_lag,
                          echo_distance_t *out)
{
    if (peak == NULL || cal == NULL || out == NULL)
        return -1;

    /* Do not accidentally reuse a previously calculated position. */
    *out = (echo_distance_t){0};

    if (peak->index >= ECHO_CORRELATION_COUNT ||
        (peak->value_q16 > 0 && peak->polarity != 1) ||
        (peak->value_q16 < 0 && peak->polarity != -1) ||
        peak->value_q16 == 0)
        return -1;

    if (cal->sample_rate_hz == 0u ||
        !isfinite(cal->propagation_m_s) || cal->propagation_m_s <= 0.0 ||
        !isfinite(cal->fixed_delay_s) ||
        !isfinite(fractional_lag) ||
        fractional_lag < -0.5 || fractional_lag > 0.5)
        return -2;

    uint64_t lag64 = (uint64_t)cal->lag_min + (uint64_t)peak->index;
    if (lag64 > UINT32_MAX)
        return -3;

    const double effective_lag = (double)lag64 + fractional_lag;
    if (effective_lag < 0.0)
        return -3;

    const double arrival_s = effective_lag / (double)cal->sample_rate_hz;
    const double roundtrip_s = arrival_s - cal->fixed_delay_s;
    const double distance_m = 0.5 * cal->propagation_m_s * roundtrip_s;

    if (!isfinite(arrival_s) || !isfinite(roundtrip_s) ||
        !isfinite(distance_m) || roundtrip_s < 0.0 || distance_m < 0.0)
        return -3;

    out->lag = (uint32_t)lag64;
    out->arrival_time_s = arrival_s;
    out->roundtrip_time_s = roundtrip_s;
    out->distance_m = distance_m;
    return 0;
}
