#include "long_endpoint1.h"
long_endpoint1_status long_endpoint1_evaluate(const int64_t *corr,size_t count,
    int64_t dc_sum,int profile,int mask,long_endpoint1_result *out)
{
    if(!out)return LONG1_INVALID;
    *out=(long_endpoint1_result){.status=LONG1_INVALID,.metric={.lag=-1},.L_mm=-1,.available=false};
    if(return_candidate1_evaluate(corr,count,dc_sum,profile,mask,&out->metric)==RETURN1_INVALID_INPUT)return out->status;
    const return_candidate1_result *m=&out->metric;
    if(profile!=1 || mask!=1)out->status=LONG1_REFERENCE_UNFITTED;
    else if(m->abs_peak_num<=UINT64_C(2147483648))out->status=LONG1_LOW_RETURN;
    else if(m->lag==0 || m->lag==255)out->status=LONG1_EDGE_PEAK;
    else if(m->lag<194 || m->lag>210)out->status=LONG1_OUTSIDE_FIT;
    else if(m->abs_peak_num<UINT64_C(137438953472) || m->abs_peak_num>UINT64_C(549755813888) || m->abs_peak_num<4*m->other_abs_num)out->status=LONG1_UNQUALIFIED;
    else {out->status=m->sign>0?LONG1_OPEN_LIKE:LONG1_SHORT_LIKE;out->L_mm=500*(m->lag-144);out->available=true;}
    return out->status;
}
const char *long_endpoint1_status_name(long_endpoint1_status s)
{
    static const char *const names[]={"INVALID_INPUT","REFERENCE_UNFITTED","LOW_RETURN","EDGE_PEAK","OUTSIDE_LONG_FIT_SPAN","UNQUALIFIED_LONG_RETURN","LONG_OPEN_LIKE","LONG_SHORT_LIKE"};
    return (unsigned)s<sizeof(names)/sizeof(names[0])?names[s]:"INVALID_INPUT";
}
