#ifndef LONG_ENDPOINT1_H
#define LONG_ENDPOINT1_H
#include "return_candidate1.h"
/* Model3: nominal25-33m strong isolated endpoint returns only. Caller validates
 * coherent RAW/baseline/PN context. No length or expected polarity is an input. */
typedef enum {LONG1_INVALID=0,LONG1_REFERENCE_UNFITTED,LONG1_LOW_RETURN,
    LONG1_EDGE_PEAK,LONG1_OUTSIDE_FIT,LONG1_UNQUALIFIED,LONG1_OPEN_LIKE,LONG1_SHORT_LIKE} long_endpoint1_status;
typedef struct {long_endpoint1_status status;return_candidate1_result metric;
    int32_t L_mm;bool available;} long_endpoint1_result;
long_endpoint1_status long_endpoint1_evaluate(const int64_t *corr,size_t count,
    int64_t dc_sum,int profile,int mask,long_endpoint1_result *out);
const char *long_endpoint1_status_name(long_endpoint1_status s);
#endif
