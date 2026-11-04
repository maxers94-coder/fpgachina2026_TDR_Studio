#define ECHO_MULTI61_ENABLE 1
/* Host-only command routing test. Real production main/healthy manager/PN
 * template/range/HMI formatting are linked. UART, timer, driver, transaction
 * and legacy Mode5 locator are controlled mocks, not RTL or board evidence.
 * Input is the already-verified three real 5m matched averaged RAW frames.
 */
#include <inttypes.h>
#include <setjmp.h>
#include <stdlib.h>

#define main production_firmware_main
#include "../echo200_hmi_auto_distance_app/src/main.c"
#undef main
#include "../echo200_hmi_auto_distance_app/src/echo_reference_guard_data.h"

#define LOG_CAPACITY (1024u * 1024u)
static char debug_output[LOG_CAPACITY], screen_output[LOG_CAPACITY];
static size_t debug_size, screen_size;
static int16_t real_frames[3][1024], fixture_expected[1024];
static int16_t original_frames[3][1024],startup_frames[4][3][1024];
static int16_t weak_real_sources[3][1024], weak_real_captures[9][1024];
static uint32_t weak_real_crc;
static int16_t positive_real_sources[3][1024],positive_real_captures[9][1024];
static uint32_t positive_real_crc;
static int16_t position_sources[2][3][1024],position_captures[2][9][1024];
static uint32_t fixture_crc;
static int16_t shadow_baseline[1024], active_baseline[1024], shadow_template[640], active_template[640];
static unsigned tx_total, baseline_loads, commits, raw_index;
static uint32_t pl_tx, pl_status, pl_error, pl_crc, pl_mode, pl_pn;
static int fail_candidate_load, fail_candidate_crc, block_raw_uart, uart_blocked, fail_transaction;
static jmp_buf startup_escape;
static int escape_on_recv;
static unsigned checks, test_groups;
static uint8_t mock_rx[8192],last_pixels[768],native_pixels[768];
static unsigned mock_head,mock_tail,expected_pixels,bulk_transfers,last_pixel_count;
static unsigned rx_limit,rx_dropped;
static int mock_no_ready,mock_no_done,mock_error,mock_page_change,mock_touch;
static unsigned mock_payload_slice;
static int mock_screen_tx_fail, mock_debug_tx_fail, mock_ready_reset;
static unsigned mock_debug_slice;
static int mock_post_plot_error,mock_post_plot_no_ack;
static unsigned mock_operation_requests, mock_bulk_requests;
static int mock_operation_partial;
static const char *mock_export_trigger;
static unsigned mock_export_requests;
static int mock_export_partial;
static int mock_fail_base_ready;
static int mock_guard_corr_override;
static int64_t mock_guard_corr[256];
static uint64_t mock_timer_ticks;
/* Continuous-only event injections. Stage25 regression cases leave these zero. */
static int mock_stop_during_payload,mock_stop_after_fd,mock_start_after_stop;
static int mock_page_after_stop,mock_ready_after_stop,mock_pc_after_stop;
static uint8_t mock_pc_rx[32];
static unsigned mock_pc_head,mock_pc_tail;
static int mock_ready_in_acquisition,mock_error_in_acquisition,mock_page_in_acquisition;
static int mock_stop_at_transaction_entry;
static int mock_read_results_failure,mock_disable_failure;
static unsigned mock_disable_after_tx;
static uint32_t mock_capabilities=15u;
static const char *mock_debug_failure_prefix;
static unsigned numeric_text_writes,numeric_text_unsafe,blank_distance_writes;
static unsigned blank_at_transaction_entry;
static char display_distance_text[64];
static int mock_numeric_no_ack,mock_numeric_error;
static int mock_multi_list_no_ack;
static int mock_axis_error,mock_axis_no_ack,mock_axis_page,mock_axis_tx_fail;
static int mock_class_note_no_ack,mock_class_note_error;
static unsigned class_note_unsafe;


static void push_byte(uint8_t b)
{ if(rx_limit && mock_tail-mock_head>=rx_limit){++rx_dropped;return;} if(mock_tail>=sizeof(mock_rx)){fprintf(stderr,"mock RX overflow\n");exit(4);}mock_rx[mock_tail++]=b; }
static void push_event(uint8_t code)
{ push_byte(code);push_byte(255);push_byte(255);push_byte(255); }

static void push_request(uint8_t command,uint16_t arg)
{
    const uint8_t bytes[]={0xa5,0x5a,1,command,(uint8_t)arg,(uint8_t)(arg>>8),13,10};
    for(unsigned i=0;i<sizeof(bytes);++i)push_byte(bytes[i]);
}

static void push_action_requests(unsigned mask)
{
    const uint8_t commands[]={0x10,0x20,0x11,0x12};
    for(unsigned i=0;i<4;++i)if(mask&(1u<<i))push_request(commands[i],0);
}

#define CHECK(x) do { ++checks; if (!(x)) { fprintf(stderr,"FAIL line %d: %s\n",__LINE__,#x); return 1; } } while (0)

static uint32_t host_crc(const int16_t *values, size_t count)
{
    uint32_t crc = UINT32_MAX;
    for (size_t i=0; i<count; ++i) {
        uint16_t word=(uint16_t)values[i];
        for (unsigned byte=0; byte<2; ++byte) {
            crc ^= (uint8_t)(word >> (8u*byte));
            for (unsigned bit=0; bit<8; ++bit)
                crc = (crc & 1u) ? (crc >> 1) ^ UINT32_C(0xEDB88320) : crc >> 1;
        }
    }
    return ~crc;
}

static void clear_output(void)
{
    debug_size=screen_size=0;
    debug_output[0]=screen_output[0]='\0';
}

static unsigned occurrences(const char *text, const char *needle)
{
    unsigned n=0;
    for (const char *p=text; (p=strstr(p,needle))!=NULL; p+=strlen(needle)) ++n;
    return n;
}

static int all_constant(const int16_t *values, int16_t value)
{
    for (unsigned i=0;i<1024;++i) if (values[i]!=value) return 0;
    return 1;
}

static int save_transcript(const char *name)
{
    FILE *f=fopen(name,"wb");
    CHECK(f!=NULL);
    CHECK(fwrite(debug_output,1,debug_size,f)==debug_size);
    CHECK(fclose(f)==0);
    return 0;
}

static int load_fixture(const char *path)
{
    FILE *f=fopen(path,"r");
    char magic[64];
    CHECK(f!=NULL && fscanf(f,"%63s",magic)==1);
    CHECK(strcmp(magic,"HEALTHY_BASELINE_FIXTURE_V1")==0);
    CHECK(fscanf(f,"%" SCNx32,&fixture_crc)==1);
    for (unsigned frame=0;frame<3;++frame) {
        uint32_t seq;
        CHECK(fscanf(f,"%" SCNu32,&seq)==1 && seq==frame+1u);
        for (unsigned i=0;i<1024;++i) {
            int value;
            CHECK(fscanf(f,"%d",&value)==1 && value>=-32768 && value<=32767);
            real_frames[frame][i]=(int16_t)value;
        }
    }
    for (unsigned i=0;i<1024;++i) {
        int value;
        CHECK(fscanf(f,"%d",&value)==1 && value>=-32768 && value<=32767);
        fixture_expected[i]=(int16_t)value;
    }
    CHECK(fscanf(f,"%63s",magic)==EOF);
    CHECK(fclose(f)==0);
    CHECK(host_crc(fixture_expected,1024)==fixture_crc);
    return 0;
}

static int load_startup_frames(const char *directory)
{
    const char *states[]={"matched","open","short","restored_matched"};
    for(unsigned state=0;state<4;++state)for(unsigned run=0;run<3;++run) {
        char path[2048],line[1024];
        CHECK(snprintf(path,sizeof(path),"%s/%s_r%u.txt",directory,states[state],run+1u)>0);
        FILE *f=fopen(path,"r");CHECK(f!=NULL);
        unsigned count=0;
        while(fgets(line,sizeof(line),f)) {
            unsigned index;int value;
            if(sscanf(line,"RAW,%u,%d",&index,&value)!=2)continue;
            CHECK(index==count && count<1024u && value>=INT16_MIN && value<=INT16_MAX);
            startup_frames[state][run][count++]=(int16_t)value;
        }
        CHECK(count==1024u && fclose(f)==0);
    }
    return 0;
}

static int load_weak_real_fixture(const char *path)
{
    FILE *f=fopen(path,"r");char magic[64];
    CHECK(f!=NULL && fscanf(f,"%63s",magic)==1);
    CHECK(strcmp(magic,"STAGE48_WEAK_REAL10M_V1")==0);
    CHECK(fscanf(f,"%" SCNx32,&weak_real_crc)==1 && weak_real_crc==UINT32_C(0xBB989C29));
    for(unsigned frame=0;frame<12u;++frame) {
        unsigned sequence;CHECK(fscanf(f,"%u",&sequence)==1 && sequence==73u+frame);
        int16_t *dst=frame<3u?weak_real_sources[frame]:weak_real_captures[frame-3u];
        for(unsigned i=0;i<1024u;++i) {
            int value;CHECK(fscanf(f,"%d",&value)==1 && value>=INT16_MIN && value<=INT16_MAX);
            dst[i]=(int16_t)value;
        }
    }
    CHECK(fscanf(f,"%63s",magic)==EOF && fclose(f)==0);
    return 0;
}

static int load_positive_real_fixture(const char *path)
{
    FILE *f=fopen(path,"r");char magic[64];
    CHECK(f!=NULL && fscanf(f,"%63s",magic)==1);
    CHECK(strcmp(magic,"STAGE48_POSITIVE_REAL10M_V1")==0);
    CHECK(fscanf(f,"%" SCNx32,&positive_real_crc)==1 && positive_real_crc==UINT32_C(0xB5B5FD93));
    for(unsigned frame=0;frame<12u;++frame) {
        unsigned sequence;CHECK(fscanf(f,"%u",&sequence)==1 && sequence==88u+frame);
        int16_t *dst=frame<3u?positive_real_sources[frame]:positive_real_captures[frame-3u];
        for(unsigned i=0;i<1024u;++i) {
            int value;CHECK(fscanf(f,"%d",&value)==1 && value>=INT16_MIN && value<=INT16_MAX);
            dst[i]=(int16_t)value;
        }
    }
    CHECK(fscanf(f,"%63s",magic)==EOF && fclose(f)==0);
    return 0;
}

static void select_fixture(const int16_t frames[3][1024])
{
    memcpy(real_frames,frames,sizeof(real_frames));
    for(unsigned i=0;i<1024;++i) {
        int32_t sum=(int32_t)frames[0][i]+frames[1][i]+frames[2][i];
        fixture_expected[i]=(int16_t)(sum<0 ? -((-sum+1)/3) : (sum+1)/3);
    }
    fixture_crc=host_crc(fixture_expected,1024);
}

static void plain_pn_correlation(const int16_t *raw,int64_t *corr)
{
    for(unsigned lag=0;lag<256;++lag) {
        corr[lag]=0;
        for(unsigned tap=0;tap<640;++tap)
            corr[lag]+=(int64_t)((int32_t)raw[lag+tap]-566)*pn_template_q14[tap];
    }
}

XUartPs_Config *XUartPs_LookupConfig(unsigned id)
{
    static XUartPs_Config cfg[2]={{0},{1}};
    return id<2u ? &cfg[id] : NULL;
}
int XUartPs_CfgInitialize(XUartPs *uart,XUartPs_Config *cfg,uintptr_t address)
{ (void)cfg; uart->BaseAddress=address; return XST_SUCCESS; }
int XUartPs_SetDataFormat(XUartPs *uart,XUartPsFormat *format)
{ (void)uart; return format->BaudRate==115200u ? XST_SUCCESS : XST_FAILURE; }
void XUartPs_SetOperMode(XUartPs *uart,unsigned mode) { (void)uart; (void)mode; }
u32 XUartPs_Send(XUartPs *uart,u8 *bytes,u32 count)
{
    int debug=(uart==&uart_debug);
    if(!debug && mock_axis_tx_fail && count>=5u && memcmp(bytes,"xstr ",5u)==0)return 0;
    if(debug && mock_debug_failure_prefix && count>=strlen(mock_debug_failure_prefix) &&
       memcmp(bytes,mock_debug_failure_prefix,strlen(mock_debug_failure_prefix))==0)return 0;
    if ((!debug && mock_screen_tx_fail) || (debug && mock_debug_tx_fail)) return 0;
    if (debug && mock_debug_slice && count>mock_debug_slice) count=mock_debug_slice;
    if(!debug && expected_pixels && mock_payload_slice && count>mock_payload_slice)count=mock_payload_slice;
    if (debug && block_raw_uart && count>=7u && memcmp(bytes,"RAW,10,",7)==0) uart_blocked=1;
    if (debug && uart_blocked) return 0;
    if(debug && mock_fail_base_ready && count>=11u && memcmp(bytes,"BASE_READY,",11u)==0){uart_blocked=1;return 0;}
    if(debug && mock_export_trigger && count>=strlen(mock_export_trigger) &&
       memcmp(bytes,mock_export_trigger,strlen(mock_export_trigger))==0) {
        mock_export_trigger=NULL;push_action_requests(mock_export_requests);
        if(mock_export_partial){push_byte(0xa5);push_byte(0x5a);push_byte(1);push_byte(0x20);}
    }
    char *out=debug ? debug_output : screen_output;
    size_t *used=debug ? &debug_size : &screen_size;
    if (*used+count+1u>=LOG_CAPACITY) { fprintf(stderr,"Mock UART buffer exhausted\n"); exit(3); }
    memcpy(out+*used,bytes,count); *used+=count; out[*used]='\0';
    if(!debug) {
        if(count>=strlen("t_note.txt=\"SHORT-LIKE") &&
            (memcmp(bytes,"t_note.txt=\"OPEN-LIKE",strlen("t_note.txt=\"OPEN-LIKE"))==0 ||
             memcmp(bytes,"t_note.txt=\"SHORT-LIKE",strlen("t_note.txt=\"SHORT-LIKE"))==0) &&
            (expected_pixels || screen_bulk_active))++class_note_unsafe;
        if(count>12u && memcmp(bytes,"t_dist.txt=\"",12u)==0) {
            unsigned n=0;while(12u+n<count && bytes[12u+n]!='"' && n+1u<sizeof(display_distance_text)) {
                display_distance_text[n]=(char)bytes[12u+n];++n;
            }
            display_distance_text[n]='\0';
        }
        int numeric_command=count>=strlen("t_dist.txt=\"10.000 m\"") && memcmp(bytes,"t_dist.txt=\"10.000 m\"",strlen("t_dist.txt=\"10.000 m\""))==0;
        if((long_candidate_selected || negative_extension_selected) && count>12u && memcmp(bytes,"t_dist.txt=\"",12u)==0 && bytes[12u]>='0' && bytes[12u]<='9')numeric_command=1;
        if(ECHO_MULTI61_ENABLE && count>12u && memcmp(bytes,"t_dist.txt=\"",12u)==0 && bytes[12u]!='-')numeric_command=1;
        if(numeric_command) {
            ++numeric_text_writes;
            if(expected_pixels || screen_bulk_active || screen_ack_pending || !last_plot_valid ||
               screen_link_blocked || screen_reset_seen || screen_refresh_pending)++numeric_text_unsafe;
        }
        if(count>=strlen("t_dist.txt=\"-- m\"") && memcmp(bytes,"t_dist.txt=\"-- m\"",strlen("t_dist.txt=\"-- m\""))==0)++blank_distance_writes;
        if(expected_pixels) {
            if(mock_stop_during_payload) {
                mock_stop_during_payload=0;
                push_request(0x12,0);
                if(mock_start_after_stop)push_request(0x11,0);
                if(mock_page_after_stop){push_byte(0x66);push_byte(1);push_byte(255);push_byte(255);push_byte(255);}
                if(mock_ready_after_stop)push_event(0x88);
                if(mock_pc_after_stop)mock_pc_rx[mock_pc_tail++]=(uint8_t)mock_pc_after_stop;
            }
            if(count>expected_pixels || last_pixel_count+count>768u){fprintf(stderr,"Oversized transparent payload\n");exit(5);}
            memcpy(last_pixels+last_pixel_count,bytes,count);last_pixel_count+=count;expected_pixels-=count;
            if(!expected_pixels){for(unsigned p=0;p<last_pixel_count;++p)native_pixels[p]=last_pixels[last_pixel_count-1u-p];++bulk_transfers;if(!mock_no_done)push_event(0xfd);}
        } else if(count>=5u && memcmp(bytes,"addt ",5u)==0) {
            char command[81];unsigned id,channel,n;
            if(count>=sizeof(command))exit(6);
            memcpy(command,bytes,count);command[count]=0;
            if(sscanf(command,"addt %u,%u,%u",&id,&channel,&n)!=3 || (id!=8u && id!=12u) || channel || n>768u)exit(7);
            if(mock_ready_reset){expected_pixels=0;push_event(0x88);}
            else if(mock_error)push_event(0x12);
            else {
                expected_pixels=n;
                last_pixel_count=0;
                push_action_requests(mock_bulk_requests);
                if(mock_page_change){push_byte(0x66);push_byte(2);push_byte(255);push_byte(255);push_byte(255);}
                if(mock_touch){const uint8_t request[]={0xa5,0x5a,1,0x30,0,0,13,10};for(unsigned i=0;i<8;++i)push_byte(request[i]);}
                if(!mock_no_ready)push_event(0xfe);
            }
        } else if(count>=5u && memcmp(bytes,"xstr ",5u)==0 && (mock_axis_error || mock_axis_no_ack || mock_axis_page)) {
            if(mock_axis_error)push_event(0x1a);
            if(mock_axis_page){push_byte(0x66);push_byte(2);push_byte(255);push_byte(255);push_byte(255);push_event(1);}
        } else if(count>=strlen("t_note.txt=\"OPEN-LIKE") && memcmp(bytes,"t_note.txt=\"OPEN-LIKE",strlen("t_note.txt=\"OPEN-LIKE"))==0 && (mock_class_note_no_ack || mock_class_note_error)) {
            if(mock_class_note_error)push_event(0x1a);
        } else if(mock_multi_list_no_ack && count>13u && memcmp(bytes,"t_cal.txt=\"1:",13u)==0) {
            /* Intentionally withhold only the list ACK. */
        } else if(numeric_command && (mock_numeric_no_ack || mock_numeric_error)) {
            if(mock_numeric_error)push_event(0x1a);
        } else if(count>=6u && memcmp(bytes,"sendme",6u)==0) {
            push_byte(0x66);push_byte(0);push_byte(255);push_byte(255);push_byte(255);
        } else if(count>=5u && memcmp(bytes,"fill ",5u)==0 && mock_stop_after_fd) {
            mock_stop_after_fd=0;push_request(0x12,0);push_event(1);
            if(mock_start_after_stop)push_request(0x11,0);
        } else if(count>=5u && memcmp(bytes,"fill ",5u)==0 && mock_post_plot_error)push_event(0x1a);
        else if(!(count>=5u && memcmp(bytes,"fill ",5u)==0 && mock_post_plot_no_ack))push_event(1);
    }
    return count;
}
u32 XUartPs_Recv(XUartPs *uart,u8 *bytes,u32 count)
{
    if(escape_on_recv)longjmp(startup_escape,1);
    if(uart==&uart_debug && count && mock_pc_head<mock_pc_tail){*bytes=mock_pc_rx[mock_pc_head++];return 1;}
    if(uart==&uart_screen && count && mock_head<mock_tail){*bytes=mock_rx[mock_head++];if(mock_head==mock_tail)mock_head=mock_tail=0;return 1;}
    return 0;
}
int XUartPs_IsTransmitEmpty(XUartPs *uart) { (void)uart; return 1; }
void usleep(unsigned long usec) { (void)usec; }
uint32_t Xil_In32(UINTPTR address)
{
    if(address==GTIMER_LO_ADDR) { mock_timer_ticks+=333334u; return (uint32_t)mock_timer_ticks; }
    if(address==GTIMER_HI_ADDR)return (uint32_t)(mock_timer_ticks>>32);
    return address==GTIMER_CTRL_ADDR ? 1u : 0u;
}
void Xil_Out32(UINTPTR address,uint32_t value) { (void)address; (void)value; }

