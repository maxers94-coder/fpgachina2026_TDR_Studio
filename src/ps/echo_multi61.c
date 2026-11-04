#include "echo_multi61.h"
#include "unified2_model_data.h"
#include <math.h>
#include <stdio.h>
bool multi61_eligible(const unified2_peak *p)
{
    bool strong=p->kind==UNIFIED2_OPEN_LIKE || p->kind==UNIFIED2_SHORT_LIKE;
    return p->projection_available && !p->companion_mask && p->nominal_mm>=(strong?-250:750) && p->nominal_mm<=35000;
}
void multi61_select(const unified2_result *r,multi61_view *v)
{
    *v=(multi61_view){.first_mm=0,.span_mm=35000,.primary=-1};uint64_t strongest=0;
    for(unsigned i=0;i<r->count;++i){
        if(r->peaks[i].companion_mask)++v->pn_count;
        if(!multi61_eligible(&r->peaks[i]))continue;
        v->indices[v->count++]=i;
        if(r->peaks[i].nominal_mm>33000)++v->edge_count;
        uint64_t a=r->peaks[i].num<0?(uint64_t)(-r->peaks[i].num):(uint64_t)r->peaks[i].num;
        if(a>strongest){strongest=a;v->primary=(int)i;}
    }
    /* Different polarity calibrations can differ slightly: order by distance. */
    for(unsigned i=1;i<v->count;++i){unsigned x=v->indices[i],j=i;while(j && r->peaks[v->indices[j-1]].nominal_mm>r->peaks[x].nominal_mm){v->indices[j]=v->indices[j-1];--j;}v->indices[j]=x;}
    v->more=v->count>6?v->count-6:0;
}
void multi61_format_mm(char *text,size_t cap,int32_t mm)
{
    if(mm>=-250 && mm<250){snprintf(text,cap,"NEAR 0 m");return;}
    long a=mm<0?-(long)mm:(long)mm;
    snprintf(text,cap,"%s%ld.%03ld m%s",mm<0?"-":"",a/1000,a%1000,mm>33000?"*":"");
}
const char *multi61_kind(int kind)
{
    static const char *const names[]={"INVALID","POSITIVE_RETURN","NEGATIVE_RETURN","OPEN_LIKE","SHORT_LIKE","AMBIGUOUS_RETURN"};
    return (unsigned)kind<sizeof(names)/sizeof(names[0])?names[kind]:"INVALID";
}
static unsigned calibration(const unified2_peak *p)
{
    return (p->kind==UNIFIED2_OPEN_LIKE || p->kind==UNIFIED2_SHORT_LIKE?2u:0u)+(p->sign<0?1u:0u);
}
static double interpolated(const int64_t *c,int64_t dc,double lag,const unified2_result *r)
{
    if(lag<0 || lag>255)return 0;
    unsigned k=(unsigned)floor(lag);unsigned next=k<255?k+1:k;
    double a=(double)(128*c[k]-dc*65536),b=(double)(128*c[next]-dc*65536);
    double value=a+(b-a)*(lag-k);
    for(unsigned i=0;i<r->count;++i){
        int pk=r->peaks[i].lag;
        if(pk>0 && pk<255 && fabs(lag-pk)<=1.0){
            double left=(double)(128*c[pk-1]-dc*65536),mid=(double)(128*c[pk]-dc*65536),right=(double)(128*c[pk+1]-dc*65536),d=lag-pk;
            value=mid+(right-left)*0.5*d+(left-2*mid+right)*0.5*d*d;break;
        }
    }
    return value;
}
static double sample_mm(const int64_t *corr,int64_t dc,double mm,const unified2_result *r,const multi61_view *v)
{
    double selected=0;
    for(unsigned sign=0;sign<2;++sign){
        unsigned cal=sign;double best=1e99;
        if(v->primary>=0)cal=(calibration(&r->peaks[v->primary])&2u)+sign;
        for(unsigned i=0;i<r->count;++i){
            const unified2_peak *p=&r->peaks[i];if((p->sign<0?1u:0u)!=sign)continue;
            double delta=fabs(mm-p->nominal_mm);if(delta>best)continue;
            unsigned c=calibration(p);
            if(p->companion_mask){for(unsigned j=0;j<r->count;++j)if(p->companion_mask&(1u<<j)){c=(calibration(&r->peaks[j])&2u)+sign;break;}}
            best=delta;cal=c;
        }
        double lag=unified2_cal[cal][1]+mm/unified2_cal[cal][0];double value=interpolated(corr,dc,lag,r);
        if((sign==0?value>=0:value<=0) && fabs(value)>fabs(selected))selected=value;
    }
    return selected;
}
int multi61_build_plot(const int16_t *raw,const int16_t *base,const int64_t *corr,unsigned zoom,echo_hmi_wave_t *f,unified2_result *r,multi61_view *v)
{
    if(!raw || !base || !corr || !f || !r || !v || zoom>1 || f->count>768 || f->count<2)return -1;
    int64_t dc=0;for(unsigned i=0;i<128;++i)dc+=(int32_t)raw[i]-base[i];
    unified2_evaluate(corr,256,dc,1,1,r);if(!r->valid_input)return -1;
    multi61_select(r,v);
    if(zoom && v->count){
        int32_t low=r->peaks[v->indices[0]].nominal_mm,high=r->peaks[v->indices[v->count-1]].nominal_mm;
        int32_t first=(int32_t)floor((low-2000)/1000.0)*1000,last=(int32_t)ceil((high+2000)/1000.0)*1000;
        if(first<0)first=0;
        if(last>35000)last=35000;
        if(last-first<4000){if(first>31000)first=31000;last=first+4000;}
        v->first_mm=first;v->span_mm=last-first;
    }
    f->first=0;f->source_count=256;f->envelope=0;f->zero=(f->height+24u)/2u;
    unsigned radius=(f->height-24u)/2u-4u;int64_t scale=INT64_C(2147483648);
    for(unsigned p=0;p<f->count;++p){double value=sample_mm(corr,dc,v->first_mm+(double)v->span_mm*p/(f->count-1),r,v);while(fabs(value)>scale)scale*=2;}
    f->full_scale=scale/128;
    for(unsigned p=0;p<f->count;++p){double value=sample_mm(corr,dc,v->first_mm+(double)v->span_mm*p/(f->count-1),r,v);unsigned offset=(unsigned)floor(fabs(value)*radius/scale+0.5);f->pixels[p]=(uint8_t)(value<0?f->zero-offset:f->zero+offset);}
    return 0;
}
