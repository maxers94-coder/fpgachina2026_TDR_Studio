`timescale 1ns/1ps

// Canonical boundary between the verified ADC receiver and future PL/PS data
// consumers.  Every source word contains two consecutive 200 MSPS ADC
// samples captured by the 100 MHz DDR clock.  The raw branch is lossless while
// the FIFO has space; the optional averaged branch never replaces the raw
// samples.
//
// AXI-stream word layout:
//   [13:0]  rising-edge offset-binary sample
//   [27:14] falling-edge offset-binary sample
//   [28]    either physical sample is clipped
//   [29]    ADC receiver ready snapshot
//   [31:30] reserved, zero
module adc_pl_stream_frontend #(
    parameter integer FRAME_WORD_W = 16,
    parameter integer FIFO_DEPTH = 64,
    parameter integer FIFO_ADDR_W = $clog2(FIFO_DEPTH),
    parameter integer FIFO_COUNT_W = $clog2(FIFO_DEPTH + 1)
) (
    input  logic                         clk_acq,
    input  logic                         rst_acq,

    input  logic                         capture_enable,
    input  logic                         clear_stats,
    input  logic [FRAME_WORD_W-1:0]      cfg_frame_words,

    input  logic                         adc_ready,
    input  logic                         pair_valid,
    input  logic [13:0]                  sample_rise_u14,
    input  logic [13:0]                  sample_fall_u14,
    input  logic                         sample_clip,

    output logic [31:0]                  m_axis_tdata,
    output logic                         m_axis_tvalid,
    input  logic                         m_axis_tready,
    output logic                         m_axis_tlast,

    // Direct, unstalled branch for a future acquisition-domain processor.
    output logic                         proc_pair_valid,
    output logic [13:0]                  proc_rise_u14,
    output logic [13:0]                  proc_fall_u14,
    output logic                         proc_pair_clip,

    // Optional 100 MS/s branch.  Raw samples above remain available.
    output logic                         proc_average_valid,
    output logic [13:0]                  proc_average_u14,
    output logic                         proc_average_clip,

    output logic [31:0]                  source_word_count,
    output logic [31:0]                  stream_word_count,
    output logic [31:0]                  dropped_word_count,
    output logic                         overflow_sticky,
    output logic [FIFO_COUNT_W-1:0]      fifo_level,
    output logic [FRAME_WORD_W-1:0]      source_frame_word_index
);

    logic [31:0] fifo_data [0:FIFO_DEPTH-1];
    logic        fifo_last [0:FIFO_DEPTH-1];
    logic [FIFO_ADDR_W-1:0] wr_ptr;
    logic [FIFO_ADDR_W-1:0] rd_ptr;
    logic [FIFO_COUNT_W-1:0] fifo_count;

    logic source_fire;
    logic fifo_pop;
    logic fifo_push;
    logic frame_last_now;
    logic [FRAME_WORD_W-1:0] effective_frame_words;
    logic average_rst;
    logic average_clip_from_codes;
    logic average_input_clip_d;

    initial begin
        if (FIFO_DEPTH < 2)
            $error("adc_pl_stream_frontend FIFO_DEPTH must be at least 2");
        if ((1 << FIFO_ADDR_W) != FIFO_DEPTH)
            $error("adc_pl_stream_frontend FIFO_DEPTH must be a power of two");
    end

    assign effective_frame_words = (cfg_frame_words == '0)
                                 ? {{(FRAME_WORD_W-1){1'b0}}, 1'b1}
                                 : cfg_frame_words;
    assign source_fire = capture_enable && pair_valid;
    assign frame_last_now = source_frame_word_index
                          == (effective_frame_words - 1'b1);

    assign m_axis_tvalid = (fifo_count != 0);
    assign m_axis_tdata = fifo_data[rd_ptr];
    assign m_axis_tlast = fifo_last[rd_ptr];
    assign fifo_pop = m_axis_tvalid && m_axis_tready;

    // A pop from a full FIFO frees the location on the same edge, so a new
    // source word may be accepted without creating an unnecessary drop.
    assign fifo_push = source_fire
                    && ((fifo_count != FIFO_DEPTH) || fifo_pop);
    assign fifo_level = fifo_count;

    assign proc_pair_valid = source_fire;
    assign proc_rise_u14 = sample_rise_u14;
    assign proc_fall_u14 = sample_fall_u14;
    assign proc_pair_clip = sample_clip;

    assign average_rst = rst_acq || !capture_enable;

    // adc_pair_average detects rail codes itself. Preserve any upstream
    // clip indication as well, delayed to the averaged sample's cycle.
    always_ff @(posedge clk_acq) begin
        if (average_rst)
            average_input_clip_d <= 1'b0;
        else if (source_fire)
            average_input_clip_d <= sample_clip;
    end
    assign proc_average_clip = average_clip_from_codes
                                 || average_input_clip_d;

    adc_pair_average average_i (
        .clk(clk_acq),
        .rst(average_rst),
        .in_valid(source_fire),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .out_valid(proc_average_valid),
        .sample_u14(proc_average_u14),
        .clip_event(average_clip_from_codes)
    );

    always_ff @(posedge clk_acq) begin
        if (rst_acq || !capture_enable) begin
            wr_ptr <= '0;
            rd_ptr <= '0;
            fifo_count <= '0;
            source_frame_word_index <= '0;
        end else begin
            if (fifo_push) begin
                fifo_data[wr_ptr] <= {
                    2'b00,
                    adc_ready,
                    sample_clip,
                    sample_fall_u14,
                    sample_rise_u14
                };
                fifo_last[wr_ptr] <= frame_last_now;
                wr_ptr <= wr_ptr + 1'b1;
            end

            if (fifo_pop)
                rd_ptr <= rd_ptr + 1'b1;

            case ({fifo_push, fifo_pop})
                2'b10: fifo_count <= fifo_count + 1'b1;
                2'b01: fifo_count <= fifo_count - 1'b1;
                default: fifo_count <= fifo_count;
            endcase

            if (source_fire) begin
                if (frame_last_now)
                    source_frame_word_index <= '0;
                else
                    source_frame_word_index <= source_frame_word_index + 1'b1;
            end
        end
    end

    always_ff @(posedge clk_acq) begin
        if (rst_acq) begin
            source_word_count <= '0;
            stream_word_count <= '0;
            dropped_word_count <= '0;
            overflow_sticky <= 1'b0;
        end else if (clear_stats) begin
            source_word_count <= '0;
            stream_word_count <= '0;
            dropped_word_count <= '0;
            overflow_sticky <= 1'b0;
        end else begin
            if (source_fire)
                source_word_count <= source_word_count + 1'b1;

            if (fifo_push)
                stream_word_count <= stream_word_count + 1'b1;

            if (source_fire && !fifo_push) begin
                dropped_word_count <= dropped_word_count + 1'b1;
                overflow_sticky <= 1'b1;
            end
        end
    end

endmodule
