#include "multireturn_candidate1.h"
static uint64_t mag(int64_t v){return v<0?(uint64_t)(-v):(uint64_t)v;}
static int64_t val(const int64_t *c,int64_t dc,unsigned k){return 128*c[k]-dc*65536;}
void multi1_evaluate(const int64_t *corr,size_t count,int64_t dc,multi1_result *out)
{
    if(!out)return;
    *out=(multi1_result){0};
    if(!corr || count!=256 || dc < -INT64_C(8388480) || dc>INT64_C(8388480))return;
    for(unsigned k=0;k<256;++k)if(corr[k]<-INT64_C(140737488355328) || corr[k]>INT64_C(140737488355327))return;
    out->valid_input=true;
    out->edge_above_gate=mag(val(corr,dc,0))>UINT64_C(2147483648) || mag(val(corr,dc,255))>UINT64_C(2147483648);
    for(unsigned rank=0;rank<=MULTI1_MAX;++rank) {
        int best=-1;uint64_t strongest=0;
        for(unsigned k=1;k<255;++k) {
            uint64_t a=mag(val(corr,dc,k));
            if(a<=UINT64_C(2147483648) || a<=mag(val(corr,dc,k-1)) || a<mag(val(corr,dc,k+1)))continue;
            bool blocked=false;
            for(unsigned i=0;i<out->count;++i){int d=(int)k-out->peaks[i].lag;if(d<0)d=-d;if(d<MULTI1_MIN_SEPARATION)blocked=true;}
            if(!blocked && a>strongest){best=(int)k;strongest=a;}
        }
        if(best<0)break;
        if(rank==MULTI1_MAX){out->overflow=true;break;}
        int64_t n=val(corr,dc,(unsigned)best);
        out->peaks[out->count++]=(multi1_peak){best,n>0?1:-1,n};
    }
    for(unsigned i=1;i<out->count;++i){multi1_peak x=out->peaks[i];unsigned j=i;while(j && out->peaks[j-1].lag>x.lag){out->peaks[j]=out->peaks[j-1];--j;}out->peaks[j]=x;}
}
