/* Actual four exported RAW arrays: three healthy sources and C25/A30/B33.
 * Acquisition is mocked; output rows and all candidates use production code. */
static int test_stage63_actual_triple(void)
{
    FILE *f=fopen("../stage63_actual_triple_fixture.txt","r");int16_t sources[3][1024],sample[1024];CHECK(f);
    for(unsigned frame=0;frame<4;++frame)for(unsigned i=0;i<1024;++i){int n;CHECK(fscanf(f,"%d",&n)==1);if(frame<3)sources[frame][i]=(int16_t)n;else sample[i]=(int16_t)n;}
    CHECK(fclose(f)==0);++test_groups;select_fixture(sources);CHECK(reset_screen_case(0,1)==0);
    for(unsigned j=0;j<3;++j)memcpy(real_frames[j],sample,sizeof(sample));
    hmi_request(0x10,0);CHECK(drain_mock_screen_events()==0);
    CHECK(weak_candidate_current() && multi61_selected.count==3 && !screen_link_blocked && !screen_ack_pending);
    CHECK(strstr(screen_output,"t_cal.txt=\"1:-25.049 m\"") && strstr(screen_output,"t_ref.txt=\"2:+30.045 m\"") && strstr(screen_output,"t_frames.txt=\"3:+33.147 m*\""));
    CHECK(multi61_list_ack==1 && multi61_list_points==3 && multi61_list_seq==measurement_seq);
    process_pc_debug_byte('V');CHECK(strstr(debug_output,"LIST_POINTS=3,LIST_ACK=1") && strstr(debug_output,"FW_STAGE=63"));
    process_pc_debug_byte('R');process_pc_debug_byte('C');CHECK(save_transcript("stage63_actual_triple_DRCV.txt")==0);
    FILE *wire=fopen("stage63_actual_triple_screen_commands.bin","wb");CHECK(wire && fwrite(screen_output,1,screen_size,wire)==screen_size && fclose(wire)==0);
    unsigned before=tx_total;hmi_request(0x11,0);continuous_tick();continuous_tick();CHECK(continuous_frames==2 && multi61_list_points==3);
    hmi_request(0x12,0);continuous_tick();CHECK(continuous_state==CONT_IDLE && tx_total==before+2 && multi61_list_ack);
    show_current_page();CHECK(strstr(screen_output,"t_frames.txt=\"3:+33.147 m*\""));
    select_fixture(sources);for(unsigned j=0;j<3;++j)memcpy(real_frames[j],sources[0],sizeof(real_frames[j]));
    clear_output();process_pc_debug_byte('F');CHECK(fast_saved_valid && multi61_selected.count==0 && multi61_list_points==0 && strcmp(display_distance_text,"-- m")==0);
    /* Compact-pair capacity/layout cases are controlled UI cases, not board evidence. */
    for(unsigned count=4;count<=6;++count){
        ++test_groups;multi61_result=(unified2_result){.valid_input=true,.profile_fitted=true,.count=count};
        for(unsigned i=0;i<count;++i)multi61_result.peaks[i]=(unified2_peak){.lag=150+(int)i*10,.sign=i%2?-1:1,.kind=i%2?UNIFIED2_NEGATIVE:UNIFIED2_POSITIVE,.num=INT64_C(4000000000),.nominal_mm=1000+(int)i*5000,.projection_available=true,.inside_requested_range=true};
        multi61_select(&multi61_result,&multi61_selected);invalidate_text_cache();clear_output();publish_weak_candidate_distance();
        CHECK(!screen_link_blocked && multi61_list_ack && multi61_list_points==count);
        CHECK(strstr(screen_output,"t_cal.txt=\"1:+1.000  2:-6.000\"") && strstr(screen_output,"t_ref.txt=\"3:+11.000  4:-16.000\""));
        if(count==6)CHECK(strstr(screen_output,"t_frames.txt=\"5:+21.000  6:-26.000\""));
    }
    select_fixture(original_frames);return 0;
}
/* Controlled presentation cases. Distances include the observed C2 values
 *33255/33276; sample magnitudes below are representative, not missing CONT RAW. */
