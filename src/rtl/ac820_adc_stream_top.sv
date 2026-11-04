`timescale 1ns/1ps
// Hardware-validation top for the continuous ADC -> AXI-stream path.
// The validated DAC/ADC loopback logic is intentionally kept identical to
// ac820_adc_dac_top; only the stream monitor block below is added.
module ac820_adc_stream_top #(
    parameter [31:0] PHASE_STEP=32'd429496730,
    parameter integer Q_MODE=1,
    parameter integer ADC_IDELAY_TAP=4,
    parameter integer POWERUP_CYCLES=50_000,
    parameter integer SPI_HALF_PERIOD=25,
    parameter integer CLOCK_SETTLE_CYCLES=5_000_000,
    parameter integer PLL_WAIT_CYCLES=500_000,
    parameter integer POLL_LIMIT=4096,
    parameter integer CLOCK_WAIT_CYCLES=5_000_000,
    parameter integer MONITOR_WINDOW=50_000,
    parameter integer STREAM_FRAME_WORDS=4096
) (
    input wire clk_50m, input wire adc_dco_p, adc_dco_n,
    input wire [13:0] adc_data_p, adc_data_n,
    output wire adk_spi_sda, adk_spi_sclk, adk_spi_csb,
    inout wire dac_spi_sdio, output wire dac_spi_sclk, dac_spi_csb,
    output wire dac_dci_p, dac_dci_n,
    output wire [15:0] dac_data_p, dac_data_n,
    output reg pll_done_led, dac_done_led,
    output reg adc_ready_led, adc_clip_led
);
    reg [31:0] power_count=0;
    reg rst_sys=1;
    always @(posedge clk_50m) begin
        if (power_count<POWERUP_CYCLES) begin power_count<=power_count+1'b1; rst_sys<=1; end
        else rst_sys<=0;
    end
    wire dco_se, clk_dco, clk_dac, clk_acq;
    IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("LVDS_25")) dco_ibuf (
        .I(adc_dco_p),.IB(adc_dco_n),.O(dco_se)
    );
    BUFG dco_bufg (.I(dco_se),.O(clk_dco));
    // DAC interface remains 100 MHz; ADC runs at 100 MSPS for first loopback.
    wire mmcm_feedback, mmcm_feedback_buf, dac_clock_unbuffered, adc_clock_unbuffered, mmcm_locked;
    BUFG feedback_bufg(.I(mmcm_feedback),.O(mmcm_feedback_buf));
    BUFG dac_clock_bufg(.I(dac_clock_unbuffered),.O(clk_dac));
    BUFG adc_clock_bufg(.I(adc_clock_unbuffered),.O(clk_acq));
    // First loopback: ADC 100 MSPS / DCO 50 MHz, DAC DCI stays 100 MHz.
    // 119.25 degrees = 53 legal phase steps of 45/20 = 2.25 degrees.
    // This places the 50 MHz DDR capture edges inside the input eye.
    MMCME2_BASE #(.BANDWIDTH("OPTIMIZED"),.CLKIN1_PERIOD(10.000),
        .DIVCLK_DIVIDE(1),.CLKFBOUT_MULT_F(10.000),.CLKOUT0_DIVIDE_F(10.000),
        .CLKOUT0_PHASE(0.000),.CLKOUT1_DIVIDE(10),.CLKOUT1_PHASE(175.500),
        .STARTUP_WAIT("FALSE")) dac_clock_mmcm (
        .CLKIN1(dco_se),.CLKFBIN(mmcm_feedback_buf),.CLKFBOUT(mmcm_feedback),
        .CLKOUT0(dac_clock_unbuffered),.CLKOUT1(adc_clock_unbuffered),
        .LOCKED(mmcm_locked),.PWRDWN(1'b0),.RST(rst_sys)
    );
    wire reset_source=rst_sys || !mmcm_locked;
    (* ASYNC_REG="TRUE" *) reg [2:0] rst_dac_sync=3'b111;
    always @(posedge clk_dac or posedge reset_source) begin
        if(reset_source) rst_dac_sync<=3'b111;
        else rst_dac_sync<={rst_dac_sync[1:0],1'b0};
    end
    wire rst_dac=rst_dac_sync[2];
    // IDELAYCTRL uses an independent reference, even before AD9516 starts.
    wire ref_feedback, ref_feedback_buf, ref_unbuffered, ref_clk_200m, ref_locked;
    BUFG ref_fb_bufg(.I(ref_feedback),.O(ref_feedback_buf));
    BUFG ref_clk_bufg(.I(ref_unbuffered),.O(ref_clk_200m));
    MMCME2_BASE #(.CLKIN1_PERIOD(20.0),.CLKFBOUT_MULT_F(20.0),
        .DIVCLK_DIVIDE(1),.CLKOUT0_DIVIDE_F(5.0),.STARTUP_WAIT("FALSE")) ref_mmcm (
        .CLKIN1(clk_50m),.CLKFBIN(ref_feedback_buf),.CLKFBOUT(ref_feedback),
        .CLKOUT0(ref_unbuffered),.LOCKED(ref_locked),.PWRDWN(1'b0),.RST(rst_sys)
    );
    wire ref_reset=rst_sys || !ref_locked;
    wire adc_reset_source=ref_reset || !mmcm_locked;
    // Divide the raw DCO before synchronizing its heartbeat into clk_50m.
    reg [9:0] heartbeat_div=0;
    always @(posedge clk_dco) begin
        heartbeat_div<=heartbeat_div+1'b1;
    end
    (* ASYNC_REG="TRUE" *) reg [2:0] heartbeat_sync;
    (* ASYNC_REG="TRUE" *) reg [1:0] locked_sync;
    reg heartbeat_previous, edge_seen, dco_alive;
    reg [31:0] monitor_count;
    always @(posedge clk_50m) begin
        if(rst_sys) begin
            heartbeat_sync<=0; heartbeat_previous<=0; edge_seen<=0;
            monitor_count<=0; dco_alive<=0; locked_sync<=0;
        end else begin
            locked_sync<={locked_sync[0],mmcm_locked};
            heartbeat_sync<={heartbeat_sync[1:0],heartbeat_div[9]};
            heartbeat_previous<=heartbeat_sync[2];
            if(heartbeat_previous!=heartbeat_sync[2]) edge_seen<=1;
            if(monitor_count>=MONITOR_WINDOW-1) begin
                dco_alive<=locked_sync[1] && (edge_seen || (heartbeat_previous!=heartbeat_sync[2]));
                edge_seen<=0; monitor_count<=0;
            end else monitor_count<=monitor_count+1'b1;
        end
    end
    wire clock_config_done, dac_config_done;
    wire [3:0] error_code, init_state;
    wire [7:0] pll_status, fifo_status, fifo_level;
    dac_init #(
        .SPI_HALF_PERIOD(SPI_HALF_PERIOD),.CLOCK_SETTLE_CYCLES(CLOCK_SETTLE_CYCLES),
        .PLL_WAIT_CYCLES(PLL_WAIT_CYCLES),.POLL_LIMIT(POLL_LIMIT),
        .CLOCK_WAIT_CYCLES(CLOCK_WAIT_CYCLES)
    ) init_i (
        .clk(clk_50m),.rst(rst_sys),.dco_alive(dco_alive),
        .adk_sclk(adk_spi_sclk),.adk_csb(adk_spi_csb),.adk_sda(adk_spi_sda),
        .dac_sclk(dac_spi_sclk),.dac_csb(dac_spi_csb),.dac_sdio(dac_spi_sdio),
        .clock_config_done(clock_config_done),.dac_config_done(dac_config_done),
        .error_code(error_code),.pll_status(pll_status),.fifo_status(fifo_status),
        .fifo_level(fifo_level),.state_debug(init_state)
    );
    (* ASYNC_REG="TRUE" *) reg [1:0] enable_sync=0;
    always @(posedge clk_dac) begin
        if(rst_dac) enable_sync<=0;
        else enable_sync<={enable_sync[0],dac_config_done};
    end
    wire signed [15:0] i_sample, q_sample;
    wire [2:0] test_mode;
`ifdef SYNTHESIS
    vio_test_control control_i (.clk(clk_dac),.probe_out0(test_mode));
