#include "unified_candidate2.h"
#include "unified2_model_data.h"
#include <math.h>
static uint64_t magnitude(int64_t n){return n<0?(uint64_t)(-n):(uint64_t)n;}
static int64_t number(const int64_t *c,int64_t dc,unsigned i){return 128*c[i]-dc*65536;}
void unified2_evaluate(const int64_t *corr,size_t count,int64_t dc,int profile,int mask,unified2_result *out)
{
    if(!out)return;
    *out=(unified2_result){0};multi1_result selected;
    multi1_evaluate(corr,count,dc,&selected);
    if(!selected.valid_input)return;
    out->valid_input=true;out->profile_fitted=profile==1 && mask==1;
    out->overflow=selected.overflow;out->edge_above_gate=selected.edge_above_gate;
    if(!out->profile_fitted)return;
    out->count=selected.count;
    for(unsigned p=0;p<out->count;++p) {
        multi1_peak m=selected.peaks[p];unsigned k=(unsigned)m.lag;uint64_t absolute=magnitude(m.num),other=0;
        for(unsigned i=0;i<256;++i){int d=(int)i-(int)k;if(d < -4 || d>4){uint64_t a=magnitude(number(corr,dc,i));if(a>other)other=a;}}
        bool strong=absolute>=UINT64_C(137438953472) && absolute<=UINT64_C(549755813888) && absolute>=4*other;
        int kind=strong?(m.sign>0?UNIFIED2_OPEN_LIKE:UNIFIED2_SHORT_LIKE):absolute<=UINT64_C(68719476736)?(m.sign>0?UNIFIED2_POSITIVE:UNIFIED2_NEGATIVE):UNIFIED2_AMBIGUOUS;
        unsigned cal=(strong?2u:0u)+(m.sign<0?1u:0u);
        double a=(double)number(corr,dc,k-1),b=(double)m.num,c=(double)number(corr,dc,k+1);
        double denominator=2*(a-2*b+c),offset=denominator?(a-c)/denominator:0;
        double lag=m.lag+(fabs(offset)<=0.5?offset:0),mm=unified2_cal[cal][0]*(lag-unified2_cal[cal][1]);
        unified2_peak *dest=&out->peaks[p];
        *dest=(unified2_peak){.lag=m.lag,.sign=m.sign,.kind=kind,.num=m.num,.fractional_lag=lag,
            .nominal_mm=(int32_t)llround(mm),.projection_available=kind!=UNIFIED2_AMBIGUOUS,
            .near0_weak_extrapolation=!strong && mm<1000,.inside_requested_range=mm>=0 && mm<=33000};
        for(unsigned q=0;q<selected.count;++q) {
            multi1_peak dominant=selected.peaks[q];int d=m.lag-dominant.lag;if(d<0)d=-d;
            if(d<8 || magnitude(dominant.num)<=absolute)continue;
            double prediction=(double)dominant.num*unified2_pn_ratio[d];
            if(fabs(prediction)>536870912.0 && ((prediction>0)==(m.num>0)) && fabs((double)m.num-prediction)<=fmax(536870912.0,0.35*fabs(prediction)))dest->companion_mask|=1u<<q;
        }
    }
}