uint32_t mmio_read32(uintptr_t base,uint32_t offset)
{
    (void)base;
    switch(offset) {
    case ECHO_REG_IP_ID:return ECHO_IP_ID_VALUE;
    case ECHO_REG_VERSION:return ECHO_IP_VERSION_PN17;
    case ECHO_REG_CAPABILITIES:return mock_capabilities;
    case ECHO_REG_SAMPLE_RATE_HZ:return 200000000u;
    case ECHO_REG_PAIR_RATE_HZ:return 100000000u;
    case ECHO_REG_PN_INFO:return 0x007f0207u;
    case ECHO_REG_PN_SEED:return 127u;
    case ECHO_REG_PN_AMPLITUDE:return 4096u;
    case ECHO_REG_FRAME_COUNT:return 32u;
    case ECHO_REG_RESULT_COUNT:return 256u;
    case ECHO_REG_AVERAGE_VALID:return 3u;
    case ECHO_REG_TRANSACTION_COUNT:return pl_tx;
    case ECHO_REG_STATUS:return pl_status;
    case ECHO_REG_LAST_ERROR:return pl_error;
    case ECHO_REG_BASELINE_CRC:return pl_crc;
    case ECHO_REG_PULSE_CONFIG:return pl_mode | (4u<<8);
    case ECHO_REG_WAVEFORM_CONFIG:return pl_pn;
    default:return 0;
    }
}
void mmio_write32(uintptr_t base,uint32_t offset,uint32_t value)
{ (void)base; (void)offset; (void)value; }
int echo_bringup(uintptr_t base,const struct echo_hw_info *expected,struct echo_bringup_report *report)
{
    (void)base;
    memset(report,0,sizeof(*report)); report->actual=*expected;
    report->status=pl_status;
    return 0;
}
int echo_configure_waveform(int enable) { if(!enable && mock_disable_failure && tx_total>mock_disable_after_tx)return -7;pl_pn=(uint32_t)enable; return 0; }
int echo_configure_pulse(uint8_t mode,uint8_t width) { (void)width; pl_mode=mode; return 0; }
int echo_load_baseline(const int16_t *values,size_t count)
{
    ++baseline_loads;
    if(values==NULL || count!=1024) return -1;
    if(fail_candidate_load && !all_constant(values,566)) return -4;
    memcpy(shadow_baseline,values,sizeof(shadow_baseline));
    pl_crc=host_crc(values,count);
    return 0;
}
int echo_load_template(const int16_t *values,size_t count)
{ if(values==NULL || count!=640)return -1; memcpy(shadow_template,values,sizeof(shadow_template)); return 0; }
int echo_commit_coefficients(void)
{
    ++commits;
    memcpy(active_baseline,shadow_baseline,sizeof(active_baseline));
    memcpy(active_template,shadow_template,sizeof(active_template));
    pl_status|=ECHO_STATUS_COEFF_VALID;
    if(fail_candidate_crc && !all_constant(active_baseline,566))pl_crc^=1u;
    return 0;
}
int echo_run_transaction_traced(uint32_t timeout,echo_now_ms_fn clock,echo_transaction_trace_t *trace)
{
    (void)timeout;
    blank_at_transaction_entry=blank_distance_writes;
    push_action_requests(mock_operation_requests);
    if(mock_stop_at_transaction_entry){mock_stop_at_transaction_entry=0;push_request(0x12,0);}
    if(mock_ready_in_acquisition){mock_ready_in_acquisition=0;push_event(0x88);}
    if(mock_error_in_acquisition){mock_error_in_acquisition=0;push_event(0x1a);}
    if(mock_page_in_acquisition){unsigned page=mock_page_in_acquisition==2?0u:1u;mock_page_in_acquisition=0;push_byte(0x66);push_byte((uint8_t)page);push_byte(255);push_byte(255);push_byte(255);}
    if(mock_operation_partial){push_byte(0xa5);push_byte(0x5a);push_byte(1);push_byte(0x20);mock_operation_partial=0;}
    if(clock)(void)clock(); /* exercise production acquisition event pump */
    trace->tx_on_entry=pl_tx; trace->tx_after_clear=0;
    if(fail_transaction) { trace->tx_on_completion=0; return -3; }
    raw_index=tx_total%3u; ++tx_total; pl_tx=1;
    trace->tx_on_completion=1;
    pl_status=ECHO_STATUS_COEFF_VALID|ECHO_STATUS_ADC_READY|ECHO_STATUS_DONE|ECHO_STATUS_START_ACCEPTED;
    return 0;
}
int echo_get_status(struct echo_status *status) { status->raw=pl_status; status->last_error=pl_error; return 0; }
int echo_read_average_frame(int16_t *dst,size_t capacity)
{ if(capacity<1024)return -1; memcpy(dst,real_frames[raw_index],sizeof(real_frames[raw_index])); return 0; }
int echo_read_results(int64_t *dst,size_t capacity)
{
    if(mock_read_results_failure)return -8;
    if(capacity<256)return -1;
    if(mock_guard_corr_override){memcpy(dst,mock_guard_corr,sizeof(mock_guard_corr));return 0;}
    for(unsigned lag=0;lag<256;++lag) {
        int64_t sum=0;
        for(unsigned tap=0;tap<640;++tap)
            sum+=(int64_t)((int32_t)real_frames[raw_index][lag+tap]-active_baseline[lag+tap])*active_template[tap];
        dst[lag]=sum;
    }
    return 0;
}
int echo_locator_run(const int16_t raw[1024],echo_locator_result_t *result)
{ (void)raw; memset(result,0,sizeof(*result)); return 0; }

static int test_no_baseline_and_explicit_collection(void)
{
    ++test_groups;
    CHECK(uart_init(&uart_debug,1u)==0 && uart_init(&uart_screen,0u)==0);
    echo_healthy_baseline_reset(&healthy_baseline);
    pl_status=ECHO_STATUS_ADC_READY;
    invalidate_text_cache();
    clear_output();
    process_pc_debug_byte('D');
    CHECK(tx_total==0 && baseline_loads==0 && !fatal_failure);
    CHECK(strstr(debug_output,"[DIFF] DENIED: no healthy reference")!=NULL);
    clear_output();
    process_pc_debug_byte('B');
    CHECK(tx_total==3 && baseline_loads==4 && commits==4);
    CHECK(!fatal_failure && batch_ok && !average_available && !correlation_available);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(active_baseline))==0);
    CHECK(occurrences(debug_output,"RAW_BEGIN,")==3 && occurrences(debug_output,"RAW_END,")==3);
    CHECK(occurrences(debug_output,"\r\nRAW,")==3u*1024u);
    CHECK(occurrences(debug_output,"PN_DISTANCE,STATUS=LOW_RETURN,")==3);
    CHECK(strstr(debug_output,"FIRST_SEQ=1,LAST_SEQ=3")!=NULL);
    CHECK(strstr(debug_output,"[BASE] PASS:")!=NULL);
    const char *p=debug_output;
    for(unsigned frame=0;frame<3;++frame) {
        p=strstr(p,"RAW_BEGIN,"); CHECK(p!=NULL); p=strchr(p,'\n'); CHECK(p!=NULL); ++p;
        for(unsigned i=0;i<1024;++i) {
            unsigned index; int value;
            CHECK(sscanf(p,"RAW,%u,%d",&index,&value)==2);
            CHECK(index==i && value==real_frames[frame][i]);
            p=strchr(p,'\n'); CHECK(p!=NULL); ++p;
        }
    }
    CHECK(save_transcript("stage48_main_mock_B.txt")==0);
    return 0;
}

static int test_difference_and_exports(void)
{
    ++test_groups; clear_output();
    invalidate_text_cache();
    current_page=0; current_page_valid=1;
    process_pc_debug_byte('D');
    CHECK(tx_total==4 && diagnostic_waveform==3u && !fatal_failure && average_available && correlation_available);
    CHECK(cached_baseline_id==1u && cached_baseline_crc==fixture_crc);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(active_baseline))==0 && !all_constant(active_baseline,566));
    CHECK(strstr(debug_output,"PN_DIFF_RESULT,")!=NULL && strstr(debug_output,"DISTANCE_VALID=0")!=NULL);
    CHECK(strstr(debug_output,"PN_DISTANCE,")==NULL);
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
    for(unsigned lag=0;lag<256;++lag) {
        int64_t expected=0;
        for(unsigned tap=0;tap<640;++tap)
            expected+=(int64_t)((int32_t)real_frames[raw_index][lag+tap]-fixture_expected[lag+tap])*pn_template_q14[tap];
        CHECK(correlation_q16[lag]==expected);
    }
    process_pc_debug_byte('R'); process_pc_debug_byte('C');
    CHECK(strstr(debug_output,"PROC=HEALTHY_DIFF,BASE_ID=1,")!=NULL);
    CHECK(occurrences(debug_output,"DCORR_BEGIN,")==1 && occurrences(debug_output,"\r\nDCORR,")==256);
    CHECK(strstr(debug_output,"\r\nCORR_BEGIN,")==NULL);
    CHECK(save_transcript("stage48_main_mock_D.txt")==0);
    clear_output(); process_pc_debug_byte('J');
    CHECK(occurrences(debug_output,"BASE_BEGIN,")==1 && occurrences(debug_output,"\r\nBASE,")==1024);
    CHECK(strstr(debug_output,"FIRST_SEQ=1,LAST_SEQ=3")!=NULL);
    CHECK(save_transcript("stage48_main_mock_J.txt")==0);
    return 0;
}

static int test_legacy_switch_and_restore(void)
{
    const char commands[]={'P','L','Z'};
    for(unsigned i=0;i<sizeof(commands);++i) {
        ++test_groups; clear_output();
        unsigned before=tx_total;
        process_pc_debug_byte((uint8_t)commands[i]);
        CHECK(tx_total==before+1 && !fatal_failure && all_constant(active_baseline,566));
        CHECK(diagnostic_waveform==(commands[i]=='P' ? 1u : commands[i]=='Z' ? 2u : 0u));
        CHECK(pl_mode==(commands[i]=='Z' ? 2u : 5u));
        CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
        CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
        if(commands[i]=='P') {
            process_pc_debug_byte('C');
            CHECK(strstr(debug_output,"\r\nCORR_BEGIN,")!=NULL && strstr(debug_output,"DCORR_BEGIN,")==NULL);
        }
        clear_output(); process_pc_debug_byte('D');
        CHECK(tx_total==before+2 && !fatal_failure && cached_baseline_id==1u && cached_baseline_crc==fixture_crc);
        CHECK(memcmp(active_baseline,fixture_expected,sizeof(active_baseline))==0);
        CHECK(strstr(debug_output,"PN_DISTANCE,")==NULL);
    }
    return 0;
}

static int test_failure_retention_and_reset(void)
{
    ++test_groups; clear_output();
    unsigned before=tx_total;
    fail_candidate_load=1;
    process_pc_debug_byte('B');
    fail_candidate_load=0;
    CHECK(tx_total==before+3 && fatal_failure && !batch_ok);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
    CHECK(strstr(debug_output,"[BASE] PASS:")==NULL);
    clear_output(); process_pc_debug_byte('D');
    CHECK(tx_total==before+3 && strstr(debug_output,"previous failure; reset first")!=NULL);
    ++test_groups; fatal_failure=0; clear_output();
    before=tx_total; block_raw_uart=1;
    process_pc_debug_byte('B');
    block_raw_uart=uart_blocked=0;
    CHECK(tx_total==before+1 && fatal_failure && !batch_ok);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(!healthy_baseline.collecting && !healthy_baseline.ready);
    CHECK(occurrences(debug_output,"RAW_BEGIN,")==1 && occurrences(debug_output,"RAW_END,")==0);
    ++test_groups; fatal_failure=0; clear_output();
    escape_on_recv=1;
    if(setjmp(startup_escape)==0) (void)production_firmware_main();
    escape_on_recv=0;
    CHECK(strstr(debug_output,"STAGE63 THREE ROW CANDIDATES READY")!=NULL);
    CHECK(!echo_healthy_baseline_is_valid(&healthy_baseline));
    clear_output(); before=tx_total; process_pc_debug_byte('D');
    CHECK(tx_total==before && strstr(debug_output,"no healthy reference")!=NULL);
    return 0;
}

static void reset_mock_screen(void)
{
    mock_axis_error=mock_axis_no_ack=mock_axis_page=mock_axis_tx_fail=0;
    expected_pixels=mock_head=mock_tail=0;
    mock_no_ready=mock_no_done=mock_error=mock_page_change=mock_touch=0;
    mock_payload_slice=0;
    mock_screen_tx_fail=mock_debug_tx_fail=mock_ready_reset=0;mock_debug_slice=0;
    mock_post_plot_error=mock_post_plot_no_ack=0;screen_ack_pending=0;
    screen_link_blocked=screen_bulk_active=screen_reset_seen=screen_deferred_error=0;
    deferred_hmi_head=deferred_hmi_count=0;screen_refresh_pending=0;
    last_plot_valid=0;plot_view_explicit=0;plot_zoom=0;
    invalidate_text_cache();
    tdr_hmi_parser_init(&parser);
}

