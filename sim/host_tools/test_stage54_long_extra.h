static int16_t long_frames[3][11][1024];
static int long_lengths[3];
static uint32_t long_crcs[3];
static int test_long_endpoint_actual_arrays_and_UI(void)
{
    FILE *f=fopen("../stage54_long_fixture.txt","r");char magic[80];
    CHECK(f && fscanf(f,"%79s",magic)==1 && strcmp(magic,"STAGE54_LONG_REAL_RAW_V1")==0);
    for(unsigned p=0;p<3;++p) {
        unsigned count;CHECK(fscanf(f,"%d %" SCNx32 " %u",&long_lengths[p],&long_crcs[p],&count)==3 && count==11);
        for(unsigned row=0;row<11;++row)for(unsigned i=0;i<1024;++i){int v;CHECK(fscanf(f,"%d",&v)==1 && v>=INT16_MIN && v<=INT16_MAX);long_frames[p][row][i]=(int16_t)v;}
    }
    CHECK(fclose(f)==0);
    for(unsigned p=0;p<3;++p) {
        ++test_groups;select_fixture(long_frames[p]);CHECK(reset_screen_case(0,0)==0);
        process_pc_debug_byte('B');CHECK(batch_ok && !fatal_failure && echo_healthy_baseline_active_crc32(&healthy_baseline)==long_crcs[p]);
        process_pc_debug_byte('J');char file_name[96];
        snprintf(file_name,sizeof(file_name),"stage54_long_p%u_BJ.txt",p);CHECK(save_transcript(file_name)==0);
        for(unsigned row=3;row<11;++row) {
            ++test_groups;
            for(unsigned i=0;i<3;++i)memcpy(real_frames[i],long_frames[p][row],sizeof(real_frames[i]));
            clear_output();process_pc_debug_byte('D');CHECK(batch_ok && !fatal_failure && weak_candidate_current());
            int endpoint=row>=4u && row<=9u;
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            snprintf(file_name,sizeof(file_name),"stage54_long_p%u_r%u_DRC.txt",p,row);CHECK(save_transcript(file_name)==0);
            CHECK(weak_candidate_available()==endpoint && long_candidate_selected==endpoint);
            if(endpoint) {
                CHECK(current_candidate_model()==3 && current_return_model()==3 && current_candidate_mm()==long_lengths[p]);
                CHECK(strcmp(return_class_name(),row<=6?"LONG_OPEN_LIKE":"LONG_SHORT_LIKE")==0);
                char label[60];snprintf(label,sizeof(label),"t_dist.txt=\"%d.000 m\"",long_lengths[p]/1000);
                CHECK(strstr(screen_output,label) && long_axis_frame(&plot_frame) && plot_frame.first==144 && plot_frame.source_count==81);
                CHECK(!numeric_text_unsafe && !screen_link_blocked && !screen_ack_pending);
                unsigned peak=(unsigned)long_candidate.metric.lag;
                CHECK(peak==144u+2u*(unsigned)(long_lengths[p]/1000));
                unsigned tick=nominal_axis_pixel(&plot_frame,peak)-plot_frame.x;
                CHECK(native_pixels[tick]==plot_frame.pixels[tick]);
                CHECK(row<=6?native_pixels[tick]>plot_frame.zero:native_pixels[tick]<plot_frame.zero);
                unsigned tx=tx_total;
                hmi_request(0x31,1);CHECK(drain_mock_screen_events()==0);
                if(screen_refresh_pending){screen_refresh_pending=0;show_current_page();CHECK(drain_mock_screen_events()==0);}
                CHECK(tx_total==tx && plot_frame.first==194 && plot_frame.source_count==17);
                CHECK(current_candidate_mm()==long_lengths[p] && long_axis_frame(&plot_frame));
                snprintf(file_name,sizeof(file_name),"stage54_long_p%u_r%u_ZOOM_DRC.txt",p,row);CHECK(save_transcript(file_name)==0);
                hmi_request(0x31,0);CHECK(drain_mock_screen_events()==0);
            } else CHECK(current_candidate_mm()==-1 && strcmp(display_distance_text,"-- m")==0);
        }
        /* Actual short RAW for continuous hold/STOP and numeric-ACK failures. */
        for(unsigned i=0;i<3;++i)memcpy(real_frames[i],long_frames[p][7],sizeof(real_frames[i]));
        ++test_groups;clear_output();hmi_request(0x11,0);continuous_tick();continuous_tick();
        CHECK(continuous_frames==2 && long_candidate_selected && current_candidate_mm()==long_lengths[p]);
        CHECK(strstr(debug_output,"RETURN_MODEL=3,RETURN_CLASS=LONG_SHORT_LIKE") && !strstr(debug_output,"WAVE_ERROR"));
        hmi_request(0x12,0);continuous_tick();CHECK(continuous_state==CONT_IDLE && weak_candidate_drawn);
        ++test_groups;unsigned before_page=tx_total;
        plot_view=2;plot_view_explicit=1;hmi_request(0x01,1);CHECK(drain_mock_screen_events()==0);
        CHECK(tx_total==before_page && !weak_candidate_available() && long_axis_frame(&plot_frame) && plot_frame.first==144);
        hmi_request(0x31,1);CHECK(drain_mock_screen_events()==0);
        CHECK(tx_total==before_page && plot_frame.first==194 && !weak_candidate_available());
        hmi_request(0x01,0);CHECK(drain_mock_screen_events()==0);
        CHECK(tx_total==before_page && strcmp(display_distance_text,"-- m")==0);
        /* New frame restores numeric ownership after leaving cached pages. */
        process_pc_debug_byte('F');CHECK(fast_saved_valid && long_candidate_selected);
        ++test_groups;mock_numeric_no_ack=1;clear_output();process_pc_debug_byte('F');mock_numeric_no_ack=0;
        CHECK(!fast_saved_valid && !weak_candidate_available() && !strstr(debug_output,"FAST_RESULT,"));
        reset_mock_screen();
    }
    ++test_groups;
    int64_t corr[256]={0};long_endpoint1_result out;
    corr[202]=INT64_C(1)<<31;CHECK(long_endpoint1_evaluate(corr,256,0,1,1,&out)==LONG1_OPEN_LIKE && out.L_mm==29000);
    corr[202]=0;corr[193]=INT64_C(1)<<31;CHECK(long_endpoint1_evaluate(corr,256,0,1,1,&out)==LONG1_OUTSIDE_FIT && !out.available);
    corr[193]=0;corr[202]=INT64_C(1)<<29;CHECK(long_endpoint1_evaluate(corr,256,0,1,1,&out)==LONG1_UNQUALIFIED);
    CHECK(long_endpoint1_evaluate(NULL,0,0,1,1,&out)==LONG1_INVALID && !out.available && out.metric.lag==-1);
    return 0;
}
