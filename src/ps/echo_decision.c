#include <math.h>
#include <stdint.h>
#include <stddef.h>

#include "echo_decision.h"
#include "echo_pl_regs.h"

#define EXPECTED_K 256u

static int timing_usable(const echo_distance_cal_t *cal, size_t end)
{
    if (cal->sample_rate_hz == 0u ||
        !isfinite(cal->propagation_m_s) || cal->propagation_m_s <= 0.0 ||
        !isfinite(cal->fixed_delay_s))
        return 0;

    /* All requested correlation indices must fit the 32-bit physical lag. */
    if ((uint64_t)cal->lag_min + (uint64_t)(end - 1u) > UINT32_MAX)
        return 0;

    return 1;
}

int echo_analyze_correlation(const int64_t *corr_q16, size_t count,
                             uint32_t pl_status,
                             const echo_decision_config_t *config,
                             echo_decision_output_t *output)
{
    if (output == NULL)
        return -1;

    *output = (echo_decision_output_t){0};
    output->kind = ECHO_DECISION_INVALID;

    if (corr_q16 == NULL || config == NULL || count != EXPECTED_K ||
        config->search_begin >= config->search_end ||
        config->search_end > count ||
        !isfinite(config->max_distance_m) || config->max_distance_m <= 0.0)
        return -1;

    /* Hardware-quality errors take precedence over a plausible peak. */
    if ((pl_status & ECHO_STATUS_CLIP) != 0u) {
        output->reason = ECHO_REASON_ADC_CLIP;
        return 0;
    }
    if ((pl_status & (ECHO_STATUS_AVG_OVERFLOW |
                      ECHO_STATUS_CORR_OVERFLOW)) != 0u) {
        output->reason = ECHO_REASON_ARITH_OVERFLOW;
        return 0;
    }
    if ((pl_status & ECHO_STATUS_DONE) == 0u ||
        (pl_status & ECHO_STATUS_BUSY) != 0u) {
        output->reason = ECHO_REASON_NOT_DONE;
        return 0;
    }

    const uint32_t result_count =
        (pl_status & ECHO_STATUS_RESULT_MASK) >> ECHO_STATUS_RESULT_SHIFT;
    if (result_count != EXPECTED_K) {
        output->reason = ECHO_REASON_BAD_RESULT_COUNT;
        return 0;
    }

    if (!config->baseline_valid) {
        output->kind = ECHO_DECISION_RECALIBRATE;
        output->reason = ECHO_REASON_BASELINE_NOT_VALID;
        return 0;
    }
    if (!config->calibration_valid ||
        !timing_usable(&config->timing, config->search_end)) {
        output->kind = ECHO_DECISION_RECALIBRATE;
        output->reason = ECHO_REASON_CALIBRATION_NOT_VALID;
        return 0;
    }

    int found = echo_find_peak(corr_q16, count,
                               config->search_begin, config->search_end,
                               config->threshold_q16, &output->peak);
    if (found < 0)
        return -1;
    if (found == 1) {
        output->kind = ECHO_DECISION_NORMAL;
        return 0;
    }

    /* Do not fabricate fractional timing corrections. */
    const int rc = echo_peak_to_distance(&output->peak, &config->timing,
                                         0.0, &output->distance);
    if (rc != 0 || output->distance.distance_m > config->max_distance_m) {
        output->kind = ECHO_DECISION_AMBIGUOUS;
        output->reason = ECHO_REASON_DISTANCE_UNRELIABLE;
        output->distance = (echo_distance_t){0};
        return 0;
    }

    output->kind = ECHO_DECISION_CANDIDATE;
    return 0;
}

const char *echo_decision_kind_name(echo_decision_kind_t kind)
{
    switch (kind) {
    case ECHO_DECISION_NORMAL: return "normal";
    case ECHO_DECISION_CANDIDATE: return "candidate";
    case ECHO_DECISION_INVALID: return "invalid";
    case ECHO_DECISION_AMBIGUOUS: return "ambiguous";
    case ECHO_DECISION_RECALIBRATE: return "recalibrate";
    default: return "unknown";
    }
}

