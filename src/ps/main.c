/*
 * ECHO200 + TJC HMI, Stage54 frozen long endpoint and bounded screen acknowledgements.
 * Screen SINGLE is healthy PN difference; PC L retains legacy Mode5.
 * Target: Zynq-7020 / Vitis 2026.1 Standalone / ECHO IP v3.1 or v3.2.
 * UART0 MIO10/11 = TJC screen; UART1 MIO48/49 = PC diagnostics.
 * L: new measurement; R: export last successful average without re-acquisition.
 * P: PN127 capture; Z: zero-output capture; C: cached PN correlation.
 * V: read hardware information; H/?: print command help.
 * DC baseline 566 Q2 is loaded in PL; the delta template is DIAGNOSTIC ONLY.
 * Successful measurements may be repeated; hardware failures require restart.
 */
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include <math.h>
#include "echo_multi61.h"
#ifndef ECHO_MULTI61_ENABLE
#define ECHO_MULTI61_ENABLE 1
#endif

#include "xparameters.h"
#include "xuartps.h"
#include "xstatus.h"
#include "sleep.h"
#include "xil_io.h"

#include "tdr_hmi_protocol.h"
#include "echo_mmio.h"
#include "echo_pl.h"
#include "echo_bringup.h"
#include "echo_transaction.h"
#include "echo_pl_regs.h"
#include "echo_locator.h"
#include "echo_pn.h"
#include "echo_pn_range.h"
#include "echo_healthy_baseline.h"
#include "echo_reference_guard.h"
#include "echo_hmi_wave.h"
#include "weak_candidate1.h"
#include "negative_extension1.h"
#include "positive_candidate1.h"
#include "return_candidate1.h"
#include "long_endpoint1.h"

#define ECHO_BASE                 ((uintptr_t)0x43C00000u)
#define ECHO_SAMPLE_RATE_HZ       200000000u
#define ECHO_CPU_CLOCK_HZ         UINT64_C(666666687)
#define ECHO_TIMEOUT_MS           1500u
#define ECHO_RESULTS              256u
#define ECHO_BASE_COUNT           1024u
#define ECHO_TEMPLATE_COUNT       640u
#define MODE5_TRANSACTIONS        1u
#define BASELINE_DC_Q2           566

#define GTIMER_LO_ADDR            ((UINTPTR)0xF8F00200u)
#define GTIMER_HI_ADDR            ((UINTPTR)0xF8F00204u)
#define GTIMER_CTRL_ADDR          ((UINTPTR)0xF8F00208u)

static XUartPs uart_screen;
static XUartPs uart_debug;
static tdr_hmi_parser_t parser;
static uint8_t current_page;
static int current_page_valid;
static int attempted;
static int busy;
static int batch_ok;
static int fatal_failure;
static uint32_t completed_runs;
static uint32_t measurement_seq;
static int average_available;
/* 0=Mode5, 1=legacy PN range, 2=zero DAC, 3=PL healthy difference. */
static unsigned diagnostic_waveform;
static echo_healthy_baseline_t healthy_baseline;
static uint32_t cached_baseline_id, cached_baseline_crc;
static uint32_t healthy_first_seq, healthy_last_seq;
static uint32_t healthy_guard_profile, healthy_guard_mask;
static weak_candidate1_result weak_candidate;
static positive_candidate1_result positive_candidate;
static return_candidate1_result return_candidate;
static long_endpoint1_result long_candidate;
static int long_candidate_selected;
static int negative_extension_selected;
static int32_t negative_extension_mm;
static int positive_candidate_selected;
static unified2_result multi61_result,multi61_plot_result;
static uint32_t multi61_list_seq;
static unsigned multi61_list_points,multi61_list_ack;
static multi61_view multi61_selected,multi61_plot_view;
static int multi61_append(char *line,size_t cap,int used,int axis);
static void publish_multi61_list(void);
static int multi61_display_owned(void);
static int draw_multi61_axis(const echo_hmi_wave_t *frame);
static int weak_candidate_cached, weak_candidate_profile_fitted, weak_candidate_drawn;
static uint32_t weak_candidate_seq, weak_candidate_base_id, weak_candidate_base_crc;
static uint32_t weak_candidate_epoch;
static int64_t weak_candidate_dc_sum_delta;
/* Presentation only: never reused as a measurement or exported candidate. */
static int continuous_distance_hold;
static uint32_t held_epoch, held_base_id, held_base_crc, held_session;
static unsigned plot_view, plot_view_explicit, plot_zoom;
static echo_hmi_wave_t plot_frame;
/* Both delivered native waveform controls have dir=0. The board observation
 * establishes right-to-left insertion. Keep logical pixels left-to-right;
 * compensate only the outgoing transparent payload, for all three views. */
static uint8_t screen_wire_pixels[ECHO_HMI_WAVE_MAX];
static int screen_bulk_active, screen_link_blocked, screen_reset_seen, screen_refresh_pending;
static int screen_deferred_error;
static uint32_t screen_page_epoch;
static tdr_hmi_event_t deferred_hmi[8];
static unsigned deferred_hmi_head, deferred_hmi_count;
static int last_plot_valid;
static uint32_t last_plot_seq, last_plot_crc;
static unsigned last_plot_page, last_plot_kind, last_plot_zoom;
static int last_plot_window;
static int correlation_available;
static echo_pn_range_result_t pn_range;
static int16_t pn_template_q14[ECHO_TEMPLATE_COUNT];
static int64_t correlation_q16[ECHO_RESULTS];
static int last_located;
static echo_locator_kind_t last_kind = ECHO_LOCATOR_NONE;
static long last_distance_mm;
static int16_t average_ref_q2[ECHO_BASE_COUNT];
static int16_t baseline_dc_q2[ECHO_BASE_COUNT];
static const int16_t template_test[ECHO_TEMPLATE_COUNT] = {[128] = 16384};

enum { TEXT_CACHE_SLOTS=12, FAST_SUMMARY_CAPACITY=4096 };
static struct { char widget[24], text[128]; } text_cache[TEXT_CACHE_SLOTS];
static unsigned text_cache_count;
static uint32_t text_cache_epoch=UINT32_MAX;
static unsigned text_cache_page=UINT32_MAX;
static int fast_active, fast_capture_failed, fast_saved_valid;
static int diagnostic_record_failed;
static char fast_summary[FAST_SUMMARY_CAPACITY];
static size_t fast_summary_used;
static unsigned fast_summary_lines, fast_plot_lines;
static uint32_t fast_saved_seq, fast_saved_base_id, fast_saved_base_crc;
static unsigned screen_ack_pending;
/* Keep ASCII replies below the UART FIFO capacity, including native page
 * notifications already queued when a second page redraw starts. */
enum { SCREEN_ACK_WINDOW=2 };
static int screen_paint_active;
static uint32_t screen_paint_epoch;
static int screen_pn_mode = 1;
static int screen_operation_active, screen_service_active;
static int reference_confirm_armed;
static uint32_t reference_confirm_epoch;
static uint64_t reference_confirm_deadline_ms;
static int reference_capture_failed;
enum { CONT_IDLE, CONT_RUNNING, CONT_STOP_PENDING, CONT_ERROR };
static unsigned continuous_state;
static uint32_t continuous_session, continuous_frames;
static uint32_t continuous_base_id, continuous_base_crc, continuous_last_seq;
static int continuous_internal_frame, continuous_stop_error;
static uint64_t continuous_request_ms;
static const char *continuous_reason;
static void service_screen_during_operation(void);
static void cancel_reference_confirmation(void);
static void continuous_reset(void);
static void continuous_request_stop(const char *reason, int error);
static void continuous_tick(void);
static void clear_weak_candidate(void);
static int settle_fast_screen(void);
static void blank_weak_distance_before_attempt(void);
static void publish_weak_candidate_distance(void);
static int send_record(const char *line);

static int continuous_active(void)
{
    return continuous_state==CONT_RUNNING || continuous_state==CONT_STOP_PENDING;
}

static const char *continuous_state_name(void)
{
    return continuous_state==CONT_RUNNING ? "RUNNING" :
           continuous_state==CONT_STOP_PENDING ? "STOP_PENDING" :
           continuous_state==CONT_ERROR ? "ERROR" : "IDLE";
}

static void invalidate_text_cache(void)
{
    text_cache_count=0;
    text_cache_epoch=screen_page_epoch;
    text_cache_page=current_page;
}

static int important_record(const char *line)
{
    return strstr(line,"[STOP]") || strstr(line,"FAILED") || strstr(line,"DENIED") ||
           strstr(line,"WAVE_ERROR") || strstr(line,"LCD error") ||
           strstr(line,"WARNING") || strstr(line,"[WARN]") ||
           strstr(line,"Deferred touch queue full");
}

static uint32_t reg32(uint32_t off)
{
    return mmio_read32(ECHO_BASE, off);
}

static void clear_weak_candidate(void)
{
    (void)weak_candidate1_evaluate(NULL, 0u, 0, &weak_candidate);
    (void)positive_candidate1_evaluate(NULL,0u,0,&positive_candidate);
    (void)return_candidate1_evaluate(NULL,0u,0,0,0,&return_candidate);
    (void)long_endpoint1_evaluate(NULL,0u,0,0,0,&long_candidate);
    long_candidate_selected=0;
    multi61_result=(unified2_result){0};multi61_select(&multi61_result,&multi61_selected);
    multi61_list_seq=0;multi61_list_points=multi61_list_ack=0;
    negative_extension_selected=0;negative_extension_mm=-1;
    positive_candidate_selected=0;
    weak_candidate_cached=weak_candidate_profile_fitted=weak_candidate_drawn=0;
    weak_candidate_seq=weak_candidate_base_id=weak_candidate_base_crc=0u;
    weak_candidate_epoch=0u;weak_candidate_dc_sum_delta=0;
    continuous_distance_hold=0;
    fast_saved_valid=0;
}

/* The narrow compatibility check is deliberate: profile2 remains admissible
 * for explicit reference capture, but has no fitted weak-distance mapping.
 * A new launch always loses its RAM baseline and requires an explicit B.
 */
static int weak_profile_fitted_now(void)
{
    return healthy_guard_profile==1u && healthy_guard_mask==1u &&
        echo_reference_guard_data_crc32()==UINT32_C(0x02FEEBDD) &&
        reg32(ECHO_REG_VERSION)==ECHO_IP_VERSION_PN17 &&
        reg32(ECHO_REG_SAMPLE_RATE_HZ)==ECHO_SAMPLE_RATE_HZ &&
        reg32(ECHO_REG_PAIR_RATE_HZ)==100000000u &&
        (reg32(ECHO_REG_CAPABILITIES)&ECHO_CAP_PN127_50M)!=0u &&
        reg32(ECHO_REG_PN_INFO)==UINT32_C(0x007F0207) &&
        reg32(ECHO_REG_PN_SEED)==127u && reg32(ECHO_REG_PN_AMPLITUDE)==4096u &&
        reg32(ECHO_REG_FRAME_COUNT)==32u && reg32(ECHO_REG_RESULT_COUNT)==ECHO_RESULTS &&
        reg32(ECHO_REG_BASELINE_CRC)==echo_healthy_baseline_active_crc32(&healthy_baseline);
}

static int weak_candidate_current(void)
{
    return weak_candidate_cached && diagnostic_waveform==3u && !busy &&
        batch_ok && !fatal_failure && average_available && correlation_available &&
        weak_candidate_seq==measurement_seq && weak_candidate_epoch==screen_page_epoch &&
        echo_healthy_baseline_is_valid(&healthy_baseline) &&
        weak_candidate_base_id==cached_baseline_id && weak_candidate_base_crc==cached_baseline_crc &&
        weak_candidate_base_id==echo_healthy_baseline_id(&healthy_baseline) &&
        weak_candidate_base_crc==echo_healthy_baseline_active_crc32(&healthy_baseline);
}

static int weak_candidate_available(void)
{
    if(ECHO_MULTI61_ENABLE)return weak_candidate_current() && weak_candidate_profile_fitted && weak_profile_fitted_now() && multi61_result.valid_input && multi61_selected.primary>=0;
    return weak_candidate_current() && weak_candidate_profile_fitted &&
        weak_profile_fitted_now() && (negative_extension_selected ? 1 : long_candidate_selected ? long_candidate.available : positive_candidate_selected ? positive_candidate.candidate_distance_available : weak_candidate.candidate_distance_available);
}

static int current_candidate_model(void) { if(ECHO_MULTI61_ENABLE)return 5; return negative_extension_selected ? 4 : long_candidate_selected ? 3 : positive_candidate_selected ? 2 : 1; }
static int32_t current_candidate_mm(void) { if(ECHO_MULTI61_ENABLE)return multi61_selected.primary>=0?multi61_result.peaks[multi61_selected.primary].nominal_mm:-1; return negative_extension_selected ? negative_extension_mm : long_candidate_selected ? long_candidate.L_mm : positive_candidate_selected ? positive_candidate.L_mm : weak_candidate.L_mm; }
static int current_return_model(void) {if(ECHO_MULTI61_ENABLE)return 5; return negative_extension_selected ? 4 : long_candidate_selected ? 3 : 1;}

static int held_distance_current(void)
{
    return continuous_distance_hold && continuous_internal_frame && continuous_active() &&
        !fatal_failure && !screen_link_blocked && !screen_reset_seen && !screen_refresh_pending &&
        !screen_deferred_error && current_page_valid && current_page==0u &&
        screen_page_epoch==held_epoch && continuous_session==held_session &&
        echo_healthy_baseline_is_valid(&healthy_baseline) &&
        echo_healthy_baseline_id(&healthy_baseline)==held_base_id &&
        echo_healthy_baseline_active_crc32(&healthy_baseline)==held_base_crc;
}

static const char *weak_candidate_status_name(void)
{
    if (!weak_candidate_current()) return "NO_CURRENT_CANDIDATE";
    if (!weak_candidate_profile_fitted || !weak_profile_fitted_now()) return "PROFILE_UNFITTED";
    if(ECHO_MULTI61_ENABLE) {
        if(!multi61_result.count)return multi61_result.edge_above_gate?"EDGE_PEAK":"LOW_RETURN";
        if(multi61_selected.primary<0)return "NO_ELIGIBLE_RETURN";
        return multi61_selected.count>1?"MULTI_RETURN_CANDIDATES":multi61_kind(multi61_result.peaks[multi61_selected.primary].kind);
    }
    if (negative_extension_selected) return "NEGATIVE_EXTENDED_CANDIDATE";
    if (long_candidate_selected) return long_endpoint1_status_name(long_candidate.status);
    return positive_candidate_selected ? positive_candidate1_status_name(positive_candidate.status) : weak_candidate1_status_name(weak_candidate.status);
}

static const char *return_class_name(void)
{
    static const char *const names[]={"INVALID_INPUT","REFERENCE_UNFITTED","LOW_RETURN",
        "EDGE_PEAK","OUTSIDE_FIT_SPAN","POSITIVE_RETURN","NEGATIVE_RETURN",
        "AMBIGUOUS_RETURN","OPEN_LIKE","SHORT_LIKE"};
    if (!weak_candidate_current()) return "NO_CURRENT_CANDIDATE";
    if (!weak_candidate_profile_fitted || !weak_profile_fitted_now()) return "REFERENCE_UNFITTED";
    if(ECHO_MULTI61_ENABLE)return multi61_selected.primary>=0?multi61_kind(multi61_result.peaks[multi61_selected.primary].kind):weak_candidate_status_name();
    if (negative_extension_selected) return "NEGATIVE_RETURN";
    if (long_candidate_selected) return long_endpoint1_status_name(long_candidate.status);
    unsigned s=(unsigned)return_candidate.status;
    return s<sizeof(names)/sizeof(names[0]) ? names[s] : "INVALID_INPUT";
}

static int return_label_available(void)
{
    if(ECHO_MULTI61_ENABLE)return weak_candidate_available();
    return weak_candidate_current() && weak_candidate_profile_fitted &&
        weak_profile_fitted_now() && (negative_extension_selected ? 1 : long_candidate_selected ? long_candidate.available : return_candidate.label_available);
}

/* Frozen diagnostic consistency labels, not unique circuit identification.
 * The PN result note is sent after the plot transfer; its ASCII ACK must settle
 * before numeric publication or successful FAST/CONT completion.
 */
