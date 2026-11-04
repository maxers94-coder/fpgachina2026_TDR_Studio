#ifndef UNIFIED_CANDIDATE2_H
#define UNIFIED_CANDIDATE2_H
#include "multireturn_candidate1.h"
enum {UNIFIED2_POSITIVE=1,UNIFIED2_NEGATIVE,UNIFIED2_OPEN_LIKE,UNIFIED2_SHORT_LIKE,UNIFIED2_AMBIGUOUS};
typedef struct {int lag,sign,kind;int64_t num;double fractional_lag;int32_t nominal_mm;unsigned companion_mask;bool projection_available,near0_weak_extrapolation,inside_requested_range;} unified2_peak;
typedef struct {bool valid_input,profile_fitted,overflow,edge_above_gate;unsigned count;unified2_peak peaks[MULTI1_MAX];} unified2_result;
/* Host-development kernel, production integration pending. No physical length,
 * fixture identity or expected count is passed. No certified distance/fault count. */
void unified2_evaluate(const int64_t *corr,size_t count,int64_t dc,int profile,int mask,unified2_result *out);
#endif