static int test_wave_views_and_failures(void)
{
    ++test_groups;
    reset_mock_screen();clear_output();
    unsigned before=tx_total;
    uint32_t sequence=measurement_seq;
    current_page=0;current_page_valid=1;
    process_pc_debug_byte('W');
    CHECK(tx_total==before && measurement_seq==sequence && last_pixel_count==512u);
    CHECK(strstr(debug_output,"KIND=CORR,N=512,")!=NULL);
    CHECK(nominal_axis_frame(&plot_frame) && strstr(screen_output,"X:NOMINAL m")!=NULL);
    unsigned transfers=bulk_transfers;
    clear_output();show_current_page();
    CHECK(bulk_transfers==transfers && screen_size==0u);
    tdr_hmi_event_t event={.type=TDR_HMI_REQUEST,.cmd=1,.arg=1};
    process_hmi_event(&event);
    CHECK(last_pixel_count==768u && strstr(screen_output,"b_raw.txt=\"AVG32\"")!=NULL);
    CHECK(strstr(screen_output,"b_diff.txt=\"CORRELATION\"")!=NULL);
    for(unsigned kind=0;kind<3;++kind) {
        event.cmd=0x30;event.arg=(uint16_t)kind;process_hmi_event(&event);
        CHECK(last_plot_kind==kind && tx_total==before && measurement_seq==sequence);
        event.cmd=0x31;event.arg=1;process_hmi_event(&event);
        CHECK(plot_frame.first==(kind==2u?153u:96u) && plot_frame.source_count==(kind==2u?21u:608u));
        event.arg=0;process_hmi_event(&event);
    }
    ++test_groups;
    reset_mock_screen();current_page=0;current_page_valid=1;mock_touch=1;
    process_pc_debug_byte('W');
    CHECK(deferred_hmi_count==1u && !plot_view_explicit && tx_total==before);
    event=deferred_hmi[deferred_hmi_head];deferred_hmi_count=0;mock_touch=0;
    current_page=1;current_page_valid=1;process_hmi_event(&event);
    CHECK(plot_view_explicit && plot_view==0u && tx_total==before);
    ++test_groups;
    reset_mock_screen();current_page=0;current_page_valid=1;mock_page_change=1;transfers=bulk_transfers;
    clear_output();process_pc_debug_byte('W');
    CHECK(bulk_transfers==transfers+1u && current_page==2u && screen_refresh_pending);
    CHECK(strstr(debug_output,"HMI_PLOT,")==NULL && !screen_link_blocked);
    const int failure_modes[]={1,2,3};
    for(unsigned i=0;i<3;++i) {
        ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;
        mock_no_ready=failure_modes[i]==1;mock_no_done=failure_modes[i]==2;mock_error=failure_modes[i]==3;
        clear_output();process_pc_debug_byte('W');
        CHECK(screen_link_blocked && !fatal_failure && average_available && correlation_available);
        CHECK(strstr(debug_output,"WAVE_ERROR:")!=NULL && strstr(debug_output,"HMI_PLOT,")==NULL);
        size_t sent=screen_size;set_text("t_note","MUST NOT ENTER A TRANSPARENT PAYLOAD");
        CHECK(screen_size==sent && tx_total==before && measurement_seq==sequence);
        if(i==0u)CHECK(expected_pixels==512u);
        if(i==1u)CHECK(expected_pixels==0u);
    }
    reset_mock_screen();current_page=0;current_page_valid=1;
    process_pc_debug_byte('W');
    CHECK(!screen_link_blocked && last_plot_valid && tx_total==before);
    ++test_groups;reset_mock_screen();current_page=1;current_page_valid=1;mock_payload_slice=17;
    process_pc_debug_byte('W');
    CHECK(!screen_link_blocked && last_plot_valid && last_pixel_count==768u && !expected_pixels);
    CHECK(memcmp(native_pixels,plot_frame.pixels,768)==0 && tx_total==before && measurement_seq==sequence);
    return 0;
}

static int test_text_cache_and_invalidation(void)
{
    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
    set_text("t_link","HOST ONLINE");
    size_t first=screen_size;CHECK(first>0u);
    set_text("t_link","HOST ONLINE");CHECK(screen_size==first);
    set_text("t_link","LINK CHANGED");CHECK(screen_size>first);
    clear_output();note_screen_page(0u);set_text("t_link","LINK CHANGED");CHECK(screen_size>0u);
    clear_output();note_screen_page(1u);set_text("t_link","LINK CHANGED");CHECK(screen_size>0u);
    clear_output();log_line("[HMI] LCD error code=26");
    set_text("t_link","LINK CHANGED");CHECK(screen_size>0u && !fast_saved_valid);
    clear_output();tdr_hmi_event_t ready={.type=TDR_HMI_READY};process_hmi_event(&ready);
    CHECK(!current_page_valid && text_cache_count==0u);
    reset_mock_screen();current_page=0;current_page_valid=1;clear_output();mock_screen_tx_fail=1;
    set_text("t_link","TX FAILURE");mock_screen_tx_fail=0;
    CHECK(screen_link_blocked && text_cache_count==0u && strstr(debug_output,"WAVE_ERROR")!=NULL);
    reset_mock_screen();current_page=0;current_page_valid=1;
    return 0;
}

static int test_compact_success_replay_and_old_D(void)
{
    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
    unsigned tx=tx_total;uint32_t seq=measurement_seq;
    process_pc_debug_byte('F');
    CHECK(tx_total==tx+1u && measurement_seq==seq+1u && fast_saved_valid && !fast_active);
    CHECK(!fatal_failure && batch_ok && last_plot_valid && last_pixel_count==512u);
    CHECK(occurrences(debug_output,"FAST_RESULT,")==1u && occurrences(debug_output,"\r\n")==1u);
    CHECK(strstr(debug_output,"[DIFF] START:")==NULL && strstr(debug_output,"PN_DIFF_RESULT,")==NULL);
    CHECK(strstr(debug_output,"READY=1,DONE=1,")!=NULL && strstr(debug_output,"RC=0,WEAK_STATUS=")!=NULL && strstr(debug_output,"DISTANCE_VALID=0")!=NULL);
    CHECK(fast_summary_lines==10u && fast_plot_lines==1u && fast_summary_used<2048u);
    CHECK(screen_ack_pending==0u);
    CHECK(strstr(fast_summary,"[DIFF] START:")!=NULL && strstr(fast_summary,"PN_DIFF_RESULT,")!=NULL);
    CHECK(strstr(fast_summary,"HMI_PLOT,")!=NULL && strstr(fast_summary,"[DIFF] PASS:")!=NULL);
    CHECK(save_transcript("stage48_fast_main_mock_F.txt")==0);
    clear_output();process_pc_debug_byte('I');
    CHECK(tx_total==tx+1u && measurement_seq==seq+1u && strcmp(debug_output,fast_summary)==0);
    process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(occurrences(debug_output,"RAW_BEGIN,")==1u && occurrences(debug_output,"DCORR_BEGIN,")==1u);
    CHECK(save_transcript("stage48_fast_main_mock_I_R_C.txt")==0);
    clear_output();process_pc_debug_byte('J');CHECK(fast_saved_valid && tx_total==tx+1u);
    clear_output();process_pc_debug_byte('V');CHECK(fast_saved_valid && strstr(debug_output,"FW_STAGE=63")!=NULL);
    clear_output();process_pc_debug_byte('W');CHECK(fast_saved_valid && tx_total==tx+1u);

    ++test_groups;clear_output();process_pc_debug_byte('D');
    CHECK(tx_total==tx+2u && !fast_saved_valid && occurrences(debug_output,"\r\n")==10u);
    CHECK(occurrences(debug_output,"[DIFF] START:")==1u && occurrences(debug_output,"HMI_PLOT,")==1u);
    CHECK(strstr(debug_output,"FAST_RESULT,")==NULL);
    clear_output();process_pc_debug_byte('I');CHECK(strstr(debug_output,"DENIED")!=NULL && tx_total==tx+2u);

    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;
    process_pc_debug_byte('F');CHECK(fast_saved_valid);
    clear_output();tx=tx_total;process_pc_debug_byte('F');
    CHECK(tx_total==tx+1u && fast_saved_valid && occurrences(debug_output,"FAST_RESULT,")==1u);
    CHECK(strstr(screen_output,"MEASURING...")==NULL && strstr(screen_output,"PL DIFFERENCE - SEE PC")==NULL);
    CHECK(occurrences(screen_output,".txt=")==0u && last_pixel_count==512u);
    return 0;
}

static int test_fast_guards_and_failures(void)
{
    ++test_groups;reset_mock_screen();current_page=1;current_page_valid=1;clear_output();
    unsigned tx=tx_total;process_pc_debug_byte('F');
    CHECK(tx_total==tx && strstr(debug_output,"DENIED")!=NULL && strstr(debug_output,"FAST_RESULT,")==NULL);
    reset_mock_screen();current_page=0;current_page_valid=1;
    deferred_hmi_count=1;clear_output();process_pc_debug_byte('F');
    CHECK(tx_total==tx && strstr(debug_output,"DENIED")!=NULL);
    deferred_hmi_count=0;
    const unsigned failures=6;
    for(unsigned i=0;i<failures;++i) {
        ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();tx=tx_total;
        mock_no_ready=i==0u;mock_no_done=i==1u;mock_error=i==2u;mock_page_change=i==3u;
        mock_touch=i==4u;mock_ready_reset=i==5u;
        process_pc_debug_byte('F');
        CHECK(tx_total==tx+1u && !fast_saved_valid && !fast_active && !batch_ok);
        CHECK(strstr(debug_output,"FAST_RESULT,")==NULL && strstr(debug_output,"[FAST] FAILED:")!=NULL);
        CHECK(strstr(debug_output,"[DIFF] PASS:")==NULL);
        clear_output();process_pc_debug_byte('I');CHECK(strstr(debug_output,"DENIED")!=NULL && tx_total==tx+1u);
    }
    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();tx=tx_total;
    fail_transaction=1;process_pc_debug_byte('F');fail_transaction=0;
    CHECK(tx_total==tx && fatal_failure && !fast_saved_valid && strstr(debug_output,"[STOP]")!=NULL);
    CHECK(strstr(debug_output,"FAST_RESULT,")==NULL);fatal_failure=0;

    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
    mock_screen_tx_fail=1;process_pc_debug_byte('F');mock_screen_tx_fail=0;
    CHECK(!fast_saved_valid && screen_link_blocked && strstr(debug_output,"FAST_RESULT,")==NULL);
    CHECK(strstr(debug_output,"WAVE_ERROR")!=NULL);

    for(unsigned i=0;i<2u;++i) {
        ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
        mock_post_plot_error=i==0u;mock_post_plot_no_ack=i==1u;
        process_pc_debug_byte('F');
        CHECK(!fast_saved_valid && strstr(debug_output,"FAST_RESULT,")==NULL);
        CHECK(strstr(debug_output,i==0u?"LCD error":"WAVE_ERROR")!=NULL);
    }

    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
    mock_payload_slice=17;mock_debug_slice=7;process_pc_debug_byte('F');
    CHECK(fast_saved_valid && last_pixel_count==512u && memcmp(native_pixels,plot_frame.pixels,512u)==0);
    CHECK(occurrences(debug_output,"FAST_RESULT,")==1u && occurrences(debug_output,"\r\n")==1u);
    clear_output();process_pc_debug_byte('I');CHECK(strcmp(debug_output,fast_summary)==0);
    mock_debug_slice=0;

    ++test_groups;reset_mock_screen();current_page=0;current_page_valid=1;clear_output();
    fast_active=1;fast_capture_failed=0;fast_summary_used=FAST_SUMMARY_CAPACITY-2u;
    CHECK(send_record("OVERFLOW")==-1 && fast_capture_failed && !fast_saved_valid);
    fast_active=0;CHECK(strstr(debug_output,"FAILED: diagnostic replay buffer full")!=NULL);
    fast_summary_used=0;
    return 0;
}

static void hmi_request(uint8_t command,uint16_t arg)
{
    const tdr_hmi_event_t event={.type=TDR_HMI_REQUEST,.cmd=command,.arg=arg};
    process_hmi_event(&event);
}

static int drain_mock_screen_events(void)
{
    uint8_t byte;tdr_hmi_event_t event;
    for(unsigned count=0;count<20000u;++count) {
        if(XUartPs_Recv(&uart_screen,&byte,1u)!=1u)return 0;
        if(tdr_hmi_parser_feed(&parser,byte,(uint32_t)now_ms(),&event))process_hmi_event(&event);
    }
    CHECK(0 && "Screen mock event loop did not quiesce");
    return 1;
}

static int reset_screen_case(unsigned page,int with_baseline)
{
    /* Reset only simulated process state; no production reference is bypassed. */
    continuous_reset();
    reset_mock_screen();clear_output();
    mock_operation_requests=mock_bulk_requests=0;mock_operation_partial=0;
    mock_stop_during_payload=mock_stop_after_fd=mock_start_after_stop=0;
    mock_page_after_stop=mock_ready_after_stop=mock_pc_after_stop=0;mock_pc_head=mock_pc_tail=0;
    mock_ready_in_acquisition=mock_error_in_acquisition=mock_page_in_acquisition=mock_stop_at_transaction_entry=0;
    mock_export_trigger=NULL;mock_export_requests=0;mock_export_partial=0;
    fail_transaction=fail_candidate_load=fail_candidate_crc=block_raw_uart=uart_blocked=0;
    screen_operation_active=screen_service_active=0;screen_pn_mode=1;reference_capture_failed=0;cancel_reference_confirmation();
    healthy_guard_profile=healthy_guard_mask=0u;
    mock_fail_base_ready=mock_guard_corr_override=0;
    mock_read_results_failure=mock_disable_failure=0;mock_debug_failure_prefix=NULL;mock_capabilities=15u;
    numeric_text_writes=numeric_text_unsafe=blank_distance_writes=blank_at_transaction_entry=0;
    mock_numeric_no_ack=mock_numeric_error=0;
    attempted=busy=batch_ok=fatal_failure=last_located=0;
    average_available=correlation_available=0;diagnostic_waveform=0;
    completed_runs=measurement_seq=0;healthy_first_seq=healthy_last_seq=0;
    cached_baseline_id=cached_baseline_crc=0;last_kind=ECHO_LOCATOR_NONE;last_distance_mm=0;
    tx_total=baseline_loads=commits=raw_index=0;
    pl_tx=pl_error=pl_crc=pl_mode=pl_pn=0;pl_status=ECHO_STATUS_ADC_READY;
    memset(&pn_range,0,sizeof(pn_range));
    echo_healthy_baseline_reset(&healthy_baseline);
    note_screen_page(page);
    if(with_baseline) {
        process_pc_debug_byte('B');
        CHECK(tx_total==3u && echo_healthy_baseline_is_valid(&healthy_baseline) && !fatal_failure);
        CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
        CHECK(drain_mock_screen_events()==0);
    }
    clear_output();
    return 0;
}

static int test_screen_single_requires_reference_and_page(void)
{
    ++test_groups;CHECK(reset_screen_case(0,0)==0);
    hmi_request(0x10,0);
    CHECK(tx_total==0u && measurement_seq==0u && !fatal_failure);
    CHECK(strstr(debug_output,"DENIED")!=NULL && strstr(debug_output,"[LOCATE] START:")==NULL);
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
    for(unsigned page=1;page<5;++page) {
        ++test_groups;CHECK(reset_screen_case(page,1)==0);
        unsigned before=tx_total;hmi_request(0x10,0);
        CHECK(tx_total==before && strstr(debug_output,"DENIED")!=NULL);
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);
    unsigned before=tx_total;hmi_request(0x10,1);
    CHECK(tx_total==before && strstr(debug_output,"DENIED")!=NULL);
    return 0;
}

static int test_screen_reference_confirm_commit_and_single(void)
{
    ++test_groups;CHECK(reset_screen_case(2,0)==0);
    show_current_page();
    CHECK(strstr(screen_output,"50 OHM")!=NULL && strstr(screen_output,"RAM")!=NULL);
    clear_output();hmi_request(0x20,0);
    CHECK(reference_confirm_armed && reference_confirmation_valid());
    CHECK(tx_total==0u && !echo_healthy_baseline_is_valid(&healthy_baseline));
    CHECK(strstr(debug_output,"[BASE] START:")==NULL);
    CHECK(strstr(screen_output,"50 OHM")!=NULL);
    hmi_request(0x20,0);
    CHECK(!reference_confirm_armed && !screen_operation_active && !busy && !fatal_failure);
    CHECK(tx_total==3u && measurement_seq==3u && echo_healthy_baseline_id(&healthy_baseline)==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(active_baseline))==0);
    CHECK(strstr(debug_output,"[HMI] REFERENCE CONFIRMED -> capture healthy PN baseline")!=NULL);
    CHECK(occurrences(debug_output,"[BASE] PASS:")==1u && occurrences(debug_output,"RAW_BEGIN,")==3u);
    CHECK(!average_available && !correlation_available);
    CHECK(save_transcript("stage48_screen_mock_reference_B.txt")==0);
    process_pc_debug_byte('J');
    CHECK(save_transcript("stage48_screen_mock_reference_BJ.txt")==0);
    CHECK(drain_mock_screen_events()==0);

    ++test_groups;note_screen_page(0);clear_output();hmi_request(0x10,0);
    CHECK(tx_total==4u && measurement_seq==4u && diagnostic_waveform==3u && batch_ok && !fatal_failure);
    CHECK(!screen_operation_active && !busy && average_available && correlation_available);
    CHECK(strstr(debug_output,"[HMI] SINGLE -> PN healthy difference")!=NULL);
    CHECK(occurrences(debug_output,"PN_DIFF_RESULT,")==1u && occurrences(debug_output,"HMI_PLOT,")==1u);
    CHECK(strstr(debug_output,"[LOCATE] START:")==NULL && strstr(debug_output,"PN_DISTANCE,")==NULL);
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL && last_pixel_count==512u);
    CHECK(cached_baseline_id==1u && cached_baseline_crc==fixture_crc);
    process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_screen_mock_single_D_R_C.txt")==0);

    ++test_groups;note_screen_page(2);clear_output();hmi_request(0x20,0);CHECK(reference_confirm_armed);
    hmi_request(0x20,0);
    CHECK(tx_total==7u && measurement_seq==7u && echo_healthy_baseline_id(&healthy_baseline)==2u);
    CHECK(!reference_confirm_armed && !fatal_failure && !average_available && !correlation_available);
    CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
    return 0;
}