`else
    // Testbench can force this net to exercise all online modes.
    assign test_mode=3'd2;
`endif
    // Async assertion on clock loss; synchronous release in the DAC domain.
    // This gates only clock availability, never waits for DAC SPI completion.
    (* ASYNC_REG="TRUE" *) reg [2:0] tx_reset_sync=3'b111;
    always @(posedge clk_dac or negedge dco_alive) begin
        if(!dco_alive) tx_reset_sync<=3'b111;
        else tx_reset_sync<={tx_reset_sync[1:0],1'b0};
    end
    wire tx_reset=rst_dac || tx_reset_sync[2];
    sine_dds #(.PHASE_STEP(PHASE_STEP),.Q_MODE(Q_MODE)) dds_i (
        .clk(clk_dac),.rst(rst_dac),.enable(enable_sync[1]),.test_mode(test_mode),
        .i_sample(i_sample),.q_sample(q_sample)
    );
    dac_lvds_tx tx_i (
        .clk(clk_dac),.rst(tx_reset),.i_sample(i_sample),.q_sample(q_sample),
        .dac_dci_p(dac_dci_p),.dac_dci_n(dac_dci_n),
        .dac_data_p(dac_data_p),.dac_data_n(dac_data_n)
    );
    wire idelay_ready, sample_valid, dac_ready_acq;
    wire [13:0] raw_rise, raw_fall;
    adc_loopback_rx #(.IDELAY_TAP(ADC_IDELAY_TAP)) rx_i (
        .rst_async(adc_reset_source),.ref_clk_200m(ref_clk_200m),.clk_acq(clk_acq),
                .capture_enable(dac_config_done),
        .adc_data_p(adc_data_p),.adc_data_n(adc_data_n),
        .idelay_ready(idelay_ready),.sample_valid(sample_valid),.dac_ready_acq(dac_ready_acq),
        .sample_rise(raw_rise),.sample_fall(raw_fall)
    );
    // One snapshot register aligns codes, flags and word index at 50 MHz.
    // Each word holds two 100 MSPS samples; the word counter increments by 1.
    (* ASYNC_REG="TRUE" *) reg [1:0] rx_reset_sync=3;
    always @(posedge clk_acq or posedge adc_reset_source) begin
        if(adc_reset_source) rx_reset_sync<=3;
        else rx_reset_sync<={rx_reset_sync[0],1'b0};
    end
    reg [13:0] adc_rise_u14=0, adc_fall_u14=0;
    wire signed [13:0] adc_rise_s14=adc_rise_u14 ^ 14'h2000;
    wire signed [13:0] adc_fall_s14=adc_fall_u14 ^ 14'h2000;
    reg [31:0] sample_word_count=0, clip_count=0;
    reg [7:0] rx_flags=0;
    reg adc_clip_sticky=0;
    wire clip_now=(raw_rise==0 || raw_rise==16383 || raw_fall==0 || raw_fall==16383);
    // Saturating clipping-word count; clears on reset or clock-lock loss.
    always @(posedge clk_acq) begin
        if(rx_reset_sync[1]) begin
            adc_rise_u14<=0; adc_fall_u14<=0; sample_word_count<=0;
            clip_count<=0; rx_flags<=0; adc_clip_sticky<=0;
        end else begin
            adc_rise_u14<=raw_rise; adc_fall_u14<=raw_fall;
            rx_flags<={3'b000,adc_clip_sticky,(sample_valid && clip_now),dac_ready_acq,idelay_ready,sample_valid};
            if(sample_valid) begin
                sample_word_count<=sample_word_count+1'b1;
                if(clip_now) begin
                    adc_clip_sticky<=1;
                    if(clip_count!=32'hffffffff) clip_count<=clip_count+1'b1;
                end
            end
        end
    end
    // LEDs cross only single-bit status; ILA payload stays in the DCO domain.
    (* ASYNC_REG="TRUE" *) reg [1:0] adc_ready_sync=0, adc_clip_sync=0;
    always @(posedge clk_50m) begin
        if(rst_sys) begin adc_ready_sync<=0; adc_clip_sync<=0; adc_ready_led<=0; adc_clip_led<=0; end
        else begin
            adc_ready_sync<={adc_ready_sync[0],idelay_ready};
            adc_clip_sync<={adc_clip_sync[0],adc_clip_sticky};
            adc_ready_led<=adc_ready_sync[1]; adc_clip_led<=adc_clip_sync[1];
        end
    end
`ifdef SYNTHESIS
    // Preserve both raw 100 MSPS samples in each 50 MHz source word, cross
    // them into the existing 100 MHz DAC/AXI clock domain and expose the
    // complete handshake to the design's single ILA.  TDATA[13:0] and
    // TDATA[27:14] replace the old raw rise/fall probes, avoiding the BASIC
    // license restriction against multiple ILA instances.  This block does
    // not feed back into the validated DAC waveform or ADC receiver.
    adc_stream_hw_probe #(
        .FRAME_WORDS(STREAM_FRAME_WORDS)
    ) stream_probe_i (
        .clk_acq(clk_acq),
        .rst_acq(rx_reset_sync[1]),
        .clk_axis(clk_dac),
        .rst_axis(rst_dac),
        .adc_ready(idelay_ready),
        .pair_valid(sample_valid),
        .sample_rise_u14(raw_rise),
        .sample_fall_u14(raw_fall),
        .sample_clip(clip_now)
    );
`endif
    // AC820 schematic: FPGA drives LED anodes through series resistors (high=on).
    // LED0: clock table sent. LED1: DAC ready, or 2 Hz blink after failure.
    reg [24:0] blink_count;
    always @(posedge clk_50m) begin
        if(rst_sys) blink_count<=0;
        else if(blink_count==24_999_999) blink_count<=0;
        else blink_count<=blink_count+1'b1;
    end
    always @(posedge clk_50m) begin
        if(rst_sys) begin pll_done_led<=0; dac_done_led<=0; end
        else begin
            pll_done_led<=clock_config_done;
            dac_done_led<=dac_config_done || ((error_code!=0) && (blink_count<12_500_000));
        end
    end
endmodule
