/* Included by the full production-main harness; no real UART/MMIO access. */
static int16_t class_frames[3][18][1024];
static int class_expected_status[3][18],class_expected_mm[3][18];
static unsigned class_frame_count[3];
static uint32_t class_crc[3];

static int load_class_fixture(const char *path)
{
    FILE *f=fopen(path,"r");char magic[80];
    CHECK(f && fscanf(f,"%79s",magic)==1 && strcmp(magic,"STAGE48_MEASURED_RETURN_FIXTURE_V1")==0);
    for(unsigned phase=0;phase<3u;++phase) {
        unsigned p,n;CHECK(fscanf(f,"%u %u %" SCNx32,&p,&n,&class_crc[phase])==3);
        CHECK(p==phase && n==(phase==2u?18u:15u));class_frame_count[phase]=n;
        for(unsigned row=0;row<n;++row) {
            unsigned seq;CHECK(fscanf(f,"%u %d %d",&seq,&class_expected_status[phase][row],&class_expected_mm[phase][row])==3);
            for(unsigned k=0;k<1024u;++k){int v;CHECK(fscanf(f,"%d",&v)==1 && v>=INT16_MIN && v<=INT16_MAX);class_frames[phase][row][k]=(int16_t)v;}
        }
    }
    CHECK(fscanf(f,"%79s",magic)==EOF && fclose(f)==0);return 0;
}

static void class_select_row(unsigned phase,unsigned row)
{
    for(unsigned n=0;n<3u;++n)memcpy(real_frames[n],class_frames[phase][row],sizeof(real_frames[n]));
}

static int seed_class(unsigned phase,unsigned row)
{
    select_fixture(class_frames[phase]);CHECK(reset_screen_case(0,0)==0);
    process_pc_debug_byte('B');CHECK(batch_ok && !fatal_failure && healthy_guard_profile==1u && healthy_guard_mask==1u);
    CHECK(echo_healthy_baseline_active_crc32(&healthy_baseline)==class_crc[phase]);
    class_select_row(phase,row);clear_output();process_pc_debug_byte('F');
    CHECK(fast_saved_valid && weak_candidate_current());return 0;
}

static int test_measured_return_classes_all39(void)
{
    for(unsigned phase=0;phase<3u;++phase) {
        ++test_groups;select_fixture(class_frames[phase]);CHECK(reset_screen_case(0,0)==0);
        clear_output();process_pc_debug_byte('B');process_pc_debug_byte('J');
        CHECK(batch_ok && !fatal_failure && echo_healthy_baseline_active_crc32(&healthy_baseline)==class_crc[phase]);
        char name[128];CHECK(snprintf(name,sizeof(name),"stage48_class_p%u_BJ.txt",phase)>0);CHECK(save_transcript(name)==0);
        clear_output();process_pc_debug_byte('V');CHECK(strstr(debug_output,"RETURN_SHA256=4c578f312b73f7dd8a242720088eff4d94bb4888401dcdeb7623875deb0f09b9")!=NULL);
        CHECK(snprintf(name,sizeof(name),"stage48_class_p%u_V.txt",phase)>0);CHECK(save_transcript(name)==0);
        for(unsigned row=3;row<class_frame_count[phase];++row) {
            ++test_groups;class_select_row(phase,row);clear_output();process_pc_debug_byte('D');
            CHECK(batch_ok && !fatal_failure && weak_candidate_current() && weak_candidate_profile_fitted);
            CHECK((int)return_candidate.status==class_expected_status[phase][row]);
            CHECK(return_candidate.peak_num==weak_candidate.peak_num && return_candidate.lag==weak_candidate.peak_lag);
            CHECK(!return_candidate.fault_type_valid);
            CHECK(current_candidate_mm()==class_expected_mm[phase][row]);
            CHECK(weak_candidate_available()==(class_expected_mm[phase][row]>=0));
            const char *label=return_class_name();CHECK(strstr(debug_output,label)!=NULL);
            if(return_candidate.status==RETURN1_OPEN_LIKE)CHECK(strstr(screen_output,"OPEN-LIKE / NOMINAL")!=NULL);
            else if(return_candidate.status==RETURN1_SHORT_LIKE)CHECK(strstr(screen_output,"SHORT-LIKE / NOMINAL")!=NULL);
            else CHECK(strstr(screen_output,"OPEN-LIKE")==NULL && strstr(screen_output,"SHORT-LIKE")==NULL);
            if(class_expected_mm[phase][row]<0)CHECK(strcmp(display_distance_text,"-- m")==0 && !return_label_available());
            process_pc_debug_byte('R');process_pc_debug_byte('C');
            CHECK(snprintf(name,sizeof(name),"stage48_class_p%u_row%u_D_R_C.txt",phase,row-3u)>0);CHECK(save_transcript(name)==0);
        }
    }
    return 0;
}

