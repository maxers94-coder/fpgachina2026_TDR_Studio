#include "echo_hmi_wave.h"
#include <string.h>

static int64_t sample_value(const int16_t *raw, const int16_t *base,
                            const int64_t *corr, unsigned kind,
                            unsigned index, int64_t dc_sum)
{
    if (kind == ECHO_HMI_AVG32) return (int64_t)raw[index];
    if (kind == ECHO_HMI_DIFFERENCE)
        return ((int64_t)raw[index]-base[index])*128-dc_sum;
    return corr[index]*128-dc_sum*INT64_C(65536);
}

static uint8_t map_pixel(int64_t value, int64_t scale, unsigned zero, unsigned radius)
{
    uint64_t magnitude=(uint64_t)(value < 0 ? -value : value);
    unsigned offset=(unsigned)((magnitude*radius+(uint64_t)scale/2u)/(uint64_t)scale);
    return (uint8_t)(value < 0 ? zero-offset : zero+offset);
}

int echo_hmi_wave_build(const int16_t *raw, const int16_t *baseline,
                       const int64_t *corr, unsigned waveform,
                       unsigned kind, unsigned zoom, unsigned page,
                       echo_hmi_wave_t *out)
{
    if (!raw || !out || page>1u || kind>2u || zoom>1u || waveform>3u) return -1;
    if (kind != ECHO_HMI_AVG32 && (waveform != 3u || !baseline)) return -2;
    if (kind == ECHO_HMI_CORRELATION && !corr) return -2;
    int64_t dc_sum=0;
    if (kind != ECHO_HMI_AVG32)
        for (unsigned i=0;i<128u;++i) dc_sum+=(int32_t)raw[i]-baseline[i];
    if (kind == ECHO_HMI_CORRELATION) {
        const int64_t limit=INT64_C(640)*65535*32768;
        for (unsigned i=0;i<256u;++i) if (corr[i]<-limit || corr[i]>limit) return -3;
    }
    memset(out,0,sizeof(*out));
    out->kind=kind;
    out->component=page==0u ? 8u : 12u;
    out->x=16u; out->y=page==0u ? 96u : 112u;
    out->width=page==0u ? 512u : 768u;
    out->height=page==0u ? 224u : 240u;
    out->zero=out->height/2u;
    out->count=out->width;
    out->first=0u; out->source_count=kind==2u ? 256u : 1024u;
    if (zoom) {
        out->first=96u;
        out->source_count=kind==2u ? 128u : (waveform==1u || waveform==3u) ? 608u : 160u;
    }
    const int64_t denominator=kind==0u ? 1 : 128;
    int64_t scale=(kind==0u ? INT64_C(2048) : kind==1u ? INT64_C(1024) : INT64_C(2147483648))*denominator;
    for (unsigned i=out->first;i<out->first+out->source_count;++i) {
        int64_t v=sample_value(raw,baseline,corr,kind,i,dc_sum);
        int64_t a=v<0 ? -v : v;
        while (a>scale) scale*=2;
    }
    out->full_scale=scale/denominator;
    unsigned radius=out->zero-4u;
    if (out->source_count>out->count) {
        out->envelope=1u;
        unsigned bins=out->count/2u;
        for (unsigned b=0;b<bins;++b) {
            unsigned first=out->first+b*out->source_count/bins;
            unsigned end=out->first+(b+1u)*out->source_count/bins;
            int64_t low=sample_value(raw,baseline,corr,kind,first,dc_sum), high=low;
            unsigned low_i=first,high_i=first;
            for (unsigned i=first+1u;i<end;++i) {
                int64_t v=sample_value(raw,baseline,corr,kind,i,dc_sum);
                if (v<low) {low=v;low_i=i;}
                if (v>high) {high=v;high_i=i;}
            }
            out->pixels[2u*b]=map_pixel(low_i<=high_i?low:high,scale,out->zero,radius);
            out->pixels[2u*b+1u]=map_pixel(low_i<=high_i?high:low,scale,out->zero,radius);
        }
    } else {
        for (unsigned p=0;p<out->count;++p) {
            unsigned i=out->first+p*(out->source_count-1u)/(out->count-1u);
            out->pixels[p]=map_pixel(sample_value(raw,baseline,corr,kind,i,dc_sum),scale,out->zero,radius);
        }
    }
    return 0;
}
