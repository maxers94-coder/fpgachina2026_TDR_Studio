#ifndef ECHO_DECISION_H
#define ECHO_DECISION_H

#include <stddef.h>
#include <stdint.h>
#include "echo_distance.h"

/* Preliminary V1 decision. CANDIDATE is not a validated fault diagnosis. */
typedef enum {
    ECHO_DECISION_NORMAL = 0,
    ECHO_DECISION_CANDIDATE,
    ECHO_DECISION_INVALID,
    ECHO_DECISION_AMBIGUOUS,
    ECHO_DECISION_RECALIBRATE
} echo_decision_kind_t;

typedef enum {
    ECHO_REASON_NONE = 0,
    ECHO_REASON_NOT_DONE,
    ECHO_REASON_BAD_RESULT_COUNT,
    ECHO_REASON_ADC_CLIP,
    ECHO_REASON_ARITH_OVERFLOW,
    ECHO_REASON_BASELINE_NOT_VALID,
    ECHO_REASON_CALIBRATION_NOT_VALID,
    ECHO_REASON_DISTANCE_UNRELIABLE
} echo_decision_reason_t;

typedef struct {
    size_t search_begin;         /* Inclusive array index; exclude near-end blind zone */
    size_t search_end;           /* Exclusive array index; <= 256 */
    uint64_t threshold_q16;     /* Development-set threshold, NOT a field-calibrated default */
    int baseline_valid;         /* Explicitly confirmed matching baseline */
    int calibration_valid;      /* Explicitly confirmed current timing calibration */
    double max_distance_m;      /* Registered search boundary, > 0 */
    echo_distance_cal_t timing;
} echo_decision_config_t;

typedef struct {
    echo_decision_kind_t kind;
    echo_decision_reason_t reason;
    echo_peak_t peak;           /* Only meaningful for CANDIDATE or AMBIGUOUS */
    echo_distance_t distance;   /* Meaningful only for CANDIDATE */
} echo_decision_output_t;

/*
 * Check measurement validity, find the largest signed-correlation candidate
 * and convert its peak location to distance (integer lag only, delta=0).
 *
 * Returns 0 when the output classification was produced; -1 for bad API
 * arguments. A return of 0 does NOT imply a detected fault.
 *
 * Correlation sign is NOT automatically the physical reflection polarity;
 * additional sign calibration and shape/consistency checks are pending.
 */
int echo_analyze_correlation(const int64_t *corr_q16, size_t count,
                             uint32_t pl_status,
                             const echo_decision_config_t *config,
                             echo_decision_output_t *output);

const char *echo_decision_kind_name(echo_decision_kind_t kind);
const char *echo_decision_reason_name(echo_decision_reason_t reason);

/*
 * M9.0: fixture-specific amplitude screening, SEPARATE from the
 * calibrated peak/distance decision API above.
 * Valid only for this exact board/DAC/splitter/cable/coefficients setup.
 * The names "matched_like/open_like" are not universal fault diagnoses.
 */
typedef enum {
    ECHO_FIXTURE_INVALID = 0,
    ECHO_FIXTURE_MATCHED_LIKE,
    ECHO_FIXTURE_OPEN_LIKE,
    ECHO_FIXTURE_UNCERTAIN
} echo_fixture_label_t;

typedef struct {
    int64_t matched_min_q16;   /* Inclusive */
    int64_t matched_max_q16;   /* Inclusive */
    int64_t open_min_q16;      /* Inclusive */
    int64_t open_max_q16;      /* Inclusive */
} echo_fixture_ranges_t;

typedef struct {
    echo_fixture_label_t label;
    int64_t mean_q16;
} echo_fixture_output_t;

/* Returns 0 on a completed screening, -1 on bad arguments.
 * An invalid PL status yields ECHO_FIXTURE_INVALID, not a diagnosis.
 * Mean uses integer arithmetic without overflowing a 64-bit sum.
 */
int echo_classify_fixture_mean(const int64_t *results_q16, size_t count,
                               uint32_t pl_status, uint32_t last_error,
                               const echo_fixture_ranges_t *ranges,
                               echo_fixture_output_t *out);
const char *echo_fixture_label_name(echo_fixture_label_t label);

#endif /* ECHO_DECISION_H */
