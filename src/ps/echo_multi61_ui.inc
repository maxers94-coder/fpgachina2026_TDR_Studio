/* Included after UART/axis helpers: bounded ACK and page ownership are shared. */
static int multi61_append(char *line,size_t cap,int used,int axis)
{
    if(used<0 || (size_t)used>=cap)return -1;
    int current=weak_candidate_current() && weak_candidate_profile_fitted && weak_profile_fitted_now();
    unsigned edge_mask=0;
    if(current)for(unsigned i=0;i<multi61_result.count;++i)if(multi61_result.peaks[i].nominal_mm>33000)edge_mask|=1u<<i;
    int n=snprintf(line+used,cap-(size_t)used,",POINTS=%u,LOCAL_POINTS=%u,PN_COUNT=%u,MORE=%u,OVERFLOW=%d,EDGE_COUNT=%u,EDGE_MASK=%u",
        current?multi61_selected.count:0u,current?multi61_result.count:0u,current?multi61_selected.pn_count:0u,current?multi61_selected.more:0u,current?multi61_result.overflow:0,current?multi61_selected.edge_count:0u,edge_mask);
    if(n<0 || (size_t)n>=cap-(size_t)used)return -1;
    used+=n;
    if(current)for(unsigned i=0;i<multi61_result.count;++i){
        const unified2_peak *p=&multi61_result.peaks[i];
        n=snprintf(line+used,cap-(size_t)used,",C%u=%d:%d:%ld:%d:%u:%d",i+1u,p->lag,p->sign,(long)p->nominal_mm,p->kind,p->companion_mask,multi61_eligible(p));
        if(n<0 || (size_t)n>=cap-(size_t)used)return -1;
        used+=n;
    }
    if(axis){
        n=snprintf(line+used,cap-(size_t)used,",AXIS=UNIFIED_MM,X0_MM=%ld,XSPAN_MM=%ld",(long)multi61_plot_view.first_mm,(long)multi61_plot_view.span_mm);
        if(n<0 || (size_t)n>=cap-(size_t)used)return -1;
        used+=n;
    }
    return used;
}
static int multi61_display_owned(void)
{
    return held_distance_current() || (weak_candidate_current() && weak_candidate_drawn && last_plot_valid && last_plot_seq==measurement_seq && last_plot_crc==cached_baseline_crc);
}
static void publish_multi61_list(void)
{
    if(!weak_candidate_current() || !current_page_valid || current_page!=0u)return;
    if(!weak_candidate_profile_fitted || !weak_profile_fitted_now()){
        set_text("t_cal","REFERENCE NOT FITTED");set_text("t_ref","NO MULTI DISTANCE");set_text("t_frames","");return;
    }
    char rows[3][96]={{0}};
    unsigned shown=multi61_selected.count<6u?multi61_selected.count:6u;
    for(unsigned i=0;i<shown;++i){
        const unified2_peak *p=&multi61_result.peaks[multi61_selected.indices[i]];
        char mm[40],entry[48];multi61_format_mm(mm,sizeof(mm),p->nominal_mm);
        /* Each of the first three candidates owns a separate visible row.
         * Four to six use compact pairs within the existing240px font0 rows. */
        if(shown>3u){char *unit=strchr(mm,' ');if(unit){int edge=strchr(unit,'*')!=NULL;*unit=edge?'*':'\0';if(edge)unit[1]='\0';}}
        (void)snprintf(entry,sizeof(entry),"%u:%c%s",i+1u,p->sign>0?'+':'-',mm);
        unsigned row=shown<=3u?i:i/2u;size_t used=strlen(rows[row]);
        (void)snprintf(rows[row]+used,sizeof(rows[0])-used,"%s%s",used?"  ":"",entry);
    }
    if(!shown)(void)snprintf(rows[0],sizeof(rows[0]),"%s",multi61_result.count?"UNCERTAIN / OUT OF RANGE":"LOW RETURN / NO POINTS");
    if(!rows[1][0])(void)snprintf(rows[1],sizeof(rows[1]),"PN? %u / EDGE* %u",multi61_selected.pn_count,multi61_selected.edge_count);
    if(!rows[2][0])(void)snprintf(rows[2],sizeof(rows[2]),"%u POINTS; EDGE* %u%s",multi61_selected.count,multi61_selected.edge_count,multi61_result.overflow?"; OVERFLOW":"");
    set_text("t_cal",rows[0]);set_text("t_ref",rows[1]);set_text("t_frames",rows[2]);
}
static unsigned multi61_plot_x(const echo_hmi_wave_t *f,int32_t mm)
{
    if(mm<=multi61_plot_view.first_mm)return f->x;
    if(mm>=multi61_plot_view.first_mm+multi61_plot_view.span_mm)return f->x+f->width-1u;
    return f->x+(unsigned)(((int64_t)(mm-multi61_plot_view.first_mm)*(f->width-1u)+multi61_plot_view.span_mm/2)/multi61_plot_view.span_mm);
}
static int draw_multi61_axis(const echo_hmi_wave_t *f)
{
    unsigned page=current_page;uint32_t epoch=screen_page_epoch;char line[160];unsigned y=f->y+f->height-24u;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,24,65535",f->x,y,f->width);
    int rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    (void)snprintf(line,sizeof(line),"fill %u,%u,%u,2,33808",f->x,y,f->width);
    rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    int32_t low=multi61_plot_view.first_mm,high=low+multi61_plot_view.span_mm;
    int32_t first=((low+4999)/5000)*5000;
    for(int32_t mm=first;mm<=high;mm+=5000){
        unsigned x=multi61_plot_x(f,mm),left=x>f->x+21u?x-21u:f->x;
        if(left+42u>f->x+f->width)left=f->x+f->width-42u;
        (void)snprintf(line,sizeof(line),"xstr %u,%u,42,18,0,33808,65535,%u,1,1,\"%ldm\"",left,y+6u,mm==low?0u:mm==high?2u:1u,(long)mm/1000);
        rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    }
    for(unsigned rank=0;rank<multi61_plot_view.count;++rank){
        const unified2_peak *p=&multi61_plot_result.peaks[multi61_plot_view.indices[rank]];
        if(p->nominal_mm<low-250 || p->nominal_mm>high)continue;
        unsigned x=multi61_plot_x(f,p->nominal_mm),color=p->nominal_mm>33000?64512u:p->sign>0?992u:63488u;
        /* Small top marker/number keeps the measured curve visible. */
        (void)snprintf(line,sizeof(line),"fill %u,%u,1,10,%u",x,f->y,color);
        rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
        unsigned left=x+2u;if(left+18u>f->x+f->width)left=f->x+f->width-18u;
        (void)snprintf(line,sizeof(line),"xstr %u,%u,18,18,0,%u,65535,0,1,1,\"%u%s\"",left,f->y+1u,color,rank+1u,p->nominal_mm>33000?"*":"");
        rc=axis_command(line,sizeof(line),page,epoch);if(rc)return rc;
    }
    return 0;
}