static int test_screen_confirmation_cancellation(void)
{
    ++test_groups;CHECK(reset_screen_case(2,0)==0);hmi_request(0x20,0);CHECK(reference_confirm_armed);
    reference_confirm_deadline_ms=0;expire_reference_confirmation();
    CHECK(!reference_confirm_armed && tx_total==0u);
    hmi_request(0x20,0);CHECK(reference_confirm_armed && tx_total==0u);
    ++test_groups;note_screen_page(2);CHECK(!reference_confirm_armed);
    hmi_request(0x20,0);CHECK(reference_confirm_armed && tx_total==0u);
    ++test_groups;note_screen_page(0);CHECK(!reference_confirm_armed);
    note_screen_page(2);hmi_request(0x20,0);CHECK(reference_confirm_armed && tx_total==0u);
    ++test_groups;tdr_hmi_event_t ev={.type=TDR_HMI_READY};process_hmi_event(&ev);
    CHECK(!reference_confirm_armed && !current_page_valid && tx_total==0u);
    CHECK(reset_screen_case(2,0)==0);hmi_request(0x20,0);
    ev.type=TDR_HMI_ERROR;ev.code=0x1a;process_hmi_event(&ev);
    CHECK(!reference_confirm_armed && tx_total==0u);
    const uint8_t commands[]={'D','P','L','Z','B','F'};
    for(unsigned i=0;i<sizeof(commands);++i) {
        ++test_groups;CHECK(reset_screen_case(2,1)==0);hmi_request(0x20,0);CHECK(reference_confirm_armed);
        unsigned before=tx_total;process_pc_debug_byte(commands[i]);
        CHECK(!reference_confirm_armed);
        CHECK(tx_total==before+(commands[i]=='B'?3u:commands[i]=='F'?0u:1u));
    }
    return 0;
}

static int test_screen_action_guards_and_unsupported(void)
{
    for(unsigned command=0;command<2;++command) {
        const uint8_t cmd=command?0x20:0x10;
        for(unsigned mode=0;mode<5;++mode) {
            ++test_groups;CHECK(reset_screen_case(command?2u:0u,1)==0);
            unsigned before=tx_total;
            busy=mode==0;screen_bulk_active=mode==1;screen_link_blocked=mode==2;
            screen_operation_active=mode==3;fatal_failure=mode==4;
            hmi_request(cmd,0);
            CHECK(tx_total==before && !reference_confirm_armed && strstr(debug_output,"DENIED")!=NULL);
        }
    }
    for(unsigned page=0;page<5;++page) {
        if(page==2u)continue;
        ++test_groups;CHECK(reset_screen_case(page,0)==0);hmi_request(0x20,0);
        CHECK(tx_total==0u && !reference_confirm_armed && strstr(debug_output,"DENIED")!=NULL);
    }
    ++test_groups;CHECK(reset_screen_case(2,0)==0);hmi_request(0x20,1);
    CHECK(tx_total==0u && !reference_confirm_armed && strstr(debug_output,"DENIED")!=NULL);
    for(unsigned i=0;i<2;++i) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        unsigned before=tx_total;hmi_request((uint8_t)(0x11u+i),0);
        CHECK(tx_total==before && !reference_confirm_armed);
        CHECK(strstr(debug_output,"[BASE] START:")==NULL && strstr(debug_output,"[DIFF] START:")==NULL);
    }
    return 0;
}

static int test_screen_actions_while_operations_are_not_replayed(void)
{
    ++test_groups;CHECK(reset_screen_case(2,0)==0);hmi_request(0x20,0);CHECK(reference_confirm_armed);
    mock_operation_requests=15u;hmi_request(0x20,0);mock_operation_requests=0;
    CHECK(tx_total==3u && !reference_confirm_armed && deferred_hmi_count==0u);
    CHECK(drain_mock_screen_events()==0);
    CHECK(tx_total==3u && !reference_confirm_armed && !screen_operation_active);

    ++test_groups;note_screen_page(0);clear_output();mock_operation_requests=15u;
    hmi_request(0x10,0);mock_operation_requests=0;
    CHECK(tx_total==4u && deferred_hmi_count==0u && !reference_confirm_armed);
    CHECK(drain_mock_screen_events()==0 && tx_total==4u && !reference_confirm_armed);

    ++test_groups;CHECK(reset_screen_case(0,1)==0);mock_bulk_requests=15u;
    unsigned before=tx_total;hmi_request(0x10,0);mock_bulk_requests=0;
    CHECK(tx_total==before+1u && deferred_hmi_count==0u && !reference_confirm_armed);
    CHECK(drain_mock_screen_events()==0 && tx_total==before+1u);

    ++test_groups;CHECK(reset_screen_case(2,1)==0);
    /* A half request received during a command cannot be completed later as a new capture. */
    mock_operation_partial=1;process_pc_debug_byte('P');
    CHECK(!reference_confirm_armed && deferred_hmi_count==0u);
    push_byte(0);push_byte(0);push_byte(13);push_byte(10);
    CHECK(drain_mock_screen_events()==0 && !reference_confirm_armed && tx_total==4u);

    ++test_groups;CHECK(reset_screen_case(2,1)==0);hmi_request(0x20,0);CHECK(reference_confirm_armed);
    const tdr_hmi_event_t request={.type=TDR_HMI_REQUEST,.cmd=0x20,.arg=0};
    screen_bulk_active=1;defer_screen_event(&request);screen_bulk_active=0;
    CHECK(!reference_confirm_armed && deferred_hmi_count==0u && tx_total==3u);
    return 0;
}

static int test_screen_reference_failure_preserves_previous(void)
{
    ++test_groups;CHECK(reset_screen_case(2,1)==0);
    hmi_request(0x20,0);fail_candidate_load=1;hmi_request(0x20,0);fail_candidate_load=0;
    CHECK(tx_total==6u && fatal_failure && !batch_ok && !reference_confirm_armed && !screen_operation_active);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
    CHECK(strstr(debug_output,"[BASE] PASS:")==NULL);
    CHECK(!average_available && !correlation_available);
    ++test_groups;CHECK(reset_screen_case(2,1)==0);
    hmi_request(0x20,0);fail_candidate_crc=1;hmi_request(0x20,0);fail_candidate_crc=0;
    CHECK(tx_total==6u && fatal_failure && !batch_ok && !reference_confirm_armed && !screen_operation_active);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
    CHECK(strstr(debug_output,"[BASE] PASS:")==NULL && !average_available && !correlation_available);
    ++test_groups;clear_output();unsigned before=tx_total;note_screen_page(0);hmi_request(0x10,0);
    CHECK(tx_total==before && strstr(debug_output,"DENIED")!=NULL);
    ++test_groups;CHECK(reset_screen_case(0,1)==0);fail_transaction=1;hmi_request(0x10,0);fail_transaction=0;
    CHECK(tx_total==3u && fatal_failure && !batch_ok && !average_available && !correlation_available && !screen_operation_active);
    CHECK(strstr(debug_output,"[DIFF] PASS:")==NULL && strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
    return 0;
}

static int test_screen_PN_mode_hides_legacy_distance_without_destroying_cache(void)
{
    for(unsigned command=0;command<2;++command) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        process_pc_debug_byte(command?'P':'L');
        CHECK(tx_total==4u && average_available && !screen_pn_mode);
        if(command) {
            pn_range.status=ECHO_PN_STRONG_RETURN;pn_range.within_fit_span=1;
            pn_range.distance_m=5.005;pn_range.polarity=1;
        } else {
            last_located=1;last_distance_mm=5016;last_kind=ECHO_LOCATOR_SHORT;
        }
        clear_output();invalidate_text_cache();show_current_page();
        CHECK(strstr(screen_output,command?"t_dist.txt=\"5.005 m\"":"t_dist.txt=\"5.016 m\"")!=NULL);
        CHECK(strstr(screen_output,"LEGACY")!=NULL);
        unsigned before_bulk=bulk_transfers;uint32_t seq=measurement_seq;
        clear_output();note_screen_page(0);show_current_page();
        CHECK(screen_pn_mode && measurement_seq==seq && tx_total==4u && bulk_transfers==before_bulk);
        CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL && average_available);
        clear_output();hmi_request(0x10,0);
        CHECK(tx_total==5u && measurement_seq==seq+1u && diagnostic_waveform==3u && screen_pn_mode);
        /* -- m was already written on page entry; text caching may suppress a redundant write. */
        CHECK(strstr(debug_output,"PN_DISTANCE,")==NULL && !last_located);
    }
    return 0;
}

static int test_screen_requests_during_exports_are_not_replayed(void)
{
    const uint8_t commands[]={'R','C','J','I'};
    const char *triggers[]={"RAW,10,","DCORR,10,","BASE,10,","[DIFF] START:"};
    for(unsigned item=0;item<sizeof(commands);++item) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        process_pc_debug_byte('F');CHECK(fast_saved_valid && tx_total==4u);
        note_screen_page(2);clear_output();
        mock_export_trigger=triggers[item];mock_export_requests=15u;
        process_pc_debug_byte(commands[item]);
        if(commands[item]=='I') {
            /* Stage44 invalidates summary ownership on every PAGE report. */
            CHECK(mock_export_trigger!=NULL && strstr(debug_output,"DENIED")!=NULL && !fast_saved_valid);
            CHECK(tx_total==4u && !screen_operation_active && !reference_confirm_armed);
            mock_export_trigger=NULL;
            continue;
        }
        CHECK(mock_export_trigger==NULL && tx_total==4u && !screen_operation_active && !reference_confirm_armed);
        CHECK(deferred_hmi_count==0u && drain_mock_screen_events()==0);
        CHECK(tx_total==4u && !reference_confirm_armed);

        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        process_pc_debug_byte('F');CHECK(fast_saved_valid && tx_total==4u);
        note_screen_page(2);clear_output();
        mock_export_trigger=triggers[item];mock_export_partial=1;
        process_pc_debug_byte(commands[item]);
        CHECK(mock_export_trigger==NULL && !reference_confirm_armed && !screen_operation_active);
        push_byte(0);push_byte(0);push_byte(13);push_byte(10);
        CHECK(drain_mock_screen_events()==0 && !reference_confirm_armed && tx_total==4u);
    }
    return 0;
}

static int test_reference_profile_guard(void)
{
    ++test_groups;CHECK(echo_reference_guard_data_crc32()==UINT32_C(0x02FEEBDD));
    echo_reference_guard_result_t result;
    int64_t corr[256];
    for(unsigned state=0;state<5;++state)for(unsigned run=0;run<3;++run) {
        const int16_t *raw=state==0 ? original_frames[run] : startup_frames[state-1u][run];
        plain_pn_correlation(raw,corr);
        CHECK(echo_reference_guard_evaluate(raw,1024,corr,256,&result)==0);
        CHECK(result.matched_mask==(state==0?1u:state==1u||state==4u?2u:0u));
    }
    ++test_groups;
    memset(&result,255,sizeof(result));
    CHECK(echo_reference_guard_evaluate(NULL,1024,corr,256,&result)==-1 && result.matched_mask==0u);
    CHECK(result.peak_numerator[0]==0u && result.peak_numerator[1]==0u);
    CHECK(echo_reference_guard_evaluate(original_frames[0],1023,corr,256,&result)==-1);
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,255,&result)==-1);
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,NULL)==-1);
    plain_pn_correlation(original_frames[0],corr);corr[5]=INT64_MAX;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==-2 && result.matched_mask==0u);
    corr[5]=INT64_MIN;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==-2 && result.matched_mask==0u);

    /* Synthetic arithmetic boundary, independent of a physical acquisition.
     * Build every residual near zero, then place one exactly on the old gate. */
    ++test_groups;int64_t pre=0;int selected=-1;
    for(unsigned i=0;i<128;++i)pre+=original_frames[0][i];
    int64_t dc=3*pre-reference_guard_pretrigger_sum[0];
    for(unsigned i=0;i<256;++i) {
        int64_t value=reference_guard_correlation_sum[0][i]+dc*512;
        corr[i]=value/3;
        if(value%3==0)selected=(int)i;
    }
    CHECK(selected>=0);
    int64_t center=corr[selected];
    const uint64_t gate=ECHO_REFERENCE_GUARD_GATE_Q16*384u;
    corr[selected]=center+(int64_t)ECHO_REFERENCE_GUARD_GATE_Q16-1;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==0);
    CHECK((result.matched_mask&1u)!=0u && result.peak_numerator[0]==gate-384u);
    corr[selected]++;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==0);
    CHECK((result.matched_mask&1u)==0u && result.peak_numerator[0]==gate);
    corr[selected]++;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==0);
    CHECK((result.matched_mask&1u)==0u && result.peak_numerator[0]==gate+384u);
    corr[selected]=center-(int64_t)ECHO_REFERENCE_GUARD_GATE_Q16;
    CHECK(echo_reference_guard_evaluate(original_frames[0],1024,corr,256,&result)==0);
    CHECK((result.matched_mask&1u)==0u && result.peak_numerator[0]==gate);
    return 0;
}

static int test_profile2_screen_and_diagnostics(void)
{
    ++test_groups;select_fixture(startup_frames[0]);CHECK(reset_screen_case(2,0)==0);
    process_pc_debug_byte('V');
    CHECK(strstr(debug_output,"PROFILES=2,BANK_CRC32=02FEEBDD,ACTIVE_PROFILE=0,ACTIVE_MASK=0,")!=NULL);
    CHECK(save_transcript("stage48_profile2_mock_V_before.txt")==0);
    clear_output();hmi_request(0x20,0);hmi_request(0x20,0);
    CHECK(!fatal_failure && batch_ok && tx_total==3u && healthy_guard_profile==2u && healthy_guard_mask==2u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==fixture_crc);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(fixture_expected))==0);
    CHECK(occurrences(debug_output,"BASE_GUARD,")==3u);
    CHECK(occurrences(debug_output,"PN_DISTANCE,STATUS=OUTSIDE_FIT_SPAN,")==3u);
    CHECK(strstr(debug_output,"GUARD_VERSION=1,PROFILE_ID=2,PROFILE_MASK=2,BANK_CRC32=02FEEBDD")!=NULL);
    process_pc_debug_byte('J');CHECK(save_transcript("stage48_profile2_mock_BJ.txt")==0);
    clear_output();process_pc_debug_byte('V');
    CHECK(strstr(debug_output,"ACTIVE_PROFILE=2,ACTIVE_MASK=2,")!=NULL);
    CHECK(save_transcript("stage48_profile2_mock_V_after.txt")==0);
    CHECK(drain_mock_screen_events()==0);note_screen_page(0);
    const unsigned states[]={3u,1u,2u};
    const char *names[]={"stage48_profile2_mock_matched_D_R_C.txt","stage48_profile2_mock_open_D_R_C.txt","stage48_profile2_mock_short_D_R_C.txt"};
    for(unsigned i=0;i<3;++i) {
        ++test_groups;memcpy(real_frames,startup_frames[states[i]],sizeof(real_frames));
        clear_output();hmi_request(0x10,0);
        CHECK(batch_ok && !fatal_failure && diagnostic_waveform==3u && last_pixel_count==512u);
        CHECK(strstr(debug_output,"PN_DISTANCE,")==NULL && strstr(debug_output,"DISTANCE_VALID=0")!=NULL);
        CHECK(strstr(debug_output,"[HMI] SINGLE -> PN healthy difference")!=NULL);
        process_pc_debug_byte('R');process_pc_debug_byte('C');CHECK(save_transcript(names[i])==0);
        if(i)CHECK(correlation_q16[153]*(i==1?1:-1)>INT64_C(2000000000));
    }
    ++test_groups;memcpy(real_frames,startup_frames[3],sizeof(real_frames));clear_output();process_pc_debug_byte('F');
    CHECK(fast_saved_valid && occurrences(debug_output,"FAST_RESULT,")==1u && tx_total==7u);
    CHECK(save_transcript("stage48_profile2_mock_F.txt")==0);
    unsigned before=tx_total;clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(tx_total==before && occurrences(debug_output,"PN_DIFF_RESULT,")==1u && occurrences(debug_output,"DCORR_BEGIN,")==1u);
    CHECK(save_transcript("stage48_profile2_mock_I_R_C.txt")==0);
    return 0;
}

