`timescale 1ns/1ps

// One ADS5474 produces two consecutive physical samples per 100 MHz DCO word.
// Average each position over M aligned pulse frames; never average rise/fall
// with one another. Two independent 512-deep accumulators sustain one pair/cycle.
module frame_average_pair_bram #(
    parameter integer PAIRS = 512,
    parameter integer M = 32,
    parameter integer PRETRIGGER_PAIRS = 64,
    parameter integer MAX_TRANSACTION_CYCLES = 70_000
) (
    input  logic                   clk_acq,
    input  logic                   rst_acq,
    input  logic                   start_pulse,
    input  logic [13:0]            sample_rise_u14,
    input  logic [13:0]            sample_fall_u14,
    input  logic                   pair_valid,
    input  logic                   sample_clip,
    input  logic                   tx_marker,
    input  logic [31:0]            frame_meta,
    output logic                   busy,
    output logic                   group_done_pulse,
    output logic                   frame_error_pulse,
    output logic                   frame_error_sticky,
    output logic [$clog2(M+1)-1:0] frames_seen,
    output logic                   clip_flag_snapshot,
    output logic [31:0]            overflow_count,
    output logic                   rise_wr_en,
    output logic [$clog2(PAIRS)-1:0] rise_wr_addr,
    output logic signed [15:0]     rise_wr_data_q2,
    output logic                   fall_wr_en,
    output logic [$clog2(PAIRS)-1:0] fall_wr_addr,
    output logic signed [15:0]     fall_wr_data_q2
);
    localparam integer INDEX_W = $clog2(PAIRS);
    localparam integer FRAME_W = $clog2(M+1);
    logic frame_open;
    logic [INDEX_W-1:0] expected_index;
    logic [15:0] last_frame_id;
    logic [2:0] first_mode;
    logic [31:0] elapsed_cycles;
    logic rise_busy, fall_busy, rise_done, fall_done;
    logic rise_clip, fall_clip;
    logic [31:0] rise_overflow, fall_overflow;
    logic pair_accept;
    logic frame_good;
    logic [INDEX_W-1:0] index_now;
    logic frame_start, frame_last, window_valid;

    assign index_now = frame_meta[INDEX_W-1:0];
    assign window_valid = frame_meta[9];
    assign frame_start = frame_meta[10];
    assign frame_last = frame_meta[11];
    assign frame_good = busy && pair_valid && window_valid && !frame_error_sticky &&
        (frames_seen < M) &&
        (frame_open ?
            (index_now == expected_index && !frame_start &&
             frame_meta[31:16] == last_frame_id &&
             frame_meta[15:13] == first_mode) :
            (index_now == 0 && frame_start &&
             (frames_seen == 0 || frame_meta[31:16] == last_frame_id + 16'd1) &&
             (frames_seen == 0 || frame_meta[15:13] == first_mode))) &&
        (frame_last == (index_now == PAIRS-1)) &&
        (tx_marker == (index_now == PRETRIGGER_PAIRS));
    assign pair_accept = frame_good;
    assign clip_flag_snapshot = rise_clip || fall_clip;
    assign overflow_count = rise_overflow + fall_overflow;

    // An invalid ADC word leaves a gap in the numbered window. A later valid
    // word then fails expected_index. The watchdog also covers a missing frame.
    always_ff @(posedge clk_acq) begin
        if (rst_acq) begin
            busy <= 1'b0;
            group_done_pulse <= 1'b0;
            frame_error_pulse <= 1'b0;
            frame_error_sticky <= 1'b0;
            frames_seen <= '0;
            frame_open <= 1'b0;
            expected_index <= '0;
            last_frame_id <= '0;
            first_mode <= '0;
            elapsed_cycles <= '0;
        end else begin
            group_done_pulse <= 1'b0;
            frame_error_pulse <= 1'b0;
            if (start_pulse && !busy) begin
                busy <= 1'b1;
                frame_error_sticky <= 1'b0;
                frames_seen <= '0;
                frame_open <= 1'b0;
                expected_index <= '0;
                last_frame_id <= '0;
                first_mode <= '0;
                elapsed_cycles <= '0;
            end else if (busy) begin
                elapsed_cycles <= elapsed_cycles + 1'b1;
                if (elapsed_cycles >= MAX_TRANSACTION_CYCLES ||
                    (frame_start && !frame_good) ||
                    (window_valid && !frame_good) ||
                    (frame_last && !frame_good)) begin
                    busy <= 1'b0;
                    frame_error_sticky <= 1'b1;
                    frame_error_pulse <= 1'b1;
                end else if (pair_accept) begin
                    if (index_now == 0) begin
                        frame_open <= 1'b1;
                        last_frame_id <= frame_meta[31:16];
                        if (frames_seen == 0) first_mode <= frame_meta[15:13];
                    end
                    expected_index <= index_now + 1'b1;
                    if (frame_last) begin
                        frame_open <= 1'b0;
                        frames_seen <= frames_seen + 1'b1;
                    end
                end
                if (rise_done && fall_done && frames_seen == M &&
                    !frame_error_sticky) begin
                    busy <= 1'b0;
                    group_done_pulse <= 1'b1;
                end
            end
        end
    end

    frame_average_bram #(.N(PAIRS), .M(M), .ADDR_W(INDEX_W)) rise_average_i (
        .clk_acq(clk_acq), .rst_acq(rst_acq ||
                                  (frame_error_sticky && !start_pulse)),
        .start_pulse(start_pulse), .sample_valid(pair_accept),
        .sample_u14(sample_rise_u14), .sample_clip(sample_clip),
        .busy(rise_busy), .group_done_pulse(rise_done),
        .clip_flag_snapshot(rise_clip), .overflow_count(rise_overflow),
        .avg_wr_en(rise_wr_en), .avg_wr_addr(rise_wr_addr),
        .avg_wr_data_q2(rise_wr_data_q2)
    );
    frame_average_bram #(.N(PAIRS), .M(M), .ADDR_W(INDEX_W)) fall_average_i (
        .clk_acq(clk_acq), .rst_acq(rst_acq ||
                                  (frame_error_sticky && !start_pulse)),
        .start_pulse(start_pulse), .sample_valid(pair_accept),
        .sample_u14(sample_fall_u14), .sample_clip(sample_clip),
        .busy(fall_busy), .group_done_pulse(fall_done),
        .clip_flag_snapshot(fall_clip), .overflow_count(fall_overflow),
        .avg_wr_en(fall_wr_en), .avg_wr_addr(fall_wr_addr),
        .avg_wr_data_q2(fall_wr_data_q2)
    );

    initial begin
        if (PAIRS != 512 || M != 32 || PRETRIGGER_PAIRS >= PAIRS)
            $fatal(1, "Unsupported physical frame configuration");
    end
endmodule