static const char *measurement_reason_text(void)
{
    if (fatal_failure) return "CAPTURE FAILED: RELOAD PROGRAM";
    if (busy) return held_distance_current() ? "UPDATING / LAST COMPLETE RESULT" : "MEASURING...";
    if (!echo_healthy_baseline_is_valid(&healthy_baseline)) return "NO REF: USE REFERENCE/CAL";
    if (!(diagnostic_waveform==3u && batch_ok && average_available && correlation_available))
        return "REF READY: PRESS SINGLE";
    if (!weak_candidate_current()) return "RESULT EXPIRED: PRESS SINGLE";
    if (!weak_candidate_profile_fitted || !weak_profile_fitted_now()) return "REF NOT FITTED: NO DISTANCE";
    if(ECHO_MULTI61_ENABLE){
        if(!multi61_result.count)return multi61_result.edge_above_gate?"EDGE PEAK: NO DISTANCE":"LOW RETURN: NO DISTANCE";
        if(multi61_selected.primary<0)return "UNCERTAIN / OUTSIDE NOMINAL RANGE";
        if(multi61_selected.count>1)return multi61_selected.edge_count?"MULTIPLE CANDIDATES / EDGE* PENDING":"MULTIPLE RETURN CANDIDATES / NOMINAL";
        if(multi61_selected.edge_count)return "EDGE* CANDIDATE / NOT QUALIFIED";
        int kind=multi61_result.peaks[multi61_selected.primary].kind;
        return kind==UNIFIED2_OPEN_LIKE?"OPEN-LIKE / NOMINAL":kind==UNIFIED2_SHORT_LIKE?"SHORT-LIKE / NOMINAL":kind==UNIFIED2_NEGATIVE?"NEGATIVE RETURN / NOMINAL":"POSITIVE RETURN / NOMINAL";
    }
    if (negative_extension_selected) return "NEG RETURN / EXTENDED NOMINAL";
    if (long_candidate_selected) return long_candidate.status==LONG1_OPEN_LIKE ? "LONG OPEN-LIKE / NOMINAL" : "LONG SHORT-LIKE / NOMINAL";
    const char *status=weak_candidate_status_name();
    if (strcmp(status,"LOW_RETURN")==0) return "LOW RETURN: NO DISTANCE";
    if (strcmp(status,"OUTSIDE_FIT_SPAN")==0) return "RETURN OUT OF RANGE: NO DISTANCE";
    if (strcmp(status,"EDGE_PEAK")==0) return "EDGE PEAK: NO DISTANCE";
    if (return_candidate.status==RETURN1_OPEN_LIKE) return "OPEN-LIKE / NOMINAL";
    if (return_candidate.status==RETURN1_SHORT_LIKE) return "SHORT-LIKE / NOMINAL";
    if (return_candidate.status==RETURN1_AMBIGUOUS_RETURN) return "TYPE UNCERTAIN / NOMINAL";
    if (strcmp(status,"POSITIVE_DISTANCE_CANDIDATE")==0) return "POSITIVE RETURN / NOMINAL";
    if (strcmp(status,"NEGATIVE_DISTANCE_CANDIDATE")==0) return "NEGATIVE RETURN / NOMINAL";
    return "INVALID RESULT: NO DISTANCE";
}

/* Display copy only. FULL covers nominal0..25m (lag143..193); ZOOM covers
 * the fitted5..15m (lag153..173). Evaluation still uses all256 correlations.
 * Reserve24 pixels below the curve for ticks, so labels cannot hide a peak. */
static int cached_long_window(const int16_t *raw,const int16_t *base,const int64_t *corr)
{
    int64_t dc=0;long_endpoint1_result view;
    for(unsigned i=0;i<128u;++i)dc+=(int32_t)raw[i]-base[i];
    (void)long_endpoint1_evaluate(corr,256u,dc,1,1,&view);
    /* Drawing only: caller checks coherent cached frame/profile. A PAGE
     * invalidates numeric ownership but must not shrink its cached plot. */
    return view.available;
}
/* A distance fit must never decide whether an acquired return is visible.
 * Mode2 is an observation in lag coordinates, with no new distance or label. */
static int cached_plot_window(const int16_t *raw,const int16_t *base,const int64_t *corr)
{
    if(ECHO_MULTI61_ENABLE)return 4;
    if(cached_long_window(raw,base,corr))return 1;
    int64_t dc=0;weak_candidate1_result metric;
    for(unsigned i=0;i<128u;++i)dc+=(int32_t)raw[i]-base[i];
    if(weak_candidate1_evaluate(corr,256u,dc,&metric)==WEAK_CANDIDATE1_INVALID_INPUT)return 0;
    int32_t mm;
    if(negative_extension1_project(&metric,1,1,&mm))return 3;
    return metric.abs_peak_num>WEAK_CANDIDATE1_GATE_NUM &&
        metric.peak_lag>0 && metric.peak_lag<255 &&
        (metric.peak_lag<153 || metric.peak_lag>173) ? 2 : 0;
}
static unsigned diagnostic_zoom_first(unsigned peak)
{
    return peak<32u?0u:peak>224u?192u:peak-32u;
}
static void apply_nominal_distance_window(echo_hmi_wave_t *out,const int16_t *raw,
                                          const int16_t *base,const int64_t *corr,unsigned zoom)
{
    if(ECHO_MULTI61_ENABLE){
        if(multi61_build_plot(raw,base,corr,zoom,out,&multi61_plot_result,&multi61_plot_view)!=0)out->count=0;
        return;
    }
    int64_t dc=0,scale=INT64_C(2147483648)*128;
    for (unsigned i=0;i<128u;++i) dc+=(int32_t)raw[i]-base[i];
    int mode=cached_plot_window(raw,base,corr);
    if(mode==3) {
        scale=(int64_t)WEAK_CANDIDATE1_GATE_NUM;
        out->first=zoom?173u:143u;out->source_count=zoom?21u:61u;
    } else if(mode==2) {
        /* Observation-only auto gain: the former strong-endpoint floor made
         * real weak returns only1-2 pixels high. This never changes a gate. */
        scale=(int64_t)WEAK_CANDIDATE1_GATE_NUM;
        weak_candidate1_result metric;
        (void)weak_candidate1_evaluate(corr,256u,dc,&metric);
        out->first=zoom?diagnostic_zoom_first((unsigned)metric.peak_lag):0u;
        out->source_count=zoom?64u:256u;
    } else {
        out->first=mode==1?(zoom?194u:144u):(zoom?153u:143u);
        out->source_count=mode==1?(zoom?17u:81u):(zoom?21u:51u);
    }
    out->envelope=0u;
    out->zero=(out->height+24u)/2u;
    unsigned radius=(out->height-24u)/2u-4u;
    for (unsigned i=out->first;i<out->first+out->source_count;++i) {
        int64_t value=corr[i]*128-dc*INT64_C(65536),magnitude=value<0?-value:value;
        while (magnitude>scale) scale*=2;
    }
    out->full_scale=scale/128;
    for (unsigned p=0;p<out->count;++p) {
        unsigned i=out->first+p*(out->source_count-1u)/(out->count-1u);
        int64_t value=corr[i]*128-dc*INT64_C(65536);
        uint64_t magnitude=(uint64_t)(value<0?-value:value);
        unsigned offset=(unsigned)((magnitude*radius+(uint64_t)scale/2u)/(uint64_t)scale);
        out->pixels[p]=(uint8_t)(value<0?out->zero-offset:out->zero+offset);
    }
}

static int long_axis_frame(const echo_hmi_wave_t *frame)
{
    return frame->kind==ECHO_HMI_CORRELATION && frame->zero==(frame->height+24u)/2u &&
        ((frame->first==144u && frame->source_count==81u) || (frame->first==194u && frame->source_count==17u));
}
static int extended_axis_frame(const echo_hmi_wave_t *frame)
{
    return frame->kind==ECHO_HMI_CORRELATION && frame->zero==(frame->height+24u)/2u &&
        ((frame->first==143u && frame->source_count==61u) || (frame->first==173u && frame->source_count==21u));
}
static int nominal_axis_frame(const echo_hmi_wave_t *frame)
{
    if(ECHO_MULTI61_ENABLE)return frame->kind==ECHO_HMI_CORRELATION && frame->zero==(frame->height+24u)/2u && frame->first==0u && frame->source_count==256u;
    return frame->kind==ECHO_HMI_CORRELATION && frame->zero==(frame->height+24u)/2u &&
        ((frame->first==143u && frame->source_count==51u) ||
         (frame->first==153u && frame->source_count==21u) || extended_axis_frame(frame) || long_axis_frame(frame));
}
static int diagnostic_axis_frame(const echo_hmi_wave_t *frame)
{
    if(ECHO_MULTI61_ENABLE)return 0;
    return frame->kind==ECHO_HMI_CORRELATION && frame->zero==(frame->height+24u)/2u &&
        ((frame->first==0u && frame->source_count==256u) ||
         (frame->first<=192u && frame->source_count==64u));
}

/* Match the first pixel of the sample's floor-resampled plateau exactly. */
static unsigned nominal_axis_pixel(const echo_hmi_wave_t *frame,unsigned lag)
{
    unsigned span=frame->source_count-1u;
    return frame->x+((lag-frame->first)*(frame->count-1u)+span-1u)/span;
}

static uint32_t reversed_wire_hash(const echo_hmi_wave_t *frame)
{
    uint32_t hash=UINT32_C(2166136261);
    for (unsigned i=frame->count;i>0u;--i)
        hash=(hash^frame->pixels[i-1u])*UINT32_C(16777619);
    return hash;
}

static int send_weak_candidate(void)
{
    char line[1024];
    int current=weak_candidate_current();
    int available=weak_candidate_available();
    int fitted=current && weak_candidate_profile_fitted && weak_profile_fitted_now();
    int n=snprintf(line,sizeof(line),
        "WEAK_CANDIDATE,SEQ=%lu,MODEL=%d,STATUS=%s,L_MM=%ld,AVAILABLE=%d,PEAK_LAG=%d,SIGN=%d,PEAK_NUM=%" PRId64 ",DC_SUM_DELTA=%" PRId64 ",PROFILE_FITTED=%d,BASE_ID=%lu,BASE_CRC=%08lX,DIAGNOSTIC=1,DISTANCE_VALID=0,RETURN_MODEL=%d,RETURN_CLASS=%s,RETURN_AVAILABLE=%d,FAULT_TYPE_VALID=0",
        (unsigned long)measurement_seq,current_candidate_model(),weak_candidate_status_name(),
        available ? (long)current_candidate_mm() : -1L,available,
        current ? (ECHO_MULTI61_ENABLE && multi61_selected.primary>=0?multi61_result.peaks[multi61_selected.primary].lag:weak_candidate.peak_lag) : -1,
        current ? (ECHO_MULTI61_ENABLE && multi61_selected.primary>=0?multi61_result.peaks[multi61_selected.primary].sign:weak_candidate.sign) : 0,
        current ? (ECHO_MULTI61_ENABLE && multi61_selected.primary>=0?multi61_result.peaks[multi61_selected.primary].num:weak_candidate.peak_num) : INT64_C(0),
        current ? weak_candidate_dc_sum_delta : INT64_C(0),fitted,
        (unsigned long)cached_baseline_id,(unsigned long)cached_baseline_crc,
        current_return_model(),return_class_name(),return_label_available());
    if(ECHO_MULTI61_ENABLE)n=multi61_append(line,sizeof(line),n,0);
    if (n<0 || (size_t)n>=sizeof(line)) return -1;
    return send_record(line);
}

static uint64_t timer_ticks(void)
{
    uint32_t hi1, lo, hi2;
    do {
        hi1 = Xil_In32(GTIMER_HI_ADDR);
        lo = Xil_In32(GTIMER_LO_ADDR);
        hi2 = Xil_In32(GTIMER_HI_ADDR);
    } while (hi1 != hi2);
    return ((uint64_t)hi1 << 32) | (uint64_t)lo;
}

static int timer_start_check(void)
{
    uint32_t ctrl = Xil_In32(GTIMER_CTRL_ADDR);
    if ((ctrl & 1u) == 0u) Xil_Out32(GTIMER_CTRL_ADDR, ctrl | 1u);
    uint64_t a = timer_ticks();
    for (volatile uint32_t i = 0u; i < 10000u; ++i) { }
    return timer_ticks() > a;
}

static uint64_t now_ms(void)
{
    uint32_t ctrl = Xil_In32(GTIMER_CTRL_ADDR);
    uint32_t prescaler = ((ctrl >> 8) & 0xffu) + 1u;
    uint64_t freq = (ECHO_CPU_CLOCK_HZ / 2u) / prescaler;
    uint64_t ticks = timer_ticks();
    return (ticks / freq) * UINT64_C(1000) +
           ((ticks % freq) * UINT64_C(1000)) / freq;
}

static void continuous_reset(void)
{
    continuous_state=CONT_IDLE;
    continuous_session=continuous_frames=0u;
    continuous_base_id=continuous_base_crc=continuous_last_seq=0u;
    continuous_internal_frame=continuous_stop_error=0;
    continuous_request_ms=0u;
    continuous_reason="NONE";
}

/* Latch only. A parsed request never interrupts hardware or sends ASCII in
 * the middle of addt. A later error overrides an ordinary stop reason. */
static void continuous_request_stop(const char *reason, int error)
{
    if (!continuous_active()) return;
    if (continuous_state==CONT_RUNNING || (error && !continuous_stop_error)) {
        continuous_request_ms=now_ms();
        continuous_reason=reason;
    } else if (!error && !continuous_stop_error && strcmp(continuous_reason,"USER")==0 &&
               strcmp(reason,"USER")!=0) {
        /* A page/reset after STOP invalidates display ownership too. Keep
         * the first request time, but do not treat that normal cancellation
         * as a failed USER frame or clear widgets on the new page. */
        continuous_reason=reason;
    }
    if (error) clear_weak_candidate();
    continuous_stop_error|=error;
    continuous_state=CONT_STOP_PENDING;
}

/* The acquisition driver polls this callback while waiting for DONE. Keep
 * now_ms itself side-effect free because the screen parser also calls it. */
static uint64_t operation_now_ms(void)
{
    if (continuous_active() && screen_operation_active && !screen_service_active)
        service_screen_during_operation();
    return now_ms();
}

static void cancel_reference_confirmation(void)
{
    reference_confirm_armed=0;
    reference_confirm_epoch=0u;
    reference_confirm_deadline_ms=0u;
}

static int reference_confirmation_valid(void)
{
    return reference_confirm_armed && current_page_valid && current_page==2u &&
        reference_confirm_epoch==screen_page_epoch &&
        now_ms()<reference_confirm_deadline_ms;
}

static void expire_reference_confirmation(void)
{
    if (reference_confirm_armed && !reference_confirmation_valid())
        cancel_reference_confirmation();
}

static int uart_init(XUartPs *uart, unsigned channel)
{
    XUartPs_Config *cfg;
    XUartPsFormat fmt;
    int rc;
    if (channel == 0u) {
#ifdef SDT
        cfg = XUartPs_LookupConfig(XPAR_XUARTPS_0_BASEADDR);
#else
        cfg = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
#endif
    } else {
#ifdef SDT
        cfg = XUartPs_LookupConfig(XPAR_XUARTPS_1_BASEADDR);
#else
        cfg = XUartPs_LookupConfig(XPAR_XUARTPS_1_DEVICE_ID);
#endif
    }
    if (!cfg) return XST_FAILURE;
    rc = XUartPs_CfgInitialize(uart, cfg, cfg->BaseAddress);
    if (rc != XST_SUCCESS) return rc;
    fmt.BaudRate = 115200u;
    fmt.DataBits = XUARTPS_FORMAT_8_BITS;
    fmt.Parity = XUARTPS_FORMAT_NO_PARITY;
    fmt.StopBits = XUARTPS_FORMAT_1_STOP_BIT;
    rc = XUartPs_SetDataFormat(uart, &fmt);
    if (rc != XST_SUCCESS) return rc;
    XUartPs_SetOperMode(uart, XUARTPS_OPER_MODE_NORMAL);
    return XST_SUCCESS;
}

/* Return an error on UART TX failure. Do not claim success for partial dumps. */
static int tx_all(XUartPs *uart, const uint8_t *data, size_t size)
{
    size_t sent = 0u;
    unsigned stalled = 0u;
    while (sent < size) {
        u32 n = XUartPs_Send(uart, (u8 *)(data + sent), (u32)(size - sent));
        if (n == 0u) {
            if (++stalled > 1000000u) return -1;
            continue;
        }
        stalled = 0u;
        sent += (size_t)n;
    }
    for (unsigned tries = 0u; tries < 1000000u; ++tries) {
        if (XUartPs_IsTransmitEmpty(uart)) return 0;
    }
    return -1;
}

static int send_record_direct(const char *line)
{
    if (tx_all(&uart_debug, (const uint8_t *)line, strlen(line)) != 0)
        return -1;
    int rc=tx_all(&uart_debug, (const uint8_t *)"\r\n", 2u);
    /* B exports three large RAW frames. Service screen RX between complete
     * records so touches cannot accumulate and execute after the operation. */
    if (screen_operation_active && !screen_service_active && !screen_bulk_active)
        service_screen_during_operation();
    return rc;
}