const char *echo_decision_reason_name(echo_decision_reason_t reason)
{
    switch (reason) {
    case ECHO_REASON_NONE: return "none";
    case ECHO_REASON_NOT_DONE: return "not_done";
    case ECHO_REASON_BAD_RESULT_COUNT: return "bad_result_count";
    case ECHO_REASON_ADC_CLIP: return "adc_clip";
    case ECHO_REASON_ARITH_OVERFLOW: return "arithmetic_overflow";
    case ECHO_REASON_BASELINE_NOT_VALID: return "baseline_not_valid";
    case ECHO_REASON_CALIBRATION_NOT_VALID: return "calibration_not_valid";
    case ECHO_REASON_DISTANCE_UNRELIABLE: return "distance_unreliable";
    default: return "unknown";
    }
}

/* M9.0 laboratory-only terminal classification; no distance calculation. */
int echo_classify_fixture_mean(const int64_t *results_q16, size_t count,
                               uint32_t pl_status, uint32_t last_error,
                               const echo_fixture_ranges_t *ranges,
                               echo_fixture_output_t *out)
{
    const uint32_t required = ECHO_STATUS_COEFF_VALID | ECHO_STATUS_ADC_READY |
                              ECHO_STATUS_START_ACCEPTED | ECHO_STATUS_DONE;
    const uint32_t forbidden = ECHO_STATUS_START_REJECTED | ECHO_STATUS_BUSY |
                               ECHO_STATUS_ACQ_BUSY | ECHO_STATUS_CLIP |
                               ECHO_STATUS_AVG_OVERFLOW |
                               ECHO_STATUS_CORR_OVERFLOW;

    if (out == NULL)
        return -1;
    *out = (echo_fixture_output_t){0};
    out->label = ECHO_FIXTURE_INVALID;

    if (results_q16 == NULL || ranges == NULL || count != EXPECTED_K ||
        ranges->matched_min_q16 > ranges->matched_max_q16 ||
        ranges->open_min_q16 > ranges->open_max_q16 ||
        ranges->matched_max_q16 >= ranges->open_min_q16)
        return -1;

    if ((pl_status & required) != required ||
        (pl_status & forbidden) != 0u || last_error != 0u ||
        ((pl_status & ECHO_STATUS_RESULT_MASK) >> ECHO_STATUS_RESULT_SHIFT) !=
            EXPECTED_K)
        return 0;

    /* Divide each input first to avoid adding 256 full-width int64 samples.
       Truncating quotients and remainders preserves signed mean truncation. */
    int64_t quotient_sum = 0;
    int64_t remainder_sum = 0;
    for (size_t i = 0u; i < count; ++i) {
        quotient_sum += results_q16[i] / (int64_t)EXPECTED_K;
        remainder_sum += results_q16[i] % (int64_t)EXPECTED_K;
    }
    out->mean_q16 = quotient_sum + remainder_sum / (int64_t)EXPECTED_K;

    if (out->mean_q16 >= ranges->matched_min_q16 &&
        out->mean_q16 <= ranges->matched_max_q16)
        out->label = ECHO_FIXTURE_MATCHED_LIKE;
    else if (out->mean_q16 >= ranges->open_min_q16 &&
             out->mean_q16 <= ranges->open_max_q16)
        out->label = ECHO_FIXTURE_OPEN_LIKE;
    else
        out->label = ECHO_FIXTURE_UNCERTAIN;

    return 0;
}

const char *echo_fixture_label_name(echo_fixture_label_t label)
{
    switch (label) {
    case ECHO_FIXTURE_INVALID: return "invalid";
    case ECHO_FIXTURE_MATCHED_LIKE: return "matched_like";
    case ECHO_FIXTURE_OPEN_LIKE: return "open_like";
    case ECHO_FIXTURE_UNCERTAIN: return "uncertain";
    default: return "unknown";
    }
}
