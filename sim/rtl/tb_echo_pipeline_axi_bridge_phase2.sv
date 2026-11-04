`timescale 1ns/1ps

module tb_echo_pipeline_axi_bridge_phase2;
    localparam integer N = 4, L = 3, K = 4;
    localparam logic [1:0] OKAY = 2'b00, SLVERR = 2'b10;
    localparam logic [7:0] CONTROL=8'h14, BASE_ADDR=8'h34, BASE_DATA=8'h38;
    localparam logic [7:0] TMPL_ADDR=8'h3c, TMPL_DATA=8'h40;
    localparam logic [7:0] LAST_ERROR=8'h50, RESULT_VALID=8'h58;
    localparam logic [7:0] BASE_COUNT=8'h5c, TMPL_COUNT=8'h60;
    localparam logic [7:0] BASE_CRC=8'h64, TMPL_CRC=8'h68, COEFF_STATUS=8'h6c;
    localparam logic [7:0] VERSION=8'h04, RESULT_ADDR=8'h44;
    localparam logic [7:0] RESULT_LO=8'h48, RESULT_HI=8'h4c;
    localparam logic [7:0] CAPS=8'h70, PULSE_CFG=8'h74, FRAME_CFG=8'h78;
    localparam logic [7:0] FRAME_COUNT=8'h80, PAIR_RATE=8'h84;
    localparam logic [7:0] AVG_ADDR=8'h88, AVG_DATA=8'h8c, AVG_VALID=8'h90;

    logic clk=0, resetn=0;
    logic [7:0] awaddr=0, araddr=0;
    logic awvalid=0, awready, wvalid=0, wready, bvalid, bready=0;
    logic [31:0] wdata=0, rdata;
    logic [3:0] wstrb=4'hf;
    logic [1:0] bresp, rresp;
    logic arvalid=0, arready, rvalid, rready=0;
    logic start_pulse, clear_status_pulse, baseline_commit_pulse;
    logic template_commit_pulse, soft_reset_pulse;
    logic baseline_wr_en, template_wr_en;
    logic [1:0] baseline_wr_addr, result_select_addr;
    logic [1:0] template_wr_addr;
    logic signed [15:0] baseline_wr_data, template_wr_data;
    logic transaction_busy=0, baseline_bank=0, template_bank=0;
    logic baseline_accepted=0, template_accepted=0;
    logic baseline_rejected=0, template_rejected=0;
    logic [31:0] status_word=0, transaction_count=0;
    logic [2:0] result_count=K;
    logic signed [63:0] selected_result=64'sh0123_4567_89ab_cdef;
    logic [2:0] pulse_mode;
    logic [5:0] pulse_width;
    logic pn_enable;
    logic [1:0] average_select_addr;
    logic [5:0] frames_seen=6'd32;
    logic frame_error_sticky=0, average_frame_available=0;
    logic signed [15:0] selected_average_q2=-16'sd17;
    logic irq;
    integer errors=0, baseline_pulses=0, template_pulses=0;
    logic [31:0] rd; logic [1:0] rr;

    always #5 clk=~clk;
    always_ff @(posedge clk) begin
        baseline_accepted <= baseline_commit_pulse;
        template_accepted <= template_commit_pulse;
        if (baseline_commit_pulse) baseline_bank <= ~baseline_bank;
        if (template_commit_pulse) template_bank <= ~template_bank;
        if (baseline_wr_en) baseline_pulses <= baseline_pulses+1;
        if (template_wr_en) template_pulses <= template_pulses+1;
    end

    echo_pipeline_axi_bridge_phase2 #(.N(N),.M(2),.L(L),.K(K)) dut (
        .s_axi_aclk(clk),.s_axi_aresetn(resetn),
        .s_axi_awaddr(awaddr),.s_axi_awvalid(awvalid),.s_axi_awready(awready),
        .s_axi_wdata(wdata),.s_axi_wstrb(wstrb),.s_axi_wvalid(wvalid),.s_axi_wready(wready),
        .s_axi_bresp(bresp),.s_axi_bvalid(bvalid),.s_axi_bready(bready),
        .s_axi_araddr(araddr),.s_axi_arvalid(arvalid),.s_axi_arready(arready),
        .s_axi_rdata(rdata),.s_axi_rresp(rresp),.s_axi_rvalid(rvalid),.s_axi_rready(rready),
        .start_pulse(start_pulse),.clear_status_pulse(clear_status_pulse),
        .pulse_mode(pulse_mode),.pulse_width(pulse_width),
        .pn_enable(pn_enable),
        .baseline_commit_pulse(baseline_commit_pulse),
        .template_commit_pulse(template_commit_pulse),.soft_reset_pulse(soft_reset_pulse),
        .baseline_shadow_wr_en(baseline_wr_en),.baseline_shadow_wr_addr(baseline_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_wr_data),
        .template_shadow_wr_en(template_wr_en),.template_shadow_wr_addr(template_wr_addr),
        .template_shadow_wr_data_q14(template_wr_data),.result_select_addr(result_select_addr),
        .average_select_addr(average_select_addr),
        .transaction_busy(transaction_busy),.baseline_active_bank(baseline_bank),
        .template_active_bank(template_bank),.baseline_commit_accepted(baseline_accepted),
        .template_commit_accepted(template_accepted),.baseline_commit_rejected(baseline_rejected),
        .template_commit_rejected(template_rejected),.status_word(status_word),
        .transaction_count(transaction_count),.result_count(result_count),
        .frames_seen(frames_seen),.frame_error_sticky(frame_error_sticky),
        .average_frame_available(average_frame_available),
        .average_overflow_count(0),.correlation_overflow_count(0),
        .selected_result_q16(selected_result),
        .selected_average_q2(selected_average_q2),.irq_f2p(irq)
    );

    task automatic write32(input logic[7:0] a,input logic[31:0] d,input logic[1:0] expected);
        begin
            @(negedge clk); awaddr=a; wdata=d; awvalid=1; wvalid=1;
            do @(posedge clk); while(!(awready&&wready));
            @(negedge clk); awvalid=0; wvalid=0; bready=1;
            do @(posedge clk); while(!bvalid);
            if(bresp!==expected) begin $error("write %02h response",a); errors=errors+1; end
            @(negedge clk); bready=0;
        end
    endtask

    task automatic read32(input logic[7:0] a,output logic[31:0] d,output logic[1:0] resp);
        begin
            @(negedge clk); araddr=a; arvalid=1;
            do @(posedge clk); while(!arready);
            @(negedge clk); arvalid=0; rready=1;
            do @(posedge clk); while(!rvalid);
            d=rdata; resp=rresp;
            @(negedge clk); rready=0;
        end
    endtask

    task automatic expect32(input logic[7:0] a,input logic[31:0] expected);
        begin
            read32(a,rd,rr);
            if(rr!==OKAY || rd!==expected) begin
                $error("read %02h got %08h expected %08h",a,rd,expected); errors=errors+1;
            end
        end
    endtask

    initial begin
        repeat(5) @(negedge clk); resetn=1;
        expect32(VERSION,32'h0003_0002);
        expect32(CAPS,32'h0000_000f);
        expect32(8'h94,0);
        expect32(8'h98,32'h007f_0207);
        expect32(8'h9c,32'h7f);
        expect32(8'ha0,4096);
        write32(8'h94,1,OKAY);
        if(pn_enable !== 1'b1) $fatal(1,"PN selection not propagated");
        expect32(8'h94,1);
        transaction_busy=1;
        write32(8'h94,0,SLVERR);
        expect32(8'h94,1);
        transaction_busy=0;
        write32(CONTROL,2,OKAY);
        write32(PULSE_CFG,32'h0000_0406,SLVERR);
        expect32(PULSE_CFG,32'h0000_0405);
        write32(CONTROL,2,OKAY);
        write32(8'h94,2,SLVERR);
        expect32(8'h94,1);
        write32(CONTROL,2,OKAY);
        wstrb=4'b0010;
        write32(8'h94,0,OKAY);
        expect32(8'h94,1);
        wstrb=4'hf;
        write32(8'h94,0,OKAY);
        if(pn_enable !== 1'b0) $fatal(1,"Mode5 restore failed");
        write32(PULSE_CFG,32'h0000_0402,OKAY);
        write32(8'h94,1,SLVERR);
        expect32(8'h94,0);
        write32(CONTROL,2,OKAY);
        expect32(FRAME_CFG,32'h0040_0200);
        expect32(FRAME_COUNT,32'd32);
        expect32(PAIR_RATE,32'd100_000_000);
        write32(PULSE_CFG,32'h0000_0405,OKAY);
        expect32(PULSE_CFG,32'h0000_0405);
        if(pulse_mode!==3'd5 || pulse_width!==6'd4) begin
            $error("pulse configuration output mismatch"); errors=errors+1;
        end
        write32(PULSE_CFG,32'h0000_0403,SLVERR);
        write32(CONTROL,32'h2,OKAY);
        expect32(PULSE_CFG,32'h0000_0405);

        // Average-frame snapshots are unavailable until 32 valid frames finish.
        write32(AVG_ADDR,1,SLVERR);
        write32(CONTROL,32'h2,OKAY);
        average_frame_available=1;
        write32(AVG_ADDR,1,OKAY);
        expect32(AVG_VALID,32'd3);
        expect32(AVG_DATA,32'hffff_ffef);
        if(average_select_addr!==2'd1) begin
            $error("average address mismatch"); errors=errors+1;
        end

        // Incomplete table cannot be committed.
        write32(CONTROL,32'h4,SLVERR);
        expect32(LAST_ERROR,32'h10);
        write32(CONTROL,32'h2,OKAY);

        // Four contiguous baseline writes become committable.
        write32(BASE_ADDR,0,OKAY);
        write32(BASE_DATA,16'h0004,OKAY);
        write32(BASE_DATA,16'hfff8,OKAY);
        write32(BASE_DATA,16'h000c,OKAY);
        write32(BASE_DATA,16'h0010,OKAY);
        expect32(BASE_COUNT,N);
        read32(BASE_CRC,rd,rr);
        if(rr!==OKAY || rd===32'd0) begin $error("baseline CRC invalid"); errors=errors+1; end
        write32(CONTROL,32'h4,OKAY);
        repeat(3) @(negedge clk);
        if(baseline_pulses!=N || !baseline_bank) begin
            $error("baseline load/commit failed"); errors=errors+1;
        end

        // Three contiguous template writes become committable.
        write32(TMPL_ADDR,0,OKAY);
        write32(TMPL_DATA,16'h4000,OKAY);
        write32(TMPL_DATA,16'h0000,OKAY);
        write32(TMPL_DATA,16'he000,OKAY);
        expect32(TMPL_COUNT,L);
        read32(TMPL_CRC,rd,rr);
        if(rr!==OKAY || rd===32'd0) begin $error("template CRC invalid"); errors=errors+1; end
        write32(CONTROL,32'h8,OKAY);
        repeat(3) @(negedge clk);
        if(template_pulses!=L || !template_bank) begin
            $error("template load/commit failed"); errors=errors+1;
        end
        read32(COEFF_STATUS,rd,rr);
        if(!rd[2] || !rd[3] || !rd[8] || !rd[9]) begin
            $error("coefficient status mismatch %08h",rd); errors=errors+1;
        end

        // Any coefficient write while busy must be rejected.
        transaction_busy=1;
        write32(BASE_ADDR,0,SLVERR);
        transaction_busy=0;
        read32(LAST_ERROR,rd,rr);
        if(!rd[3]) begin $error("busy error bit missing"); errors=errors+1; end

        // Existing atomic 64-bit result protocol remains intact.
        write32(RESULT_ADDR,2,OKAY);
        expect32(RESULT_VALID,1);
        expect32(RESULT_LO,32'h89ab_cdef);
        expect32(RESULT_HI,32'h0123_4567);

        if(errors==0) $display("PASS: phase-2/v3 coefficient, pulse, average and result tests passed");
        else $fatal(1,"FAIL: %0d errors",errors);
        $finish;
    end
    initial begin #2_000_000; $fatal(1,"timeout"); end
endmodule