static int send_record(const char *line)
{
    if (important_record(line)) {
        clear_weak_candidate();
        fast_saved_valid=0;
        cancel_reference_confirmation();
        invalidate_text_cache();
        if (fast_active) fast_capture_failed=1;
    } else if (fast_active) {
        size_t n=strlen(line);
        if (fast_summary_used+n+2u>=sizeof(fast_summary)) {
            fast_capture_failed=1;fast_saved_valid=0;
            diagnostic_record_failed=1;clear_weak_candidate();
            (void)send_record_direct("[FAST] FAILED: diagnostic replay buffer full");
            return -1;
        }
        memcpy(fast_summary+fast_summary_used,line,n);
        fast_summary_used+=n;
        fast_summary[fast_summary_used++]='\r';
        fast_summary[fast_summary_used++]='\n';
        fast_summary[fast_summary_used]='\0';
        ++fast_summary_lines;
        if (strncmp(line,"HMI_PLOT,",9u)==0) ++fast_plot_lines;
        return 0;
    }
    int rc=send_record_direct(line);
    if (rc) { diagnostic_record_failed=1;clear_weak_candidate(); if (fast_active) fast_capture_failed=1; }
    return rc;
}

static void log_line(const char *line)
{
    (void)send_record(line);
}

/* Symmetric rounding also for negative echo amplitudes/DC values. */
static long round_scaled(float value, float scale)
{
    float scaled = value * scale;
    return (long)(scaled >= 0.0f ? scaled + 0.5f : scaled - 0.5f);
}

static void print_help(void)
{
    log_line("[STAGE61] Screen SINGLE/CONTINUOUS: frozen return type and nominal distance; safe STOP");
    log_line("[STAGE61] REFERENCE: confirm 50 ohm, then capture RAM reference; no auto-reference");
    log_line("[STAGE61] PC L/P/Z/B/D/F and I/R/C/J: use while stopped; V: info; H/?: help");
    log_line("[STAGE61] Frozen return candidate1: OPEN-LIKE/SHORT-LIKE or ordinary residual; fit5..15 only");
}

static const char *pn_range_status_name(void)
{
    if (pn_range.status == ECHO_PN_LOW_RETURN) return "LOW_RETURN";
    if (pn_range.status == ECHO_PN_EDGE_PEAK) return "EDGE_PEAK";
    if (pn_range.status == ECHO_PN_UNSTABLE_PEAK) return "UNSTABLE_PEAK";
    if (!pn_range.within_fit_span) return "OUTSIDE_FIT_SPAN";
    return pn_range.polarity > 0 ? "POSITIVE_RETURN" : "NEGATIVE_RETURN";
}

static void print_hw_info(void)
{
    char line[256];
    (void)snprintf(line, sizeof(line),
        "HW_INFO,IP_ID=%08lX,VERSION=%08lX,FS_HZ=%lu,PAIR_HZ=%lu,CAPS=%lu",
        (unsigned long)reg32(ECHO_REG_IP_ID),
        (unsigned long)reg32(ECHO_REG_VERSION),
        (unsigned long)reg32(ECHO_REG_SAMPLE_RATE_HZ),
        (unsigned long)reg32(ECHO_REG_PAIR_RATE_HZ),
        (unsigned long)reg32(ECHO_REG_CAPABILITIES));
    log_line(line);
    (void)snprintf(line, sizeof(line),
        "HW_STATUS,STATUS=%08lX,ERROR=%08lX,FRAME=%lu,RESULT=%lu,PULSE_CFG=%08lX,AVG_VALID=%08lX",
        (unsigned long)reg32(ECHO_REG_STATUS),
        (unsigned long)reg32(ECHO_REG_LAST_ERROR),
        (unsigned long)reg32(ECHO_REG_FRAME_COUNT),
        (unsigned long)reg32(ECHO_REG_RESULT_COUNT),
        (unsigned long)reg32(ECHO_REG_PULSE_CONFIG),
        (unsigned long)reg32(ECHO_REG_AVERAGE_VALID));
    log_line(line);
    if (reg32(ECHO_REG_VERSION) == ECHO_IP_VERSION_PN17) {
        (void)snprintf(line, sizeof(line),
            "PN_INFO,CONFIG=%lu,INFO=%08lX,SEED=%lu,AMPLITUDE=%lu,CHIP_HZ=50000000",
            (unsigned long)reg32(ECHO_REG_WAVEFORM_CONFIG),
            (unsigned long)reg32(ECHO_REG_PN_INFO),
            (unsigned long)reg32(ECHO_REG_PN_SEED),
            (unsigned long)reg32(ECHO_REG_PN_AMPLITUDE));
        log_line(line);
    }
    (void)snprintf(line, sizeof(line),
        "PN_MODEL,ID=1,FIT_M=1|15,HOLDOUT_M=3|5,REF_N=3,GATE_Q16=%lu,WEAK_VALIDATED=0",
        (unsigned long)echo_pn_range_gate_q16());
    log_line(line);
    (void)snprintf(line, sizeof(line),
        "HMI_INFO,PAGE=%u,VALID=%d,LOCKED=%d,VIEW=%u,ZOOM=%u,WAVE_VERSION=1,WIRE_REVERSED=1,ACK_PENDING=%u,RX_PARTIAL=%u,ACK_WINDOW=2,LIST_LAYOUT=2,LIST_SEQ=%lu,LIST_POINTS=%u,LIST_ACK=%u",
        (unsigned)current_page,current_page_valid,screen_link_blocked,plot_view,plot_zoom,
        screen_ack_pending,(unsigned)parser.len,(unsigned long)multi61_list_seq,multi61_list_points,multi61_list_ack);
    log_line(line);
    (void)snprintf(line, sizeof(line),
        "REF_GUARD_INFO,VERSION=1,PROFILES=2,BANK_CRC32=%08lX,ACTIVE_PROFILE=%lu,ACTIVE_MASK=%lu,GATE_Q16=208916480,ADAPTIVE=0",
        (unsigned long)echo_reference_guard_data_crc32(),
        (unsigned long)healthy_guard_profile,(unsigned long)healthy_guard_mask);
    log_line(line);
    (void)snprintf(line, sizeof(line),
        "CONT_INFO,STATE=%s,SESSION=%lu,FRAMES=%lu,BASE_ID=%lu,BASE_CRC=%08lX,LAST_SEQ=%lu,MEAS_SEQ=%lu,IN_FLIGHT=%d",
        continuous_state_name(),(unsigned long)continuous_session,(unsigned long)continuous_frames,
        (unsigned long)continuous_base_id,(unsigned long)continuous_base_crc,
        (unsigned long)continuous_last_seq,(unsigned long)measurement_seq,continuous_internal_frame);
    log_line(line);
    log_line("WEAK_MODEL_INFO,MODEL=1,MODEL_SHA256=c038ed417b9c8030344891b9d6e875aa4c881a1ec2def88dbc0f90213189dcc4,GATE_Q16=16777216,DEN=128,LAG_ZERO=143,MM_PER_LAG=500,FIT_LAG_MIN=153,FIT_LAG_MAX=173,PROFILE_MASK=1,DIAGNOSTIC=1,DISTANCE_VALID=0");
    log_line("POSITIVE_MODEL_INFO,MODEL=2,MODEL_SHA256=8b49823088b0cf74bf58677221f1f8d393b0b33dc523791466ab425b1f035e40,GATE_Q16=16777216,DEN=128,LAG_ZERO=143,MM_PER_LAG=500,FIT_LAG_MIN=153,FIT_LAG_MAX=173,PROFILE_MASK=1,DIAGNOSTIC=1,DISTANCE_VALID=0");
    if(ECHO_MULTI61_ENABLE)log_line("MULTI_MODEL_INFO,MODEL=5,SHA256=dba1a730709ebfd751c0b2368115763a4c718f104f0ea0e69dc23824edaee713,MAX_CANDIDATES=8,SCREEN_CAPACITY=6,WEAK_MIN_M=1,NOMINAL_MAX_M=33,OBSERVATION_MAX_M=35,PRESENTATION_POLICY=2,LIST_LAYOUT=2,EDGE_PENDING=1,DISTANCE_VALID=0,FAULT_COUNT_VALID=0");
    log_line("NEG_EXT_INFO,MODEL=4,SHA256=31a2576e3394f765ffde7945ad3470a265763370effa7a8347310598dd8de212,LAG_MIN=174,LAG_MAX=193,LAG_ZERO=143,MM_PER_LAG=500,NEGATIVE_ONLY=1,DIAGNOSTIC=1,DISTANCE_VALID=0");
    log_line("LONG_MODEL_INFO,MODEL=3,MODEL_SHA256=f26ce906932e54856f91e1379fd39ab3de9e147e07936ac4510b389f4d40413c,FIT_LAG_MIN=194,FIT_LAG_MAX=210,LAG_ZERO=144,MM_PER_LAG=500,STRONG_ONLY=1,DISTANCE_VALID=0");
    (void)snprintf(line, sizeof(line),
        "HEALTHY_INFO,VALID=%d,BASE_ID=%lu,CRC32=%08lX,REF_N=3,VOLATILE=1,DISTANCE_VALID=0,FW_STAGE=63,RETURN_MODEL=1,RETURN_SHA256=4c578f312b73f7dd8a242720088eff4d94bb4888401dcdeb7623875deb0f09b9",
        echo_healthy_baseline_is_valid(&healthy_baseline),
        (unsigned long)echo_healthy_baseline_id(&healthy_baseline),
        (unsigned long)echo_healthy_baseline_active_crc32(&healthy_baseline));
    log_line(line);
}

/* Export the cached RAW average, not the diagnostic baseline-subtracted data.
 * Sequence is PS-owned because CLEAR_STATUS resets the PL transaction count.
 * FNV-1a covers each signed Q2 word as two little-endian bytes. */
static int dump_last_average(void)
{
    char line[224];
    int32_t sum = 0;
    int16_t minimum = average_ref_q2[0], maximum = average_ref_q2[0];
    uint32_t hash = UINT32_C(2166136261);
    if (!average_available) {
        log_line("[RAW] No valid average. Send L or press SINGLE first.");
        return -1;
    }
    if (diagnostic_waveform == 3u) {
        (void)snprintf(line, sizeof(line),
            "RAW_BEGIN,SEQ=%lu,COUNT=1024,FORMAT=Q2,MODE=PN127,FRAMES=32,FS_HZ=200000000,PROC=HEALTHY_DIFF,BASE_ID=%lu,BASE_CRC=%08lX",
            (unsigned long)measurement_seq, (unsigned long)cached_baseline_id,
            (unsigned long)cached_baseline_crc);
    } else (void)snprintf(line, sizeof(line),
        "RAW_BEGIN,SEQ=%lu,COUNT=1024,FORMAT=Q2,MODE=%s,FRAMES=32,FS_HZ=200000000",
        (unsigned long)measurement_seq,
        diagnostic_waveform == 1u ? "PN127" : diagnostic_waveform == 2u ? "2" : "5");
    if (send_record(line) != 0) return -1;
    for (uint32_t i = 0; i < ECHO_BASE_COUNT; ++i) {
        int16_t value = average_ref_q2[i];
        uint16_t word = (uint16_t)value;
        sum += value;
        if (value < minimum) minimum = value;
        if (value > maximum) maximum = value;
        hash = (hash ^ (uint8_t)word) * UINT32_C(16777619);
        hash = (hash ^ (uint8_t)(word >> 8)) * UINT32_C(16777619);
        (void)snprintf(line, sizeof(line), "RAW,%lu,%d", (unsigned long)i, (int)value);
        if (send_record(line) != 0) return -1;
    }
    (void)snprintf(line, sizeof(line),
        "RAW_END,SEQ=%lu,COUNT=1024,SUM=%ld,MIN=%d,MAX=%d,FNV1A=%08lX",
        (unsigned long)measurement_seq, (long)sum,
        (int)minimum, (int)maximum, (unsigned long)hash);
    return send_record(line);
}

static void dump_last_correlation(void)
{
    char line[192];
    uint32_t hash = UINT32_C(2166136261);
    const char *prefix = diagnostic_waveform == 3u ? "DCORR" : "CORR";
    if (!correlation_available) {
        log_line("[CORR] No PN correlation. Run P successfully first.");
        return;
    }
    if (diagnostic_waveform == 3u) {
        (void)snprintf(line, sizeof(line),
            "DCORR_BEGIN,SEQ=%lu,COUNT=256,FORMAT=Q16,MODE=PN127,CALIBRATED=0,BASE_ID=%lu,BASE_CRC=%08lX",
            (unsigned long)measurement_seq, (unsigned long)cached_baseline_id,
            (unsigned long)cached_baseline_crc);
    } else (void)snprintf(line, sizeof(line),
        "CORR_BEGIN,SEQ=%lu,COUNT=256,FORMAT=Q16,MODE=PN127,CALIBRATED=0",
        (unsigned long)measurement_seq);
    if (send_record(line) != 0) return;
    for (uint32_t i = 0; i < ECHO_RESULTS; ++i) {
        uint64_t word = (uint64_t)correlation_q16[i];
        (void)snprintf(line, sizeof(line), "%s,%lu,%08lX,%08lX", prefix,
            (unsigned long)i, (unsigned long)(word >> 32), (unsigned long)(word & UINT32_MAX));
        if (send_record(line) != 0) return;
        for (unsigned byte = 0; byte < 8; ++byte)
            hash = (hash ^ (uint8_t)(word >> (byte * 8))) * UINT32_C(16777619);
    }
    (void)snprintf(line, sizeof(line), "%s_END,SEQ=%lu,COUNT=256,FNV1A=%08lX", prefix,
                   (unsigned long)measurement_seq, (unsigned long)hash);
    (void)send_record(line);
}

static void dump_healthy_baseline(void)
{
    const int16_t *data = echo_healthy_baseline_active_data(&healthy_baseline);
    char line[320];
    if (data == NULL) { log_line("[BASE] DENIED: no healthy baseline; B first"); return; }
    uint32_t id = echo_healthy_baseline_id(&healthy_baseline);
    uint32_t crc = echo_healthy_baseline_active_crc32(&healthy_baseline);
    (void)snprintf(line, sizeof(line),
        "BASE_BEGIN,ID=%lu,COUNT=1024,FORMAT=Q2,REF_N=3,CRC32=%08lX,VOLATILE=1,FIRST_SEQ=%lu,LAST_SEQ=%lu,GUARD_VERSION=1,PROFILE_ID=%lu,PROFILE_MASK=%lu,BANK_CRC32=%08lX",
        (unsigned long)id, (unsigned long)crc,
        (unsigned long)healthy_first_seq, (unsigned long)healthy_last_seq,
        (unsigned long)healthy_guard_profile,(unsigned long)healthy_guard_mask,
        (unsigned long)echo_reference_guard_data_crc32());
    if (send_record(line) != 0) return;
    for (uint32_t i = 0u; i < ECHO_BASE_COUNT; ++i) {
        (void)snprintf(line, sizeof(line), "BASE,%lu,%d", (unsigned long)i, (int)data[i]);
        if (send_record(line) != 0) return;
    }
    (void)snprintf(line, sizeof(line),
        "BASE_END,ID=%lu,COUNT=1024,CRC32=%08lX,GUARD_VERSION=1,PROFILE_ID=%lu,PROFILE_MASK=%lu,BANK_CRC32=%08lX",
        (unsigned long)id, (unsigned long)crc,
        (unsigned long)healthy_guard_profile,(unsigned long)healthy_guard_mask,
        (unsigned long)echo_reference_guard_data_crc32());
    (void)send_record(line);
}

static void set_text(const char *widget, const char *text)
{
    if (screen_link_blocked || screen_bulk_active) return;
    if (screen_paint_active && screen_paint_epoch!=screen_page_epoch) return;
    if (text_cache_epoch!=screen_page_epoch || text_cache_page!=current_page)
        invalidate_text_cache();
    unsigned slot=TEXT_CACHE_SLOTS;
    int cacheable=strlen(widget)<sizeof(text_cache[0].widget) &&
                  strlen(text)<sizeof(text_cache[0].text);
    if (cacheable) {
        for (unsigned i=0;i<text_cache_count;++i) {
            if (strcmp(text_cache[i].widget,widget)==0) {
                if (strcmp(text_cache[i].text,text)==0) return;
                slot=i;break;
            }
        }
        if (slot==TEXT_CACHE_SLOTS && text_cache_count<TEXT_CACHE_SLOTS) slot=text_cache_count;
    }
    /* Receive bounded batches while painting, instead of accumulating all
     * replies until a future measurement. Never discard missing ACKs. PAGE
     * can change ownership while waiting; old-page widget names must stop. */
    uint32_t epoch=screen_page_epoch;
    if (screen_ack_pending>=SCREEN_ACK_WINDOW && settle_fast_screen()!=0) return;
    if (epoch!=screen_page_epoch || !current_page_valid || screen_reset_seen ||
        (screen_paint_active && screen_paint_epoch!=screen_page_epoch)) return;
    uint8_t buf[160];
    size_t n = tdr_hmi_make_text(buf, sizeof(buf), widget, text);
    if (!n || tx_all(&uart_screen,buf,n)!=0) {
        screen_link_blocked=1;last_plot_valid=0;
        log_line("[HMI] WAVE_ERROR: text write unconfirmed; screen writes paused");
        return;
    }
    ++screen_ack_pending;
    if (slot<TEXT_CACHE_SLOTS) {
        strcpy(text_cache[slot].widget,widget);strcpy(text_cache[slot].text,text);
        if (slot==text_cache_count) ++text_cache_count;
    }
}

