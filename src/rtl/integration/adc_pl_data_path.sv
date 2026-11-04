`timescale 1ns/1ps

// Board-independent PL data path:
// verified ADC pair -> framed raw AXI stream -> asynchronous FIFO -> AXI clock.
// A parallel acquisition-domain branch exposes both the untouched pair and
// the optional 50 MSPS pair average for future algorithms.
module adc_pl_data_path #(
    parameter integer FRAME_WORD_W = 16,
    parameter integer FRONTEND_FIFO_DEPTH = 64,
    parameter integer ASYNC_FIFO_DEPTH = 1024,
    parameter integer FRONTEND_COUNT_W = $clog2(FRONTEND_FIFO_DEPTH + 1),
    parameter integer ASYNC_COUNT_W = $clog2(ASYNC_FIFO_DEPTH) + 1
) (
    input  logic                         clk_acq,
    input  logic                         rst_acq,
    input  logic                         clk_axis,
    input  logic                         rst_axis,

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

    output logic                         proc_pair_valid,
    output logic [13:0]                  proc_rise_u14,
    output logic [13:0]                  proc_fall_u14,
    output logic                         proc_pair_clip,
    output logic                         proc_average_valid,
    output logic [13:0]                  proc_average_u14,
    output logic                         proc_average_clip,

    output logic [31:0]                  source_word_count,
    output logic [31:0]                  stream_word_count,
    output logic [31:0]                  dropped_word_count,
    output logic                         overflow_sticky,
    output logic [FRONTEND_COUNT_W-1:0] frontend_fifo_level,
    output logic [ASYNC_COUNT_W-1:0]    async_write_level,
    output logic [ASYNC_COUNT_W-1:0]    async_read_level,
    output logic                         async_almost_full,
    output logic                         async_write_reset_busy,
    output logic                         async_read_reset_busy
);

    logic [31:0] raw_tdata;
    logic raw_tvalid;
    logic raw_tready;
    logic raw_tlast;
    logic [FRAME_WORD_W-1:0] unused_frame_word_index;
    (* ASYNC_REG = "TRUE" *) logic [1:0] axis_reset_acq_sync = 2'b11;
    logic path_reset_acq;

    // If the future PS/AXI domain is reset independently, flush the complete
    // stream path so that stale pre-reset words cannot appear after restart.
    // Assertion is asynchronous; release is synchronized to the write clock,
    // matching the XPM FIFO requirement that its reset be write-clock safe.
    always_ff @(posedge clk_acq or posedge rst_axis) begin
        if (rst_axis)
            axis_reset_acq_sync <= 2'b11;
        else
            axis_reset_acq_sync <= {axis_reset_acq_sync[0], 1'b0};
    end

    assign path_reset_acq = rst_acq || axis_reset_acq_sync[1];

    adc_pl_stream_frontend #(
        .FRAME_WORD_W(FRAME_WORD_W),
        .FIFO_DEPTH(FRONTEND_FIFO_DEPTH)
    ) frontend_i (
        .clk_acq(clk_acq),
        .rst_acq(path_reset_acq),
        .capture_enable(capture_enable),
        .clear_stats(clear_stats),
        .cfg_frame_words(cfg_frame_words),
        .adc_ready(adc_ready),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip),
        .m_axis_tdata(raw_tdata),
        .m_axis_tvalid(raw_tvalid),
        .m_axis_tready(raw_tready),
        .m_axis_tlast(raw_tlast),
        .proc_pair_valid(proc_pair_valid),
        .proc_rise_u14(proc_rise_u14),
        .proc_fall_u14(proc_fall_u14),
        .proc_pair_clip(proc_pair_clip),
        .proc_average_valid(proc_average_valid),
        .proc_average_u14(proc_average_u14),
        .proc_average_clip(proc_average_clip),
        .source_word_count(source_word_count),
        .stream_word_count(stream_word_count),
        .dropped_word_count(dropped_word_count),
        .overflow_sticky(overflow_sticky),
        .fifo_level(frontend_fifo_level),
        .source_frame_word_index(unused_frame_word_index)
    );

    axis_async_fifo #(
        .DATA_WIDTH(32),
        .FIFO_DEPTH(ASYNC_FIFO_DEPTH)
    ) cdc_fifo_i (
        .s_axis_aclk(clk_acq),
        .fifo_reset(path_reset_acq),
        .s_axis_tdata(raw_tdata),
        .s_axis_tvalid(raw_tvalid),
        .s_axis_tready(raw_tready),
        .s_axis_tlast(raw_tlast),
        .m_axis_aclk(clk_axis),
        .m_axis_reset(rst_axis),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tready(m_axis_tready),
        .m_axis_tlast(m_axis_tlast),
        .write_level(async_write_level),
        .read_level(async_read_level),
        .almost_full(async_almost_full),
        .write_reset_busy(async_write_reset_busy),
        .read_reset_busy(async_read_reset_busy)
    );

endmodule