static int test_stage62_edge_presentation(void)
{
    for(unsigned i=0;i<7;++i){
        ++test_groups;int32_t mm=(int32_t[]){33000,33250,33255,33276,33500,35000,35001}[i];
        unified2_result r={.valid_input=true,.profile_fitted=true,.count=2};
        r.peaks[0]=(unified2_peak){.lag=204,.sign=-1,.kind=UNIFIED2_NEGATIVE,.num=-INT64_C(4000000000),.nominal_mm=30032,.projection_available=true,.inside_requested_range=true};
        r.peaks[1]=(unified2_peak){.lag=211,.sign=1,.kind=UNIFIED2_POSITIVE,.num=INT64_C(6000000000),.nominal_mm=mm,.projection_available=true,.inside_requested_range=mm<=33000};
        multi61_view view;multi61_select(&r,&view);
        CHECK(view.count==(i==6?1u:2u) && view.edge_count==(i>0 && i<6?1u:0u));
        CHECK(r.peaks[1].nominal_mm==mm && r.peaks[1].inside_requested_range==(mm<=33000));
        char number[48];multi61_format_mm(number,sizeof(number),mm);CHECK((strchr(number,'*')!=NULL)==(mm>33000));
    }
    ++test_groups;
    select_fixture(positive_real_sources);CHECK(reset_screen_case(0,1)==0);
    for(unsigned i=0;i<3;++i)memcpy(real_frames[i],positive_real_captures[3],sizeof(real_frames[i]));
    process_pc_debug_byte('D');CHECK(batch_ok && weak_candidate_profile_fitted && weak_profile_fitted_now());
    if(screen_refresh_pending){screen_refresh_pending=0;show_current_page();CHECK(drain_mock_screen_events()==0);}
    /* Current matched frame owns this page; replace only result presentation
     * fields to test UI ACK/serialization. This is not a physical acquisition. */
    CHECK(weak_candidate_current() && current_page==0u && !screen_link_blocked);
    multi61_result=(unified2_result){.valid_input=true,.profile_fitted=true,.count=2};
    multi61_result.peaks[0]=(unified2_peak){.lag=204,.sign=-1,.kind=UNIFIED2_NEGATIVE,.num=-INT64_C(4000000000),.nominal_mm=30032,.projection_available=true,.inside_requested_range=true};
    multi61_result.peaks[1]=(unified2_peak){.lag=211,.sign=1,.kind=UNIFIED2_POSITIVE,.num=INT64_C(6000000000),.nominal_mm=33276,.projection_available=true,.inside_requested_range=false};
    multi61_select(&multi61_result,&multi61_selected);
    invalidate_text_cache();clear_output();publish_weak_candidate_distance();
    CHECK(weak_candidate_available() && strcmp(display_distance_text,"33.276 m*")==0);
    CHECK(strstr(screen_output,"1:-30.032 m") && strstr(screen_output,"2:+33.276 m*") && strstr(screen_output,"EDGE* 1"));
    CHECK(!screen_link_blocked && !screen_ack_pending && !multi61_result.peaks[1].inside_requested_range);
    char record[1024]="TEST";CHECK(multi61_append(record,sizeof(record),4,0)>0);
    CHECK(strstr(record,"POINTS=2") && strstr(record,"EDGE_COUNT=1,EDGE_MASK=2"));
    for(unsigned i=0;i<3;++i)memcpy(real_frames[i],positive_real_captures[0],sizeof(real_frames[i]));
    clear_output();process_pc_debug_byte('F');
    CHECK(fast_saved_valid && multi61_selected.count==0 && multi61_selected.edge_count==0 && strcmp(display_distance_text,"-- m")==0);
    return 0;
}
static int run_multi61_tests(void)
{
    FILE *f=fopen("../stage61_actual_fixture.txt","r");char magic[80];unsigned sessions;
    CHECK(f && fscanf(f,"%79s %u",magic,&sessions)==2 && strcmp(magic,"STAGE61_REAL_RAW_V1")==0 && sessions==7);
    unsigned total=0;
    for(unsigned session=0;session<sessions;++session){
        char name[160];unsigned rows;uint32_t crc;int16_t sources[3][1024];
        CHECK(fscanf(f,"%159s %" SCNx32 " %u",name,&crc,&rows)==3);
        for(unsigned j=0;j<3;++j)for(unsigned i=0;i<1024;++i){int n;CHECK(fscanf(f,"%d",&n)==1);sources[j][i]=(int16_t)n;}
        ++test_groups;select_fixture(sources);CHECK(reset_screen_case(0,0)==0);
        process_pc_debug_byte('B');process_pc_debug_byte('J');CHECK(!fatal_failure && echo_healthy_baseline_active_crc32(&healthy_baseline)==crc);
        char file[100];snprintf(file,sizeof(file),"stage63_s%u_BJ.txt",session);CHECK(save_transcript(file)==0);
        for(unsigned row=0;row<rows;++row){
            char state[80];unsigned count,eligible;int primary;int lag[8],sign[8],kind[8],mm[8];unsigned masks[8];
            CHECK(fscanf(f,"%79s %u %u %d",state,&count,&eligible,&primary)==4 && count<=8);
            for(unsigned i=0;i<count;++i)CHECK(fscanf(f,"%d %d %d %d %u",&lag[i],&sign[i],&mm[i],&kind[i],&masks[i])==5);
            for(unsigned i=0;i<1024;++i){int n;CHECK(fscanf(f,"%d",&n)==1);for(unsigned j=0;j<3;++j)real_frames[j][i]=(int16_t)n;}
            ++test_groups;++total;plot_zoom=0;clear_output();process_pc_debug_byte('D');
            CHECK(batch_ok && !fatal_failure && weak_candidate_current() && multi61_result.valid_input && current_candidate_model()==5);
            CHECK(multi61_result.count==count && multi61_selected.count==eligible && multi61_selected.primary==primary);
            for(unsigned i=0;i<count;++i){CHECK(multi61_result.peaks[i].lag==lag[i] && multi61_result.peaks[i].sign==sign[i] && multi61_result.peaks[i].kind==kind[i] && multi61_result.peaks[i].nominal_mm==mm[i] && multi61_result.peaks[i].companion_mask==masks[i]);}
            CHECK(weak_candidate_available()==(primary>=0));
            char expected[48];if(primary>=0)multi61_format_mm(expected,sizeof(expected),mm[primary]);else strcpy(expected,"-- m");
            CHECK(strcmp(display_distance_text,expected)==0 && !screen_link_blocked && !screen_ack_pending && !numeric_text_unsafe);
            CHECK(nominal_axis_frame(&plot_frame) && multi61_plot_view.first_mm==0 && multi61_plot_view.span_mm==35000);
            CHECK(memcmp(native_pixels,plot_frame.pixels,512)==0);
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            snprintf(file,sizeof(file),"stage63_s%u_r%u_DRC.txt",session,row);CHECK(save_transcript(file)==0);
            if(strcmp(state,"sample_D30_B33")==0){
                CHECK(eligible==2 && strstr(screen_output,"1:-30.") && strstr(screen_output,"2:+33."));
                unsigned transactions=tx_total;hmi_request(0x31,1);CHECK(drain_mock_screen_events()==0);
                CHECK(tx_total==transactions && multi61_plot_view.first_mm==28000 && multi61_plot_view.span_mm==7000 && weak_candidate_available());
                snprintf(file,sizeof(file),"stage63_s%u_r%u_ZOOM_DRC.txt",session,row);CHECK(save_transcript(file)==0);
                plot_view=2;plot_view_explicit=1;hmi_request(0x01,1);CHECK(drain_mock_screen_events()==0);
                CHECK(tx_total==transactions && !weak_candidate_available() && multi61_plot_view.count==2 && plot_frame.count==768);
                hmi_request(0x31,0);CHECK(drain_mock_screen_events()==0);hmi_request(0x01,0);CHECK(drain_mock_screen_events()==0);
                CHECK(tx_total==transactions && strcmp(display_distance_text,"-- m")==0 && multi61_plot_view.count==2);
                snprintf(file,sizeof(file),"stage63_s%u_r%u_CACHED_DRC.txt",session,row);CHECK(save_transcript(file)==0);
                clear_output();hmi_request(0x11,0);continuous_tick();
                unsigned first_frame_blanks=blank_distance_writes;
                clear_output();continuous_tick();
                CHECK(continuous_frames==2 && weak_candidate_available() && multi61_selected.count==2 && !screen_link_blocked);
                CHECK(strstr(debug_output,"POINTS=2") && blank_distance_writes==first_frame_blanks && !strstr(screen_output,"LAST COMPLETE / FIT"));
                hmi_request(0x12,0);continuous_tick();CHECK(continuous_state==CONT_IDLE && weak_candidate_available());
                /* Explicitly test both number ACK and new list ACK failure. */
                invalidate_text_cache();clear_output();mock_numeric_no_ack=1;process_pc_debug_byte('F');mock_numeric_no_ack=0;
                CHECK(!fast_saved_valid && !weak_candidate_available() && !strstr(debug_output,"FAST_RESULT,"));reset_mock_screen();
                process_pc_debug_byte('F');CHECK(fast_saved_valid && weak_candidate_available());
                invalidate_text_cache();clear_output();mock_multi_list_no_ack=1;process_pc_debug_byte('F');mock_multi_list_no_ack=0;
                CHECK(!fast_saved_valid && !weak_candidate_available() && !strstr(debug_output,"FAST_RESULT,"));reset_mock_screen();
            }
        }
    }
    CHECK(fclose(f)==0 && total==71);
    select_fixture(original_frames);
    CHECK(test_screen_single_requires_reference_and_page()==0);
    CHECK(test_screen_reference_confirm_commit_and_single()==0);
    CHECK(test_screen_confirmation_cancellation()==0);
    CHECK(test_screen_actions_while_operations_are_not_replayed()==0);
    CHECK(test_screen_reference_failure_preserves_previous()==0);
    CHECK(test_profile2_screen_and_diagnostics()==0);
    CHECK(test_profile2_refusal_retention_and_publish()==0);
    CHECK(test_continuous_stop_boundaries()==0);
    CHECK(test_continuous_page_ready_and_errors()==0);
    CHECK(test_bounded_rx_reference_to_measure()==0);
    CHECK(test_stage62_edge_presentation()==0);
    CHECK(test_stage63_actual_triple()==0);
    printf("STAGE63_MULTI_MAIN_HOST_PASS: %u groups; %u checks;71 actual RAW replays; UART/driver mocks only\n",test_groups,checks);
    return 0;
}