static void request_screen_page(void)
{
    clear_weak_candidate();
    if (screen_link_blocked || screen_bulk_active) return;
    static const uint8_t query[] = {'s','e','n','d','m','e',0xff,0xff,0xff};
    current_page_valid = 0;
    cancel_reference_confirmation();
    invalidate_text_cache();
    (void)tx_all(&uart_screen, query, sizeof(query));
}

/* addt is a bounded, exclusive screen-UART transaction. No widget text or
 * measurements are processed inside it. Page changes are noted immediately;
 * other touch requests are queued for the normal event loop. */
static void note_screen_page(unsigned page)
{
    clear_weak_candidate();
    continuous_request_stop("PAGE",0);
    /* A same-page report can follow a native page reload, which resets its
     * private text controls too. Never retain widget cache across a report. */
    ++screen_page_epoch;
    cancel_reference_confirmation();
    last_plot_valid=0;
    invalidate_text_cache();
    current_page=(uint8_t)page;
    current_page_valid=page<4u;
    if (page==0u) screen_pn_mode=1;
}

static void defer_screen_event(const tdr_hmi_event_t *ev)
{
    if (ev->type==TDR_HMI_ACK) {
        if (screen_ack_pending) --screen_ack_pending;
        return;
    }
    if (continuous_active()) {
        if (ev->type==TDR_HMI_REQUEST && ev->cmd==0x12u && ev->arg==0u) {
            continuous_request_stop("USER",0);
            return;
        }
        if (ev->type==TDR_HMI_REQUEST && ev->cmd!=0x01u) {
            /* Do not poison the in-flight fast frame for duplicate START,
             * SINGLE, reference or view requests. None may execute later. */
            cancel_reference_confirmation();
            (void)send_record_direct("CONT_IGNORED,COMMAND=HMI,REASON=RUNNING");
            return;
        }
        if (ev->type==TDR_HMI_TOUCH) return;
        if (ev->type==TDR_HMI_PAGE ||
            (ev->type==TDR_HMI_REQUEST && ev->cmd==0x01u))
            continuous_request_stop("PAGE",0);
        else if (ev->type==TDR_HMI_READY) continuous_request_stop("READY",0);
        else if (ev->type==TDR_HMI_ERROR) continuous_request_stop("LCD_ERROR",1);
    }
    if (fast_active && (ev->type==TDR_HMI_REQUEST || ev->type==TDR_HMI_TOUCH ||
                       ev->type==TDR_HMI_PAGE || ev->type==TDR_HMI_READY)) {
        fast_capture_failed=1;fast_saved_valid=0;
    }
    if (ev->type==TDR_HMI_REQUEST && ev->cmd!=0x01u &&
        (screen_operation_active || ev->cmd==0x10u || ev->cmd==0x20u ||
         ev->cmd==0x11u || ev->cmd==0x12u)) {
        cancel_reference_confirmation();
        log_line("[HMI] DENIED: action received during operation/transfer; not queued");
        return;
    }
    if (ev->type==TDR_HMI_ERROR) {
        clear_weak_candidate();
        if (screen_ack_pending) --screen_ack_pending;
        char line[80];
        (void)snprintf(line,sizeof(line),"[HMI] LCD error code=%u before waveform",ev->code);
        log_line(line);
        screen_deferred_error=1;
        screen_link_blocked=1;
    } else if (ev->type==TDR_HMI_PAGE ||
        (ev->type==TDR_HMI_REQUEST && ev->cmd==0x01u)) {
        note_screen_page(ev->type==TDR_HMI_PAGE ? ev->page : ev->arg);
        screen_refresh_pending=1;
    } else if (ev->type==TDR_HMI_READY) {
        clear_weak_candidate();
        screen_deferred_error=0;
        current_page_valid=0;
        ++screen_page_epoch;
        cancel_reference_confirmation();
        invalidate_text_cache();fast_saved_valid=0;screen_ack_pending=0;
        screen_reset_seen=1;
        screen_refresh_pending=1;
    } else if (ev->type==TDR_HMI_REQUEST) {
        if (deferred_hmi_count<8u) {
            deferred_hmi[(deferred_hmi_head+deferred_hmi_count)%8u]=*ev;
            ++deferred_hmi_count;
        } else log_line("[HMI] Deferred touch queue full");
    }
}

/* Read only screen events while an acquisition/export is in progress. PAGE,
 * READY and ACK keep their protocol meaning; requests cannot start a second
 * acquisition. This function never paints a page or enters addt. */
static void service_screen_during_operation(void)
{
    if (!screen_operation_active || screen_service_active) return;
    screen_service_active=1;
    uint8_t byte;
    tdr_hmi_event_t ev;
    for (unsigned i=0;i<2048u;++i) {
        if (XUartPs_Recv(&uart_screen,&byte,1u)!=1u) break;
        if (tdr_hmi_parser_feed(&parser,byte,(uint32_t)now_ms(),&ev))
            defer_screen_event(&ev);
    }
    screen_service_active=0;
}

static void finish_screen_operation(void)
{
    service_screen_during_operation();
    /* A request which began during busy cannot be completed by later bytes
     * and mistaken for a new idle confirmation or measurement. */
    if (!continuous_active() && parser.len && parser.buf[0]==0xa5u)
        tdr_hmi_parser_init(&parser);
    screen_operation_active=0;
}

static int wait_screen_bulk(tdr_hmi_event_type_t wanted)
{
    uint64_t started=now_ms();
    for (unsigned poll=0;poll<100000u;++poll) {
        uint8_t byte;
        tdr_hmi_event_t ev;
        if (XUartPs_Recv(&uart_screen,&byte,1u)==1u) {
            if (tdr_hmi_parser_feed(&parser,byte,(uint32_t)now_ms(),&ev)) {
                if (ev.type==wanted) return 0;
                if (ev.type==TDR_HMI_ERROR) {
                    continuous_request_stop("LCD_ERROR",1);
                    char line[80];
                    (void)snprintf(line,sizeof(line),"[HMI] LCD error code=%u during waveform",ev.code);
                    log_line(line);
                    return -2;
                }
                defer_screen_event(&ev);
                if (screen_reset_seen) return -3;
            }
        } else usleep(1000u);
        if (now_ms()-started>=500u) return -1;
    }
    return -1;
}

static int upload_plot(const echo_hmi_wave_t *frame)
{
    uint8_t command[80],byte;
    tdr_hmi_event_t ev;
    if (!frame || frame->count==0u || frame->count>sizeof(screen_wire_pixels)) return -1;
    unsigned page=current_page;
    uint32_t epoch=screen_page_epoch;
    for (unsigned i=0;i<frame->count;++i)
        screen_wire_pixels[i]=frame->pixels[frame->count-1u-i];
    screen_bulk_active=1;
    screen_reset_seen=0;
    screen_deferred_error=0;
    for (unsigned i=0;i<2048u && XUartPs_Recv(&uart_screen,&byte,1u)==1u;++i)
        if (tdr_hmi_parser_feed(&parser,byte,(uint32_t)now_ms(),&ev)) defer_screen_event(&ev);
    if (screen_deferred_error) {
        screen_bulk_active=0;screen_link_blocked=1;
        log_line("[HMI] WAVE_ERROR: prior screen command failed; no waveform payload sent");
        return -1;
    }
    if (!current_page_valid || epoch!=screen_page_epoch || screen_reset_seen) {
        screen_bulk_active=0;
        return 1;
    }
    size_t n=tdr_hmi_make_clear(command,sizeof(command),frame->component,0u);
    int rc=(n && tx_all(&uart_screen,command,n)==0) ? 0 : -4;
    if (!rc) ++screen_ack_pending;
    if (!rc) {
        n=tdr_hmi_make_addt(command,sizeof(command),frame->component,0u,frame->count);
        if (!n || tx_all(&uart_screen,command,n)!=0) rc=-4;
    }
    if (!rc) rc=wait_screen_bulk(TDR_HMI_BULK_READY);
    if (!rc && tx_all(&uart_screen,screen_wire_pixels,frame->count)!=0) rc=-4;
    if (!rc) rc=wait_screen_bulk(TDR_HMI_BULK_DONE);
    screen_bulk_active=0;
    if (rc) {
        /* An interrupted transparent transfer has no safe ASCII cancellation.
         * Stop screen writes until a real screen READY reset is observed. */
        screen_link_blocked=!screen_reset_seen;
        last_plot_valid=0;
        log_line("[HMI] WAVE_ERROR: transfer unconfirmed; screen writes paused; measurement data retained");
        return -1;
    }
    if (page!=current_page || epoch!=screen_page_epoch || !current_page_valid) return 1;
    return 0;
}

static int axis_command(char *line,size_t capacity,unsigned page,uint32_t epoch)
{
    if (screen_bulk_active || screen_link_blocked || screen_reset_seen || !current_page_valid ||
        current_page!=page || screen_page_epoch!=epoch) return 1;
    size_t n=strlen(line);
    if (n+3u>=capacity) return -1;
    line[n++]=(char)0xff;line[n++]=(char)0xff;line[n++]=(char)0xff;
    if (tx_all(&uart_screen,(const uint8_t *)line,n)!=0) {
        screen_link_blocked=1;last_plot_valid=0;
        log_line("[HMI] WAVE_ERROR: distance-axis write unconfirmed");
        return -1;
    }
    ++screen_ack_pending;
    if (settle_fast_screen()!=0) return -1;
    return (!current_page_valid || current_page!=page || screen_page_epoch!=epoch || screen_refresh_pending)?1:0;
}

static int draw_nominal_distance_axis(const echo_hmi_wave_t *frame)
{
    if(ECHO_MULTI61_ENABLE)return draw_multi61_axis(frame);
    char line[144];unsigned page=current_page;uint32_t epoch=screen_page_epoch;
    unsigned band_y=frame->y+frame->height-24u;
    int is_long=long_axis_frame(frame);
    int extended=extended_axis_frame(frame);
    unsigned fit_start=nominal_axis_pixel(frame,extended?173u:is_long?194u:153u),fit_end=nominal_axis_pixel(frame,extended?193u:is_long?210u:173u);
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,24,65535",frame->x,band_y,frame->width);
    int rc=axis_command(line,sizeof(line),page,epoch);if (rc) return rc;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,2,33808",frame->x,band_y,frame->width);
    rc=axis_command(line,sizeof(line),page,epoch);if (rc) return rc;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,2,%u",fit_start,band_y,fit_end-fit_start+1u,extended?64512u:992u);
    rc=axis_command(line,sizeof(line),page,epoch);if (rc) return rc;
    unsigned first_m=extended?(frame->first==173u?15u:0u):is_long?(frame->first==194u?25u:0u):(frame->first==153u?5u:0u);
    unsigned last_m=extended?(frame->first==173u?25u:30u):is_long?(frame->first==194u?33u:40u):(frame->first==153u?15u:25u);
    unsigned step=extended?5u:is_long?(frame->first==194u?4u:10u):5u;
    for (unsigned m=first_m;m<=last_m;m+=step) {
        unsigned x=nominal_axis_pixel(frame,(is_long?144u:143u)+2u*m),color=extended?(m>=15u && m<=25u?64512u:33808u):(is_long?(m>=25u && m<=33u):(m>=5u && m<=15u))?992u:33808u;
        (void)snprintf(line,sizeof(line),"fill %u,%u,1,4,%u",x,band_y+2u,color);
        rc=axis_command(line,sizeof(line),page,epoch);if (rc) return rc;
        unsigned left=x>frame->x+21u?x-21u:frame->x;
        if (left+42u>frame->x+frame->width) left=frame->x+frame->width-42u;
        unsigned align=m==first_m?0u:m==last_m?2u:1u;
        (void)snprintf(line,sizeof(line),"xstr %u,%u,42,18,0,%u,65535,%u,1,1,\"%um\"",left,band_y+6u,color,align,m);
        rc=axis_command(line,sizeof(line),page,epoch);if (rc) return rc;
    }
    return 0;
}

