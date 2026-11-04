`timescale 1ns/1ps

module echo_pipeline_hw_probe #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer K_ADDR_W = $clog2(K)
) (
    input logic        clk_acq,
    input logic        rst_acq,
    input logic        clk_proc,
    input logic        rst_proc,
    input logic        adc_ready_acq,
    input logic        pair_valid,
    input logic [13:0] sample_rise_u14,
    input logic [13:0] sample_fall_u14,
    input logic        sample_clip
);

    logic start_request;
    logic clear_status;
    logic [K_ADDR_W-1:0] result_select_addr;
    logic coeff_init_done;
    logic transaction_busy;
    logic acquisition_busy;
    logic done_sticky;
    logic start_accepted_sticky;
    logic start_rejected_sticky;
    logic [31:0] transaction_count;
    logic [K_ADDR_W:0] result_count;
    logic signed [63:0] selected_result_q16;
    logic [31:0] average_overflow_count;
    logic [31:0] correlation_overflow_count;
    logic clip_flag_snapshot;
    logic [31:0] status_word;

    echo_pipeline_hw_control #(
        .N(N), .M(M), .L(L), .K(K)
    ) control_i (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .adc_ready_acq(adc_ready_acq),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip),
        .start_request(start_request),
        .clear_status(clear_status),
        .result_select_addr(result_select_addr),
        .coeff_init_done(coeff_init_done),
        .transaction_busy(transaction_busy),
        .acquisition_busy(acquisition_busy),
        .done_sticky(done_sticky),
        .start_accepted_sticky(start_accepted_sticky),
        .start_rejected_sticky(start_rejected_sticky),
        .transaction_count(transaction_count),
        .result_count(result_count),
        .selected_result_q16(selected_result_q16),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .clip_flag_snapshot(clip_flag_snapshot),
        .status_word(status_word)
    );

    // probe_out0: start request (pulse by writing 1 then 0)
    // probe_out1: result BRAM address
    // probe_out2: clear sticky status/counters (write 1 then 0)
    vio_echo_control vio_i (
        .clk(clk_proc),
        .probe_in0(status_word),
        .probe_in1(selected_result_q16),
        .probe_in2(transaction_count),
        .probe_in3(average_overflow_count),
        .probe_in4(correlation_overflow_count),
        .probe_out0(start_request),
        .probe_out1(result_select_addr),
        .probe_out2(clear_status)
    );

    ila_echo_pipeline ila_i (
        .clk(clk_proc),
        .probe0(status_word),
        .probe1(transaction_count),
        .probe2(selected_result_q16),
        .probe3(result_select_addr),
        .probe4(result_count)
    );

endmodule