static int test_profile2_refusal_retention_and_publish(void)
{
    for(unsigned state=1;state<=2;++state) {
        ++test_groups;select_fixture(startup_frames[0]);CHECK(reset_screen_case(2,1)==0);
        uint32_t old_crc=fixture_crc;memcpy(real_frames,startup_frames[state],sizeof(real_frames));
        hmi_request(0x20,0);hmi_request(0x20,0);
        CHECK(tx_total==4u && !fatal_failure && !batch_ok && healthy_guard_profile==2u && healthy_guard_mask==2u);
        CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==old_crc);
        CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),fixture_expected,sizeof(fixture_expected))==0);
        CHECK(strstr(debug_output,"no common frozen Normal profile")!=NULL && strstr(debug_output,"[BASE] PASS:")==NULL);
    }
    ++test_groups;select_fixture(startup_frames[0]);CHECK(reset_screen_case(2,1)==0);
    memcpy(real_frames[0],original_frames[0],sizeof(real_frames[0]));
    hmi_request(0x20,0);hmi_request(0x20,0);
    CHECK(tx_total==5u && !fatal_failure && !batch_ok && healthy_guard_profile==2u && healthy_guard_mask==2u);
    CHECK(occurrences(debug_output,"BASE_GUARD,")==2u && occurrences(debug_output,"RAW_BEGIN,")==1u);
    CHECK(strstr(debug_output,"[BASE] PASS:")==NULL && echo_healthy_baseline_id(&healthy_baseline)==1u);
    CHECK(save_transcript("stage48_profile2_mock_mixed_rejected.txt")==0);
    for(unsigned failure=0;failure<5;++failure) {
        ++test_groups;select_fixture(original_frames);CHECK(reset_screen_case(2,1)==0);
        uint32_t old_crc=fixture_crc;int16_t old_data[1024];memcpy(old_data,fixture_expected,sizeof(old_data));
        select_fixture(startup_frames[0]);
        fail_candidate_load=failure==0u;fail_candidate_crc=failure==1u;
        mock_guard_corr_override=failure==2u;mock_guard_corr[0]=INT64_MAX;
        fail_transaction=failure==3u;block_raw_uart=failure==4u;
        hmi_request(0x20,0);hmi_request(0x20,0);
        fail_transaction=block_raw_uart=uart_blocked=0;
        CHECK(fatal_failure && !batch_ok && healthy_guard_profile==1u && healthy_guard_mask==1u);
        CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && echo_healthy_baseline_active_crc32(&healthy_baseline)==old_crc);
        CHECK(memcmp(echo_healthy_baseline_active_data(&healthy_baseline),old_data,sizeof(old_data))==0);
        CHECK(strstr(debug_output,"[BASE] PASS:")==NULL);
    }
    /* Synthetic correlation halfway between the two compatibility regions.
     * Both bits are retained; the published ID is the lowest shared bit.
     * This is coarse admission, not exact waveform authentication. */
    ++test_groups;select_fixture(startup_frames[0]);CHECK(reset_screen_case(2,0)==0);
    int64_t pre=0;for(unsigned i=0;i<128;++i)pre+=real_frames[0][i];
    memcpy(real_frames[1],real_frames[0],sizeof(real_frames[0]));
    memcpy(real_frames[2],real_frames[0],sizeof(real_frames[0]));
    for(unsigned i=0;i<256;++i)mock_guard_corr[i]=
        (reference_guard_correlation_sum[0][i]+reference_guard_correlation_sum[1][i]+
         (6*pre-reference_guard_pretrigger_sum[0]-reference_guard_pretrigger_sum[1])*512)/6;
    mock_guard_corr_override=1;hmi_request(0x20,0);hmi_request(0x20,0);mock_guard_corr_override=0;
    CHECK(batch_ok && !fatal_failure && healthy_guard_profile==1u && healthy_guard_mask==3u);
    CHECK(strstr(debug_output,"GUARD_VERSION=1,PROFILE_ID=1,PROFILE_MASK=3,")!=NULL);
    /* A final UART failure occurs after the actual PL/RAM publish. The active
     * identity must follow that publish, and fatal_failure stops further use. */
    ++test_groups;select_fixture(original_frames);CHECK(reset_screen_case(2,1)==0);
    CHECK(healthy_guard_profile==1u && healthy_guard_mask==1u);
    select_fixture(startup_frames[0]);uint32_t new_crc=fixture_crc;
    mock_fail_base_ready=1;hmi_request(0x20,0);hmi_request(0x20,0);
    mock_fail_base_ready=uart_blocked=0;
    CHECK(fatal_failure && !batch_ok && tx_total==6u);
    CHECK(healthy_guard_profile==2u && healthy_guard_mask==2u && echo_healthy_baseline_id(&healthy_baseline)==2u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==new_crc && pl_crc==new_crc);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(fixture_expected))==0);
    CHECK(strstr(debug_output,"BASE_READY,")==NULL && strstr(debug_output,"[BASE] PASS:")==NULL);
    clear_output();process_pc_debug_byte('V');CHECK(strstr(debug_output,"ACTIVE_PROFILE=2,ACTIVE_MASK=2,")!=NULL);
    CHECK(save_transcript("stage48_profile2_mock_postpublish_uart_failure_V.txt")==0);
    return 0;
}

static uint64_t record_u64(const char *record,const char *field)
{
    const char *value=strstr(record,field);
    if(!value){fprintf(stderr,"Missing record field %s\n",field);exit(8);}
    return strtoull(value+strlen(field),NULL,10);
}

static int check_stopped(unsigned frames,unsigned before,const char *reason)
{
    const char *stop=strstr(debug_output,"CONT_STOP,");
    CHECK(stop!=NULL && strstr(stop,reason)!=NULL);
    CHECK(continuous_state==CONT_IDLE || continuous_state==CONT_ERROR);
    CHECK(continuous_frames==frames && !continuous_internal_frame && !busy && !screen_bulk_active);
    CHECK(record_u64(stop,"FRAMES=")==frames);
    CHECK(record_u64(stop,"LAST_SEQ=")==continuous_last_seq);
    CHECK(record_u64(stop,"MEAS_SEQ=")==measurement_seq);
    CHECK(record_u64(stop,"IN_FLIGHT=")==0u);
    uint64_t requested=record_u64(stop,"REQUEST_MS="),done=record_u64(stop,"DONE_MS=");
    CHECK(done>=requested && record_u64(stop,"LATENCY_MS=")==done-requested);
    unsigned transactions=tx_total;
    for(unsigned i=0;i<3u;++i)continuous_tick();
    CHECK(tx_total==transactions && tx_total>=before);
    return 0;
}

static int test_continuous_screen_owned_success(void)
{
    ++test_groups;select_fixture(original_frames);CHECK(reset_screen_case(2,0)==0);
    hmi_request(0x20,0);hmi_request(0x20,0);CHECK(tx_total==3u && batch_ok);
    process_pc_debug_byte('J');CHECK(save_transcript("stage48_continuous_mock_BJ.txt")==0);
    note_screen_page(0);clear_output();invalidate_text_cache();
    hmi_request(0x11,0);
    CHECK(continuous_state==CONT_RUNNING && tx_total==3u && continuous_frames==0u);
    CHECK(continuous_session==1u && continuous_last_seq==3u);
    CHECK(occurrences(debug_output,"CONT_START,")==1u);
    CHECK(strstr(debug_output,"FIRST_SEQ=4,DISTANCE_VALID=0")!=NULL);
    for(unsigned index=1;index<=3u;++index) {
        continuous_tick();
        CHECK(continuous_state==CONT_RUNNING && tx_total==index+3u);
        CHECK(measurement_seq==index+3u && continuous_frames==index && continuous_last_seq==measurement_seq);
        CHECK(fast_saved_valid && average_available && correlation_available && last_plot_valid);
    }
    CHECK(occurrences(debug_output,"CONT_FRAME,")==3u && occurrences(debug_output,"FAST_RESULT,")==0u);
    CHECK(occurrences(debug_output,"[DIFF] START:")==0u);
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
    CHECK(memcmp(active_baseline,fixture_expected,sizeof(fixture_expected))==0);
    hmi_request(0x12,0);continuous_tick();
    CHECK(check_stopped(3u,3u,"REASON=USER")==0);
    CHECK(continuous_state==CONT_IDLE && fast_saved_valid);
    process_pc_debug_byte('V');
    CHECK(strstr(debug_output,"CONT_INFO,STATE=IDLE")!=NULL && strstr(debug_output,"FW_STAGE=63")!=NULL);
    CHECK(save_transcript("stage48_continuous_mock_controls.txt")==0);
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(occurrences(debug_output,"MEASUREMENT,SEQ=6,")==1u);
    CHECK(occurrences(debug_output,"RAW_BEGIN,SEQ=6,")==1u && occurrences(debug_output,"DCORR_BEGIN,SEQ=6,")==1u);
    CHECK(save_transcript("stage48_continuous_mock_stopped_I_R_C.txt")==0);
    clear_output();process_pc_debug_byte('J');
    CHECK(save_transcript("stage48_continuous_mock_J_after.txt")==0);
    CHECK(tx_total==6u && measurement_seq==6u && continuous_last_seq==6u);
    return 0;
}

static int test_continuous_stop_boundaries(void)
{
    for(unsigned stage=0;stage<5u;++stage) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        hmi_request(0x11,0);CHECK(continuous_state==CONT_RUNNING);
        if(stage==0u)hmi_request(0x12,0);
        if(stage==1u)mock_stop_at_transaction_entry=1;
        if(stage==2u)mock_bulk_requests=8u;
        if(stage==3u){mock_stop_during_payload=1;mock_payload_slice=17u;}
        if(stage==4u)mock_stop_after_fd=1;
        continuous_tick();
        unsigned frames=stage==0u?0u:1u;
        CHECK(tx_total==3u+frames && continuous_last_seq==3u+frames);
        CHECK(check_stopped(frames,3u,"REASON=USER")==0);
        CHECK(continuous_state==CONT_IDLE && !fatal_failure);
        CHECK(occurrences(debug_output,"CONT_FRAME,")==frames);
        CHECK(strstr(debug_output,"[FAST] FAILED:")==NULL && strstr(debug_output,"[HMI] WAVE_ERROR:")==NULL);
        if(frames) {
            CHECK(fast_saved_valid && last_plot_valid && expected_pixels==0u);
            CHECK(last_pixel_count==512u && memcmp(native_pixels,plot_frame.pixels,512u)==0);
            const char *frame=strstr(debug_output,"CONT_FRAME,"),*stop=strstr(debug_output,"CONT_STOP,");
            CHECK(frame<stop && expected_pixels==0u);
            /* STOPPED text follows the completed plot; its own ASCII ACKs
             * are drained by the next normal idle event-loop pass. */
            CHECK(drain_mock_screen_events()==0 && screen_ack_pending==0u);
            if(stage==3u) {
                CHECK(save_transcript("stage48_continuous_mock_payload_stop.txt")==0);
                clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
                CHECK(save_transcript("stage48_continuous_mock_payload_stop_I_R_C.txt")==0);
            }
        }
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);
    hmi_request(0x11,0);mock_stop_during_payload=mock_start_after_stop=1;
    continuous_tick();CHECK(drain_mock_screen_events()==0);continuous_tick();
    if(tx_total!=4u || continuous_state!=CONT_IDLE || continuous_session!=1u)
        fprintf(stderr,"Queued START after STOP: tx=%u state=%u session=%" PRIu32 " log=%s\n",
            tx_total,continuous_state,continuous_session,debug_output);
    CHECK(tx_total==4u && continuous_state==CONT_IDLE && continuous_session==1u);
    CHECK(occurrences(debug_output,"CONT_START,")==1u && occurrences(debug_output,"CONT_FRAME,")==1u);
    CHECK(check_stopped(1u,3u,"REASON=USER")==0);
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    mock_stop_during_payload=1;mock_pc_after_stop='B';continuous_tick();
    CHECK(mock_pc_head==mock_pc_tail && tx_total==4u && continuous_state==CONT_IDLE);
    CHECK(echo_healthy_baseline_id(&healthy_baseline)==1u && !reference_confirm_armed);
    CHECK(strstr(debug_output,"CONT_IGNORED,COMMAND=PC,REASON=RUNNING")!=NULL);
    CHECK(strstr(debug_output,"[BASE] START:")==NULL);
    CHECK(check_stopped(1u,3u,"REASON=USER")==0);
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    mock_operation_partial=1;continuous_tick();
    CHECK(continuous_state==CONT_RUNNING && tx_total==4u && !reference_confirm_armed);
    push_byte(0);push_byte(0);push_byte(13);push_byte(10);CHECK(drain_mock_screen_events()==0);
    CHECK(!reference_confirm_armed && tx_total==4u);
    hmi_request(0x12,0);continuous_tick();CHECK(check_stopped(1u,3u,"REASON=USER")==0);
    return 0;
}

static int test_continuous_start_and_command_guards(void)
{
    for(unsigned page=0;page<5u;++page) {
        ++test_groups;CHECK(reset_screen_case(page,page!=0u)==0);
        unsigned before=tx_total;hmi_request(0x11,0);
        CHECK(continuous_state!=CONT_RUNNING && tx_total==before && strstr(debug_output,"CONT_START,")==NULL);
        CHECK(strstr(debug_output,"DENIED")!=NULL);
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,1);
    CHECK(continuous_state==CONT_IDLE && tx_total==3u && strstr(debug_output,"CONT_START,")==NULL);
    for(unsigned failure=0;failure<3u;++failure) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);
        screen_link_blocked=failure==0u;fatal_failure=failure==1u;screen_operation_active=failure==2u;
        hmi_request(0x11,0);
        CHECK(continuous_state!=CONT_RUNNING && tx_total==3u && strstr(debug_output,"CONT_START,")==NULL);
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);
    hmi_request(0x12,0);hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && tx_total==3u && !fatal_failure);
    clear_output();hmi_request(0x11,0);uint32_t session=continuous_session;
    hmi_request(0x11,0);hmi_request(0x11,0);
    CHECK(continuous_state==CONT_RUNNING && continuous_session==session && tx_total==3u);
    CHECK(occurrences(debug_output,"CONT_START,")==1u);
    hmi_request(0x12,1);CHECK(continuous_state==CONT_RUNNING);
    const uint8_t commands[]={'B','P','L','Z','D','F','I','R','C','J','W'};
    for(unsigned i=0;i<sizeof(commands);++i) {
        ++test_groups;clear_output();process_pc_debug_byte(commands[i]);
        CHECK(tx_total==3u && continuous_state==CONT_RUNNING && continuous_session==session);
        CHECK(strstr(debug_output,"CONT_START,")==NULL && strstr(debug_output,"RAW_BEGIN,")==NULL);
        CHECK(strstr(debug_output,"BASE_BEGIN,")==NULL && strstr(debug_output,"PN_DIFF_RESULT,")==NULL);
    }
    ++test_groups;clear_output();process_pc_debug_byte('V');process_pc_debug_byte('H');
    CHECK(strstr(debug_output,"CONT_INFO,STATE=RUNNING")!=NULL && tx_total==3u && continuous_state==CONT_RUNNING);
    continuous_tick();CHECK(tx_total==4u && continuous_frames==1u);
    hmi_request(0x12,0);continuous_tick();CHECK(check_stopped(1u,3u,"REASON=USER")==0);
    clear_output();hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && tx_total==4u && !fatal_failure);
    return 0;
}

static int test_continuous_page_ready_and_errors(void)
{
    for(unsigned mode=0;mode<8u;++mode) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
        if(mode==0u) {tdr_hmi_event_t ev={.type=TDR_HMI_PAGE,.page=1};process_hmi_event(&ev);}
        if(mode==1u)mock_page_in_acquisition=1;
        if(mode==2u)mock_page_change=1;
        if(mode==3u)mock_ready_in_acquisition=1;
        if(mode==4u)mock_error_in_acquisition=1;
        if(mode==5u)mock_no_ready=1;
        if(mode==6u)mock_no_done=1;
        if(mode==7u)fail_transaction=1;
        continuous_tick();fail_transaction=0;
        CHECK(continuous_state!=CONT_RUNNING && continuous_state!=CONT_STOP_PENDING);
        CHECK(continuous_frames==0u && continuous_last_seq==3u);
        CHECK(occurrences(debug_output,"CONT_FRAME,")==0u && !fast_saved_valid);
        CHECK(expected_pixels==0u || screen_link_blocked);
        const char *reason=mode<3u?"REASON=PAGE":mode==3u?"REASON=READY":mode==4u?"REASON=LCD_ERROR":
                           mode<7u?"REASON=SCREEN_ERROR":"REASON=ACQUISITION_ERROR";
        CHECK(check_stopped(0u,3u,reason)==0);
        if(mode<4u) {
            CHECK(continuous_state==CONT_IDLE && strstr(debug_output,"[FAST] FAILED:")==NULL);
        } else CHECK(continuous_state==CONT_ERROR);
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    continuous_tick();CHECK(continuous_frames==1u && tx_total==4u);
    tdr_hmi_event_t page={.type=TDR_HMI_PAGE,.page=2};process_hmi_event(&page);continuous_tick();
    CHECK(check_stopped(1u,3u,"REASON=PAGE")==0);
    CHECK(continuous_last_seq==4u && continuous_state==CONT_IDLE);

    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    CHECK(echo_healthy_baseline_begin(&healthy_baseline)==0);
    for(unsigned i=0;i<3u;++i)CHECK(echo_healthy_baseline_add_frame(&healthy_baseline,real_frames[i],1024,20u+i)==0);
    CHECK(echo_healthy_baseline_prepare(&healthy_baseline)==0);
    uint32_t crc=echo_healthy_baseline_candidate_crc32(&healthy_baseline);
    CHECK(echo_healthy_baseline_publish(&healthy_baseline,crc)==0);
    continuous_tick();CHECK(tx_total==3u && continuous_frames==0u);
    CHECK(check_stopped(0u,3u,"REASON=REFERENCE_CHANGED")==0);

    /* A prior successful frame cannot remain replayable after a later error. */
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    continuous_tick();CHECK(fast_saved_valid && continuous_frames==1u);
    mock_no_ready=1;continuous_tick();
    CHECK(continuous_state==CONT_ERROR && !fast_saved_valid && continuous_frames==1u && continuous_last_seq==4u);
    clear_output();process_pc_debug_byte('I');
    CHECK(strstr(debug_output,"DENIED")!=NULL && strstr(debug_output,"[DIFF] START:")==NULL);

    /* A page/reset after USER STOP cancels publication without relabeling it
     * as an ordinary FAST failure or writing page-private clear commands. */
    for(unsigned reset=0;reset<2u;++reset) {
        ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
        continuous_tick();CHECK(continuous_frames==1u && tx_total==4u);
        mock_stop_during_payload=1;mock_page_after_stop=reset==0u;mock_ready_after_stop=reset==1u;
        continuous_tick();
        CHECK(continuous_state==CONT_IDLE && continuous_frames==1u && continuous_last_seq==4u && !fast_saved_valid);
        CHECK(check_stopped(1u,3u,reset?"REASON=READY":"REASON=PAGE")==0);
        CHECK(strstr(debug_output,"[FAST] FAILED:")==NULL);
    }
    ++test_groups;CHECK(reset_screen_case(0,1)==0);hmi_request(0x11,0);
    hmi_request(0x12,0);uint64_t first_request=continuous_request_ms;
    tdr_hmi_event_t ready={.type=TDR_HMI_READY};process_hmi_event(&ready);
    CHECK(continuous_request_ms==first_request);continuous_tick();
    CHECK(check_stopped(0u,3u,"REASON=READY")==0);
    return 0;
}