static int draw_diagnostic_lag_axis(const echo_hmi_wave_t *frame)
{
    char line[144];unsigned page=current_page;uint32_t epoch=screen_page_epoch;
    unsigned y=frame->y+frame->height-24u;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,24,65535",frame->x,y,frame->width);
    int rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,2,33808",frame->x,y,frame->width);
    rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    for(unsigned tick=0;tick<=4u;++tick) {
        unsigned lag=frame->first+(frame->source_count-1u)*tick/4u;
        unsigned x=nominal_axis_pixel(frame,lag);
        unsigned left=x>frame->x+21u?x-21u:frame->x;
        if(left+42u>frame->x+frame->width)left=frame->x+frame->width-42u;
        (void)snprintf(line,sizeof(line),"xstr %u,%u,42,18,0,33808,65535,%u,1,1,\"%u\"",left,y+6u,tick==0u?0u:tick==4u?2u:1u,lag);
        rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    }
    return 0;
}
static void draw_cached_waveform(void)
{
    if (busy || screen_bulk_active || screen_link_blocked || !current_page_valid || current_page>1u) return;
    unsigned kind=current_page==0u ? (diagnostic_waveform==3u ? 2u : 0u) :
        plot_view_explicit ? plot_view : diagnostic_waveform==3u ? 2u : 0u;
    unsigned component=current_page==0u ? 8u : 12u;
    const int16_t *base=echo_healthy_baseline_active_data(&healthy_baseline);
    int healthy_frame=diagnostic_waveform==3u && average_available && correlation_available && base &&
        cached_baseline_id==echo_healthy_baseline_id(&healthy_baseline) &&
        cached_baseline_crc==echo_healthy_baseline_active_crc32(&healthy_baseline);
    if (current_page==0u && screen_pn_mode && !healthy_frame) {
        uint8_t cmd[48];
        size_t n=tdr_hmi_make_clear(cmd,sizeof(cmd),component,0u);
        if (n && tx_all(&uart_screen,cmd,n)==0) ++screen_ack_pending;
        last_plot_valid=0;
        return;
    }
    if (!average_available || (kind!=0u && !healthy_frame)) {
        uint8_t cmd[48];
        size_t n=tdr_hmi_make_clear(cmd,sizeof(cmd),component,0u);
        if (n && tx_all(&uart_screen,cmd,n)==0) ++screen_ack_pending;
        last_plot_valid=0;
        if (!average_available) set_text("t_note",screen_pn_mode?measurement_reason_text():"NO CACHED WAVEFORM - MEASURE FIRST");
        else set_text("t_note","HEALTHY DIFF/CORR NEEDS B THEN D; AVG32 AVAILABLE");
        return;
    }
    int plot_window=healthy_frame && weak_profile_fitted_now() ? cached_plot_window(average_ref_q2,base,correlation_q16):0;
    int unchanged=last_plot_valid && last_plot_seq==measurement_seq && last_plot_page==current_page &&
        last_plot_kind==kind && last_plot_zoom==plot_zoom && last_plot_crc==cached_baseline_crc && last_plot_window==plot_window;
    if (!unchanged) {
    if (echo_hmi_wave_build(average_ref_q2,healthy_frame?base:NULL,
                           healthy_frame?correlation_q16:NULL,diagnostic_waveform,
                           kind,plot_zoom,current_page,&plot_frame)!=0) {
        log_line("[HMI] WAVE_ERROR: invalid cached waveform inputs");
        return;
    }
    if (kind==ECHO_HMI_CORRELATION && healthy_frame && weak_profile_fitted_now())
        apply_nominal_distance_window(&plot_frame,average_ref_q2,base,correlation_q16,plot_zoom);
    if (upload_plot(&plot_frame)!=0) return;
    char line[256];
    /* Zero line is a drawing overlay; it never changes the display samples. */
    int chars=snprintf(line,sizeof(line),"fill %u,%u,%u,1,44538",
                       plot_frame.x,plot_frame.y+plot_frame.height-plot_frame.zero,plot_frame.width);
    if (chars>0 && (size_t)chars+3u<sizeof(line)) {
        line[chars++]=(char)0xff;line[chars++]=(char)0xff;line[chars++]=(char)0xff;
        if (tx_all(&uart_screen,(const uint8_t *)line,(size_t)chars)!=0) {
            screen_link_blocked=1;last_plot_valid=0;
            log_line("[HMI] WAVE_ERROR: zero-line write unconfirmed; screen writes paused");
            return;
        }
        ++screen_ack_pending;
    }
    if (nominal_axis_frame(&plot_frame) && draw_nominal_distance_axis(&plot_frame)!=0) {
        last_plot_valid=0;
        return;
    }
    if (diagnostic_axis_frame(&plot_frame) && draw_diagnostic_lag_axis(&plot_frame)!=0) {
        last_plot_valid=0;return;
    }
    }
    char line[512];
    if(ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)) {
        (void)snprintf(line,sizeof(line),"X:NOMINAL %ld..%ld m; CANDIDATES ONLY",(long)multi61_plot_view.first_mm/1000,(long)(multi61_plot_view.first_mm+multi61_plot_view.span_mm)/1000);
    } else if (nominal_axis_frame(&plot_frame)) {
        (void)snprintf(line,sizeof(line),"X:NOMINAL m %s | RANGE:%s | GRAY:UNVERIFIED",
            extended_axis_frame(&plot_frame)?(plot_frame.first==173u?"15..25":"0..30"):long_axis_frame(&plot_frame)?(plot_frame.first==194u?"25..33":"0..40"):(plot_frame.first==153u?"5..15":"0..25"),
            extended_axis_frame(&plot_frame)?"EXTENDED15-25":long_axis_frame(&plot_frame)?"STRONG25-33":"FIT5-15");
    } else if (kind==2u) {
        (void)snprintf(line,sizeof(line),"CORR lag %u..%u; +/- %" PRId64 " Q16; ZERO=center",
            plot_frame.first,plot_frame.first+plot_frame.source_count-1u,plot_frame.full_scale);
    } else {
        unsigned first_ns=plot_frame.first*5u,last_ns=(plot_frame.first+plot_frame.source_count-1u)*5u;
        (void)snprintf(line,sizeof(line),"%s t %u.%03u..%u.%03u us; +/- %" PRId64 " ADC; ZERO=center",
            kind==0u?"AVG32":"DIFF/DC128",first_ns/1000u,first_ns%1000u,last_ns/1000u,last_ns%1000u,
            plot_frame.full_scale/4);
    }
    if (current_page==0u && diagnostic_waveform==3u) {
        (void)snprintf(line,sizeof(line),"%s | %s",measurement_reason_text(),
            ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)?"X:NOMINAL m; NUMBERED CANDIDATES":nominal_axis_frame(&plot_frame)?(extended_axis_frame(&plot_frame)?"X:NOMINAL m; ORANGE=EXT15-25":long_axis_frame(&plot_frame)?"X:NOMINAL m; STRONG25-33":"X:NOMINAL m; GREEN=FIT 5-15"):diagnostic_axis_frame(&plot_frame)?"X:LAG; AUTO SCALE; NO DISTANCE FIT":"X:LAG; REF NOT FITTED");
        set_text("t_note",line);
    } else set_text(current_page==1u?"t_axis":"t_note",line);
    if (current_page==1u) {
        set_text("b_full",ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)?"FULL 0-35 m":nominal_axis_frame(&plot_frame)?(extended_axis_frame(&plot_frame)?"FULL 0-30 m":long_axis_frame(&plot_frame)?"FULL 0-40 m":"FULL 0-25 m"):diagnostic_axis_frame(&plot_frame)?"FULL LAG 0-255":"FULL RECORD");
        set_text("b_zoom",ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)?"ZOOM RETURNS":nominal_axis_frame(&plot_frame)?(extended_axis_frame(&plot_frame)?"ZOOM 15-25 m":long_axis_frame(&plot_frame)?"ZOOM 25-33 m":"ZOOM 5-15 m"):diagnostic_axis_frame(&plot_frame)?"PEAK ZOOM / LAG":"RESPONSE ZOOM");
        set_text("t_note",kind==ECHO_HMI_CORRELATION ?
            (ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)?"CACHED MULTI RETURN VIEW / NOMINAL ONLY":nominal_axis_frame(&plot_frame)?(extended_axis_frame(&plot_frame)?"CACHED EXTENDED NEGATIVE; ORANGE15-25; NOMINAL ONLY":long_axis_frame(&plot_frame)?"CACHED LONG ENDPOINT; GREEN25-33 ONLY; DIAGNOSTIC":"CACHED NOMINAL AXIS; GREEN FIT5-15 ONLY; NOT FAULT CLASSIFICATION"):diagnostic_axis_frame(&plot_frame)?"CACHED OUT-OF-RANGE RETURN; LAG AXIS; NO DISTANCE FIT":"REF NOT FITTED: LAG AXIS ONLY; NO DISTANCE") :
            "TIME VIEW: SELECT CORRELATION FOR DISTANCE AXIS");
    }
    if (screen_link_blocked) return;
    if (unchanged) return;
    last_plot_valid=1;last_plot_seq=measurement_seq;last_plot_page=current_page;
    last_plot_kind=kind;last_plot_zoom=plot_zoom;last_plot_crc=cached_baseline_crc;last_plot_window=plot_window;
    uint32_t pixel_hash=UINT32_C(2166136261);
    for (unsigned i=0;i<plot_frame.count;++i)
        pixel_hash=(pixel_hash^plot_frame.pixels[i])*UINT32_C(16777619);
    (void)snprintf(line,sizeof(line),
        "HMI_PLOT,SEQ=%lu,PAGE=%u,KIND=%s,N=%u,FIRST=%u,COUNT=%u,SCALE=%" PRId64 ",ZERO=%u,READY=1,DONE=1,FNV1A=%08lX,BASE_ID=%lu,BASE_CRC=%08lX,WIRE_REVERSED=1,WIRE_FNV1A=%08lX",
        (unsigned long)measurement_seq,(unsigned)current_page,kind==0u?"AVG32":kind==1u?"DIFF":"CORR",
        plot_frame.count,plot_frame.first,plot_frame.source_count,plot_frame.full_scale,plot_frame.zero,
        (unsigned long)pixel_hash,(unsigned long)(kind?cached_baseline_id:0u),
        (unsigned long)(kind?cached_baseline_crc:0u),(unsigned long)reversed_wire_hash(&plot_frame));
    if(ECHO_MULTI61_ENABLE && nominal_axis_frame(&plot_frame)) {
        size_t used=strlen(line);int n=snprintf(line+used,sizeof(line)-used,",AXIS=UNIFIED_MM,X0_MM=%ld,XSPAN_MM=%ld,EDGE_COUNT=%u",(long)multi61_plot_view.first_mm,(long)multi61_plot_view.span_mm,multi61_plot_view.edge_count);
        if(n<0 || (size_t)n>=sizeof(line)-used){log_line("[HMI] WAVE_ERROR: axis metadata overflow");return;}
    }
    log_line(line);
}

#include "echo_multi61_ui.inc"

static void show_current_page(void)
{
    char line[96];
    /* A PS-only Run does not reset the LCD. Its retained page may be 1..3,
     * so do not send page-0 private widget names until its page is known. */
    if (!current_page_valid || screen_bulk_active || screen_link_blocked || screen_paint_active) return;
    if (fast_active && busy) return;
    screen_paint_active=1;
    screen_paint_epoch=screen_page_epoch;
    expire_reference_confirmation();
    set_text("t_link", "HOST ONLINE");
    if (current_page == 0u) {
        set_text("b_once","PN DIFF SINGLE");
        set_text("b_repeat",continuous_state==CONT_STOP_PENDING ? "STOPPING..." :
                 continuous_state==CONT_RUNNING ? "RUNNING" : "CONTINUOUS");
        set_text("b_stop","STOP");
        set_text("t_result",ECHO_MULTI61_ENABLE?"PRIMARY / NOMINAL":"DISTANCE / NOMINAL");
        set_text("t_config", screen_pn_mode ? "ADC 200MSPS / PN HEALTHY DIFF / SINGLE=PN DIFF" :
                 diagnostic_waveform == 1u ? "PC LEGACY PN RANGE CACHE / SINGLE=PN DIFF" :
                 diagnostic_waveform == 2u ? "PC ZERO OUTPUT CACHE / SINGLE=PN DIFF" :
                 "PC LEGACY MODE5 CACHE / SINGLE=PN DIFF");
        if (held_distance_current()) {
            /* Keep the last acknowledged complete value until this plot settles. */
        } else if (screen_pn_mode && weak_candidate_drawn && weak_candidate_available() &&
            last_plot_valid && last_plot_seq==measurement_seq && last_plot_page==0u &&
            last_plot_kind==ECHO_HMI_CORRELATION && last_plot_crc==cached_baseline_crc) {
            long mm=(long)current_candidate_mm();
            if(ECHO_MULTI61_ENABLE)multi61_format_mm(line,sizeof(line),(int32_t)mm);
            else (void)snprintf(line,sizeof(line),"%ld.%03ld m",mm/1000,mm%1000);
            set_text("t_dist",line);
        } else if (!screen_pn_mode && diagnostic_waveform == 1u && batch_ok &&
            pn_range.status == ECHO_PN_STRONG_RETURN && pn_range.within_fit_span) {
            long mm = (long)(pn_range.distance_m * 1000.0 + 0.5);
            (void)snprintf(line, sizeof(line), "%ld.%03ld m", mm/1000, mm%1000);
            set_text("t_dist", line);
        } else if (!screen_pn_mode && diagnostic_waveform == 0u && last_located) {
            (void)snprintf(line, sizeof(line), "%ld.%03ld m",
                           last_distance_mm / 1000, last_distance_mm % 1000);
            set_text("t_dist", line);
        } else {
            set_text("t_dist", "-- m");
        }
        if(!ECHO_MULTI61_ENABLE || !screen_pn_mode || !multi61_display_owned()) {
        set_text("t_cal", screen_pn_mode ? (negative_extension_selected?"LAST COMPLETE / EXT15-25":long_candidate_selected?"LAST COMPLETE / LONG25-33":"LAST COMPLETE / FIT5-15") :
                 diagnostic_waveform == 1u ? "PC PN MODEL V1 / DIAGNOSTIC" :
                 diagnostic_waveform == 3u ? "LAST COMPLETE / NOMINAL" :
                 diagnostic_waveform == 2u ? "DIAGNOSTIC / NOT CALIBRATED" : "15M MATCHED REF (FIXED)");
        if (screen_pn_mode) {
            if (echo_healthy_baseline_is_valid(&healthy_baseline))
                (void)snprintf(line,sizeof(line),"HEALTHY REF: RAM ID %lu",
                    (unsigned long)echo_healthy_baseline_id(&healthy_baseline));
            else (void)snprintf(line,sizeof(line),"REF MISSING - REFERENCE PAGE");
            set_text("t_ref",line);
        } else set_text("t_ref", diagnostic_waveform == 1u ? "PC PN REF: FIXED MATCHED AVG3" :
                 diagnostic_waveform == 2u ? "REF: ZERO OUTPUT BASELINE" : "PC REF: 15M MATCHED 10-RUN MEAN");
        set_text("t_frames", batch_ok && average_available ? "VALID FRAMES: 32/32" : "VALID FRAMES: --");
        }
        if(ECHO_MULTI61_ENABLE && screen_pn_mode){
            (void)snprintf(line,sizeof(line),"PN MULTI; NOMINAL0-33m; WEAK>=1m; REF:%lu",(unsigned long)echo_healthy_baseline_id(&healthy_baseline));set_text("t_config",line);
        }
        if (busy) {
        (void)snprintf(line, sizeof(line), "MEASURING...");
        } else if (screen_pn_mode) {
            (void)snprintf(line,sizeof(line),"%s",measurement_reason_text());
        } else if (batch_ok) {
            (void)snprintf(line, sizeof(line), "%s", diagnostic_waveform == 1u ? pn_range_status_name() :
                    diagnostic_waveform == 3u ?
                        (!weak_candidate_current() ? "RESIDUAL - NEW MEASUREMENT REQUIRED" :
                         !weak_candidate_profile_fitted || !weak_profile_fitted_now() ? "RESIDUAL / PROFILE UNFITTED" :
                         positive_candidate_selected ?
                             (positive_candidate.status==POSITIVE_CANDIDATE1_DISTANCE ? "POSITIVE RESIDUAL / NOMINAL" : "POSITIVE RESIDUAL / NO FIT") :
                         weak_candidate.status==WEAK_CANDIDATE1_LOW_RETURN ? "LOW RESIDUAL / NO DISTANCE" :
                         weak_candidate.status==WEAK_CANDIDATE1_NEGATIVE_DISTANCE_CANDIDATE ? "NEGATIVE RESIDUAL / NOMINAL" :
                         weak_candidate.status==WEAK_CANDIDATE1_POSITIVE_UNFITTED ? "POSITIVE RESIDUAL / UNFITTED" :
                         "RESIDUAL / NO FITTED DISTANCE") :
                    diagnostic_waveform == 2u ? "ZERO CAPTURE - SEE PC" :
                    last_kind == ECHO_LOCATOR_OPEN  ? "OPEN CIRCUIT" :
                    last_kind == ECHO_LOCATOR_SHORT ? "SHORT CIRCUIT" :
                                                     "NO ECHO");
        } else if (attempted) {
            (void)snprintf(line, sizeof(line), "LOCATE FAILED - SEE PC");
        } else {
            (void)snprintf(line, sizeof(line), "READY - PRESS SINGLE");
        }
        if (!(batch_ok && diagnostic_waveform==3u && average_available && correlation_available)) set_text("t_note", line);
    } else if (current_page == 1u) {
        set_text("b_raw","AVG32");
        set_text("b_avg","DIFFERENCE");
        set_text("b_diff","CORRELATION");
        set_text("t_axis","RAW/DIFF:TIME us; CORR:NOMINAL m IF FITTED");
        set_text("t_note","SELECT A CACHED VIEW - NO NEW ACQUISITION");
    } else if (current_page == 2u) {
        set_text("t_refhead","1. HEALTHY PN REFERENCE");
        set_text("t_refinfo","CONNECT VERIFIED 50 OHM");
        if (busy) (void)snprintf(line,sizeof(line),"ACQUIRING - WAIT");
        else if (echo_healthy_baseline_is_valid(&healthy_baseline))
            (void)snprintf(line,sizeof(line),"VALID RAM REF / ID %lu",
                (unsigned long)echo_healthy_baseline_id(&healthy_baseline));
        else (void)snprintf(line,sizeof(line),"NO HEALTHY REFERENCE");
        set_text("t_refstate",line);
        (void)snprintf(line,sizeof(line),"3 x AVG32 / CRC %08lX",
            (unsigned long)echo_healthy_baseline_active_crc32(&healthy_baseline));
        set_text("t_refhint",line);
        set_text("b_ref",busy ? "ACQUIRING..." :
            reference_confirm_armed ? "CONFIRM 50 OHM" : "CAPTURE HEALTHY REF");
        set_text("t_calstate","FIT5-15; STRONG END25-33");
        set_text("t_calhint","HEALTHY REF IS NOT RANGE CAL");
        set_text("t_note",fatal_failure ? "CAPTURE FAILED - RESET FIRST" :
            reference_confirm_armed ? "HEALTHY 50 OHM? PRESS CONFIRM WITHIN 15 SECONDS" :
            reference_capture_failed ? "REF UPDATE FAILED - CHECK 50 OHM CABLE" :
            "RAM ONLY: LOST ON RUN/POWER. SINGLE = PN DIFF");
    } else if (current_page == 3u) {
        set_text("t_mode", diagnostic_waveform == 1u ? "PN127 DIAGNOSTIC" :
                 diagnostic_waveform == 3u ? "PN127 PL HEALTHY DIFFERENCE" :
                 diagnostic_waveform == 2u ? "MODE 2 ZERO OUTPUT" : "MODE 5 PULSE");
        set_text("t_width", (diagnostic_waveform == 1u || diagnostic_waveform == 3u) ? "50 MCHIP/S / AVG 32" :
                 diagnostic_waveform == 2u ? "ZERO DAC / AVG 32" : "40 NS / AVG 32");
        set_text("t_ready", completed_runs > 0u ? "ADC READY" : "NOT YET CHECKED");
        set_text("t_status", batch_ok ? "DONE" : busy ? "ACQUIRING" : "IDLE");
        set_text("t_clip", batch_ok ? "NO CLIP" : "CHECK CONSOLE");
        set_text("t_errors", batch_ok ? "NO ERROR" : "CHECK CONSOLE");
        (void)snprintf(line, sizeof(line), "ECHO 0x%08lX", (unsigned long)reg32(ECHO_REG_VERSION));
        set_text("t_ver", line);
        set_text("t_note", "STAGE54: LONG ENDPOINT / NOMINAL; STOP TO EXPORT");
    }
    if (screen_paint_epoch==screen_page_epoch && !screen_reset_seen) {
        draw_cached_waveform();
        publish_weak_candidate_distance();
    }
    screen_paint_active=0;
}

/* One fresh mode-5 transaction per request. Stop immediately on any error.
 * Existing echo_run_transaction clears DONE and starts a NEW transaction.
 * Coefficients reloaded for each request (DC 566 Q2 / diagnostic template).
 * AVG readback is RAW and does not reflect the PL baseline subtraction.
 * Do not treat this waveform as a validated normal cable template yet.
 */
