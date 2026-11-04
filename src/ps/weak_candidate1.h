#ifndef WEAK_CANDIDATE1_H
#define WEAK_CANDIDATE1_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/* Frozen host-development candidate. Not a production fault detector.
 * Only the negative residual polarity has a nominal-distance fit. A distance
 * here is an unqualified diagnostic projection, never physical distance validity.
 */
#define WEAK_CANDIDATE1_COUNT ((size_t)256)
#define WEAK_CANDIDATE1_CORR_MIN (-INT64_C(140737488355328))
#define WEAK_CANDIDATE1_CORR_MAX INT64_C(140737488355327)
#define WEAK_CANDIDATE1_DC_MAX INT64_C(8388480)
#define WEAK_CANDIDATE1_DENOMINATOR INT64_C(128)
#define WEAK_CANDIDATE1_TEMPLATE_SUM INT64_C(65536)
#define WEAK_CANDIDATE1_GATE_Q16 INT64_C(16777216)
#define WEAK_CANDIDATE1_GATE_NUM UINT64_C(2147483648)
#define WEAK_CANDIDATE1_FIT_LAG_MIN 153
#define WEAK_CANDIDATE1_FIT_LAG_MAX 173
#define WEAK_CANDIDATE1_LAG_ZERO 143
#define WEAK_CANDIDATE1_MM_PER_LAG 500

typedef enum weak_candidate1_status {
    WEAK_CANDIDATE1_INVALID_INPUT = 0,
    WEAK_CANDIDATE1_LOW_RETURN = 1,
    WEAK_CANDIDATE1_EDGE_PEAK = 2,
    WEAK_CANDIDATE1_POSITIVE_UNFITTED = 3,
    WEAK_CANDIDATE1_OUTSIDE_FIT_SPAN = 4,
    WEAK_CANDIDATE1_NEGATIVE_DISTANCE_CANDIDATE = 5
} weak_candidate1_status;

typedef struct weak_candidate1_result {
    weak_candidate1_status status;
    int peak_lag;
    int sign;
    int64_t peak_num;
    uint64_t abs_peak_num;
    int32_t L_mm;
    bool candidate_distance_available;
} weak_candidate1_result;

/* Caller must first verify capture/baseline integrity and the frozen profile:
 * FS=200MSPS, PN127 at 50Mchip/s, amplitude=4096, 32 averaged frames,
 * verified far-end load and the declared provisional-barrel reference process.
 * This arithmetic helper cannot verify the physical setup or RAW provenance.
 * corr must contain exactly 256 signed-48-bit uncorrected Q16 correlations.
 * dc_sum_delta is the sum of the first 128 RAW-minus-reference Q2 samples.
 * For each k, N[k] = 128*corr[k] - dc_sum_delta*65536, using signed 64 bits.
 * The largest absolute N over all 256 lags wins; ties retain the lowest lag.
 * Strict abs(N) > 2^31 is required. Selection never receives a known position.
 * Every invalid input resets a non-NULL result (lag=-1, L_mm=-1).
 * A NULL result is invalid and cannot be reset. No input array is modified.
 */
weak_candidate1_status weak_candidate1_evaluate(
    const int64_t *corr,
    size_t count,
    int64_t dc_sum_delta,
    weak_candidate1_result *result);

const char *weak_candidate1_status_name(weak_candidate1_status status);

#endif