/* These are real archived RAW arrays replayed through controlled PL/UART
 * mocks. They verify the production integration, never a new board trial. */
static int seed_weak_numeric(void)
{
    select_fixture(weak_real_sources);
    CHECK(fixture_crc==weak_real_crc && reset_screen_case(0,1)==0);
    CHECK(healthy_guard_profile==1u && healthy_guard_mask==1u);
    for(unsigned i=0;i<3u;++i)memcpy(real_frames[i],weak_real_captures[3],sizeof(real_frames[i]));
    clear_output();process_pc_debug_byte('D');
    CHECK(!fatal_failure && batch_ok && weak_candidate_current() && weak_candidate_available());
    CHECK(weak_candidate_drawn && weak_candidate.L_mm==10000);
    CHECK(strstr(screen_output,"t_dist.txt=\"10.000 m\"")!=NULL);
    CHECK(occurrences(debug_output,"WEAK_CANDIDATE,")==1u);
    CHECK(strstr(debug_output,"STATUS=NEGATIVE_DISTANCE_CANDIDATE,L_MM=10000,AVAILABLE=1,")!=NULL);
    return 0;
}

static int weak_blank_on_current_page(void)
{
    CHECK(!weak_candidate_available());
    clear_output();invalidate_text_cache();show_current_page();
    /* A PAGE consumed during bounded ACK draining cancels the old paint.
     * Emulate the production main loop servicing its pending fresh paint. */
    CHECK(drain_mock_screen_events()==0);
    for(unsigned i=0;i<4u && screen_refresh_pending;++i) {
        screen_refresh_pending=0;show_current_page();CHECK(drain_mock_screen_events()==0);
    }
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
    CHECK(strstr(screen_output,"t_dist.txt=\"10.000 m\"")==NULL);
    return 0;
}

static int test_weak_real_raws_all_nine_and_exports(void)
{
    ++test_groups;select_fixture(weak_real_sources);CHECK(reset_screen_case(0,0)==0);
    process_pc_debug_byte('V');CHECK(save_transcript("stage48_weak_real10m_V_before.txt")==0);
    clear_output();process_pc_debug_byte('B');process_pc_debug_byte('J');
    CHECK(!fatal_failure && batch_ok && healthy_guard_profile==1u && healthy_guard_mask==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==weak_real_crc);
    CHECK(save_transcript("stage48_weak_real10m_BJ.txt")==0);
    for(unsigned state=0;state<3u;++state) {
        char name[160];
        memcpy(real_frames,weak_real_captures+state*3u,sizeof(real_frames));
        clear_output();process_pc_debug_byte('V');
        CHECK(snprintf(name,sizeof(name),"stage48_weak_real10m_%s.hardware.txt",state==0?"reference_before":state==1?"sample_D1K":"reference_after")>0);
        CHECK(save_transcript(name)==0);
        clear_output();process_pc_debug_byte('J');
        CHECK(snprintf(name,sizeof(name),"stage48_weak_real10m_%s.baseline.txt",state==0?"reference_before":state==1?"sample_D1K":"reference_after")>0);
        CHECK(save_transcript(name)==0);
        for(unsigned repeat=0;repeat<3u;++repeat) {
            ++test_groups;clear_output();process_pc_debug_byte('D');
            CHECK(batch_ok && !fatal_failure && weak_candidate_current());
            CHECK(occurrences(debug_output,"WEAK_CANDIDATE,")==1u);
            CHECK(strstr(debug_output,"DIAGNOSTIC=1,DISTANCE_VALID=0")!=NULL);
            CHECK(weak_candidate_seq==measurement_seq && weak_candidate_base_crc==weak_real_crc);
            CHECK(weak_candidate_profile_fitted && weak_candidate_drawn==(state==1u));
            int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[repeat][i]-fixture_expected[i];
            int64_t expected_peak=0;unsigned expected_lag=0;
            for(unsigned lag=0;lag<256u;++lag) {
                int64_t expected=0;
                for(unsigned tap=0;tap<640u;++tap)
                    expected+=(int64_t)((int32_t)real_frames[repeat][lag+tap]-fixture_expected[lag+tap])*pn_template_q14[tap];
                CHECK(expected==correlation_q16[lag]);
                int64_t numerator=128*expected-dc*INT64_C(65536);
                if(llabs(numerator)>llabs(expected_peak)){expected_peak=numerator;expected_lag=lag;}
            }
            CHECK(weak_candidate.peak_num==expected_peak && weak_candidate.peak_lag==(int)expected_lag);
            if(state==1u) {
                CHECK(weak_candidate_available() && weak_candidate.L_mm==10000 && expected_lag==163u && expected_peak<0);
                if(repeat==0u)CHECK(strstr(screen_output,"t_dist.txt=\"10.000 m\"")!=NULL);
            } else {
                CHECK(!weak_candidate_available() && weak_candidate.L_mm==-1);
                CHECK(strstr(debug_output,"STATUS=LOW_RETURN,L_MM=-1,AVAILABLE=0,")!=NULL);
                if(state==2u && repeat==0u)CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
            }
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            CHECK(snprintf(name,sizeof(name),"stage48_weak_real10m_%s_r%u.txt",state==0?"reference_before":state==1?"sample_D1K":"reference_after",repeat+1u)>0);
            CHECK(save_transcript(name)==0);
            if(state==1u && repeat==0u)CHECK(save_transcript("stage48_weak_real10m_D_R_C.txt")==0);
        }
    }
    clear_output();process_pc_debug_byte('J');CHECK(save_transcript("stage48_weak_real10m_J_after.txt")==0);
    clear_output();process_pc_debug_byte('V');CHECK(save_transcript("stage48_weak_real10m_V_after.txt")==0);
    return 0;
}

static int test_weak_fast_single_continuous_numeric_and_stop(void)
{
    ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();process_pc_debug_byte('F');
    CHECK(fast_saved_valid && weak_candidate_available() && weak_candidate_drawn);
    CHECK(fast_summary_lines==10u && occurrences(fast_summary,"WEAK_CANDIDATE,")==1u);
    CHECK(strstr(debug_output,"WEAK_STATUS=NEGATIVE_DISTANCE_CANDIDATE,WEAK_L_MM=10000,WEAK_AVAILABLE=1,")!=NULL);
    CHECK(save_transcript("stage48_weak_real10m_F.txt")==0);
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_weak_real10m_I_R_C.txt")==0);
    ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();hmi_request(0x10,0);
    CHECK(weak_candidate_available() && weak_candidate_drawn && !fatal_failure);
    CHECK(strstr(debug_output,"[HMI] SINGLE -> PN healthy difference")!=NULL);
    process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_weak_real10m_single_D_R_C.txt")==0);
    ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();hmi_request(0x11,0);continuous_tick();
    CHECK(continuous_state==CONT_RUNNING && continuous_frames==1u && weak_candidate_available());
    CHECK(strstr(debug_output,"CONT_FRAME,")!=NULL && strstr(debug_output,"WEAK_L_MM=10000,WEAK_AVAILABLE=1,")!=NULL);
    hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && weak_candidate_available() && weak_candidate_drawn);
    CHECK(save_transcript("stage48_weak_real10m_continuous.txt")==0);
    clear_output();invalidate_text_cache();show_current_page();
    CHECK(strstr(screen_output,"t_dist.txt=\"10.000 m\"")!=NULL);
    return 0;
}

static int test_weak_low_positive_edges_span_and_strict_gate(void)
{
    const char *statuses[]={"LOW_RETURN","POSITIVE_DISTANCE_CANDIDATE","EDGE_PEAK","OUTSIDE_FIT_SPAN","LOW_RETURN"};
    const unsigned lags[]={163u,163u,0u,120u,163u};
    for(unsigned scenario=0;scenario<5u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        if(scenario==0u)memcpy(real_frames,weak_real_captures,sizeof(real_frames));
        else {
            int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[0][i]-fixture_expected[i];
            for(unsigned lag=0;lag<256u;++lag)mock_guard_corr[lag]=dc*512;
            mock_guard_corr[lags[scenario]]+=(scenario==1u?1:-1)*(scenario==4u?INT64_C(16777216):INT64_C(67108864));
            mock_guard_corr_override=1;
        }
        process_pc_debug_byte('D');mock_guard_corr_override=0;
        char expected[80];CHECK(snprintf(expected,sizeof(expected),"STATUS=%s,L_MM=%d,AVAILABLE=%d,",statuses[scenario],scenario==1u?10000:-1,scenario==1u?1:0)>0);
        CHECK(strstr(debug_output,expected)!=NULL && batch_ok && !fatal_failure);
        if(scenario==1u){CHECK(weak_candidate_available() && current_candidate_mm()==10000 && current_candidate_model()==2);}
        else CHECK(weak_blank_on_current_page()==0);
    }
    return 0;
}

static int test_weak_profile_context_and_cached_identity_invalidation(void)
{
    for(unsigned scenario=0;scenario<7u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        if(scenario==0u){healthy_guard_profile=2u;healthy_guard_mask=2u;}
        if(scenario==1u)healthy_guard_mask=3u;
        if(scenario==2u)cached_baseline_crc^=1u;
        if(scenario==3u)++cached_baseline_id;
        if(scenario==4u)++measurement_seq;
        if(scenario==5u)correlation_available=0;
        if(scenario==6u)average_available=0;
        CHECK(!weak_candidate_available());
        CHECK(weak_blank_on_current_page()==0);
        if(scenario<2u) {
            clear_output();process_pc_debug_byte('D');
            CHECK(strstr(debug_output,"STATUS=PROFILE_UNFITTED,L_MM=-1,AVAILABLE=0,")!=NULL);
            CHECK(weak_blank_on_current_page()==0);
        }
    }
    ++test_groups;CHECK(seed_weak_numeric()==0);
    select_fixture(startup_frames[0]);clear_output();process_pc_debug_byte('B');
    CHECK(healthy_guard_profile==2u && healthy_guard_mask==2u && !weak_candidate_available());
    CHECK(weak_blank_on_current_page()==0);
    ++test_groups;CHECK(seed_weak_numeric()==0);select_fixture(weak_real_sources);
    clear_output();process_pc_debug_byte('B');
    CHECK(batch_ok && !fatal_failure && !weak_candidate_available());
    CHECK(weak_blank_on_current_page()==0);
    ++test_groups;CHECK(seed_weak_numeric()==0);fail_candidate_load=1;clear_output();process_pc_debug_byte('B');fail_candidate_load=0;
    CHECK(fatal_failure && !weak_candidate_available());
    CHECK(weak_blank_on_current_page()==0);
    return 0;
}

static int test_weak_rejected_attempt_capture_and_screen_failures(void)
{
    for(unsigned scenario=0;scenario<9u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        if(scenario==0u){fatal_failure=1;process_pc_debug_byte('D');}
        if(scenario==1u){fail_transaction=1;process_pc_debug_byte('D');fail_transaction=0;}
        if(scenario==2u){mock_no_ready=1;process_pc_debug_byte('F');mock_no_ready=0;}
        if(scenario==3u){mock_no_done=1;process_pc_debug_byte('F');mock_no_done=0;}
        if(scenario==4u){mock_post_plot_error=1;process_pc_debug_byte('F');mock_post_plot_error=0;}
        if(scenario==5u){mock_post_plot_no_ack=1;process_pc_debug_byte('F');mock_post_plot_no_ack=0;}
        if(scenario==6u){deferred_hmi_count=1;process_pc_debug_byte('F');deferred_hmi_count=0;}
        if(scenario==7u){screen_operation_active=1;hmi_request(0x10,0);screen_operation_active=0;}
        if(scenario==8u){hmi_request(0x10,1);}
        CHECK(!weak_candidate_available());
        CHECK(strstr(debug_output,"FAST_RESULT,")==NULL);
        /* A blocked transparent channel must not receive a page-private clear.
         * Verify logical clearing now and visible '-- m' after READY recovers. */
        if(screen_link_blocked || screen_reset_seen || screen_refresh_pending) {
            reset_mock_screen();current_page=0;current_page_valid=1;
        }
        CHECK(weak_blank_on_current_page()==0);
    }
    return 0;
}

static int test_weak_PAGE_READY_and_continuous_failure_clearing(void)
{
    for(unsigned scenario=0;scenario<3u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        tdr_hmi_event_t ev={.type=scenario==2u?TDR_HMI_READY:TDR_HMI_PAGE,.page=scenario==1u?1u:0u};
        process_hmi_event(&ev);CHECK(!weak_candidate_available());
        if(scenario!=0u)note_screen_page(0);
        screen_reset_seen=screen_refresh_pending=screen_link_blocked=0;
        CHECK(weak_blank_on_current_page()==0);
    }
    for(unsigned scenario=0;scenario<3u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);hmi_request(0x11,0);continuous_tick();
        CHECK(weak_candidate_available() && continuous_frames==1u);
        clear_output();
        if(scenario==0u)mock_no_done=1;
        if(scenario==1u)fail_transaction=1;
        if(scenario==2u){mock_stop_during_payload=1;mock_ready_after_stop=1;}
        continuous_tick();fail_transaction=mock_no_done=0;
        CHECK(!weak_candidate_available() && !fast_saved_valid);
        CHECK(continuous_state==CONT_ERROR || continuous_state==CONT_IDLE);
        reset_mock_screen();current_page=0;current_page_valid=1;
        CHECK(weak_blank_on_current_page()==0);
    }
    return 0;
}

static int test_weak_completion_failures_and_early_blanking(void)
{
    const char *prefixes[]={"TXTRACE,","PN_DIFF_RESULT,","MEASUREMENT,","LOCATE_TEST_END,","WEAK_CANDIDATE,"};
    for(unsigned scenario=0;scenario<7u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        unsigned numeric_before=numeric_text_writes,blank_before=blank_distance_writes;
        if(scenario==0u)mock_read_results_failure=1;
        else if(scenario==1u){mock_disable_failure=1;mock_disable_after_tx=tx_total;}
        else mock_debug_failure_prefix=prefixes[scenario-2u];
        process_pc_debug_byte('D');
        mock_read_results_failure=mock_disable_failure=0;mock_debug_failure_prefix=NULL;
        CHECK(blank_at_transaction_entry>blank_before);
        CHECK(numeric_text_writes==numeric_before && !weak_candidate_available() && !weak_candidate_drawn);
        CHECK(!fast_saved_valid);
        CHECK(weak_blank_on_current_page()==0);
    }
    for(unsigned command=0;command<3u;++command) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        unsigned numeric_before=numeric_text_writes,blank_before=blank_distance_writes;
        memcpy(real_frames,weak_real_captures,sizeof(real_frames));
        if(command==0u)process_pc_debug_byte('D');
        if(command==1u)process_pc_debug_byte('F');
        if(command==2u)hmi_request(0x10,0);
        CHECK(blank_at_transaction_entry>blank_before && blank_distance_writes>blank_before);
        CHECK(numeric_text_writes==numeric_before && !weak_candidate_available() && !weak_candidate_drawn);
        CHECK(numeric_text_unsafe==0u);
    }
    for(unsigned scenario=0;scenario<3u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        unsigned numeric_before=numeric_text_writes;
        if(scenario==0u)echo_healthy_baseline_reset(&healthy_baseline);
        if(scenario==1u)mock_capabilities=7u;
        if(scenario==2u)select_fixture(startup_frames[1]);
        process_pc_debug_byte(scenario==2u?'B':'D');mock_capabilities=15u;
        CHECK(!weak_candidate_available() && !weak_candidate_drawn && !fast_saved_valid);
        CHECK(numeric_text_writes==numeric_before && strstr(debug_output,"DENIED")!=NULL);
        CHECK(weak_blank_on_current_page()==0);
    }
    return 0;
}

static int test_weak_epoch_before_computation_and_readonly_nonrevival(void)
{
    for(unsigned scenario=0;scenario<3u;++scenario) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        unsigned numeric_before=numeric_text_writes;
        if(scenario<2u)mock_page_in_acquisition=scenario==0u?2:1;
        else mock_ready_in_acquisition=1;
        process_pc_debug_byte('D');
        CHECK(!weak_candidate_current() && !weak_candidate_available() && !weak_candidate_drawn);
        CHECK(numeric_text_writes==numeric_before && !fast_saved_valid);
        CHECK(strstr(debug_output,"WEAK_CANDIDATE,")!=NULL && strstr(debug_output,"STATUS=NO_CURRENT_CANDIDATE")!=NULL);
        /* Arrays may remain exportable; W and I cannot resurrect the distance. */
        reset_mock_screen();note_screen_page(0);clear_output();process_pc_debug_byte('W');
        CHECK(!weak_candidate_available() && numeric_text_writes==numeric_before);
        clear_output();process_pc_debug_byte('I');CHECK(strstr(debug_output,"DENIED")!=NULL);
        clear_output();unsigned tx=tx_total;
        process_pc_debug_byte('R');process_pc_debug_byte('C');
        CHECK(tx_total==tx && average_available && correlation_available && !weak_candidate_available());
    }
    for(unsigned command=0;command<2u;++command) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        process_pc_debug_byte(command?'P':'L');CHECK(!weak_candidate_available() && !weak_candidate_drawn);
        note_screen_page(0);process_pc_debug_byte('W');
        CHECK(screen_pn_mode && !weak_candidate_available());
    }
    return 0;
}

