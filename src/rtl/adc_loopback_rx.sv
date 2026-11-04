`timescale 1ns/1ps
// LA / ADC1 capture at 200 MSPS. MMCM-shifted 100 MHz clock captures both
// DDR samples. Clock/data input paths and all fabric paths remain timed.
// DATA changes near DCO edges. A fixed input delay moves it into the eye;
// tap 16 is an initial value, requiring a hardware eye sweep for final signoff.
module adc_loopback_rx #(parameter integer IDELAY_TAP=16) (
    input wire rst_async, ref_clk_200m, clk_acq, capture_enable,
    input wire [13:0] adc_data_p, adc_data_n,
    output reg idelay_ready=0,
    output wire sample_valid, dac_ready_acq,
    output wire [13:0] sample_rise, sample_fall
);
    (* ASYNC_REG="TRUE" *) reg [2:0] ref_reset_sync=7;
    reg [5:0] reset_count=0;
    reg ctrl_reset=1;
    always @(posedge ref_clk_200m or posedge rst_async) begin
        if(rst_async) ref_reset_sync<=7;
        else ref_reset_sync<={ref_reset_sync[1:0],1'b0};
    end
    always @(posedge ref_clk_200m) begin
        if(ref_reset_sync[2]) begin reset_count<=0; ctrl_reset<=1; end
        else if(reset_count<32) begin reset_count<=reset_count+1'b1; ctrl_reset<=1; end
        else ctrl_reset<=0;
    end
    wire ready34, ready35;
    (* IODELAY_GROUP="ADC1_RX_B34" *) IDELAYCTRL ctrl34 (
        .REFCLK(ref_clk_200m),.RST(ctrl_reset),.RDY(ready34));
    (* IODELAY_GROUP="ADC1_RX_B35" *) IDELAYCTRL ctrl35 (
        .REFCLK(ref_clk_200m),.RST(ctrl_reset),.RDY(ready35));
    // Synchronize each independent controller flag before combining them.
    (* ASYNC_REG="TRUE" *) reg [2:0] ready34_sync=0, ready35_sync=0;
    (* ASYNC_REG="TRUE" *) reg [1:0] enable_sync=0;
    (* ASYNC_REG="TRUE" *) reg [2:0] acq_reset_sync=7;
    reg [2:0] warmup=0;
    always @(posedge clk_acq or posedge rst_async) begin
        if(rst_async) acq_reset_sync<=7;
        else acq_reset_sync<={acq_reset_sync[1:0],1'b0};
    end
    always @(posedge clk_acq or posedge rst_async) begin
        if(rst_async) begin ready34_sync<=0; ready35_sync<=0; enable_sync<=0; end
        else begin
            ready34_sync<={ready34_sync[1:0],ready34};
            ready35_sync<={ready35_sync[1:0],ready35};
            enable_sync<={enable_sync[0],capture_enable};
        end
    end
    always @(posedge clk_acq) begin
        if(acq_reset_sync[2]) idelay_ready<=0;
        else idelay_ready<=ready34_sync[2] && ready35_sync[2];
        if(acq_reset_sync[2] || !idelay_ready || !enable_sync[1]) warmup<=0;
        else warmup<={warmup[1:0],1'b1};
    end
    assign dac_ready_acq=enable_sync[1];
    assign sample_valid=warmup[2] && idelay_ready && enable_sync[1];
    wire [13:0] se, delayed;
    genvar b;
    generate for(b=0;b<14;b=b+1) begin: bits_rx
        IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("LVDS_25")) ibuf (
            .I(adc_data_p[b]),.IB(adc_data_n[b]),.O(se[b]));
        if(b==0) begin: bank34
            (* IODELAY_GROUP="ADC1_RX_B34" *)
            IDELAYE2 #(.DELAY_SRC("IDATAIN"),.HIGH_PERFORMANCE_MODE("TRUE"),
                .IDELAY_TYPE("FIXED"),.IDELAY_VALUE(IDELAY_TAP),.REFCLK_FREQUENCY(200.0)) delay_i (
                .DATAOUT(delayed[b]),.IDATAIN(se[b]),.DATAIN(1'b0),.C(1'b0),
                .CE(1'b0),.INC(1'b0),.LD(1'b0),.LDPIPEEN(1'b0),.REGRST(1'b0),
                .CNTVALUEIN(5'd0),.CNTVALUEOUT(),.CINVCTRL(1'b0));
        end else begin: bank35
            (* IODELAY_GROUP="ADC1_RX_B35" *)
            IDELAYE2 #(.DELAY_SRC("IDATAIN"),.HIGH_PERFORMANCE_MODE("TRUE"),
                .IDELAY_TYPE("FIXED"),.IDELAY_VALUE(IDELAY_TAP),.REFCLK_FREQUENCY(200.0)) delay_i (
                .DATAOUT(delayed[b]),.IDATAIN(se[b]),.DATAIN(1'b0),.C(1'b0),
                .CE(1'b0),.INC(1'b0),.LD(1'b0),.LDPIPEEN(1'b0),.REGRST(1'b0),
                .CNTVALUEIN(5'd0),.CNTVALUEOUT(),.CINVCTRL(1'b0));
        end
        // Delay the data, not the DCO. At the nominal delay Q1 contains the
        // previous falling-edge symbol and Q2 the following rising-edge symbol.
        // Keep Q1/Q2 names explicit; CSV analysis verifies temporal ordering.
        // No reset is needed on a continuously sampled input. Invalid startup
        // data is discarded by sample_valid and its three-cycle warmup.
        IDDR #(.DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),.SRTYPE("ASYNC")) iddr (
            .C(clk_acq),.CE(1'b1),.D(delayed[b]),.R(1'b0),.S(1'b0),
            .Q1(sample_rise[b]),.Q2(sample_fall[b]));
    end endgenerate
    initial if(IDELAY_TAP<0 || IDELAY_TAP>31) $error("ADC_IDELAY_TAP outside 0..31");
endmodule
