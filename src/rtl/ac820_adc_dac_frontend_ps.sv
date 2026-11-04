`timescale 1ns/1ps

// AC820 + FMC AD/DA hardware front end for the Zynq PS/PL system project.
//
// This module deliberately contains only the already validated board bring-up,
// DAC waveform generator and ADC DDR capture path.  The echo-processing chain
// and its AXI4-Lite control plane live in echo_pipeline_axi_control_phase2 and
// are connected to the exported signals below in the Vivado block design.
module ac820_adc_dac_frontend_ps #(
    parameter [31:0] PHASE_STEP = 32'd429496730,
    parameter integer Q_MODE = 1,
    parameter integer ADC_IDELAY_TAP = 4,
    parameter integer POWERUP_CYCLES = 50_000,
    parameter integer SPI_HALF_PERIOD = 25,
    parameter integer CLOCK_SETTLE_CYCLES = 5_000_000,
    parameter integer PLL_WAIT_CYCLES = 500_000,
    parameter integer POLL_LIMIT = 4096,
    parameter integer CLOCK_WAIT_CYCLES = 5_000_000,
    parameter integer MONITOR_WINDOW = 50_000
) (
    input  wire        clk_50m,
    input  wire        adc_dco_p,
    input  wire        adc_dco_n,
    input  wire [13:0] adc_data_p,
    input  wire [13:0] adc_data_n,

    output wire        adk_spi_sda,
    output wire        adk_spi_sclk,
    output wire        adk_spi_csb,
    inout  wire        dac_spi_sdio,
    output wire        dac_spi_sclk,
    output wire        dac_spi_csb,
    output wire        dac_dci_p,
    output wire        dac_dci_n,
    output wire [15:0] dac_data_p,
    output wire [15:0] dac_data_n,
    output reg         pll_done_led,
    output reg         dac_done_led,
    output reg         adc_ready_led,
    output reg         adc_clip_led,

    output wire        echo_clk_acq,
    output wire        echo_rst_acq,
    output wire        echo_adc_ready,
    output wire        echo_pair_valid,
    output wire [13:0] echo_sample_rise_u14,
    output wire [13:0] echo_sample_fall_u14,
    output wire        echo_sample_clip,
    input  wire        echo_pulse_start_acq,
    input  wire [2:0]  echo_pulse_mode,
    input  wire [5:0]  echo_pulse_width,
    input  wire        echo_pn_enable,
    output wire        echo_pulse_ready,
    output wire        echo_tx_marker,
    output wire [31:0] echo_frame_meta,
    output wire [5:0]  echo_pulse_frames_sent
);
    reg [31:0] power_count = 0;
    reg rst_sys = 1;
    always @(posedge clk_50m) begin
        if (power_count < POWERUP_CYCLES) begin
            power_count <= power_count + 1'b1;
            rst_sys <= 1'b1;
        end else begin
            rst_sys <= 1'b0;
        end
    end

    wire dco_se;
    wire clk_dco;
    wire clk_dac;
    wire clk_acq;
    IBUFDS #(.DIFF_TERM("TRUE"), .IOSTANDARD("LVDS_25")) dco_ibuf (
        .I(adc_dco_p), .IB(adc_dco_n), .O(dco_se)
    );
    BUFG dco_bufg (.I(dco_se), .O(clk_dco));

    wire mmcm_feedback;
    wire mmcm_feedback_buf;
    wire dac_clock_unbuffered;
    wire adc_clock_unbuffered;
    wire mmcm_locked;
    BUFG feedback_bufg (.I(mmcm_feedback), .O(mmcm_feedback_buf));
    BUFG dac_clock_bufg (.I(dac_clock_unbuffered), .O(clk_dac));
    BUFG adc_clock_bufg (.I(adc_clock_unbuffered), .O(clk_acq));
    MMCME2_BASE #(
        .BANDWIDTH("OPTIMIZED"), .CLKIN1_PERIOD(10.000),
        .DIVCLK_DIVIDE(1), .CLKFBOUT_MULT_F(10.000),
        .CLKOUT0_DIVIDE_F(10.000), .CLKOUT0_PHASE(0.000),
        .CLKOUT1_DIVIDE(10), .CLKOUT1_PHASE(175.500),
        .STARTUP_WAIT("FALSE")
    ) dac_clock_mmcm (
        .CLKIN1(dco_se), .CLKFBIN(mmcm_feedback_buf),
        .CLKFBOUT(mmcm_feedback), .CLKOUT0(dac_clock_unbuffered),
        .CLKOUT1(adc_clock_unbuffered), .LOCKED(mmcm_locked),
        .PWRDWN(1'b0), .RST(rst_sys)
    );

    wire reset_source = rst_sys || !mmcm_locked;
    (* ASYNC_REG="TRUE" *) reg [2:0] rst_dac_sync = 3'b111;
    always @(posedge clk_dac or posedge reset_source) begin
        if (reset_source) rst_dac_sync <= 3'b111;
        else rst_dac_sync <= {rst_dac_sync[1:0], 1'b0};
    end
    wire rst_dac = rst_dac_sync[2];
    reg echo_rst_acq_sync = 1'b1;
    wire idelay_ready;

    // IDELAYCTRL uses a 200 MHz reference generated from the board 50 MHz.
    wire ref_feedback;
    wire ref_feedback_buf;
    wire ref_unbuffered;
    wire ref_clk_200m;
    wire ref_locked;
    BUFG ref_fb_bufg (.I(ref_feedback), .O(ref_feedback_buf));
    BUFG ref_clk_bufg (.I(ref_unbuffered), .O(ref_clk_200m));
    MMCME2_BASE #(
        .CLKIN1_PERIOD(20.0), .CLKFBOUT_MULT_F(20.0),
        .DIVCLK_DIVIDE(1), .CLKOUT0_DIVIDE_F(5.0),
        .STARTUP_WAIT("FALSE")
    ) ref_mmcm (
        .CLKIN1(clk_50m), .CLKFBIN(ref_feedback_buf),
        .CLKFBOUT(ref_feedback), .CLKOUT0(ref_unbuffered),
        .LOCKED(ref_locked), .PWRDWN(1'b0), .RST(rst_sys)
    );

    wire ref_reset = rst_sys || !ref_locked;
    wire adc_reset_source = ref_reset || !mmcm_locked;

    reg [9:0] heartbeat_div = 0;
    always @(posedge clk_dco) heartbeat_div <= heartbeat_div + 1'b1;

    (* ASYNC_REG="TRUE" *) reg [2:0] heartbeat_sync = 0;
    (* ASYNC_REG="TRUE" *) reg [1:0] locked_sync = 0;
    reg heartbeat_previous = 0;
    reg edge_seen = 0;
    reg dco_alive = 0;
    reg [31:0] monitor_count = 0;
    always @(posedge clk_50m) begin
        if (rst_sys) begin
            heartbeat_sync <= 0;
            heartbeat_previous <= 0;
            edge_seen <= 0;
            monitor_count <= 0;
            dco_alive <= 0;
            locked_sync <= 0;
        end else begin
            locked_sync <= {locked_sync[0], mmcm_locked};
            heartbeat_sync <= {heartbeat_sync[1:0], heartbeat_div[9]};
            heartbeat_previous <= heartbeat_sync[2];
            if (heartbeat_previous != heartbeat_sync[2]) edge_seen <= 1'b1;
            if (monitor_count >= MONITOR_WINDOW-1) begin
                dco_alive <= locked_sync[1] &&
                             (edge_seen || (heartbeat_previous != heartbeat_sync[2]));
                edge_seen <= 1'b0;
                monitor_count <= 0;
            end else begin
                monitor_count <= monitor_count + 1'b1;
            end
        end
    end

    wire clock_config_done;
    wire dac_config_done;
    wire [3:0] error_code;
    wire [3:0] init_state;
    wire [7:0] pll_status;
    wire [7:0] fifo_status;
    wire [7:0] fifo_level;
    wire dac_sdio_i;
    wire dac_sdio_o;
    wire dac_sdio_t;
    IOBUF dac_sdio_iobuf (
        .IO(dac_spi_sdio),
        .I(dac_sdio_o),
        .T(dac_sdio_t),
        .O(dac_sdio_i)
    );
    dac_init #(
        .SPI_HALF_PERIOD(SPI_HALF_PERIOD),
        .CLOCK_SETTLE_CYCLES(CLOCK_SETTLE_CYCLES),
        .PLL_WAIT_CYCLES(PLL_WAIT_CYCLES),
        .POLL_LIMIT(POLL_LIMIT),
        .CLOCK_WAIT_CYCLES(CLOCK_WAIT_CYCLES),
        .EXTERNAL_SDIO_IOBUF(1)
    ) init_i (
        .clk(clk_50m), .rst(rst_sys), .dco_alive(dco_alive),
        .adk_sclk(adk_spi_sclk), .adk_csb(adk_spi_csb), .adk_sda(adk_spi_sda),
        .dac_sclk(dac_spi_sclk), .dac_csb(dac_spi_csb), .dac_sdio(),
        .dac_sdio_i(dac_sdio_i), .dac_sdio_o(dac_sdio_o),
        .dac_sdio_t(dac_sdio_t),
        .clock_config_done(clock_config_done), .dac_config_done(dac_config_done),
        .error_code(error_code), .pll_status(pll_status),
        .fifo_status(fifo_status), .fifo_level(fifo_level),
        .state_debug(init_state)
    );

    (* ASYNC_REG="TRUE" *) reg [1:0] enable_sync = 0;
    always @(posedge clk_dac) begin
        if (rst_dac) enable_sync <= 0;
        else enable_sync <= {enable_sync[0], dac_config_done};
    end

    (* ASYNC_REG="TRUE" *) reg [2:0] tx_reset_sync = 3'b111;
    always @(posedge clk_dac or negedge dco_alive) begin
        if (!dco_alive) tx_reset_sync <= 3'b111;
        else tx_reset_sync <= {tx_reset_sync[1:0], 1'b0};
    end
    wire tx_reset = rst_dac || tx_reset_sync[2];

    (* ASYNC_REG="TRUE" *) reg [9:0] pulse_cfg_sync1 = {1'b0,3'd5,6'd4};
    (* ASYNC_REG="TRUE" *) reg [9:0] pulse_cfg_sync2 = {1'b0,3'd5,6'd4};
    (* ASYNC_REG="TRUE" *) reg [1:0] idelay_ready_dac = 0;
    always @(posedge clk_dac) begin
        pulse_cfg_sync1 <= {echo_pn_enable,echo_pulse_mode,echo_pulse_width};
        pulse_cfg_sync2 <= pulse_cfg_sync1;
        idelay_ready_dac <= {idelay_ready_dac[0],idelay_ready};
    end
    wire pulse_ready_dac = enable_sync[1] && !tx_reset && idelay_ready_dac[1];
    wire burst_start_dac;
    cdc_pulse_toggle burst_start_cdc (
        .src_clk(clk_acq), .src_rst(echo_rst_acq_sync),
        .src_pulse(echo_pulse_start_acq),
        .dst_clk(clk_dac), .dst_rst(tx_reset),
        .dst_pulse(burst_start_dac)
    );
    wire burst_active;
    wire [5:0] frames_sent;
    wire source_frame_last;
    wire source_owned, source_marker, source_tx_active;
    wire source_frame_active, source_frame_start;
    wire [8:0] source_index;
    wire [15:0] source_frame_id;
    wire [2:0] source_mode;
    wire signed [15:0] pulse_sample;
    wire repeat_enable;
    pulse_burst_32 burst_i (
        .clk(clk_dac), .rst(tx_reset), .start(burst_start_dac),
        .ready(pulse_ready_dac),
        .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last),
        .repeat_enable(repeat_enable), .active(burst_active),
        .frames_sent(frames_sent)
    );
    sync_pulse_engine pulse_i (
        .clk(clk_dac), .rst(tx_reset), .ready(pulse_ready_dac),
        .requested_mode(pulse_cfg_sync2[8:6] == 3'd2 ? 3'd5 :
                        pulse_cfg_sync2[8:6]),
        .requested_width(pulse_cfg_sync2[5:0]),
        .requested_pn(pulse_cfg_sync2[9]),
        .single_request(1'b0), .repeat_enable(repeat_enable),
        .clear_request(1'b0), .busy(), .clear_accepted(),
        .rejected_sticky(), .aborted_sticky(),
        .completed_count(), .rejected_count(), .aborted_count(),
        .source_owned(source_owned), .source_sample(pulse_sample),
        .source_marker(source_marker),
        .source_tx_active(source_tx_active),
        .source_frame_active(source_frame_active),
        .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last),
        .source_index(source_index), .source_frame_id(source_frame_id),
        .source_mode(source_mode)
    );
    reg launch_marker = 0;
    reg [31:0] launch_meta = 0;
    always @(posedge clk_dac) begin
        if (tx_reset) begin
            launch_marker <= 1'b0;
            launch_meta <= '0;
        end else begin
            launch_marker <= source_marker && source_owned && pulse_ready_dac;
            launch_meta <= {source_frame_id, source_mode,
                (source_tx_active && source_owned && pulse_ready_dac),
                (source_frame_last && source_owned && pulse_ready_dac),
                (source_frame_start && source_owned && pulse_ready_dac),
                (source_frame_active && source_owned && pulse_ready_dac),
                source_index};
        end
    end
    dac_lvds_tx tx_i (
        .clk(clk_dac), .rst(tx_reset),
        .i_sample(pulse_cfg_sync2[8:6] == 3'd2 ? 16'sd0 : pulse_sample),
        .q_sample(16'sd0),
        .dac_dci_p(dac_dci_p), .dac_dci_n(dac_dci_n),
        .dac_data_p(dac_data_p), .dac_data_n(dac_data_n)
    );

    wire sample_valid;
    wire dac_ready_acq;
    wire [13:0] raw_rise;
    wire [13:0] raw_fall;
    adc_loopback_rx #(.IDELAY_TAP(ADC_IDELAY_TAP)) rx_i (
        .rst_async(adc_reset_source), .ref_clk_200m(ref_clk_200m),
        .clk_acq(clk_acq), .capture_enable(dac_config_done),
        .adc_data_p(adc_data_p), .adc_data_n(adc_data_n),
        .idelay_ready(idelay_ready), .sample_valid(sample_valid),
        .dac_ready_acq(dac_ready_acq),
        .sample_rise(raw_rise), .sample_fall(raw_fall)
    );

    (* ASYNC_REG="TRUE" *) reg [1:0] rx_reset_sync = 2'b11;
    always @(posedge clk_acq or posedge adc_reset_source) begin
        if (adc_reset_source) rx_reset_sync <= 2'b11;
        else rx_reset_sync <= {rx_reset_sync[0], 1'b0};
    end

    // Keep the acquisition reset synchronizer's asynchronous assertion, but
    // do not drive processing BRAM reset pins directly from a register with an
    // asynchronous control.  This extra stage is entirely synchronous to the
    // acquisition clock and therefore gives the algorithm RAMs a clean reset.
    always @(posedge clk_acq) begin
        echo_rst_acq_sync <= rx_reset_sync[1];
    end

    reg [13:0] adc_rise_u14 = 0;
    reg [13:0] adc_fall_u14 = 0;
    reg pair_valid_q = 0, clip_q = 0, tx_marker_q = 0;
    reg [31:0] frame_meta_q = 0;
    reg pulse_ready_q = 0;
    reg [31:0] sample_word_count = 0;
    reg [31:0] clip_count = 0;
    reg [7:0] rx_flags = 0;
    reg adc_clip_sticky = 0;
    wire clip_now = (raw_rise == 0 || raw_rise == 16383 ||
                     raw_fall == 0 || raw_fall == 16383);
    always @(posedge clk_acq) begin
        if (rx_reset_sync[1]) begin
            adc_rise_u14 <= 0;
            adc_fall_u14 <= 0;
            pair_valid_q <= 0;
            clip_q <= 0;
            tx_marker_q <= 0;
            frame_meta_q <= 0;
            pulse_ready_q <= 0;
            sample_word_count <= 0;
            clip_count <= 0;
            rx_flags <= 0;
            adc_clip_sticky <= 0;
        end else begin
            adc_rise_u14 <= raw_rise;
            adc_fall_u14 <= raw_fall;
            pair_valid_q <= sample_valid;
            clip_q <= sample_valid && clip_now;
            tx_marker_q <= launch_marker;
            frame_meta_q <= launch_meta;
            frame_meta_q[9] <= launch_meta[9] && sample_valid;
            pulse_ready_q <= idelay_ready && dac_ready_acq;
            rx_flags <= {3'b000, adc_clip_sticky, (sample_valid && clip_now),
                         dac_ready_acq, idelay_ready, sample_valid};
            if (sample_valid) begin
                sample_word_count <= sample_word_count + 1'b1;
                if (clip_now) begin
                    adc_clip_sticky <= 1'b1;
                    if (clip_count != 32'hffff_ffff)
                        clip_count <= clip_count + 1'b1;
                end
            end
        end
    end

    (* ASYNC_REG="TRUE" *) reg [1:0] adc_ready_sync = 0;
    (* ASYNC_REG="TRUE" *) reg [1:0] adc_clip_sync = 0;
    always @(posedge clk_50m) begin
        if (rst_sys) begin
            adc_ready_sync <= 0;
            adc_clip_sync <= 0;
            adc_ready_led <= 0;
            adc_clip_led <= 0;
        end else begin
            adc_ready_sync <= {adc_ready_sync[0], idelay_ready};
            adc_clip_sync <= {adc_clip_sync[0], adc_clip_sticky};
            adc_ready_led <= adc_ready_sync[1];
            adc_clip_led <= adc_clip_sync[1];
        end
    end

    reg [24:0] blink_count = 0;
    always @(posedge clk_50m) begin
        if (rst_sys) blink_count <= 0;
        else if (blink_count == 24_999_999) blink_count <= 0;
        else blink_count <= blink_count + 1'b1;
    end
    always @(posedge clk_50m) begin
        if (rst_sys) begin
            pll_done_led <= 0;
            dac_done_led <= 0;
        end else begin
            pll_done_led <= clock_config_done;
            dac_done_led <= dac_config_done ||
                            ((error_code != 0) && (blink_count < 12_500_000));
        end
    end

    // Direct, same-clock-domain interface to the AXI-controlled processing
    // block.  No additional CDC is introduced on these acquisition signals.
    assign echo_clk_acq = clk_acq;
    assign echo_rst_acq = echo_rst_acq_sync;
    assign echo_adc_ready = idelay_ready;
    assign echo_pair_valid = pair_valid_q;
    assign echo_sample_rise_u14 = adc_rise_u14;
    assign echo_sample_fall_u14 = adc_fall_u14;
    assign echo_sample_clip = clip_q;
    assign echo_pulse_ready = pulse_ready_q;
    assign echo_tx_marker = tx_marker_q;
    assign echo_frame_meta = frame_meta_q;
    assign echo_pulse_frames_sent = frames_sent;
endmodule
