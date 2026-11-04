static int test_negative_extension_actual_arrays_and_safety(void)
{
    int16_t frames[5][1024];char magic[80];FILE *f=fopen("../stage55_D25_actual_fixture.txt","r");
    CHECK(f && fscanf(f,"%79s",magic)==1 && strcmp(magic,"STAGE55_D25_REAL_RAW_V1")==0);
    for(unsigned row=0;row<5u;++row)for(unsigned i=0;i<1024u;++i){int n;CHECK(fscanf(f,"%d",&n)==1 && n>=INT16_MIN && n<=INT16_MAX);frames[row][i]=(int16_t)n;}
    CHECK(fclose(f)==0);++test_groups;
    select_fixture(frames);CHECK(reset_screen_case(0,0)==0);process_pc_debug_byte('B');process_pc_debug_byte('J');
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==UINT32_C(0x0812019B));
    CHECK(save_transcript("stage56_D25_BJ.txt")==0);
    for(unsigned i=0;i<3u;++i)memcpy(real_frames[i],frames[3],sizeof(real_frames[i]));
    for(unsigned zoom=0;zoom<2u;++zoom) {
        ++test_groups;plot_zoom=zoom;clear_output();process_pc_debug_byte('F');
        CHECK(fast_saved_valid && extended_axis_frame(&plot_frame) && nominal_axis_frame(&plot_frame));
        CHECK(weak_candidate_available() && current_candidate_model()==4 && current_return_model()==4);
        CHECK(weak_candidate.peak_lag==193 && weak_candidate.peak_num==-INT64_C(5002690560));
        CHECK(current_candidate_mm()==25000 && strcmp(display_distance_text,"25.000 m")==0);
        CHECK(strcmp(return_class_name(),"NEGATIVE_RETURN")==0 && return_label_available());
        unsigned pixel=nominal_axis_pixel(&plot_frame,193u)-plot_frame.x;
        CHECK(native_pixels[pixel]==plot_frame.pixels[pixel] && native_pixels[pixel]<plot_frame.zero-50u);
        CHECK(plot_frame.first==(zoom?173u:143u) && plot_frame.source_count==(zoom?21u:61u));
        CHECK(!screen_link_blocked && !screen_ack_pending && !numeric_text_unsafe);
        process_pc_debug_byte('R');process_pc_debug_byte('C');
        CHECK(save_transcript(zoom?"stage56_D25_zoom_DRC.txt":"stage56_D25_full_DRC.txt")==0);
    }
    ++test_groups;unsigned before=tx_total;
    plot_view=2;plot_view_explicit=1;hmi_request(0x01,1);CHECK(drain_mock_screen_events()==0);
    CHECK(tx_total==before && extended_axis_frame(&plot_frame) && !weak_candidate_available());
    hmi_request(0x31,0);CHECK(drain_mock_screen_events()==0);
    CHECK(tx_total==before && plot_frame.first==143 && plot_frame.source_count==61);
    hmi_request(0x31,1);CHECK(drain_mock_screen_events()==0);
    CHECK(tx_total==before && plot_frame.first==173 && plot_frame.source_count==21);
    hmi_request(0x01,0);CHECK(drain_mock_screen_events()==0);
    CHECK(strcmp(display_distance_text,"-- m")==0 && !weak_candidate_available());
    CHECK(save_transcript("stage56_D25_cached_pages.txt")==0);
    ++test_groups;clear_output();hmi_request(0x11,0);continuous_tick();continuous_tick();
    CHECK(continuous_frames==2 && weak_candidate_available() && current_candidate_mm()==25000);
    CHECK(strstr(debug_output,"WEAK_MODEL=4") && !strstr(debug_output,"WAVE_ERROR"));
    hmi_request(0x12,0);continuous_tick();CHECK(continuous_state==CONT_IDLE && weak_candidate_drawn);
    CHECK(strcmp(display_distance_text,"25.000 m")==0);
    ++test_groups;
    for(unsigned i=0;i<3u;++i)memcpy(real_frames[i],frames[4],sizeof(real_frames[i]));
    clear_output();process_pc_debug_byte('F');
    CHECK(fast_saved_valid && strcmp(weak_candidate_status_name(),"LOW_RETURN")==0 && !negative_extension_selected);
    CHECK(strcmp(display_distance_text,"-- m")==0 && !extended_axis_frame(&plot_frame));
    process_pc_debug_byte('R');process_pc_debug_byte('C');CHECK(save_transcript("stage56_restored_DRC.txt")==0);
    ++test_groups;
    for(unsigned i=0;i<3u;++i)memcpy(real_frames[i],frames[3],sizeof(real_frames[i]));
    clear_output();mock_numeric_no_ack=1;process_pc_debug_byte('F');mock_numeric_no_ack=0;
    CHECK(!fast_saved_valid && !weak_candidate_available() && !strstr(debug_output,"FAST_RESULT,"));reset_mock_screen();
    /* Projection boundaries and refusal, using the existing full-array kernel. */
    for(unsigned i=0;i<8u;++i) {
        ++test_groups;int64_t corr[256]={0};weak_candidate1_result metric;int32_t mm;
        unsigned lag=(unsigned[]){173,174,193,194,183,183,183,183}[i];
        corr[lag]=i==4?INT64_C(67108864):-INT64_C(67108864);
        if(i==5)corr[lag]=-INT64_C(16777216);
        if(i==6)corr[lag]=-INT64_C(536870913);
        weak_candidate1_evaluate(corr,256,0,&metric);
        bool available=negative_extension1_project(&metric,i==7?2:1,1,&mm);
        CHECK(available==(i==1 || i==2));CHECK(available?mm==500*((int)lag-143):mm==-1);
    }
    return 0;
}