static int test_weak_numeric_text_ack_failure_is_logically_invalid(void)
{
    for(unsigned error=0;error<2u;++error) {
        ++test_groups;CHECK(seed_weak_numeric()==0);clear_output();
        unsigned numeric_before=numeric_text_writes;
        mock_numeric_no_ack=!error;mock_numeric_error=error;
        process_pc_debug_byte('F');mock_numeric_no_ack=mock_numeric_error=0;
        CHECK(numeric_text_writes==numeric_before+1u && numeric_text_unsafe==0u);
        CHECK(!weak_candidate_available() && !weak_candidate_drawn && !fast_saved_valid);
        CHECK(strstr(debug_output,"FAST_RESULT,")==NULL);
        /* The write may have reached the actual LCD; an absent/rejected ACK
         * cannot certify its pixels. Pause until READY, retain no usable cache. */
        CHECK(screen_link_blocked || screen_reset_seen || screen_deferred_error);
        reset_mock_screen();note_screen_page(0);
        CHECK(weak_blank_on_current_page()==0);
    }
    return 0;
}


static int start_continuous_numeric(void)
{
    CHECK(seed_weak_numeric()==0);
    clear_output();
    hmi_request(0x11,0);continuous_tick();
    CHECK(continuous_state==CONT_RUNNING && continuous_frames==1u && weak_candidate_drawn);
    CHECK(strcmp(display_distance_text,"10.000 m")==0);
    return 0;
}

static int test_continuous_distance_no_intermediate_blanking(void)
{
    ++test_groups;CHECK(start_continuous_numeric()==0);
    unsigned blanks=blank_distance_writes;
    screen_size=0;screen_output[0]='\0';
    for(unsigned i=0;i<12u;++i) {
        continuous_tick();
        CHECK(continuous_state==CONT_RUNNING && weak_candidate_available() && !continuous_distance_hold);
        CHECK(blank_distance_writes==blanks && strcmp(display_distance_text,"10.000 m")==0);
        CHECK(blank_at_transaction_entry==blanks);
    }
    CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")==NULL);
    CHECK(strstr(screen_output,"LAST COMPLETE / NOMINAL")!=NULL || text_cache_count>0u);
    hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && strcmp(display_distance_text,"10.000 m")==0);
    CHECK(blank_distance_writes==blanks && !continuous_distance_hold);
    CHECK(save_transcript("stage48_display_mock_continuous.txt")==0);
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_display_mock_stopped_I_R_C.txt")==0);
    return 0;
}

static int test_continuous_hold_clears_on_new_results_and_failure(void)
{
    for(unsigned scenario=0;scenario<8u;++scenario) {
        ++test_groups;CHECK(start_continuous_numeric()==0);
        unsigned blanks=blank_distance_writes;
        clear_output();
        if(scenario==0u)memcpy(real_frames,weak_real_captures,sizeof(real_frames));
        if(scenario==1u)fail_transaction=1;
        if(scenario==2u)mock_no_done=1;
        if(scenario==3u)mock_page_in_acquisition=1;
        if(scenario==4u)mock_ready_in_acquisition=1;
        if(scenario==5u)mock_error_in_acquisition=1;
        if(scenario==6u){healthy_guard_profile=2u;healthy_guard_mask=2u;}
        if(scenario==7u)mock_read_results_failure=1;
        continuous_tick();
        fail_transaction=mock_no_done=mock_page_in_acquisition=mock_ready_in_acquisition=mock_error_in_acquisition=mock_read_results_failure=0;
        CHECK(!continuous_distance_hold && !weak_candidate_available());
        if(scenario==0u || scenario==1u || scenario==6u || scenario==7u) {
            CHECK(strcmp(display_distance_text,"-- m")==0 && blank_distance_writes>blanks);
            if(scenario==0u)CHECK(continuous_state==CONT_RUNNING && strstr(debug_output,"WEAK_STATUS=LOW_RETURN")!=NULL);
        } else {
            /* Broken transparent link cannot acknowledge corrective text.
             * Verify cancellation, then clear on the next synchronized page. */
            CHECK(continuous_state!=CONT_RUNNING);
            reset_mock_screen();note_screen_page(0);show_current_page();
            CHECK(strcmp(display_distance_text,"-- m")==0);
        }
    }
    ++test_groups;CHECK(start_continuous_numeric()==0);
    clear_output();unsigned blanks=blank_distance_writes;
    int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[0][i]-fixture_expected[i];
    for(unsigned k=0;k<256u;++k)mock_guard_corr[k]=dc*512;
    mock_guard_corr[164]-=INT64_C(67108864);mock_guard_corr_override=1;
    continuous_tick();mock_guard_corr_override=0;
    CHECK(weak_candidate_available() && weak_candidate.L_mm==10500);
    CHECK(strcmp(display_distance_text,"10.500 m")==0 && blank_distance_writes==blanks);
    hmi_request(0x12,0);continuous_tick();
    CHECK(strcmp(display_distance_text,"10.500 m")==0 && !continuous_distance_hold);
    return 0;
}

static int test_positive_real_raws_all_nine_and_exports(void)
{
    ++test_groups;select_fixture(positive_real_sources);CHECK(reset_screen_case(0,0)==0);
    process_pc_debug_byte('V');CHECK(save_transcript("stage48_positive_real10m_V_before.txt")==0);
    clear_output();process_pc_debug_byte('B');process_pc_debug_byte('J');
    CHECK(!fatal_failure && batch_ok && healthy_guard_profile==1u && healthy_guard_mask==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==positive_real_crc);
    CHECK(save_transcript("stage48_positive_real10m_BJ.txt")==0);
    for(unsigned state=0;state<3u;++state) {
        char name[160];
        memcpy(real_frames,positive_real_captures+state*3u,sizeof(real_frames));
        clear_output();process_pc_debug_byte('V');
        CHECK(snprintf(name,sizeof(name),"stage48_positive_real10m_%s.hardware.txt",state==0?"reference_before":state==1?"sample_B47":"reference_after")>0);
        CHECK(save_transcript(name)==0);
        clear_output();process_pc_debug_byte('J');
        CHECK(snprintf(name,sizeof(name),"stage48_positive_real10m_%s.baseline.txt",state==0?"reference_before":state==1?"sample_B47":"reference_after")>0);
        CHECK(save_transcript(name)==0);
        for(unsigned repeat=0;repeat<3u;++repeat) {
            ++test_groups;clear_output();process_pc_debug_byte('D');
            CHECK(batch_ok && !fatal_failure && weak_candidate_current());
            CHECK(occurrences(debug_output,"WEAK_CANDIDATE,")==1u);
            CHECK(strstr(debug_output,"DIAGNOSTIC=1,DISTANCE_VALID=0")!=NULL);
            CHECK(weak_candidate_seq==measurement_seq && weak_candidate_base_crc==positive_real_crc);
            CHECK(weak_candidate_profile_fitted && weak_candidate_drawn==(state==1u));
            int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[repeat][i]-fixture_expected[i];
            int64_t expected_peak=0;unsigned expected_lag=0;
            for(unsigned lag=0;lag<256u;++lag) {
                int64_t expected=0;
                for(unsigned tap=0;tap<640u;++tap)
                    expected+=(int64_t)((int32_t)real_frames[repeat][lag+tap]-fixture_expected[lag+tap])*pn_template_q14[tap];
                CHECK(expected==correlation_q16[lag]);
                int64_t numerator=128*expected-dc*INT64_C(65536);
                if(llabs(numerator)>llabs(expected_peak)){expected_peak=numerator;expected_lag=lag;}
            }
            CHECK(weak_candidate.peak_num==expected_peak && weak_candidate.peak_lag==(int)expected_lag);
            if(state==1u) {
                CHECK(weak_candidate_available() && current_candidate_mm()==10000 && expected_lag==163u && expected_peak>0);
                if(repeat==0u)CHECK(strstr(screen_output,"t_dist.txt=\"10.000 m\"")!=NULL);
            } else {
                CHECK(!weak_candidate_available() && current_candidate_mm()==-1);
                CHECK(strstr(debug_output,"STATUS=LOW_RETURN,L_MM=-1,AVAILABLE=0,")!=NULL);
                if(state==2u && repeat==0u)CHECK(strstr(screen_output,"t_dist.txt=\"-- m\"")!=NULL);
            }
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            CHECK(snprintf(name,sizeof(name),"stage48_positive_real10m_%s_r%u.txt",state==0?"reference_before":state==1?"sample_B47":"reference_after",repeat+1u)>0);
            CHECK(save_transcript(name)==0);
            if(state==1u && repeat==0u)CHECK(save_transcript("stage48_positive_real10m_D_R_C.txt")==0);
        }
    }
    clear_output();process_pc_debug_byte('J');CHECK(save_transcript("stage48_positive_real10m_J_after.txt")==0);
    clear_output();process_pc_debug_byte('V');CHECK(save_transcript("stage48_positive_real10m_V_after.txt")==0);
    return 0;
}


static int seed_positive_numeric(void)
{
    select_fixture(positive_real_sources);CHECK(reset_screen_case(0,1)==0);
    CHECK(fixture_crc==positive_real_crc);
    memcpy(real_frames,positive_real_captures+3,sizeof(real_frames));
    clear_output();process_pc_debug_byte('D');
    CHECK(weak_candidate_available() && current_candidate_model()==2 && current_candidate_mm()==10000);
    CHECK(weak_candidate_drawn && strcmp(display_distance_text,"10.000 m")==0);
    CHECK(strstr(debug_output,"MODEL=2,STATUS=POSITIVE_DISTANCE_CANDIDATE,L_MM=10000,AVAILABLE=1")!=NULL);
    return 0;
}

static int test_positive_continuous_and_invalidation(void)
{
    ++test_groups;CHECK(seed_positive_numeric()==0);
    clear_output();hmi_request(0x11,0);continuous_tick();
    CHECK(continuous_state==CONT_RUNNING && current_candidate_model()==2);
    unsigned blanks=blank_distance_writes;
    for(unsigned i=0;i<12u;++i){
        continuous_tick();
        CHECK(current_candidate_model()==2 && weak_candidate_available() && !continuous_distance_hold);
        CHECK(blank_distance_writes==blanks && strcmp(display_distance_text,"10.000 m")==0);
    }
    hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && blank_distance_writes==blanks && strcmp(display_distance_text,"10.000 m")==0);
    CHECK(save_transcript("stage48_positive_continuous_mock.txt")==0);
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_positive_stopped_mock_I_R_C.txt")==0);
    for(unsigned scenario=0;scenario<8u;++scenario){
        ++test_groups;CHECK(seed_positive_numeric()==0);clear_output();
        if(scenario==0u)memcpy(real_frames,positive_real_captures,sizeof(real_frames));
        if(scenario==1u)fail_transaction=1;
        if(scenario==2u)mock_no_done=1;
        if(scenario==3u)mock_page_in_acquisition=1;
        if(scenario==4u)mock_ready_in_acquisition=1;
        if(scenario==5u){healthy_guard_profile=2u;healthy_guard_mask=2u;}
        if(scenario==6u)mock_read_results_failure=1;
        if(scenario==7u)mock_numeric_no_ack=1;
        process_pc_debug_byte('F');
        fail_transaction=mock_no_done=mock_page_in_acquisition=mock_ready_in_acquisition=mock_read_results_failure=mock_numeric_no_ack=0;
        CHECK(!weak_candidate_available() && !continuous_distance_hold);
        if(screen_link_blocked || screen_reset_seen || screen_refresh_pending){reset_mock_screen();note_screen_page(0);}
        clear_output();invalidate_text_cache();show_current_page();
        CHECK(strcmp(display_distance_text,"-- m")==0);
    }
    ++test_groups;CHECK(seed_positive_numeric()==0);hmi_request(0x11,0);continuous_tick();
    int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[0][i]-fixture_expected[i];
    for(unsigned k=0;k<256u;++k)mock_guard_corr[k]=dc*512;
    mock_guard_corr[163]-=INT64_C(67108864);mock_guard_corr_override=1;
    continuous_tick();mock_guard_corr_override=0;
    CHECK(weak_candidate_available() && current_candidate_model()==1 && current_candidate_mm()==10000);
    hmi_request(0x12,0);continuous_tick();
    return 0;
}

static int test_positive_kernel_boundaries(void)
{
    int64_t corr[256]={0};positive_candidate1_result out;
    const int lag[]={153,173,152,174,0,255,163,153};
    const int64_t val[]={16777217,16777217,16777217,16777217,16777217,16777217,-16777217,16777216};
    const positive_candidate1_status status[]={POSITIVE_CANDIDATE1_DISTANCE,POSITIVE_CANDIDATE1_DISTANCE,POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN,POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN,POSITIVE_CANDIDATE1_EDGE_PEAK,POSITIVE_CANDIDATE1_EDGE_PEAK,POSITIVE_CANDIDATE1_NEGATIVE_UNFITTED,POSITIVE_CANDIDATE1_LOW_RETURN};
    for(unsigned i=0;i<8u;++i){
        ++test_groups;memset(corr,0,sizeof(corr));corr[lag[i]]=val[i];
        CHECK(positive_candidate1_evaluate(corr,256,0,&out)==status[i]);
        CHECK(out.candidate_distance_available==(i<2u));
        CHECK(out.L_mm==(i==0u?5000:i==1u?15000:-1));
    }
    ++test_groups;corr[0]=INT64_C(140737488355328);
    CHECK(positive_candidate1_evaluate(corr,256,0,&out)==POSITIVE_CANDIDATE1_INVALID_INPUT && out.L_mm==-1 && out.peak_lag==-1);
    CHECK(positive_candidate1_evaluate(NULL,256,0,&out)==POSITIVE_CANDIDATE1_INVALID_INPUT);
    CHECK(positive_candidate1_evaluate(corr,255,0,&out)==POSITIVE_CANDIDATE1_INVALID_INPUT);
    CHECK(positive_candidate1_evaluate(corr,256,8388481,&out)==POSITIVE_CANDIDATE1_INVALID_INPUT);
    CHECK(positive_candidate1_evaluate(corr,256,0,NULL)==POSITIVE_CANDIDATE1_INVALID_INPUT);
    return 0;
}

static int load_position_fixtures(const char *path)
{
    FILE *f=fopen(path,"r");char magic[80];
    CHECK(f!=NULL && fscanf(f,"%79s",magic)==1 && strcmp(magic,"STAGE48_POSITIONS_FIXTURE_V1")==0);
    for(unsigned phase=0;phase<2u;++phase) {
        unsigned front;uint32_t crc;
        CHECK(fscanf(f,"%u %" SCNx32,&front,&crc)==2);
        CHECK(front==(phase?15u:5u) && crc==(phase?UINT32_C(0xDE19BD8F):UINT32_C(0x6C7EE278)));
        for(unsigned frame=0;frame<12u;++frame) {
            unsigned sequence;CHECK(fscanf(f,"%u",&sequence)==1 && sequence==(phase?37u:25u)+frame);
            int16_t *dst=frame<3u?position_sources[phase][frame]:position_captures[phase][frame-3u];
            for(unsigned i=0;i<1024u;++i){int v;CHECK(fscanf(f,"%d",&v)==1 && v>=INT16_MIN && v<=INT16_MAX);dst[i]=(int16_t)v;}
        }
    }
    CHECK(fscanf(f,"%79s",magic)==EOF && fclose(f)==0);return 0;
}
static int test_actual_B_positions_UI_and_exports(void)
{
    for(unsigned phase=0;phase<2u;++phase) {
        ++test_groups;select_fixture(position_sources[phase]);CHECK(reset_screen_case(0,0)==0);
        clear_output();process_pc_debug_byte('B');CHECK(!fatal_failure && batch_ok);
        process_pc_debug_byte('J');char path[120];unsigned front=phase?15u:5u;
        CHECK(snprintf(path,sizeof(path),"stage48_B%um_BJ.txt",front)>0 && save_transcript(path)==0);
        for(unsigned state=0;state<3u;++state) {
            memcpy(real_frames,position_captures[phase]+state*3u,sizeof(real_frames));
            for(unsigned repeat=0;repeat<3u;++repeat) {
                ++test_groups;clear_output();process_pc_debug_byte('D');
                CHECK(!fatal_failure && batch_ok && weak_candidate_current() && nominal_axis_frame(&plot_frame));
                if(state==1u) {
                    CHECK(weak_candidate_available() && current_candidate_model()==2 && current_candidate_mm()==(int32_t)(front*1000u));
                    CHECK(positive_candidate.peak_lag==(phase?173:153));
                    CHECK(strcmp(measurement_reason_text(),"POSITIVE RETURN / NOMINAL")==0);
                    CHECK(strcmp(display_distance_text,phase?"15.000 m":"5.000 m")==0);
                } else {
                    CHECK(!weak_candidate_available() && strcmp(display_distance_text,"-- m")==0);
                    CHECK(strcmp(measurement_reason_text(),"LOW RETURN: NO DISTANCE")==0);
                }
                process_pc_debug_byte('R');process_pc_debug_byte('C');
                CHECK(snprintf(path,sizeof(path),"stage48_B%um_%s_r%u.txt",front,state==0u?"reference_before":state==1u?"sample_B47":"reference_after",repeat+1u)>0);
                CHECK(save_transcript(path)==0);
            }
        }
    }
    return 0;
}


