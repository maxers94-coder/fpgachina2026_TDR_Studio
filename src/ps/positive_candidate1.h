#ifndef POSITIVE_CANDIDATE1_H
#define POSITIVE_CANDIDATE1_H
#include "weak_candidate1.h"
typedef enum {
    POSITIVE_CANDIDATE1_INVALID_INPUT=0, POSITIVE_CANDIDATE1_LOW_RETURN,
    POSITIVE_CANDIDATE1_EDGE_PEAK, POSITIVE_CANDIDATE1_NEGATIVE_UNFITTED,
    POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN, POSITIVE_CANDIDATE1_DISTANCE
} positive_candidate1_status;
typedef struct {
    positive_candidate1_status status;
    int peak_lag,sign;
    int64_t peak_num;
    uint64_t abs_peak_num;
    int32_t L_mm;
    bool candidate_distance_available;
} positive_candidate1_result;
/* Frozen positive model SHA8b49823088b0cf74bf58677221f1f8d393b0b33dc523791466ab425b1f035e40.
 * Same validated global integer metric, gate and input bounds as negative1;
 * only positive residuals in lag153..173 have this nominal mapping.
 * Physical context/provenance and current display ownership are caller checks.
 */
positive_candidate1_status positive_candidate1_evaluate(const int64_t *corr,size_t count,int64_t dc,positive_candidate1_result *out);
const char *positive_candidate1_status_name(positive_candidate1_status status);
#endif