static int test_class_fast_continuous_stop_and_clearing(void)
{
    ++test_groups;CHECK(seed_class(1,6)==0);CHECK(return_candidate.status==RETURN1_OPEN_LIKE);
    CHECK(strstr(debug_output,"FAST_RESULT,") && strstr(debug_output,"RETURN_CLASS=OPEN_LIKE,RETURN_AVAILABLE=1,FAULT_TYPE_VALID=0"));
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_class_open_fast_I_R_C.txt")==0);
    clear_output();hmi_request(0x11,0);continuous_tick();CHECK(continuous_state==CONT_RUNNING && return_candidate.status==RETURN1_OPEN_LIKE);
    class_select_row(1,9);continuous_tick();CHECK(return_candidate.status==RETURN1_SHORT_LIKE && strcmp(display_distance_text,"5.000 m")==0);
    class_select_row(1,12);continuous_tick();CHECK(return_candidate.status==RETURN1_LOW_RETURN && strcmp(display_distance_text,"-- m")==0 && !return_label_available());
    hmi_request(0x12,0);continuous_tick();CHECK(continuous_state==CONT_IDLE && strcmp(return_class_name(),"LOW_RETURN")==0);
    CHECK(save_transcript("stage48_class_mixed_continuous.txt")==0);
    ++test_groups;CHECK(seed_class(1,6)==0);clear_output();
    hmi_request(0x11,0);continuous_tick();hmi_request(0x12,0);continuous_tick();
    CHECK(continuous_state==CONT_IDLE && return_candidate.status==RETURN1_OPEN_LIKE && return_label_available());
    CHECK(strcmp(display_distance_text,"5.000 m")==0);
    CHECK(save_transcript("stage48_class_open_continuous.txt")==0);
    clear_output();process_pc_debug_byte('I');process_pc_debug_byte('R');process_pc_debug_byte('C');
    CHECK(save_transcript("stage48_class_open_cont_stopped_I_R_C.txt")==0);
    for(unsigned scenario=0;scenario<4u;++scenario) {
        ++test_groups;CHECK(seed_class(1,6)==0);CHECK(return_label_available());clear_output();
        if(scenario==0u){tdr_hmi_event_t e={.type=TDR_HMI_PAGE,.page=1};process_hmi_event(&e);}
        if(scenario==1u){tdr_hmi_event_t e={.type=TDR_HMI_READY};process_hmi_event(&e);}
        if(scenario==2u){fail_transaction=1;process_pc_debug_byte('D');fail_transaction=0;}
        if(scenario==3u){process_pc_debug_byte('P');}
        CHECK(!return_label_available() && strcmp(return_class_name(),"NO_CURRENT_CANDIDATE")==0);
        CHECK(return_candidate.status==RETURN1_INVALID_INPUT);
    }
    ++test_groups;CHECK(seed_class(1,6)==0);healthy_guard_profile=2u;healthy_guard_mask=2u;
    clear_output();process_pc_debug_byte('D');CHECK(strcmp(return_class_name(),"REFERENCE_UNFITTED")==0 && !return_label_available());
    CHECK(strcmp(display_distance_text,"-- m")==0 && strstr(screen_output,"OPEN-LIKE")==NULL);
    ++test_groups;CHECK(seed_class(1,6)==0);clear_output();measurement_seq=UINT32_MAX-1u;
    process_pc_debug_byte('F');CHECK(fast_saved_valid && measurement_seq==UINT32_MAX && strstr(debug_output,"SEQ=4294967295,"));
    process_pc_debug_byte('F');CHECK(fast_saved_valid && measurement_seq==0u && return_candidate.status==RETURN1_OPEN_LIKE);
    return 0;
}

static int test_class_ambiguity_and_note_ACK_failures(void)
{
    for(unsigned scenario=0;scenario<2u;++scenario) {
        ++test_groups;CHECK(seed_class(2,6)==0);clear_output();
        int64_t dc=0;for(unsigned k=0;k<128u;++k)dc+=(int32_t)real_frames[0][k]-fixture_expected[k];
        for(unsigned k=0;k<256u;++k)mock_guard_corr[k]=dc*512;
        mock_guard_corr[163]+=scenario?INT64_C(2147483648):INT64_C(805306368);
        if(scenario)mock_guard_corr[183]+=INT64_C(1073741824);
        mock_guard_corr_override=1;process_pc_debug_byte('D');mock_guard_corr_override=0;
        CHECK(return_candidate.status==RETURN1_AMBIGUOUS_RETURN && !return_label_available());
        CHECK(weak_candidate_available() && current_candidate_mm()==10000);
        CHECK(strstr(screen_output,"TYPE UNCERTAIN / NOMINAL") && !strstr(screen_output,"OPEN-LIKE"));
    }
    for(unsigned error=0;error<2u;++error) {
        ++test_groups;select_fixture(class_frames[1]);CHECK(reset_screen_case(0,0)==0);
        process_pc_debug_byte('B');class_select_row(1,6);clear_output();
        mock_class_note_no_ack=!error;mock_class_note_error=error;
        process_pc_debug_byte('F');mock_class_note_no_ack=mock_class_note_error=0;
        CHECK(!fast_saved_valid && !weak_candidate_available() && !return_label_available());
        CHECK(strstr(debug_output,"FAST_RESULT,")==NULL);
    }
    CHECK(class_note_unsafe==0u);
    return 0;
}
