`timescale 1ns/1ps
// SPI slave emulates protocol/register responses, not the analog DAC/PLL.
// DDR pins use real Xilinx unisims_ver ODDR/OBUFDS/IBUFDS/BUFG models.
module tb_dac_sine;
    reg clk_50m=0, dco=0, dco_run=1;
    always #10 clk_50m=~clk_50m;
    always #5 if(dco_run) dco=~dco; else dco=0;
    wire adk_sda, adk_clk, adk_cs, dac_clk, dac_cs;
    tri1 dac_sdio;
    wire dci_p,dci_n;
    wire [15:0] data_p,data_n;
    wire led0,led1;
    reg [13:0] adc_stimulus=8192;
    integer scenario=0;
    ac820_adc_dac_top #(
        .POWERUP_CYCLES(32),.SPI_HALF_PERIOD(4),.CLOCK_SETTLE_CYCLES(16),
        .PLL_WAIT_CYCLES(8),.POLL_LIMIT(3),.CLOCK_WAIT_CYCLES(1000),
        .MONITOR_WINDOW(512)
    ) dut (
        .clk_50m(clk_50m),.adc_dco_p(dco),.adc_dco_n(~dco),
        .adc_data_p(adc_stimulus),.adc_data_n(~adc_stimulus),
        .adk_spi_sda(adk_sda),.adk_spi_sclk(adk_clk),.adk_spi_csb(adk_cs),
        .dac_spi_sdio(dac_sdio),.dac_spi_sclk(dac_clk),.dac_spi_csb(dac_cs),
        .dac_dci_p(dci_p),.dac_dci_n(dci_n),.dac_data_p(data_p),.dac_data_n(data_n),
        .pll_done_led(led0),.dac_done_led(led1)
    );

    reg [23:0] clock_words[0:75];
    reg [23:0] clock_shift;
    integer clock_bits=0, clock_writes=0;
    // Decode registers actually received on SPI independently of the ROM.
    // AD9516-3 Rev.C Table 39: each enabled stage divides by M + N + 2;
    // 0x1A0=0x11 means /4, not /2, even when the ROM and SPI agree.
    reg [7:0] clock_199,clock_19b,clock_19c,clock_19e,clock_1a0,clock_1a1;
    reg [7:0] clock_1e0,clock_1e1;
    integer adc_div1,adc_div2,dac_ref_div1,dac_ref_div2;
    integer adc_clock_hz,dac_ref_clock_hz;
    function automatic integer channel_divisor(input [7:0] cycle_counts,input bypass);
        channel_divisor=bypass ? 1 : (integer'(cycle_counts[7:4])+integer'(cycle_counts[3:0])+2);
    endfunction
    task automatic check_clock_rates;
        begin
            if((^{clock_199,clock_19b,clock_19c,clock_19e,clock_1a0,clock_1a1,clock_1e0,clock_1e1})===1'bx)
                $fatal(1,"AD9516 clock divider register was not written");
            // The known board PLL setup supplies 2 GHz / 5 = 400 MHz here.
            if(clock_1e0!==8'h03 || clock_1e1!==8'h02)
                $fatal(1,"AD9516 common 400 MHz clock source configuration changed");
            adc_div1=channel_divisor(clock_19e,clock_1a1[4]);
            adc_div2=channel_divisor(clock_1a0,clock_1a1[5]);
            dac_ref_div1=channel_divisor(clock_199,clock_19c[4]);
            dac_ref_div2=channel_divisor(clock_19b,clock_19c[5]);
            adc_clock_hz=400_000_000/(adc_div1*adc_div2);
            dac_ref_clock_hz=400_000_000/(dac_ref_div1*dac_ref_div2);
            if(adc_div1!=2 || adc_div2!=1 || adc_clock_hz!=200_000_000)
                $fatal(1,"AD9516 ADC clock %0d Hz (dividers %0d x %0d), expected 200 MHz (2 x 1)",adc_clock_hz,adc_div1,adc_div2);
            if(dac_ref_div1!=2 || dac_ref_div2!=1 || dac_ref_clock_hz!=200_000_000)
                $fatal(1,"AD9516 DAC REF clock %0d Hz (dividers %0d x %0d), expected 200 MHz (2 x 1)",dac_ref_clock_hz,dac_ref_div1,dac_ref_div2);
            $display("AD9516 frequency check: ADC=%0d Hz, DCO=%0d Hz, DAC REF=%0d Hz",adc_clock_hz,adc_clock_hz/2,dac_ref_clock_hz);
        end
    endtask
    initial $readmemh("ad9516_adc200m_dacref200m.mem",clock_words);
    always @(negedge adk_cs) begin clock_bits=0; clock_shift=0; end
    always @(posedge adk_clk) if(!adk_cs) begin
        clock_shift={clock_shift[22:0],adk_sda}; clock_bits=clock_bits+1;
    end
    always @(posedge adk_cs) if(clock_bits!=0) begin
        if(clock_bits!=24) $fatal(1,"AD9516 frame length %0d",clock_bits);
        if(clock_writes>=76 || clock_shift!==clock_words[clock_writes])
            $fatal(1,"AD9516 word %0d mismatch: %h",clock_writes,clock_shift);
        case(clock_shift[23:8])
            16'h0199: clock_199=clock_shift[7:0];
            16'h019b: clock_19b=clock_shift[7:0];
            16'h019c: clock_19c=clock_shift[7:0];
            16'h019e: clock_19e=clock_shift[7:0];
            16'h01a0: clock_1a0=clock_shift[7:0];
            16'h01a1: clock_1a1=clock_shift[7:0];
            16'h01e0: clock_1e0=clock_shift[7:0];
            16'h01e1: clock_1e1=clock_shift[7:0];
        endcase
        clock_writes=clock_writes+1;
        if(clock_writes==76) check_clock_rates();
    end

    reg slave_oe=0, slave_bit=0;
    assign dac_sdio=slave_oe ? slave_bit : 1'bz;
    integer dac_bits=0, dac_frames=0, lock_reads=0, fifo_reads=0;
    reg [15:0] instruction=0;
    reg [7:0] response=0, write_byte=0;
    reg [7:0] registers[0:255];
    reg [23:0] expected_writes[0:18];
    integer write_index=0, j;
    initial begin
        for(j=0;j<256;j=j+1) registers[j]=0;
        expected_writes[0]=24'h000020; expected_writes[1]=24'h002001;
        expected_writes[2]=24'h0014e7; expected_writes[3]=24'h0015c5;
        expected_writes[4]=24'h0012c0; expected_writes[5]=24'h001280;
        expected_writes[6]=24'h005e00; expected_writes[7]=24'h005f60;
        expected_writes[8]=24'h000d16; expected_writes[9]=24'h000a00;
        expected_writes[10]=24'h002803; expected_writes[11]=24'h002600;
        expected_writes[12]=24'h002501; expected_writes[13]=24'h002780;
        expected_writes[14]=24'h0018f9; expected_writes[15]=24'h0019e1;
        expected_writes[16]=24'h001af9; expected_writes[17]=24'h001b01;
        expected_writes[18]=24'h000100;
    end
    always @(negedge dac_cs) begin
        if(clock_writes!=76) $fatal(1,"DAC started before AD9516 table completed");
        dac_bits=0; instruction=0; write_byte=0; slave_oe=0;
    end
    always @(posedge dac_clk) if(!dac_cs) begin
        if(dac_bits<16) begin
            if(dac_sdio!==1'b0 && dac_sdio!==1'b1) $fatal(1,"SDIO instruction contention");
            instruction={instruction[14:0],dac_sdio};
            if(dac_bits==15 && instruction[15]) begin
                case(instruction[7:0])
                    8'h16: begin
                        response=(scenario==1 || lock_reads==0) ? 8'h00 : 8'h80;
                        lock_reads=lock_reads+1;
                    end
                    8'h25: begin
                        response=(scenario==2 || fifo_reads==0) ? 8'h00 : 8'h02;
                        fifo_reads=fifo_reads+1;
                    end
                    8'h24: response=(scenario==3) ? 8'h00 : 8'h40;
                    8'h26: response=(scenario==4) ? 8'h01 : registers[8'h26];
                    default: response=registers[instruction[7:0]];
                endcase
            end
        end else if(!instruction[15]) write_byte={write_byte[6:0],dac_sdio};
        else begin
            if(dut.init_i.dac_oe!==0) $fatal(1,"Master did not release SDIO for read");
            if(scenario!=7 && dac_sdio!==response[23-dac_bits]) $fatal(1,"SDIO contention/read bit mismatch");
        end
        dac_bits=dac_bits+1;
    end
    always @(negedge dac_clk) begin
        if(!dac_cs && instruction[15] && dac_bits>=16 && dac_bits<24 && scenario!=7) begin
            slave_oe=1; slave_bit=response[23-dac_bits];
        end else slave_oe=0;
    end
    always @(posedge dac_cs) if(dac_bits!=0) begin
        slave_oe=0;
        if(dac_bits!=24) $fatal(1,"DAC frame length %0d",dac_bits);
        if(!instruction[15]) begin
            if(write_index>=19 || {instruction,write_byte}!==expected_writes[write_index])
                $fatal(1,"DAC write %0d mismatch: %h %h",write_index,instruction,write_byte);
            if(instruction[7:0]==8'h25 && !dut.dco_alive)
                $fatal(1,"FIFO reset attempted before DCI became available");
            registers[instruction[7:0]]=write_byte;
            write_index=write_index+1;
        end
        dac_frames=dac_frames+1;
    end

    // Independent phase and $sin model checks the ROM waveform and scaling.
    reg [31:0] ref_phase=0;
    reg signed [15:0] ref_i=0;
    reg signed [15:0] expected_i=0,expected_q=0;
    real value;
    integer expected_code;
    always @(posedge dut.clk_dac) begin
        expected_i<=dut.i_sample; expected_q<=dut.q_sample;
        if(dut.rst_dac || !dut.enable_sync[1] || dut.test_mode==2) begin ref_phase<=0; ref_i<=0; end
        else begin
            value=8192.0*$sin(6.283185307179586*$itor(ref_phase[31:22])/1024.0);
            expected_code=(value>=0.0) ? $rtoi(value+0.5) : $rtoi(value-0.5);
            ref_i<=dut.test_mode==1 ? (expected_code >>> 1) : expected_code;
            ref_phase<=ref_phase+(dut.test_mode==3 ? 32'd214748365 : dut.test_mode==4 ? 32'd858993459 : 32'd429496730);
        end
        #0.02;
        if(dut.rst_dac===0) begin
            if(dut.i_sample!==ref_i || dut.q_sample!==ref_i)
                $fatal(1,"DDS independent sine/phase mismatch: %d expected %d",dut.i_sample,ref_i);
        end
    end
    integer output_samples=0, fd=0;
    always @(posedge dci_p) begin
        #0.05;
        if(!dut.tx_reset) begin
            if(data_p!==expected_i || data_n!==~data_p || dci_n!==0)
                $fatal(1,"Rising DDR sample/complement mismatch");
            if(dut.dac_config_done) begin
                output_samples=output_samples+1;
                if(fd && scenario==0) $fwrite(fd,"%0t,%0d,%0d\n",$time,$signed(data_p),$signed(expected_q));
            end else if(data_p!==0) $fatal(1,"Nonzero output before successful startup");
        end
    end
    always @(negedge dci_p) begin
        #0.05;
        if(!dut.tx_reset && !dut.rst_dac) begin
            if(data_p!==expected_q || data_n!==~data_p || dci_n!==1)
                $fatal(1,"Falling DDR sample/complement mismatch");
        end
    end
    // Asymmetric lane fixture catches I/Q swapping that equal-channel sine cannot.
    wire lane_dci, lane_dci_n;
    wire [15:0] lane_data,lane_data_n;
    dac_lvds_tx lane_fixture(.clk(dut.clk_dac),.rst(dut.rst_dac),.i_sample(16'ha55a),.q_sample(16'h5aa5),
        .dac_dci_p(lane_dci),.dac_dci_n(lane_dci_n),.dac_data_p(lane_data),.dac_data_n(lane_data_n));
    always @(posedge lane_dci) begin #0.05; if(!dut.rst_dac && lane_data!==16'ha55a) $fatal(1,"I lane swapped"); end
    always @(negedge lane_dci) begin #0.05; if(!dut.rst_dac && lane_data!==16'h5aa5) $fatal(1,"Q lane swapped"); end

    // Emulate ADS5474 DATA transitions 0.2 ns after every DCO edge.
    // Nominal Q1 at a rising capture sees the previous falling-edge symbol.
    reg [13:0] last_rise=8192, last_fall=8192;
    reg [13:0] expect_rise=0, expect_fall=0, q1_previous=0;
    integer adc_index=0, adc_checks=0, clip_checks=0, adc_fd=0;
    integer code;
    real adc_value;
    reg expected_valid=0;
    always @(dco) begin
        #0.2;
        adc_value=2200.0*$sin(6.283185307179586*adc_index/20.0);
        code=8192+$rtoi(adc_value);
        if(adc_index%251==0) code=0;
        if(adc_index%251==1) code=16383;
        adc_stimulus=code;
        if(dco) last_rise=code; else last_fall=code;
        adc_index=adc_index+1;
    end
    function automatic [13:0] stimulus_before(input real time_ns);
        integer index, value_code;
        real value;
        begin
            // Independent source history. IDELAYE2's functional model has
            // 600 ps intrinsic delay plus 16 * 78 ps calibrated taps.
            index=$rtoi($floor((time_ns-5.2-1.848)/5.0));
            if(index<0) stimulus_before=8192;
            else begin
                value=2200.0*$sin(6.283185307179586*index/20.0);
                value_code=8192+$rtoi(value);
                if(index%251==0) value_code=0;
                if(index%251==1) value_code=16383;
                stimulus_before=value_code;
            end
        end
    endfunction
    always @(posedge dut.clk_acq) begin
        expect_rise=stimulus_before($realtime-10.0);
        expect_fall=stimulus_before($realtime-5.0);
        #0.15; // IDDR functional model includes 100 ps output propagation.
        if(dut.sample_valid && dco_run) begin
            if(dut.raw_rise!==expect_rise || dut.raw_fall!==expect_fall)
                $fatal(1,"ADC DDR pair mismatch: got %d %d expected %d %d",dut.raw_rise,dut.raw_fall,expect_rise,expect_fall);
            adc_checks=adc_checks+1;
        end
        if(dut.rx_flags[0]) begin
            if($signed(dut.adc_rise_s14)!=$signed({1'b0,dut.adc_rise_u14})-8192 ||
               $signed(dut.adc_fall_s14)!=$signed({1'b0,dut.adc_fall_u14})-8192)
                $fatal(1,"Offset binary conversion mismatch");
            if(dut.rx_flags[3] !== (dut.adc_rise_u14==0 || dut.adc_rise_u14==16383 || dut.adc_fall_u14==0 || dut.adc_fall_u14==16383))
                $fatal(1,"Clip flag/data alignment mismatch");
            if(dut.rx_flags[3]) clip_checks=clip_checks+1;
            if(adc_fd) $fwrite(adc_fd,"%d,%d,%d,%d\n",dut.adc_rise_u14,dut.adc_fall_u14,dut.rx_flags,dut.sample_word_count);
        end
    end
    integer wanted_error;
    initial begin
        if(!$value$plusargs("SCENARIO=%d",scenario)) scenario=0;
        if(scenario==5) dco_run=0;
        if(scenario==0) begin adc_fd=$fopen("adc_waveform.csv","w"); $fwrite(adc_fd,"adc_rise_u14,adc_fall_u14,rx_flags,sample_word_count\n"); fd=$fopen("waveform.csv","w"); $fwrite(fd,"time_ps,i_code,q_code\n"); end
        if(scenario==0 || scenario==6 || scenario==8) begin
            wait(dut.dac_config_done===1);
            wait(output_samples>=2048);
            if(lock_reads!=2 || fifo_reads!=2 || write_index!=19)
                $fatal(1,"Startup did not exercise expected poll retries/writes");
            if(adc_checks<1000 || clip_checks<4 || dut.clip_count==0 || !dut.idelay_ready)
                $fatal(1,"ADC capture/calibration/clip coverage missing: %d %d",adc_checks,clip_checks);
            if(scenario==8) begin
                @(negedge dut.clk_dac); force dut.test_mode=3'd1;
                repeat(256) @(negedge dut.clk_dac);
                force dut.test_mode=3'd2;
                repeat(256) @(negedge dut.clk_dac);
                if(data_p!==0) $fatal(1,"Zero mode failed");
                force dut.test_mode=3'd3;
                repeat(256) @(negedge dut.clk_dac);
                force dut.test_mode=3'd4;
                repeat(256) @(negedge dut.clk_dac);
                release dut.test_mode;
            end
            if(scenario==6) begin
                dco_run=0;
                wait(dut.error_code!=0);
                #200;
                if(dut.error_code!=1 || dut.dac_config_done || data_p!==0)
                    $fatal(1,"Clock-loss handling failed");
            end
        end else begin
            case(scenario)
                1:wanted_error=2; 2:wanted_error=3; 3:wanted_error=4;
                4:wanted_error=5; 5:wanted_error=1; 7:wanted_error=4;
                default:wanted_error=15;
            endcase
            wait(dut.error_code!=0);
            #200;
            if(dut.error_code!=wanted_error || dut.dac_config_done || data_p!==0)
                $fatal(1,"Failure handling mismatch: error %d expected %d",dut.error_code,wanted_error);
            if(scenario==5 && dac_frames!=0) $fatal(1,"DAC SPI started without a source clock");
        end
        if(fd) $fclose(fd);
        if(adc_fd) $fclose(adc_fd);
        $display("PASS: scenario %0d, clock writes=%0d DAC frames=%0d output samples=%0d",scenario,clock_writes,dac_frames,output_samples);
        $finish;
    end
    initial begin #2_000_000; $fatal(1,"Timeout waiting for test completion"); end
endmodule