static int capture_one_auto_locate(void)
{
    uint32_t version = reg32(ECHO_REG_VERSION);
    if (version != ECHO_IP_VERSION_PHASE2 && version != ECHO_IP_VERSION_PN17) {
        log_line("[STOP] Unsupported hardware version");
        return -2;
    }
    const struct echo_hw_info expected = {
        .ip_id = ECHO_IP_ID_VALUE,
        .hw_version = 3u,
        .regmap_version = (uint16_t)(version & 0xffffu),
        .n = ECHO_BASE_COUNT,
        .m = 32u,
        .l = ECHO_TEMPLATE_COUNT,
        .k = ECHO_RESULTS,
        .sample_rate_hz = ECHO_SAMPLE_RATE_HZ
    };
    struct echo_bringup_report report;
    int rc;
    uint32_t prior_tx;
    char line[256];

    if (!timer_start_check()) {
        log_line("[STOP] Global timer failure");
        return -1;
    }
    rc = echo_bringup(ECHO_BASE, &expected, &report);
    if (rc != 0) {
        (void)snprintf(line, sizeof(line),
                       "[STOP] bringup rc=%d mismatch=%08lX status=%08lX",
                       rc, (unsigned long)report.mismatch,
                       (unsigned long)report.status);
        log_line(line);
        return -2;
    }
    const uint32_t base_caps = ECHO_CAP_PULSE_32 | ECHO_CAP_DUAL_LANE | ECHO_CAP_FRAME_META;
    if ((reg32(ECHO_REG_CAPABILITIES) & base_caps) != base_caps ||
        reg32(ECHO_REG_PAIR_RATE_HZ) != 100000000u ||
        echo_configure_waveform(0) != 0 ||
        echo_configure_pulse(diagnostic_waveform == 2u ? 2u : 5u, 4u) != 0) {
        log_line("[STOP] Mode5, pair rate or capabilities mismatch");
        return -3;
    }
    if ((diagnostic_waveform == 1u || diagnostic_waveform == 3u) &&
        (reg32(ECHO_REG_PN_INFO) != 0x007f0207u ||
         reg32(ECHO_REG_PN_SEED) != 127u ||
         reg32(ECHO_REG_PN_AMPLITUDE) != 4096u ||
         echo_configure_waveform(1) != 0 ||
         echo_pn_make_template(pn_template_q14, ECHO_TEMPLATE_COUNT) != 0)) {
        log_line("[STOP] PN configuration/seed/amplitude mismatch");
        return -3;
    }
    for (uint32_t i = 0u; i < ECHO_BASE_COUNT; ++i)
        baseline_dc_q2[i] = (int16_t)BASELINE_DC_Q2;
    const int16_t *baseline = diagnostic_waveform == 3u ?
        echo_healthy_baseline_active_data(&healthy_baseline) : baseline_dc_q2;
    if (baseline == NULL || echo_load_baseline(baseline, ECHO_BASE_COUNT) != 0 ||
        echo_load_template((diagnostic_waveform == 1u || diagnostic_waveform == 3u) ? pn_template_q14 : template_test,
                           ECHO_TEMPLATE_COUNT) != 0 ||
        echo_commit_coefficients() != 0) {
        log_line("[STOP] Test coefficient load/commit failed");
        return -4;
    }
    if (diagnostic_waveform == 3u &&
        reg32(ECHO_REG_BASELINE_CRC) != echo_healthy_baseline_active_crc32(&healthy_baseline)) {
        log_line("[STOP] Healthy baseline CRC does not match committed request");
        return -16;
    }

    prior_tx = reg32(ECHO_REG_TRANSACTION_COUNT);
    (void)snprintf(line, sizeof(line),
                   "LOCATE_TEST_BEGIN,COUNT=%u,MODE=%s,FRAMES=32,FIRST_TX_BEFORE=%lu",
                   MODE5_TRANSACTIONS,
                   (diagnostic_waveform == 1u || diagnostic_waveform == 3u) ? "PN127" : diagnostic_waveform == 2u ? "2" : "5",
                   (unsigned long)prior_tx);
    if (send_record(line) != 0) return -9;

    for (uint32_t run = 1u; run <= MODE5_TRANSACTIONS; ++run) {
        uint32_t before, after;
        echo_transaction_trace_t trace;
        struct echo_status status;

        before = reg32(ECHO_REG_TRANSACTION_COUNT);
        if (before != prior_tx) {
            log_line("[STOP] Transaction counter changed unexpectedly");
            return -5;
        }
        rc = echo_run_transaction_traced(ECHO_TIMEOUT_MS, operation_now_ms, &trace);
        /* Trace is emitted even on failure, before any large CSV payload. */
        (void)snprintf(line, sizeof(line),
                       "TXTRACE,SEQ=%lu,ENTRY=%lu,AFTER_CLEAR=%lu,END=%lu,RC=%d",
                       (unsigned long)run,
                       (unsigned long)trace.tx_on_entry,
                       (unsigned long)trace.tx_after_clear,
                       (unsigned long)trace.tx_on_completion, rc);
        log_line(line);
        if (rc != 0) {
            (void)snprintf(line, sizeof(line),
                           "[STOP] run=%lu transaction rc=%d",
                           (unsigned long)run, rc);
            log_line(line);
            (void)snprintf(line, sizeof(line),
                           "[REG] STATUS=%08lX ERROR=%08lX TX=%lu FRAME=%lu RESULT=%lu",
                           (unsigned long)reg32(ECHO_REG_STATUS),
                           (unsigned long)reg32(ECHO_REG_LAST_ERROR),
                           (unsigned long)reg32(ECHO_REG_TRANSACTION_COUNT),
                           (unsigned long)reg32(ECHO_REG_FRAME_COUNT),
                           (unsigned long)reg32(ECHO_REG_RESULT_COUNT));
            log_line(line);
            (void)snprintf(line, sizeof(line),
                           "[REG] PULSE=%08lX AVG_VALID=%08lX PULSE_CFG=%08lX",
                           (unsigned long)reg32(ECHO_REG_PULSE_STATUS),
                           (unsigned long)reg32(ECHO_REG_AVERAGE_VALID),
                           (unsigned long)reg32(ECHO_REG_PULSE_CONFIG));
            log_line(line);
            return -6;
        }
        after = reg32(ECHO_REG_TRANSACTION_COUNT);
        /* IMPORTANT: CLEAR_STATUS may also clear transaction statistics.
         * Do NOT compare END against ENTRY+1 across that command. A new
         * completion is guaranteed by the transaction driver relative to
         * AFTER_CLEAR, and independently checked again here. */
        if (trace.tx_on_entry != before ||
            trace.tx_on_completion != after ||
            after != (uint32_t)(trace.tx_after_clear + 1u)) {
            (void)snprintf(line, sizeof(line),
                           "[STOP] run=%lu invalid transaction trace %lu->%lu",
                           (unsigned long)run, (unsigned long)before,
                           (unsigned long)after);
            log_line(line);
            return -7;
        }
        if (echo_get_status(&status) != 0 || status.last_error != 0u ||
            (status.raw & (ECHO_STATUS_CLIP | ECHO_STATUS_AVG_OVERFLOW |
                           ECHO_STATUS_CORR_OVERFLOW | ECHO_FRAME_ERROR)) != 0u ||
            reg32(ECHO_REG_FRAME_COUNT) != 32u ||
            reg32(ECHO_REG_RESULT_COUNT) != ECHO_RESULTS ||
            (reg32(ECHO_REG_AVERAGE_VALID) & 2u) == 0u) {
            (void)snprintf(line, sizeof(line), "[STOP] run=%lu PL status/count error",
                           (unsigned long)run);
            log_line(line);
            return -8;
        }
        rc = echo_read_average_frame(average_ref_q2, ECHO_BASE_COUNT);
        if (rc != 0) {
            (void)snprintf(line, sizeof(line), "[STOP] run=%lu average read rc=%d",
                           (unsigned long)run, rc);
            log_line(line);
            return -10;
        }
        /* Use the raw 1024-point AVG waveform. DC is estimated dynamically;
         * the diagnostic PL baseline of 566 is NOT subtracted from AVG again. */
        if (diagnostic_waveform == 1u || diagnostic_waveform == 3u) {
            if (echo_read_results(correlation_q16, ECHO_RESULTS) != 0) return -13;
            uint32_t peak = 0;
            uint64_t magnitude = 0;
            for (uint32_t i = 0; i < ECHO_RESULTS; ++i) {
                uint64_t word = (uint64_t)correlation_q16[i];
                uint64_t current = correlation_q16[i] < 0 ? UINT64_C(0) - word : word;
                if (current > magnitude) { peak = i; magnitude = current; }
            }
            uint64_t word = (uint64_t)correlation_q16[peak];
            if (diagnostic_waveform == 3u) {
                int32_t dc_delta_sum = 0;
                for (unsigned i = 0u; i < 128u; ++i)
                    dc_delta_sum += (int32_t)average_ref_q2[i] - baseline[i];
                cached_baseline_id = echo_healthy_baseline_id(&healthy_baseline);
                cached_baseline_crc = echo_healthy_baseline_active_crc32(&healthy_baseline);
                (void)snprintf(line, sizeof(line),
                    "PN_DIFF_RESULT,PEAK_LAG=%lu,SIGN=%d,HI=%08lX,LO=%08lX,BASE_ID=%lu,BASE_CRC=%08lX,DC_SUM_DELTA=%ld,DISTANCE_VALID=0",
                    (unsigned long)peak, correlation_q16[peak] < 0 ? -1 : correlation_q16[peak] > 0 ? 1 : 0,
                    (unsigned long)(word >> 32), (unsigned long)(word & UINT32_MAX),
                    (unsigned long)cached_baseline_id, (unsigned long)cached_baseline_crc, (long)dc_delta_sum);
                if (send_record(line) != 0) return -9;
            } else {
            (void)snprintf(line, sizeof(line),
                "PN_RESULT,PEAK_LAG=%lu,SIGN=%d,HI=%08lX,LO=%08lX,CALIBRATED=0",
                (unsigned long)peak, correlation_q16[peak] < 0 ? -1 : correlation_q16[peak] > 0 ? 1 : 0,
                (unsigned long)(word >> 32), (unsigned long)(word & UINT32_MAX));
            if (send_record(line) != 0) return -9;
            if (echo_pn_range_evaluate(average_ref_q2, ECHO_BASE_COUNT,
                                      correlation_q16, ECHO_RESULTS, &pn_range) != 0) {
                log_line("[STOP] PN range input magnitude/size invalid");
                return -15;
            }
            int valid_range = pn_range.status == ECHO_PN_STRONG_RETURN && pn_range.within_fit_span;
            long range_mm = valid_range ? (long)(pn_range.distance_m * 1000.0 + 0.5) : -1L;
            long lag_milli = pn_range.status == ECHO_PN_STRONG_RETURN ?
                (long)(pn_range.fractional_lag * 1000.0 + 0.5) : -1L;
            (void)snprintf(line, sizeof(line),
                "PN_DISTANCE,STATUS=%s,L_MM=%ld,LAG_MILLI=%ld,IN_SPAN=%d,MODEL=1,DIAGNOSTIC=1",
                pn_range_status_name(), range_mm, lag_milli, pn_range.within_fit_span);
            if (send_record(line) != 0) return -9;
            }
            correlation_available = 1;
        } else if (diagnostic_waveform == 2u) {
            log_line("ZERO_RESULT,POINTS=1024,FRAMES=32,CALIBRATED=0");
        } else {
        echo_locator_result_t result;
        rc=echo_locator_run(average_ref_q2,&result);
        if (rc!=0) {
            log_line("[STOP] echo_locator_run failed");
            return -12;
        }
        (void)snprintf(line,sizeof(line),
             "LOCATE_RESULT,STATUS=%s,L_MM=%ld,DELAY_MILLI=%ld,ECHO_Q2_X10=%ld,R2_MILLI=%ld,DC_Q2_X10=%ld",
             result.kind == ECHO_LOCATOR_OPEN  ? "OPEN_ECHO"  :
             result.kind == ECHO_LOCATOR_SHORT ? "SHORT_ECHO" :
                                    "NO_ECHO",
             result.found ? round_scaled(result.distance_m, 1000.0f) : -1L,
             round_scaled(result.delay_samples, 1000.0f),
             round_scaled(result.echo_peak_q2, 10.0f),
             round_scaled(result.fit_r2, 1000.0f),
             round_scaled(result.input_dc_q2, 10.0f));
        if (send_record(line)!=0) return -9;
        last_located=result.found;
        last_kind=result.kind;
        last_distance_mm=result.found ? (long)(result.distance_m*1000.0f+0.5f) : 0L;
        }
        prior_tx = after;
        completed_runs = run;
        ++measurement_seq;
        average_available = 1;
        (void)snprintf(line, sizeof(line), "MEASUREMENT,SEQ=%lu,RAW_AVAILABLE=1",
                       (unsigned long)measurement_seq);
        if (send_record(line) != 0) return -9;
        /* Avoid filling the screen UART RX FIFO with ACKs while exporting. */
    }
    (void)snprintf(line, sizeof(line),
                   "LOCATE_TEST_END,COUNT=%u,LAST_TX=%lu",
                   MODE5_TRANSACTIONS, (unsigned long)prior_tx);
    if (send_record(line) != 0) return -9;
    if ((diagnostic_waveform == 1u || diagnostic_waveform == 3u) &&
        echo_configure_waveform(0) != 0) return -14;
    if (diagnostic_record_failed) return -9;
    return 0;
}

/* Only explicit B requests replace a healthy reference. Collect with the old
 * PN path, retain all three source RAW frames, and publish only after PL CRC
 * verification and bank commit. A partial candidate never replaces active. */
static int capture_healthy_baseline(void)
{
    char line[320];
    uint32_t first_seq = measurement_seq + 1u;
    uint32_t common_profiles=(UINT32_C(1)<<ECHO_REFERENCE_GUARD_PROFILE_COUNT)-UINT32_C(1);
    if (echo_healthy_baseline_begin(&healthy_baseline) != 0) return -20;
    for (unsigned run = 0u; run < ECHO_HEALTHY_BASELINE_FRAMES; ++run) {
        average_available = correlation_available = 0;
        diagnostic_waveform = 1u;
        int rc = capture_one_auto_locate();
        if (rc != 0) { echo_healthy_baseline_abort(&healthy_baseline); return rc; }
        echo_reference_guard_result_t guard;
        int guard_rc=echo_reference_guard_evaluate(average_ref_q2,ECHO_BASE_COUNT,
            correlation_q16,ECHO_RESULTS,&guard);
        (void)snprintf(line,sizeof(line),
            "BASE_GUARD,SEQ=%lu,VERSION=1,MASK=%lu,P1_MAX_NUM=%" PRIu64 ",P2_MAX_NUM=%" PRIu64 ",DEN=384,GATE_Q16=208916480,BANK_CRC32=%08lX",
            (unsigned long)measurement_seq,(unsigned long)guard.matched_mask,
            guard.peak_numerator[0],guard.peak_numerator[1],
            (unsigned long)echo_reference_guard_data_crc32());
        if (send_record(line)!=0) {
            echo_healthy_baseline_abort(&healthy_baseline);
            return -24;
        }
        if (guard_rc!=0) {
            echo_healthy_baseline_abort(&healthy_baseline);
            log_line("[BASE] DENIED: invalid frozen reference guard input/data; reset first");
            return -25;
        }
        common_profiles&=guard.matched_mask;
        if (common_profiles==0u) {
            echo_healthy_baseline_abort(&healthy_baseline);
            log_line("[BASE] DENIED: no common frozen Normal profile; check matched healthy cable");
            return 1;
        }
        if (echo_healthy_baseline_add_frame(&healthy_baseline, average_ref_q2,
                                          ECHO_BASE_COUNT, measurement_seq) != 0) {
            echo_healthy_baseline_abort(&healthy_baseline);
            return -21;
        }
        if (dump_last_average() != 0) {
            echo_healthy_baseline_abort(&healthy_baseline);
            return -24;
        }
    }
    if (echo_healthy_baseline_prepare(&healthy_baseline) != 0) return -22;
    uint32_t crc = echo_healthy_baseline_candidate_crc32(&healthy_baseline);
    if (echo_load_baseline(echo_healthy_baseline_candidate_data(&healthy_baseline), ECHO_BASE_COUNT) != 0 ||
        echo_load_template(pn_template_q14, ECHO_TEMPLATE_COUNT) != 0 ||
        echo_commit_coefficients() != 0 || reg32(ECHO_REG_BASELINE_CRC) != crc ||
        echo_healthy_baseline_publish(&healthy_baseline, crc) != 0) {
        echo_healthy_baseline_abort(&healthy_baseline);
        return -23;
    }
    healthy_first_seq = first_seq;
    healthy_last_seq = measurement_seq;
    healthy_guard_mask=common_profiles;
    healthy_guard_profile=1u;
    while ((common_profiles & (UINT32_C(1)<<(healthy_guard_profile-1u)))==0u)
        ++healthy_guard_profile;
    (void)snprintf(line, sizeof(line),
        "BASE_READY,BASE_ID=%lu,CRC32=%08lX,REF_N=3,FIRST_SEQ=%lu,LAST_SEQ=%lu,GUARD_VERSION=1,PROFILE_ID=%lu,PROFILE_MASK=%lu,BANK_CRC32=%08lX",
        (unsigned long)echo_healthy_baseline_id(&healthy_baseline), (unsigned long)crc,
        (unsigned long)first_seq, (unsigned long)measurement_seq,
        (unsigned long)healthy_guard_profile,(unsigned long)healthy_guard_mask,
        (unsigned long)echo_reference_guard_data_crc32());
    return send_record(line) == 0 ? 0 : -24;
}