static int test_status_reasons_and_global_out_of_window_peaks(void)
{
    ++test_groups;select_fixture(positive_real_sources);CHECK(reset_screen_case(0,0)==0);
    CHECK(strcmp(measurement_reason_text(),"NO REF: USE REFERENCE/CAL")==0);
    clear_output();show_current_page();CHECK(strstr(screen_output,"NO REF: USE REFERENCE/CAL")!=NULL);
    ++test_groups;CHECK(seed_positive_numeric()==0);
    CHECK(strcmp(measurement_reason_text(),"POSITIVE RETURN / NOMINAL")==0);
    CHECK(strstr(screen_output,"OPEN CIRCUIT")==NULL && strstr(screen_output,"SHORT CIRCUIT")==NULL);
    for(unsigned scenario=0;scenario<3u;++scenario) {
        ++test_groups;CHECK(seed_positive_numeric()==0);clear_output();
        int64_t dc=0;for(unsigned i=0;i<128u;++i)dc+=(int32_t)real_frames[0][i]-fixture_expected[i];
        for(unsigned lag=0;lag<256u;++lag)mock_guard_corr[lag]=dc*512;
        unsigned lag=scenario==0u?149u:scenario==1u?183u:0u;
        mock_guard_corr[lag]+=INT64_C(67108864);mock_guard_corr_override=1;
        process_pc_debug_byte('D');mock_guard_corr_override=0;
        CHECK(weak_candidate_current() && !weak_candidate_available() && weak_candidate.peak_lag==(int)lag);
        CHECK(strcmp(display_distance_text,"-- m")==0);
        const char *expected=scenario==2u?"EDGE PEAK: NO DISTANCE":"RETURN OUT OF RANGE: NO DISTANCE";
        CHECK(strcmp(measurement_reason_text(),expected)==0 && strstr(screen_output,expected)!=NULL);
        CHECK(scenario==2u ? nominal_axis_frame(&plot_frame) : diagnostic_axis_frame(&plot_frame));
        if(scenario==1u) {
            /*20m remains the GLOBAL peak although the visible fitted interval ends15m.*/
            CHECK(positive_candidate.status==POSITIVE_CANDIDATE1_OUTSIDE_FIT_SPAN);
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            CHECK(save_transcript("stage48_ui_outside20m_D_R_C.txt")==0);
        }
    }
    ++test_groups;CHECK(seed_positive_numeric()==0);
    memcpy(real_frames,positive_real_captures,sizeof(real_frames));clear_output();process_pc_debug_byte('D');
    CHECK(strcmp(measurement_reason_text(),"LOW RETURN: NO DISTANCE")==0);
    CHECK(strstr(screen_output,"LOW RETURN: NO DISTANCE")!=NULL && !weak_candidate_available());
    ++test_groups;CHECK(seed_positive_numeric()==0);healthy_guard_profile=2u;healthy_guard_mask=2u;
    clear_output();process_pc_debug_byte('D');
    CHECK(strcmp(measurement_reason_text(),"REF NOT FITTED: NO DISTANCE")==0);
    CHECK(!nominal_axis_frame(&plot_frame) && plot_frame.first==0u && plot_frame.source_count==256u);
    CHECK(strstr(screen_output,"xstr ")==NULL && strstr(screen_output,"REF NOT FITTED")!=NULL);
    ++test_groups;CHECK(seed_weak_numeric()==0);
    CHECK(strcmp(measurement_reason_text(),"NEGATIVE RETURN / NOMINAL")==0);
    fatal_failure=1;CHECK(strcmp(measurement_reason_text(),"CAPTURE FAILED: RELOAD PROGRAM")==0);
    fatal_failure=0;busy=1;CHECK(strcmp(measurement_reason_text(),"MEASURING...")==0);busy=0;
    ++measurement_seq;CHECK(strcmp(measurement_reason_text(),"RESULT EXPIRED: PRESS SINGLE")==0);
    return 0;
}

static int test_nominal_axis_geometry_read_only_and_command_bounds(void)
{
    ++test_groups;CHECK(seed_positive_numeric()==0);
    int64_t corr_before[256];int16_t raw_before[1024],base_before[1024];
    memcpy(corr_before,correlation_q16,sizeof(corr_before));
    memcpy(raw_before,average_ref_q2,sizeof(raw_before));
    memcpy(base_before,fixture_expected,sizeof(base_before));
    process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_axis_inputs_D_R_C.txt")==0);
    FILE *vectors=fopen("stage48_axis_pixels.txt","wb");CHECK(vectors!=NULL);
    unsigned transactions=tx_total;uint32_t seq=measurement_seq;
    for(unsigned page=0;page<2u;++page)for(unsigned zoom=0;zoom<2u;++zoom) {
        ++test_groups;echo_hmi_wave_t frame;
        CHECK(echo_hmi_wave_build(raw_before,base_before,corr_before,3u,2u,zoom,page,&frame)==0);
        apply_nominal_distance_window(&frame,raw_before,base_before,corr_before,zoom);
        CHECK(nominal_axis_frame(&frame) && frame.zero==(page?132u:124u));
        CHECK(frame.first==(zoom?153u:143u) && frame.source_count==(zoom?21u:51u));
        unsigned first_m=zoom?5u:0u,last_m=zoom?15u:25u;
        for(unsigned m=first_m;m<=last_m;m+=5u) {
            unsigned x=nominal_axis_pixel(&frame,143u+2u*m),offset=x-frame.x;
            CHECK(x>=frame.x && x<frame.x+frame.width);
            CHECK(frame.first+offset*(frame.source_count-1u)/(frame.count-1u)==143u+2u*m);
            if(offset)CHECK(frame.first+(offset-1u)*(frame.source_count-1u)/(frame.count-1u)<143u+2u*m);
        }
        for(unsigned i=0;i<frame.count;++i)CHECK(frame.pixels[i]>=28u && frame.pixels[i]<=frame.height-4u);
        if(!page && !zoom)CHECK(nominal_axis_pixel(&frame,153u)==119u && nominal_axis_pixel(&frame,163u)==221u && nominal_axis_pixel(&frame,173u)==323u);
        uint32_t hash=UINT32_C(2166136261);
        for(unsigned i=0;i<frame.count;++i)hash=(hash^frame.pixels[i])*UINT32_C(16777619);
        CHECK(fprintf(vectors,"AXIS_CASE,PAGE=%u,ZOOM=%u,FIRST=%u,COUNT=%u,SCALE=%" PRId64 ",ZERO=%u,N=%u,FNV1A=%08" PRIX32 "\n",
            page,zoom,frame.first,frame.source_count,frame.full_scale,frame.zero,frame.count,hash)>0);
        for(unsigned i=0;i<frame.count;++i)CHECK(fprintf(vectors,"%s%u",i?",":"PIXELS,",frame.pixels[i])>0);
        CHECK(fputc('\n',vectors)!=EOF);
        reset_mock_screen();current_page=(uint8_t)page;current_page_valid=1;clear_output();
        CHECK(draw_nominal_distance_axis(&frame)==0 && screen_ack_pending==0u && !screen_link_blocked);
        CHECK(occurrences(screen_output,"xstr ")==(zoom?3u:6u));
        CHECK(strstr(screen_output,"65535,")!=NULL && strstr(screen_output,"992")!=NULL);
        CHECK(zoom || strstr(screen_output,"33808")!=NULL);
        char path[100];CHECK(snprintf(path,sizeof(path),"stage48_axis_page%u_zoom%u_commands.txt",page,zoom)>0);
        FILE *f=fopen(path,"wb");CHECK(f!=NULL && fwrite(screen_output,1,screen_size,f)==screen_size && fclose(f)==0);
        CHECK(tx_total==transactions && measurement_seq==seq);
        CHECK(memcmp(corr_before,correlation_q16,sizeof(corr_before))==0);
        CHECK(memcmp(raw_before,average_ref_q2,sizeof(raw_before))==0);
        CHECK(memcmp(base_before,fixture_expected,sizeof(base_before))==0);
    }
    CHECK(fclose(vectors)==0);
    return 0;
}

static int test_axis_failure_never_publishes_numeric_result(void)
{
    for(unsigned scenario=0;scenario<4u;++scenario) {
        ++test_groups;CHECK(seed_positive_numeric()==0);
        unsigned numeric=numeric_text_writes;clear_output();
        mock_axis_error=scenario==0u;mock_axis_no_ack=scenario==1u;
        mock_axis_page=scenario==2u;mock_axis_tx_fail=scenario==3u;
        process_pc_debug_byte('F');
        CHECK(!fast_saved_valid && !weak_candidate_available() && !continuous_distance_hold);
        CHECK(numeric_text_writes==numeric && strstr(debug_output,"FAST_RESULT,")==NULL);
        if(scenario!=2u)CHECK(screen_link_blocked);
        if(scenario==2u)CHECK(occurrences(screen_output,"xstr ")==1u);
        reset_mock_screen();note_screen_page(0);
    }
    return 0;
}


static int test_native_RTL_widget_all_views_and_peak_axis_alignment(void)
{
    ++test_groups;select_fixture(position_sources[1]);CHECK(reset_screen_case(0,1)==0);
    for(unsigned i=0;i<3u;++i)memcpy(real_frames[i],position_captures[1][3],sizeof(real_frames[i]));
    process_pc_debug_byte('D');CHECK(current_candidate_mm()==15000 && weak_candidate_available());
    FILE *vectors=fopen("stage48_native_widget_vectors.txt","wb");CHECK(vectors!=NULL);
    unsigned transactions=tx_total;uint32_t seq=measurement_seq;
    for(unsigned page=0;page<2u;++page)for(unsigned zoom=0;zoom<2u;++zoom)for(unsigned kind=0;kind<3u;++kind) {
        ++test_groups;echo_hmi_wave_t frame,logical_before;
        CHECK(echo_hmi_wave_build(average_ref_q2,fixture_expected,correlation_q16,3u,kind,zoom,page,&frame)==0);
        if(kind==2u)apply_nominal_distance_window(&frame,average_ref_q2,fixture_expected,correlation_q16,zoom);
        logical_before=frame;
        reset_mock_screen();current_page=(uint8_t)page;current_page_valid=1;clear_output();
        CHECK(upload_plot(&frame)==0 && last_pixel_count==frame.count);
        CHECK(memcmp(&frame,&logical_before,sizeof(frame))==0);
        for(unsigned i=0;i<frame.count;++i) {
            CHECK(last_pixels[i]==frame.pixels[frame.count-1u-i]);
            CHECK(native_pixels[i]==frame.pixels[i]);
        }
        CHECK(tx_total==transactions && measurement_seq==seq);
        if(kind==2u) {
            unsigned tick=nominal_axis_pixel(&frame,173u)-frame.x;
            uint8_t maximum=0;for(unsigned i=0;i<frame.count;++i)if(frame.pixels[i]>maximum)maximum=frame.pixels[i];
            CHECK(native_pixels[tick]==maximum);
            /* The prior uncorrected payload would put a different value at15m. */
            CHECK(frame.pixels[frame.count-1u-tick]<maximum);
            CHECK(fprintf(vectors,"NATIVE_CASE,PAGE=%u,ZOOM=%u,N=%u,FIRST=%u,COUNT=%u,ZERO=%u,WIRE_FNV1A=%08" PRIX32 "\n",
                page,zoom,frame.count,frame.first,frame.source_count,frame.zero,reversed_wire_hash(&frame))>0);
            for(unsigned i=0;i<frame.count;++i)CHECK(fprintf(vectors,"%s%u",i?",":"WIRE,",last_pixels[i])>0);
            CHECK(fputc('\n',vectors)!=EOF);
            for(unsigned i=0;i<frame.count;++i)CHECK(fprintf(vectors,"%s%u",i?",":"VISIBLE,",native_pixels[i])>0);
            CHECK(fputc('\n',vectors)!=EOF);
        }
    }
    CHECK(fclose(vectors)==0);
    ++test_groups;echo_hmi_wave_t invalid={0};
    CHECK(upload_plot(NULL)!=0 && upload_plot(&invalid)!=0);
    invalid.count=769u;CHECK(upload_plot(&invalid)!=0);
    return 0;
}


#include "test_return_class_extra.h"
#include "test_stage54_long_extra.h"
#include "test_stage56_extension_extra.h"


static int test_bounded_rx_reference_to_measure(void)
{
    for(unsigned iteration=0;iteration<2;++iteration) {
        unsigned capacity=iteration ? 32u : 64u;
        ++test_groups;rx_limit=rx_dropped=0;
        select_fixture(startup_frames[0]);CHECK(reset_screen_case(2,1)==0);
        CHECK(drain_mock_screen_events()==0);
        rx_limit=capacity;
        push_request(0x01,0);
        push_byte(0x66);push_byte(0);push_byte(255);push_byte(255);push_byte(255);
        CHECK(drain_mock_screen_events()==0);
        unsigned before=tx_total;
        hmi_request(0x10,0);
        fprintf(stderr,"FINITE_RX capacity=%u dropped=%u locked=%d tx=%u->%u pending=%u\n",capacity,rx_dropped,screen_link_blocked,before,tx_total,screen_ack_pending);
        CHECK(rx_dropped==0 && !screen_link_blocked);
        CHECK(tx_total==before+1u && measurement_seq==4u);
        CHECK(echo_healthy_baseline_is_valid(&healthy_baseline));
        CHECK(drain_mock_screen_events()==0 && screen_ack_pending==0u);
        rx_limit=0;
    }
    return 0;
}

#include "test_stage63_multi_extra.h"
int main(int argc,char **argv)
{
    if(argc!=7) { fprintf(stderr,"usage: stage48_weak_main THREE_REAL_FRAME_FIXTURE STARTUP_CAPTURE_DIRECTORY WEAK_REAL10M_FIXTURE\n"); return 2; }
    if(load_fixture(argv[1]) || load_startup_frames(argv[2]) || load_weak_real_fixture(argv[3]) || load_positive_real_fixture(argv[4]) || load_position_fixtures(argv[5]) || load_class_fixture(argv[6]))return 1;
    memcpy(original_frames,real_frames,sizeof(original_frames));
    if(ECHO_MULTI61_ENABLE)return run_multi61_tests();
    if(test_no_baseline_and_explicit_collection() || test_difference_and_exports() ||
       test_legacy_switch_and_restore() || test_wave_views_and_failures() ||
       test_text_cache_and_invalidation() || test_compact_success_replay_and_old_D() ||
       test_fast_guards_and_failures() || test_failure_retention_and_reset() ||
       test_screen_single_requires_reference_and_page() || test_screen_reference_confirm_commit_and_single() ||
       test_screen_confirmation_cancellation() || test_screen_action_guards_and_unsupported() ||
       test_screen_actions_while_operations_are_not_replayed() || test_screen_reference_failure_preserves_previous() ||
       test_screen_PN_mode_hides_legacy_distance_without_destroying_cache() ||
       test_screen_requests_during_exports_are_not_replayed() || test_reference_profile_guard() ||
       test_profile2_screen_and_diagnostics() || test_profile2_refusal_retention_and_publish() ||
       test_continuous_screen_owned_success() || test_continuous_stop_boundaries() ||
       test_continuous_start_and_command_guards() || test_continuous_page_ready_and_errors() ||
       test_weak_real_raws_all_nine_and_exports() || test_weak_fast_single_continuous_numeric_and_stop() ||
       test_weak_low_positive_edges_span_and_strict_gate() || test_weak_profile_context_and_cached_identity_invalidation() ||
       test_weak_rejected_attempt_capture_and_screen_failures() || test_weak_PAGE_READY_and_continuous_failure_clearing() ||
       test_weak_completion_failures_and_early_blanking() || test_weak_epoch_before_computation_and_readonly_nonrevival() ||
       test_weak_numeric_text_ack_failure_is_logically_invalid() ||
       test_positive_real_raws_all_nine_and_exports() || test_positive_continuous_and_invalidation() || test_positive_kernel_boundaries() ||
       test_continuous_distance_no_intermediate_blanking() || test_continuous_hold_clears_on_new_results_and_failure() ||
       test_actual_B_positions_UI_and_exports() || test_status_reasons_and_global_out_of_window_peaks() || test_nominal_axis_geometry_read_only_and_command_bounds() ||
       test_axis_failure_never_publishes_numeric_result() ||
       test_native_RTL_widget_all_views_and_peak_axis_alignment() || test_measured_return_classes_all39() ||
       test_class_fast_continuous_stop_and_clearing() || test_class_ambiguity_and_note_ACK_failures() || test_bounded_rx_reference_to_measure() || test_long_endpoint_actual_arrays_and_UI() || test_negative_extension_actual_arrays_and_safety()) return 1;
    printf("STAGE63_LEGACY_MAIN_HOST_PASS: %u groups; %u checks; production command routing with controlled UART/driver/transaction mocks\n",test_groups,checks);
    puts("HOST MOCK ONLY: no UART device, MMIO device, RTL execution or board measurements performed.");
    return 0;
}
