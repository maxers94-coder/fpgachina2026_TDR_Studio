#include "echo_pn_range.h"
#include "echo_pn_range_data.h"
#include <string.h>

uint32_t echo_pn_range_gate_q16(void) { return (uint32_t)PN_RANGE_GATE_Q16; }

int echo_pn_range_evaluate(const int16_t *raw, size_t raw_count,
                           const int64_t *corr, size_t corr_count,
                           echo_pn_range_result_t *result)
{
    if (!raw || !corr || !result || raw_count != 1024 || corr_count != 256)
        return -1;
    memset(result, 0, sizeof(*result));
    int64_t sum = 0;
    for (unsigned i = 0; i < 128; ++i) sum += raw[i];
    const int64_t dc_numerator = 3 * sum - PN_RANGE_REF_PRE_SUM;
    int64_t differences[256];
    uint64_t magnitude = 0;
    unsigned peak = 0;
    /* Hardware worst case: 640 signed17-by-signed16 products. This bound
     * also guarantees every multiply/subtract below fits signed64. */
    const int64_t limit = INT64_C(640) * 65535 * 32768;
    for (unsigned i = 0; i < 256; ++i) {
        if (corr[i] < -limit || corr[i] > limit) return -2;
        differences[i] = (3 * corr[i] - pn_range_reference_corr_sum[i]) * 128
                         - dc_numerator * 65536;
        uint64_t current = (uint64_t)(differences[i] < 0 ? -differences[i] : differences[i]);
        if (current > magnitude) { peak = i; magnitude = current; }
    }
    result->peak_lag = peak;
    result->difference_peak_q16 = (double)differences[peak] / 384.0;
    if (magnitude < (uint64_t)(PN_RANGE_GATE_Q16 * 384)) {
        result->status = ECHO_PN_LOW_RETURN;
        return 0;
    }
    if (peak == 0 || peak == 255) {
        result->status = ECHO_PN_EDGE_PEAK;
        return 0;
    }
    const int sign = differences[peak] > 0 ? 1 : -1;
    double a = (double)differences[peak-1] * sign;
    double b = (double)differences[peak] * sign;
    double c = (double)differences[peak+1] * sign;
    double curvature = a - 2.0*b + c;
    if (curvature >= 0.0) {
        result->status = ECHO_PN_UNSTABLE_PEAK;
        return 0;
    }
    double fraction = 0.5 * (a-c) / curvature;
    if (fraction < -0.5 || fraction > 0.5) {
        result->status = ECHO_PN_UNSTABLE_PEAK;
        return 0;
    }
    result->status = ECHO_PN_STRONG_RETURN;
    result->polarity = sign;
    result->fractional_lag = peak + fraction;
    result->distance_m = (result->fractional_lag-PN_RANGE_OFFSET) / PN_RANGE_SAMPLES_PER_M;
    result->within_fit_span = result->distance_m >= 1.0 && result->distance_m <= 15.0;
    return 0;
}
