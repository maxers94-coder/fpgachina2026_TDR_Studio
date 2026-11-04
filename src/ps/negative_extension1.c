#include "negative_extension1.h"
bool negative_extension1_project(const weak_candidate1_result *m,int profile,int mask,int32_t *mm)
{
    if(!mm)return false;
    *mm=-1;
    if(!m || profile!=1 || mask!=1 || m->status!=WEAK_CANDIDATE1_OUTSIDE_FIT_SPAN ||
       m->sign!=-1 || m->peak_lag<174 || m->peak_lag>193 ||
       m->abs_peak_num<=WEAK_CANDIDATE1_GATE_NUM || m->abs_peak_num>UINT64_C(68719476736))return false;
    *mm=500*(m->peak_lag-143);return true;
}
