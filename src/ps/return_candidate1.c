#include "return_candidate1.h"

static uint64_t magnitude(int64_t v) {return v<0?(uint64_t)(-v):(uint64_t)v;}
return_candidate1_status return_candidate1_evaluate(const int64_t *corr,
    size_t count,int64_t dc_sum,int profile,int mask,return_candidate1_result *out) {
    size_t k;uint64_t mag=0,other=0;int64_t peak=0;int lag=0;
    return_candidate1_status s;
    if(out==NULL)return RETURN1_INVALID_INPUT;
    *out=(return_candidate1_result){RETURN1_INVALID_INPUT,-1,0,0,0,0,false,false};
    if(corr==NULL || count!=256 || dc_sum < -INT64_C(8388480) || dc_sum > INT64_C(8388480))return out->status;
    for(k=0;k<count;k++) {
        int64_t n;uint64_t a;
        if(corr[k] < -INT64_C(140737488355328) || corr[k] > INT64_C(140737488355327))return out->status;
        n=INT64_C(128)*corr[k]-dc_sum*INT64_C(65536);a=magnitude(n);
        if(a>mag){mag=a;peak=n;lag=(int)k;}
    }
    for(k=0;k<count;k++) {
        int delta=(int)k-lag;
        if(delta < -4 || delta > 4) {
            uint64_t a=magnitude(INT64_C(128)*corr[k]-dc_sum*INT64_C(65536));
            if(a>other)other=a;
        }
    }
    out->lag=lag;out->sign=(peak>0)-(peak<0);out->peak_num=peak;
    out->abs_peak_num=mag;out->other_abs_num=other;
    if(profile!=1 || mask!=1)s=RETURN1_REFERENCE_UNFITTED;
    else if(mag<=UINT64_C(2147483648))s=RETURN1_LOW_RETURN;
    else if(lag==0 || lag==255)s=RETURN1_EDGE_PEAK;
    else if(lag<153 || lag>173)s=RETURN1_OUTSIDE_FIT_SPAN;
    else if(mag<=UINT64_C(68719476736))s=peak>0?RETURN1_POSITIVE_RETURN:RETURN1_NEGATIVE_RETURN;
    else if(mag<UINT64_C(137438953472) || mag>UINT64_C(549755813888) || mag<4*other)s=RETURN1_AMBIGUOUS_RETURN;
    else s=peak>0?RETURN1_OPEN_LIKE:RETURN1_SHORT_LIKE;
    out->status=s;out->label_available=(s==RETURN1_POSITIVE_RETURN || s==RETURN1_NEGATIVE_RETURN || s==RETURN1_OPEN_LIKE || s==RETURN1_SHORT_LIKE);
    return s;
}
