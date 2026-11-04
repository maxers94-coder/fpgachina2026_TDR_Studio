/* PS-HMI-13: no dynamic allocation, no libm, host- and Cortex-A9-compatible. */
#include "echo_locator.h"
#include "tdr_fixed_reference_q2x10.h"
#include <stddef.h>

#define DC_BEGIN 400
#define DC_END   1000  /* exclusive */
#define FIT_BEGIN 264
#define FIT_END   356   /* exclusive */
#define LAG_STEP  0.05f
#define LAG_STEPS 1400 /* 0..70 samples; ~34m extrapolated */
#define CAL_A     2.03547052f /* samples / m, calibrated only at 10,15 m */
#define CAL_B     0.10661064f /* sample offset */

static float kernel(float index)
{
    /* 15 elements at indices 266..280. Endpoints (266,280) are forced zero,
     * internal points 267..279 reproduce the offline pilot template. */
    if (index <= 266.0f || index >= 280.0f) return 0.0f;
    int n = (int)index; /* always >=266, safe float->int */
    float frac = index - (float)n;
    float a = (n <= 266) ? 0.0f : (float)tdr_fixed_reference_q2x10[n] * 0.1f;
    float b = (n + 1 >= 280) ? 0.0f : (float)tdr_fixed_reference_q2x10[n + 1] * 0.1f;
    return a + frac * (b - a);
}

static float score(float shift, const float y[FIT_END - FIT_BEGIN],
                   float energy_y, float *amp)
{
    float dot = 0.0f, t2 = 0.0f;
    for (int i = FIT_BEGIN; i < FIT_END; ++i) {
        float t = kernel((float)i - shift);
        dot += y[i-FIT_BEGIN]*t;
        t2 += t*t;
    }
    if (t2 <= 0.0f || energy_y <= 0.0f) {
        *amp = 0.0f;
        return 0.0f;
    }
    *amp = dot/t2;
    return (dot*dot)/(energy_y*t2); /* explained-energy ratio 0..1 */
}

int echo_locator_run(const int16_t raw_q2[1024], echo_locator_result_t *out)
{
    float dc=0.0f, y[FIT_END - FIT_BEGIN], energy=0.0f;
    float best_score=-1.0f, best_shift=0.0f, best_amp=0.0f;
    if (!raw_q2 || !out) return -1;
    for (int n=DC_BEGIN; n<DC_END; ++n) dc += (float)raw_q2[n];
    dc /= (float)(DC_END-DC_BEGIN);
    for (int n=FIT_BEGIN; n<FIT_END; ++n) {
        float v = ((float)raw_q2[n]-dc) -
                  0.1f*(float)tdr_fixed_reference_q2x10[n];
        y[n-FIT_BEGIN]=v;
        energy += v*v;
    }
    for (int j=0; j<=LAG_STEPS; ++j) {
        float amplitude, s=score((float)j*LAG_STEP,y,energy,&amplitude);
        if (s>best_score) {
            best_score=s;
            best_shift=(float)j*LAG_STEP;
            best_amp=amplitude;
        }
    }
    /* Refine to sub-grid precision via parabolic interpolation on the score.
     * This is interpolation, NOT an ADC timing resolution specification. */
    if (best_shift>=LAG_STEP && best_shift<=(float)LAG_STEPS*LAG_STEP-LAG_STEP) {
        float aa,bb,cc, unused;
        aa=score(best_shift-LAG_STEP,y,energy,&unused);
        bb=score(best_shift,y,energy,&unused);
        cc=score(best_shift+LAG_STEP,y,energy,&unused);
        float den=aa-2.0f*bb+cc;
        if (den < -1e-8f) {
            float offset=0.5f*(aa-cc)/den;
            if (offset > 1.0f) offset=1.0f;
            if (offset < -1.0f) offset=-1.0f;
            best_shift += offset*LAG_STEP;
            best_score=score(best_shift,y,energy,&best_amp);
        }
    }
    float template_peak=0.0f;
    for (int n=267;n<=279;++n) {
        float v=0.1f*(float)tdr_fixed_reference_q2x10[n];
        if (v>template_peak) template_peak=v;
    }
    out->delay_samples=best_shift;
    out->distance_m=(best_shift-CAL_B)/CAL_A;
    out->echo_peak_q2=best_amp*template_peak;
    out->fit_r2=best_score;
    out->input_dc_q2=dc;
    out->found = (
        (out->echo_peak_q2 >= 60.0f ||
        out->echo_peak_q2 <= -60.0f) &&
        best_score >= 0.80f &&
        out->distance_m >= 0.0f &&
        out->distance_m <= 30.0f
    );
    out->kind = !out->found ? ECHO_LOCATOR_NONE :
            (out->echo_peak_q2 > 0.0f ?
             ECHO_LOCATOR_OPEN : ECHO_LOCATOR_SHORT);
    return 0;
}
