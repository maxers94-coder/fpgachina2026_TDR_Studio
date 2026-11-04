#include "positive_candidate1.h"

positive_candidate1_status positive_candidate1_evaluate(const int64_t *corr,size_t count,int64_t dc,positive_candidate1_result *out)
{
    if (!out) return POSITIVE_CANDIDATE1_INVALID_INPUT;
    *out=(positive_candidate1_result){.status=POSITIVE_CANDIDATE1_INVALID_INPUT,.peak_lag=-1,.L_mm=-1};
    weak_candidate1_result metric;
    if (weak_candidate1_evaluate(corr,count,dc,&metric)==WEAK_CANDIDATE1_INVALID_INPUT)
        return out->status;
    out->peak_lag=metric.peak_lag;out->sign=metric.sign;
    out->peak_num=metric.peak_num;out->abs_peak_num=metric.abs_peak_num;
    if (metric.abs_peak_num<=WEAK_CANDIDATE1_GATE_NUM) out->status=POSITIVE_CANDIDATE1_LOW_RETURN;
    else if (metric.peak_lag==0 || metric.peak_lag==255) out->status=POSITIVE_CANDIDATE1_EDGE_PEAK;
    else if (metric.sign<0) out->status=POSITIVE_CANDIDATE1_NEGATIVE_UNFITTED;
    else if (metric.peak_lag<153 || metric.peak_lag>173) out->status=POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN;
    else {
        out->status=POSITIVE_CANDIDATE1_DISTANCE;
        out->L_mm=500*(metric.peak_lag-143);
        out->candidate_distance_available=true;
    }
    return out->status;
}

const char *positive_candidate1_status_name(positive_candidate1_status status)
{
    switch(status) {
    case POSITIVE_CANDIDATE1_LOW_RETURN:return "LOW_RETURN";
    case POSITIVE_CANDIDATE1_EDGE_PEAK:return "EDGE_PEAK";
    case POSITIVE_CANDIDATE1_NEGATIVE_UNFITTED:return "NEGATIVE_UNFITTED";
    case POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN:return "OUTSIDE_FIT_SPAN";
    case POSITIVE_CANDIDATE1_DISTANCE:return "POSITIVE_DISTANCE_CANDIDATE";
    default:return "INVALID_INPUT";
    }
}
