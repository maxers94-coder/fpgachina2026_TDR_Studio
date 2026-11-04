#include "weak_candidate1.h"

static uint64_t magnitude(int64_t value)
{
    /* Also defined for INT64_MIN; validated arithmetic never reaches it. */
    return value < 0 ? (uint64_t)(-(value + INT64_C(1))) + UINT64_C(1)
                     : (uint64_t)value;
}

static void reset_result(weak_candidate1_result *result)
{
    result->status = WEAK_CANDIDATE1_INVALID_INPUT;
    result->peak_lag = -1;
    result->sign = 0;
    result->peak_num = INT64_C(0);
    result->abs_peak_num = UINT64_C(0);
    result->L_mm = -1;
    result->candidate_distance_available = false;
}

weak_candidate1_status weak_candidate1_evaluate(
    const int64_t *corr,
    size_t count,
    int64_t dc_sum_delta,
    weak_candidate1_result *result)
{
    size_t k;
    int64_t dc_correction;

    if (result == NULL) {
        return WEAK_CANDIDATE1_INVALID_INPUT;
    }
    reset_result(result);
    if (corr == NULL || count != WEAK_CANDIDATE1_COUNT ||
        dc_sum_delta < -WEAK_CANDIDATE1_DC_MAX ||
        dc_sum_delta > WEAK_CANDIDATE1_DC_MAX) {
        return result->status;
    }
    /* Validate the whole array before returning any measured fields. */
    for (k = 0; k < count; ++k) {
        if (corr[k] < WEAK_CANDIDATE1_CORR_MIN ||
            corr[k] > WEAK_CANDIDATE1_CORR_MAX) {
            return result->status;
        }
    }

    dc_correction = dc_sum_delta * WEAK_CANDIDATE1_TEMPLATE_SUM;
    for (k = 0; k < count; ++k) {
        /* Multiplication is defined for negative inputs; do not left-shift.
         * Signed48 correlation and bounded DC keep |N| below 2^55.
         */
        const int64_t numerator = corr[k] * WEAK_CANDIDATE1_DENOMINATOR -
                                  dc_correction;
        const uint64_t absolute = magnitude(numerator);
        if (k == 0 || absolute > result->abs_peak_num) {
            result->peak_lag = (int)k;
            result->peak_num = numerator;
            result->abs_peak_num = absolute;
        }
    }
    result->sign = (result->peak_num > 0) - (result->peak_num < 0);

    if (result->abs_peak_num <= WEAK_CANDIDATE1_GATE_NUM) {
        result->status = WEAK_CANDIDATE1_LOW_RETURN;
    } else if (result->peak_lag == 0 || result->peak_lag == 255) {
        result->status = WEAK_CANDIDATE1_EDGE_PEAK;
    } else if (result->sign > 0) {
        result->status = WEAK_CANDIDATE1_POSITIVE_UNFITTED;
    } else if (result->peak_lag < WEAK_CANDIDATE1_FIT_LAG_MIN ||
               result->peak_lag > WEAK_CANDIDATE1_FIT_LAG_MAX) {
        result->status = WEAK_CANDIDATE1_OUTSIDE_FIT_SPAN;
    } else {
        result->status = WEAK_CANDIDATE1_NEGATIVE_DISTANCE_CANDIDATE;
        result->L_mm = WEAK_CANDIDATE1_MM_PER_LAG *
                       (result->peak_lag - WEAK_CANDIDATE1_LAG_ZERO);
        result->candidate_distance_available = true;
    }
    return result->status;
}

const char *weak_candidate1_status_name(weak_candidate1_status status)
{
    switch (status) {
    case WEAK_CANDIDATE1_INVALID_INPUT: return "INVALID_INPUT";
    case WEAK_CANDIDATE1_LOW_RETURN: return "LOW_RETURN";
    case WEAK_CANDIDATE1_EDGE_PEAK: return "EDGE_PEAK";
    case WEAK_CANDIDATE1_POSITIVE_UNFITTED: return "POSITIVE_UNFITTED";
    case WEAK_CANDIDATE1_OUTSIDE_FIT_SPAN: return "OUTSIDE_FIT_SPAN";
    case WEAK_CANDIDATE1_NEGATIVE_DISTANCE_CANDIDATE:
        return "NEGATIVE_DISTANCE_CANDIDATE";
    default: return "INVALID_INPUT";
    }
}
