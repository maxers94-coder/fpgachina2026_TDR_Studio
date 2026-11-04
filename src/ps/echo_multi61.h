#ifndef ECHO_MULTI61_H
#define ECHO_MULTI61_H
#include "unified_candidate2.h"
#include "echo_hmi_wave.h"
typedef struct {int32_t first_mm,span_mm;unsigned count,pn_count,more,edge_count;int primary;unsigned indices[MULTI1_MAX];} multi61_view;
/* Presentation only: up to35m observation window; >33m is explicitly EDGE.
 * Does not change a detector gate or the calibrated nominal maximum. */
bool multi61_eligible(const unified2_peak *p);
void multi61_select(const unified2_result *r,multi61_view *v);
void multi61_format_mm(char *text,size_t capacity,int32_t mm);
const char *multi61_kind(int kind);
int multi61_build_plot(const int16_t *raw,const int16_t *base,const int64_t *corr,unsigned zoom,echo_hmi_wave_t *frame,unified2_result *view_result,multi61_view *view);
#endif
