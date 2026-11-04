#ifndef ECHO_PN_RANGE_H
#define ECHO_PN_RANGE_H
#include <stdint.h>
#include <stddef.h>

typedef enum {
    ECHO_PN_LOW_RETURN = 0,
    ECHO_PN_STRONG_RETURN = 1,
    ECHO_PN_EDGE_PEAK = 2,
    ECHO_PN_UNSTABLE_PEAK = 3
} echo_pn_range_status_t;

typedef struct {
    echo_pn_range_status_t status;
    uint32_t peak_lag;
    int polarity;
    double fractional_lag;
    double distance_m;
    double difference_peak_q16;
    int within_fit_span;
} echo_pn_range_result_t;

/* Frozen 1m/15m distance model with fixed matched reference. Large-return
 * diagnostics only; LOW_RETURN is not a certified matched/weak-fault verdict.
 * Returns -1 for bad arguments, -2 for impossible correlation magnitude. */
int echo_pn_range_evaluate(const int16_t *raw, size_t raw_count,
                           const int64_t *corr, size_t corr_count,
                           echo_pn_range_result_t *result);
uint32_t echo_pn_range_gate_q16(void);
#endif