static void process_pc_debug_byte(uint8_t ch);

/* With the released TFT's bkcmd=3 contract, acknowledge all ASCII writes
 * following FD before issuing a compact success record. This also processes
 * any page/touch/error that arrived at the end of the screen transfer. */
static int settle_fast_screen(void)
{
    uint64_t started=now_ms();
    for (unsigned poll=0;poll<100000u;++poll) {
        uint8_t byte;tdr_hmi_event_t ev;
        if (XUartPs_Recv(&uart_screen,&byte,1u)==1u) {
            if (tdr_hmi_parser_feed(&parser,byte,(uint32_t)now_ms(),&ev))
                defer_screen_event(&ev);
            if ((fast_active && fast_capture_failed) || screen_link_blocked || screen_reset_seen) return -1;
        } else if (!screen_ack_pending && parser.len==0u) return 0;
        else usleep(1000u);
        if (now_ms()-started>=500u) break;
    }
    fast_capture_failed=1;
    screen_link_blocked=1;last_plot_valid=0;clear_weak_candidate();
    log_line("[HMI] WAVE_ERROR: post-plot screen acknowledgement incomplete");
    return -1;
}

/* Independent requests clear immediately. Within a continuous frame, the
 * previously acknowledged value can remain as LAST COMPLETE while the next
 * result is unavailable. Its arithmetic cache is still invalidated immediately.
 * PAGE/READY/errors cancel this presentation hold through clear_weak_candidate.
 */
static void blank_weak_distance_before_attempt(void)
{
    int keep=held_distance_current();
    if (!keep && continuous_internal_frame && continuous_active() &&
        current_page_valid && current_page==0u && !screen_bulk_active &&
        !screen_link_blocked && !screen_reset_seen && !screen_refresh_pending &&
        !screen_deferred_error && weak_candidate_drawn && weak_candidate_available() &&
        last_plot_valid && last_plot_seq==measurement_seq && last_plot_page==0u &&
        last_plot_kind==ECHO_HMI_CORRELATION && last_plot_crc==cached_baseline_crc) {
        keep=1;
        held_epoch=screen_page_epoch;held_session=continuous_session;
        held_base_id=cached_baseline_id;held_base_crc=cached_baseline_crc;
    }
    clear_weak_candidate();
    continuous_distance_hold=keep;
    if (!keep && current_page_valid && current_page==0u && !screen_bulk_active &&
        !screen_link_blocked && !screen_reset_seen) {
        set_text("t_dist","-- m");
        if (screen_ack_pending) (void)settle_fast_screen();
    }
}

/* Publish numeric OR unavailable state only after the current plot and ASCII
 * ACKs settle. A missing ACK cancels logical state; unknown addt state remains
 * paused until READY, so physical clearing cannot be guaranteed on a dead link.
 */
static void publish_weak_candidate_distance(void)
{
    if (!screen_pn_mode || !weak_candidate_current() || !current_page_valid ||
        current_page!=0u || screen_bulk_active || screen_link_blocked ||
        screen_reset_seen || screen_refresh_pending || !last_plot_valid ||
        last_plot_seq!=measurement_seq || last_plot_page!=0u ||
        last_plot_kind!=ECHO_HMI_CORRELATION || last_plot_crc!=cached_baseline_crc)
        return;
    if (settle_fast_screen()!=0 || !weak_candidate_current() ||
        !current_page_valid || current_page!=0u || screen_refresh_pending) return;
    char text[48];
    int available=weak_candidate_available();
    if (available) {
        long mm=(long)current_candidate_mm();
        if(ECHO_MULTI61_ENABLE)multi61_format_mm(text,sizeof(text),(int32_t)mm);
        else (void)snprintf(text,sizeof(text),"%ld.%03ld m",mm/1000,mm%1000);
    } else strcpy(text,"-- m");
    set_text("t_dist",text);
    if(ECHO_MULTI61_ENABLE)publish_multi61_list();
    if (settle_fast_screen()!=0 || !weak_candidate_current()) {
        clear_weak_candidate();
        return;
    }
    if(ECHO_MULTI61_ENABLE){multi61_list_seq=measurement_seq;multi61_list_points=multi61_selected.count<6u?multi61_selected.count:6u;multi61_list_ack=1u;}
    continuous_distance_hold=0;
    weak_candidate_drawn=available;
}

/* Compact refresh is the ordinary D transaction with its ten successful
 * diagnostic records retained for I/R/C. Errors are always sent immediately.
 * It only changes transport/UI work, never acquisition or result arithmetic. */
static void run_fast_diagnostic(void)
{
    fast_capture_failed=0;
    blank_weak_distance_before_attempt();
    if (!current_page_valid || current_page!=0u || screen_link_blocked ||
        screen_bulk_active || screen_reset_seen || screen_refresh_pending ||
        deferred_hmi_count || fatal_failure ||
        !echo_healthy_baseline_is_valid(&healthy_baseline)) {
        log_line("[FAST] DENIED: needs valid MEASURE page, idle screen and healthy baseline");
        return;
    }
    uint32_t before=measurement_seq,epoch=screen_page_epoch;
    uint32_t base_id=echo_healthy_baseline_id(&healthy_baseline);
    uint32_t base_crc=echo_healthy_baseline_active_crc32(&healthy_baseline);
    unsigned zoom=plot_zoom;
    fast_saved_valid=0;fast_capture_failed=0;
    fast_summary_used=0;fast_summary_lines=fast_plot_lines=0;
    fast_summary[0]='\0';fast_active=1;
    process_pc_debug_byte((uint8_t)'D');
    if (!fast_capture_failed && !fatal_failure && batch_ok) (void)settle_fast_screen();
    fast_active=0;
    int confirmed=!fast_capture_failed && !fatal_failure && batch_ok &&
        average_available && correlation_available && diagnostic_waveform==3u &&
        measurement_seq==before+UINT32_C(1) &&
        cached_baseline_id==base_id && cached_baseline_crc==base_crc &&
        echo_healthy_baseline_id(&healthy_baseline)==base_id &&
        echo_healthy_baseline_active_crc32(&healthy_baseline)==base_crc &&
        current_page_valid && current_page==0u && screen_page_epoch==epoch &&
        plot_zoom==zoom && !screen_link_blocked && !screen_reset_seen &&
        !deferred_hmi_count && last_plot_valid && last_plot_seq==measurement_seq &&
        last_plot_page==0u && last_plot_kind==ECHO_HMI_CORRELATION &&
        last_plot_zoom==zoom && last_plot_crc==base_crc &&
        plot_frame.kind==ECHO_HMI_CORRELATION && plot_frame.component==8u &&
        plot_frame.count==512u &&
        (ECHO_MULTI61_ENABLE && weak_candidate_profile_fitted && weak_profile_fitted_now() ?
            (nominal_axis_frame(&plot_frame) && plot_frame.zero==124u && multi61_plot_view.span_mm>0) :
         nominal_axis_frame(&plot_frame) ?
            (plot_frame.zero==124u && plot_frame.first==(negative_extension_selected?(zoom?173u:143u):long_candidate_selected?(zoom?194u:144u):(zoom?153u:143u)) && plot_frame.source_count==(negative_extension_selected?(zoom?21u:61u):long_candidate_selected?(zoom?17u:81u):(zoom?21u:51u))) :
            diagnostic_axis_frame(&plot_frame) ?
            (plot_frame.zero==124u && plot_frame.first==(zoom?diagnostic_zoom_first((unsigned)weak_candidate.peak_lag):0u) && plot_frame.source_count==(zoom?64u:256u)) :
            (plot_frame.zero==112u && plot_frame.first==(zoom?96u:0u) && plot_frame.source_count==(zoom?128u:256u))) &&
        fast_summary_lines==10u && fast_plot_lines==1u;
    if (!confirmed) {
        batch_ok=0;last_plot_valid=0;clear_weak_candidate();
        /* PAGE/READY deliberately cancel display ownership. They are normal
         * continuous stops, not a failed acquisition or permission to clear
         * private widgets on the newly selected page. */
        if (continuous_internal_frame && continuous_state==CONT_STOP_PENDING &&
            !continuous_stop_error && strcmp(continuous_reason,"USER")!=0 && !fatal_failure)
            return;
        /* Unknown transparent-transfer state remains protected until READY.
         * If the screen is synchronized, discard the failed visible curve. */
        if (!screen_link_blocked && current_page_valid && current_page<=1u) {
            uint8_t cmd[48];
            size_t n=tdr_hmi_make_clear(cmd,sizeof(cmd),current_page==0u?8u:12u,0u);
            if (n && tx_all(&uart_screen,cmd,n)==0) ++screen_ack_pending;
            set_text("t_note","FAST REFRESH FAILED - SEE PC");
        }
        log_line("[FAST] FAILED: acquisition or current-page screen completion unconfirmed; no FAST_RESULT");
        return;
    }
    uint32_t hash=UINT32_C(2166136261);
    for (unsigned i=0;i<plot_frame.count;++i)
        hash=(hash^plot_frame.pixels[i])*UINT32_C(16777619);
    char line[1280];
    size_t used=0u;
    if (continuous_internal_frame) {
        int prefix=snprintf(line,sizeof(line),"CONT_FRAME,SESSION=%lu,INDEX=%lu,",
            (unsigned long)continuous_session,(unsigned long)(continuous_frames+1u));
        if (prefix<0 || (size_t)prefix>=sizeof(line)) { fast_saved_valid=0;return; }
        used=(size_t)prefix;
    } else {
        memcpy(line,"FAST_RESULT,",12u);used=12u;
    }
    int n=snprintf(line+used,sizeof(line)-used,
        "SEQ=%lu,BASE_ID=%lu,BASE_CRC=%08lX,PAGE=0,KIND=CORR,N=512,FIRST=%u,COUNT=%u,SCALE=%" PRId64 ",ZERO=%u,READY=1,DONE=1,FNV1A=%08lX,TX=1,FRAMES=32,RESULTS=256,RC=0,WEAK_STATUS=%s,WEAK_L_MM=%ld,WEAK_AVAILABLE=%d,PROFILE_FITTED=%d,WEAK_MODEL=%d,DISTANCE_VALID=0,WIRE_REVERSED=1,WIRE_FNV1A=%08lX,RETURN_MODEL=%d,RETURN_CLASS=%s,RETURN_AVAILABLE=%d,FAULT_TYPE_VALID=0",
        (unsigned long)measurement_seq,(unsigned long)base_id,(unsigned long)base_crc,
        plot_frame.first,plot_frame.source_count,plot_frame.full_scale,plot_frame.zero,(unsigned long)hash,
        weak_candidate_status_name(),weak_candidate_available()?(long)current_candidate_mm():-1L,
        weak_candidate_available(),weak_candidate_current() && weak_candidate_profile_fitted && weak_profile_fitted_now(),current_candidate_model(),
        (unsigned long)reversed_wire_hash(&plot_frame),current_return_model(),return_class_name(),return_label_available());
    if(ECHO_MULTI61_ENABLE && n>=0){int total=multi61_append(line,sizeof(line),(int)used+n,1);n=total<0?-1:total-(int)used;}
    if (n<0 || (size_t)n>=sizeof(line)-used || send_record(line)!=0) {
        fast_saved_valid=0;
        log_line("[FAST] FAILED: compact response not delivered");
        return;
    }
    fast_saved_seq=measurement_seq;fast_saved_base_id=base_id;fast_saved_base_crc=base_crc;
    fast_saved_valid=1;
}

static void replay_fast_summary(void)
{
    if (!fast_saved_valid || busy || fatal_failure || !average_available ||
        !correlation_available || diagnostic_waveform!=3u ||
        measurement_seq!=fast_saved_seq || cached_baseline_id!=fast_saved_base_id ||
        cached_baseline_crc!=fast_saved_base_crc ||
        echo_healthy_baseline_id(&healthy_baseline)!=fast_saved_base_id ||
        echo_healthy_baseline_active_crc32(&healthy_baseline)!=fast_saved_base_crc) {
        log_line("[FAST] DENIED: no current successful F summary for I replay");
        return;
    }
    if (tx_all(&uart_debug,(const uint8_t *)fast_summary,fast_summary_used)!=0) {
        fast_saved_valid=0;
        log_line("[FAST] FAILED: cached summary replay incomplete");
    }
}

/* Polling here never runs another acquisition. In particular a STOP received
 * while the compact completion is being sent is consumed before another tick. */
static void continuous_poll_screen(void)
{
    int previous=screen_operation_active;
    screen_operation_active=1;
    service_screen_during_operation();
    screen_operation_active=previous;
}

static void continuous_start(void)
{
    if (continuous_active()) {
        (void)send_record_direct("CONT_IGNORED,COMMAND=START,REASON=RUNNING");
        return;
    }
    screen_pn_mode=1;fast_capture_failed=0;
    blank_weak_distance_before_attempt();
    if (!current_page_valid || current_page!=0u || busy || screen_operation_active ||
        screen_bulk_active || screen_link_blocked || screen_reset_seen ||
        screen_refresh_pending || deferred_hmi_count || fatal_failure ||
        !echo_healthy_baseline_is_valid(&healthy_baseline) ||
        reg32(ECHO_REG_VERSION)!=ECHO_IP_VERSION_PN17 ||
        !(reg32(ECHO_REG_CAPABILITIES)&ECHO_CAP_PN127_50M)) {
        log_line("[CONT] DENIED: needs healthy reference and synchronized idle MEASURE page");
        return;
    }
    cancel_reference_confirmation();
    continuous_base_id=echo_healthy_baseline_id(&healthy_baseline);
    continuous_base_crc=echo_healthy_baseline_active_crc32(&healthy_baseline);
    if (++continuous_session==0u) ++continuous_session;
    continuous_frames=0u;continuous_last_seq=measurement_seq;
    continuous_request_ms=0u;continuous_reason="NONE";continuous_stop_error=0;
    continuous_state=CONT_RUNNING;screen_pn_mode=1;fast_saved_valid=0;
    char line[192];
    (void)snprintf(line,sizeof(line),
        "CONT_START,SESSION=%lu,BASE_ID=%lu,BASE_CRC=%08lX,FIRST_SEQ=%lu,DISTANCE_VALID=0",
        (unsigned long)continuous_session,(unsigned long)continuous_base_id,
        (unsigned long)continuous_base_crc,(unsigned long)(measurement_seq+UINT32_C(1)));
    if (send_record(line)!=0) continuous_request_stop("PC_UART_ERROR",1);
    if (continuous_state==CONT_RUNNING) show_current_page();
}

static void continuous_finish_stop(void)
{
    if (continuous_state!=CONT_STOP_PENDING || busy || screen_operation_active ||
        screen_bulk_active || fast_active || continuous_internal_frame) return;
    uint64_t done=now_ms();
    uint64_t latency=done>=continuous_request_ms ? done-continuous_request_ms : 0u;
    /* All action requests seen while running were consumed, never queued.
     * Discard an unfinished old A5 request before permitting a fresh START. */
    if (parser.len && parser.buf[0]==0xa5u) tdr_hmi_parser_init(&parser);
    deferred_hmi_head=deferred_hmi_count=0u;
    continuous_state=continuous_stop_error ? CONT_ERROR : CONT_IDLE;
    char line[384];
    (void)snprintf(line,sizeof(line),
        "CONT_STOP,SESSION=%lu,REASON=%s,LAST_SEQ=%lu,FRAMES=%lu,MEAS_SEQ=%lu,IN_FLIGHT=0,REQUEST_MS=%" PRIu64 ",DONE_MS=%" PRIu64 ",LATENCY_MS=%" PRIu64 ",STATE=%s",
        (unsigned long)continuous_session,continuous_reason,(unsigned long)continuous_last_seq,
        (unsigned long)continuous_frames,(unsigned long)measurement_seq,
        continuous_request_ms,done,latency,continuous_state_name());
    (void)send_record(line);
    /* Never touch page-private widgets after PAGE/READY or a broken addt. */
    if (current_page_valid && current_page==0u && !screen_link_blocked &&
        !screen_reset_seen && !screen_refresh_pending) {
        show_current_page();
        set_text("t_note",continuous_stop_error ? "CONTINUOUS ERROR - SEE PC" :
                 continuous_frames && fast_saved_valid ? "STOPPED - LAST COMPLETE FRAME RETAINED" :
                 "STOPPED - NO COMPLETE CONTINUOUS FRAME");
    }
}

static void continuous_tick(void)
{
    if (!continuous_active()) return;
    continuous_poll_screen();
    if (continuous_state==CONT_RUNNING) {
        if (!echo_healthy_baseline_is_valid(&healthy_baseline) ||
            echo_healthy_baseline_id(&healthy_baseline)!=continuous_base_id ||
            echo_healthy_baseline_active_crc32(&healthy_baseline)!=continuous_base_crc)
            continuous_request_stop("REFERENCE_CHANGED",1);
        else if (fatal_failure) continuous_request_stop("ACQUISITION_ERROR",1);
        else if (!current_page_valid || current_page!=0u) continuous_request_stop("PAGE",0);
        else if (screen_reset_seen) continuous_request_stop("READY",0);
        else if (screen_link_blocked || screen_refresh_pending) continuous_request_stop("SCREEN_ERROR",1);
    }
    if (continuous_state==CONT_RUNNING) {
        continuous_internal_frame=1;
        run_fast_diagnostic();
        continuous_internal_frame=0;
        if (fast_saved_valid && fast_saved_seq==measurement_seq &&
            fast_saved_base_id==continuous_base_id && fast_saved_base_crc==continuous_base_crc) {
            ++continuous_frames;continuous_last_seq=fast_saved_seq;
        } else if (fatal_failure) continuous_request_stop("ACQUISITION_ERROR",1);
        else if (echo_healthy_baseline_id(&healthy_baseline)!=continuous_base_id ||
                 echo_healthy_baseline_active_crc32(&healthy_baseline)!=continuous_base_crc)
            continuous_request_stop("REFERENCE_CHANGED",1);
        else if (continuous_state!=CONT_STOP_PENDING || continuous_stop_error ||
                 strcmp(continuous_reason,"USER")==0)
            continuous_request_stop("SCREEN_ERROR",1);
    }
    /* Commands arriving during a frame must be rejected while the session
     * still owns the device, even when that frame received STOP. V/H run here
     * at a safe frame boundary; no nested command processing occurs in the
     * acquisition timer callback. */
    u8 byte;
    for (unsigned i=0;i<1024u && XUartPs_Recv(&uart_debug,&byte,1u)==1u;++i)
        process_pc_debug_byte(byte);
    continuous_poll_screen();
    continuous_finish_stop();
}

static void process_pc_debug_byte(uint8_t ch)
{
    int rc;
    if (continuous_active() &&
        !(continuous_internal_frame && (ch=='D' || ch=='d')) &&
        ch!='V' && ch!='v' && ch!='H' && ch!='h' && ch!='?') {
        (void)send_record_direct("CONT_IGNORED,COMMAND=PC,REASON=RUNNING");
        return;
    }
    if (busy || screen_operation_active) {
    log_line("[LOCATE] DENIED: measurement busy");
    return;
    }

    if (ch == 'H' || ch == 'h' || ch == '?') { print_help(); return; }
    if (ch == 'V' || ch == 'v') { print_hw_info(); return; }
    if (ch == 'F' || ch == 'f') { run_fast_diagnostic(); return; }
    if (ch == 'I' || ch == 'i' || ch == 'R' || ch == 'r' ||
        ch == 'C' || ch == 'c' || ch == 'J' || ch == 'j') {
        /* Read-only exports can also occupy UART1 for seconds. A touch made
         * during them must not become a delayed acquisition/confirmation. */
        screen_operation_active=1;
        if (ch=='I' || ch=='i') replay_fast_summary();
        else if (ch=='R' || ch=='r') (void)dump_last_average();
        else if (ch=='C' || ch=='c') dump_last_correlation();
        else dump_healthy_baseline();
        finish_screen_operation();
        return;
    }
    if (ch == 'W' || ch == 'w') { last_plot_valid=0;show_current_page();return; }
    if (ch != 'L' && ch != 'l' && ch != 'P' && ch != 'p' && ch != 'Z' && ch != 'z' &&
        ch != 'B' && ch != 'b' && ch != 'D' && ch != 'd') return;
    cancel_reference_confirmation();
    if (!fast_active) fast_capture_failed=0;
    blank_weak_distance_before_attempt();
    diagnostic_record_failed=0;
    if ((ch == 'P' || ch == 'p' || ch == 'B' || ch == 'b' || ch == 'D' || ch == 'd') &&
        (reg32(ECHO_REG_VERSION) != ECHO_IP_VERSION_PN17 ||
         !(reg32(ECHO_REG_CAPABILITIES) & ECHO_CAP_PN127_50M))) {
        log_line("[PN] DENIED: requires Stage17 PL VERSION=00030002 CAPS bit3; Mode5 still available");
        return;
    }

    if (fatal_failure) {
        log_line("[LOCATE] DENIED: previous failure; reset first");
        return;
    }
    if ((ch == 'D' || ch == 'd') && !echo_healthy_baseline_is_valid(&healthy_baseline)) {
        log_line("[DIFF] DENIED: no healthy reference; explicit B required first");
        return;
    }
    if (ch == 'B' || ch == 'b') {
        screen_operation_active=1;
        screen_pn_mode=1;
        reference_capture_failed=0;
        attempted = busy = 1;
        batch_ok = 0;
        completed_runs = 0u;
        log_line("[BASE] START: 3 fresh PN acquisitions; operator declares cable HEALTHY/MATCHED");
        show_current_page();
        rc = capture_healthy_baseline();
        service_screen_during_operation();
        average_available = correlation_available = 0;
        busy = 0;
        batch_ok = (rc == 0);
        fatal_failure = (rc < 0);
        reference_capture_failed=(rc!=0);
        show_current_page();
        if (rc == 0) log_line("[BASE] PASS: measured healthy baseline explicitly committed; J=table D=difference");
        else {
            char line[96];
            (void)snprintf(line, sizeof(line), "[BASE] FAILED: rc=%d; reference update not confirmed", rc);
            log_line(line);
        }
        finish_screen_operation();
        return;
    }
    screen_operation_active=1;
    uint32_t request_epoch=screen_page_epoch;
    screen_pn_mode=(ch=='D' || ch=='d');
    attempted = 1;
    average_available = 0;
    correlation_available = 0;
    memset(&pn_range, 0, sizeof(pn_range));
    diagnostic_waveform = (ch == 'P' || ch == 'p') ? 1u : (ch == 'Z' || ch == 'z') ? 2u :
                          (ch == 'D' || ch == 'd') ? 3u : 0u;
    busy = 1;
    batch_ok = 0;
    completed_runs = 0u;
    last_located = 0;
    last_kind = ECHO_LOCATOR_NONE;
    last_distance_mm = 0L;
    log_line(diagnostic_waveform == 1u ? "[PN] START: PN127 50Mchip/s 32 frames; diagnostic only" :
             diagnostic_waveform == 3u ? "[DIFF] START: PN127 with measured healthy baseline; NOMINAL POLARITY CANDIDATE" :
             diagnostic_waveform == 2u ? "[ZERO] START: mode2 32 frames, raw baseline capture" :
             "[LOCATE] START: Mode5 32 frames 1024 Q2; fixed 15m matched reference");
    show_current_page();
    rc = capture_one_auto_locate();
    service_screen_during_operation();
    busy = 0;
    batch_ok = (rc == 0);
    fatal_failure = (rc != 0);
    if (rc != 0) { average_available = 0; correlation_available = 0; }
    if (rc==0 && diagnostic_waveform==3u) {
        /* Completion and PN disable succeeded. A PAGE/READY received before
         * this point cannot revive a candidate cleared by that event. */
        const int16_t *base=echo_healthy_baseline_active_data(&healthy_baseline);
        if (base && request_epoch==screen_page_epoch && !screen_reset_seen &&
            !screen_deferred_error && !screen_link_blocked && !fast_capture_failed) {
            int64_t delta=0;
            for (unsigned i=0;i<128u;++i)
                delta+=(int32_t)average_ref_q2[i]-base[i];
            if (weak_candidate1_evaluate(correlation_q16,ECHO_RESULTS,delta,&weak_candidate)==
                WEAK_CANDIDATE1_INVALID_INPUT) {
                rc=-17;batch_ok=0;fatal_failure=1;
                average_available=correlation_available=0;
                clear_weak_candidate();
            } else {
                if (weak_candidate.status==WEAK_CANDIDATE1_POSITIVE_UNFITTED) {
                    (void)positive_candidate1_evaluate(correlation_q16,ECHO_RESULTS,delta,&positive_candidate);
                    positive_candidate_selected=1;
                }
                weak_candidate_dc_sum_delta=delta;
                weak_candidate_seq=measurement_seq;
                weak_candidate_epoch=request_epoch;
                weak_candidate_base_id=cached_baseline_id;
                weak_candidate_base_crc=cached_baseline_crc;
                weak_candidate_profile_fitted=weak_profile_fitted_now();
                (void)return_candidate1_evaluate(correlation_q16,ECHO_RESULTS,delta,
                    weak_candidate_profile_fitted ? 1 : 0,
                    weak_candidate_profile_fitted ? 1 : 0,&return_candidate);
                (void)long_endpoint1_evaluate(correlation_q16,ECHO_RESULTS,delta,
                    weak_candidate_profile_fitted?1:0,weak_candidate_profile_fitted?1:0,&long_candidate);
                long_candidate_selected=long_candidate.available;
                negative_extension_selected=!long_candidate_selected && negative_extension1_project(&weak_candidate,
                    weak_candidate_profile_fitted?1:0,weak_candidate_profile_fitted?1:0,&negative_extension_mm);
                if(ECHO_MULTI61_ENABLE){
                    unified2_evaluate(correlation_q16,ECHO_RESULTS,delta,weak_candidate_profile_fitted?1:0,weak_candidate_profile_fitted?1:0,&multi61_result);
                    multi61_select(&multi61_result,&multi61_selected);
                }
                weak_candidate_cached=1;
            }
        }
        if (rc==0 && send_weak_candidate()!=0) {
            rc=-9;batch_ok=0;fatal_failure=1;
            average_available=correlation_available=0;
            clear_weak_candidate();
        }
    }
    show_current_page();
    if (rc == 0) {
        if (diagnostic_waveform != 0u) {
            log_line(diagnostic_waveform == 1u ? "[PN] PASS: acquisition/correlation executed; R=raw C=correlation" :
                     diagnostic_waveform == 3u ? "[DIFF] PASS: PL healthy subtraction/correlation; R=raw C=DCORR" :
                     "[ZERO] PASS: zero-output capture complete; R=raw");
            log_line(diagnostic_waveform == 1u ?
                "[NOTE] PN distance uses frozen model1; low return gives no distance; weak-impedance detection not validated" :
                diagnostic_waveform == 3u ? "[NOTE] Difference diagnostics only; frozen return type candidate and nominal distance; not certified fault type or impedance" :
                "[NOTE] Zero-output diagnostic data only");
        } else {
        log_line("[LOCATE] PASS: single Mode5 transaction and auto-distance algorithm executed");
        log_line("[NOTE] Three-state diagnostic locator; fixed 15m reference; nominal calibration; not certified");
        }
    } else {
        char line[80];
        (void)snprintf(line, sizeof(line),
                       "[LOCATE] FAILED: rc=%d completed=%lu/1",
                       rc, (unsigned long)completed_runs);
        log_line(line);
    }
    finish_screen_operation();
}

static void process_hmi_event(const tdr_hmi_event_t *ev)
{
    if (ev->type == TDR_HMI_ACK) {
        if (screen_ack_pending) --screen_ack_pending;
    } else if (ev->type == TDR_HMI_REQUEST) {
        if (continuous_active()) {
            defer_screen_event(ev);
            return;
        }
        if (busy || screen_operation_active || screen_bulk_active) {
            defer_screen_event(ev);
            return;
        }
        if (ev->cmd!=0x20u) cancel_reference_confirmation();
        if (ev->cmd == 0x01u && ev->arg < 4u) {
            note_screen_page(ev->arg);
            show_current_page();
        } else if (ev->cmd==0x30u && ev->arg<3u) {
            plot_view=ev->arg;plot_view_explicit=1u;
            show_current_page();
        } else if (ev->cmd==0x31u && ev->arg<2u) {
            plot_zoom=ev->arg;
            show_current_page();
        } else if (ev->cmd == 0x10u || ev->cmd == 0x20u) {
            fast_capture_failed=0;
            blank_weak_distance_before_attempt();
            unsigned required_page=ev->cmd==0x10u ? 0u : 2u;
            if (ev->arg!=0u || !current_page_valid || current_page!=required_page ||
                screen_link_blocked || fatal_failure) {
                cancel_reference_confirmation();
                log_line("[HMI] DENIED: action needs its valid page, arg0 and synchronized idle hardware");
                return;
            }
            if (ev->cmd==0x10u) {
                /* Selecting the screen PN action must also clear a legacy
                 * P/L distance when the request lacks a healthy reference. */
                screen_pn_mode=1;
                if (!echo_healthy_baseline_is_valid(&healthy_baseline)) {
                    log_line("[HMI] DENIED: PN SINGLE needs healthy reference; open REFERENCE page");
                    show_current_page();
                    return;
                }
                log_line("[HMI] SINGLE -> PN healthy difference");
                process_pc_debug_byte((uint8_t)'D');
            } else {
                expire_reference_confirmation();
                if (!reference_confirmation_valid()) {
                    reference_confirm_armed=1;
                    reference_confirm_epoch=screen_page_epoch;
                    reference_confirm_deadline_ms=now_ms()+UINT64_C(15000);
                    log_line("[HMI] REFERENCE ARMED: connect verified 50 ohm; press CONFIRM 50 OHM within 15 seconds");
                    show_current_page();
                    return;
                }
                cancel_reference_confirmation();
                log_line("[HMI] REFERENCE CONFIRMED -> capture healthy PN baseline");
                process_pc_debug_byte((uint8_t)'B');
            }
        } else if (ev->cmd==0x11u && ev->arg==0u) {
            continuous_start();
        } else if (ev->cmd==0x12u && ev->arg==0u) {
            (void)send_record_direct("CONT_IGNORED,COMMAND=STOP,REASON=IDLE");
        } else {
            log_line("[HMI] Unsupported command; use PN SINGLE, REFERENCE or page selection");
        }
    } else if (ev->type == TDR_HMI_PAGE) {
        char line[64];
        note_screen_page(ev->page);
        (void)snprintf(line, sizeof(line), "[HMI] PAGE_SYNC,PAGE=%u,VALID=%u",
                       (unsigned)current_page, (unsigned)current_page_valid);
        log_line(line);
        show_current_page();
    } else if (ev->type == TDR_HMI_READY) {
        continuous_request_stop("READY",0);
        cancel_reference_confirmation();
        screen_pn_mode=1;
        screen_link_blocked=0;screen_deferred_error=0;last_plot_valid=0;
        invalidate_text_cache();fast_saved_valid=0;screen_ack_pending=0;
        tdr_hmi_parser_init(&parser);
        request_screen_page();
    } else if (ev->type == TDR_HMI_ERROR) {
        continuous_request_stop("LCD_ERROR",1);
        cancel_reference_confirmation();
        screen_link_blocked=1;
        last_plot_valid=0;
        if (screen_ack_pending) --screen_ack_pending;
        char line[72];
        (void)snprintf(line, sizeof(line), "[HMI] LCD error code=%u", (unsigned)ev->code);
        log_line(line);
    }
}

int main(void)
{
    continuous_reset();
    screen_operation_active=screen_service_active=0;
    screen_pn_mode=1;reference_capture_failed=0;
    healthy_guard_profile=healthy_guard_mask=0u;
    cancel_reference_confirmation();
    fast_active=fast_saved_valid=0;
    fast_summary_used=0;screen_ack_pending=0;invalidate_text_cache();
    if (uart_init(&uart_debug, 1u) != XST_SUCCESS) for (;;) { }
    echo_healthy_baseline_reset(&healthy_baseline);
    clear_weak_candidate();diagnostic_record_failed=0;
    log_line("[TDR 200MSPS + HMI] STAGE63 THREE ROW CANDIDATES READY");
    if (uart_init(&uart_screen, 0u) != XST_SUCCESS) {
        log_line("[STOP] UART0 unavailable: use merged 200MSPS+UART XSA");
        for (;;) { }
    }
    if (!timer_start_check()) {
        log_line("[STOP] Global timer failure at startup");
        for (;;) { }
    }
    log_line("[TDR HMI] UART0 screen / UART1 PC @115200 8N1");
    tdr_hmi_parser_init(&parser);
    usleep(1500000u);
    request_screen_page();
    print_help();
    for (;;) {
        u8 rx;
        tdr_hmi_event_t ev;
        if (reference_confirm_armed && !reference_confirmation_valid()) {
            expire_reference_confirmation();
            show_current_page();
        }
        while (XUartPs_Recv(&uart_debug, &rx, 1u) == 1u)
            process_pc_debug_byte(rx);
        while (XUartPs_Recv(&uart_screen, &rx, 1u) == 1u)
            if (tdr_hmi_parser_feed(&parser, rx, (uint32_t)now_ms(), &ev))
                process_hmi_event(&ev);
        for (unsigned i=0;i<8u && deferred_hmi_count;++i) {
            ev=deferred_hmi[deferred_hmi_head];
            deferred_hmi_head=(deferred_hmi_head+1u)%8u;
            --deferred_hmi_count;
            process_hmi_event(&ev);
        }
        if (screen_refresh_pending) {
            screen_refresh_pending=0;
            if (screen_reset_seen) {
                screen_reset_seen=0;screen_link_blocked=0;
                request_screen_page();
            } else show_current_page();
        }
        continuous_tick();
        usleep(1000u);
    }
}
