`timescale 1ns/1ps

// Board-independent bridge between the verified DDR ADC receiver and the
// previously verified echo-processing chain.
//
// One input word contains the samples captured on the rising and falling DCO
// edges.  The two offset-binary codes are averaged in signed space, producing
// one sample per clk_acq cycle for frame averaging.  With the currently
// validated ADC 100 MSPS configuration this is a 50 MSPS functional stream;
// with the final ADC 400 MSPS configuration it becomes the intended 200 MSPS
// processing stream.  The arithmetic and downstream RTL are identical.
module adc_pair_echo_pipeline #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic                         clk_acq,
    input  logic                         rst_acq,
    input  logic                         clk_proc,
    input  logic                         rst_proc,

    input  logic                         adc_ready_acq,
    input  logic                         pair_valid,
    input  logic [13:0]                  sample_rise_u14,
    input  logic [13:0]                  sample_fall_u14,

    input  logic                         start_pulse,
    output logic                         start_accepted,
    output logic                         start_rejected_not_ready,
    output logic                         busy,
    output logic                         done_pulse,
    output logic                         acq_busy,

    input  logic                         baseline_shadow_wr_en,
    input  logic [N_ADDR_W-1:0]          baseline_shadow_wr_addr,
    input  logic signed [15:0]           baseline_shadow_wr_data_q2,
    input  logic                         baseline_commit_pulse,
    output logic                         baseline_active_bank,
    output logic                         baseline_commit_accepted,
    output logic                         baseline_commit_rejected,

    input  logic                         template_shadow_wr_en,
    input  logic [L_ADDR_W-1:0]          template_shadow_wr_addr,
    input  logic signed [15:0]           template_shadow_wr_data_q14,
    input  logic                         template_commit_pulse,
    output logic                         template_active_bank,
    output logic                         template_commit_accepted,
    output logic                         template_commit_rejected,

    input  logic                         result_rd_en,
    input  logic [K_ADDR_W-1:0]          result_rd_addr,
    output logic signed [63:0]           result_rd_data_q16,
    output logic [K_ADDR_W:0]            result_count,

    output logic                         clip_flag_snapshot,
    output logic [31:0]                  average_overflow_count,
    output logic [31:0]                  correlation_overflow_count,

    output logic                         sample_valid_debug,
    output logic [13:0]                  sample_u14_debug,
    output logic                         sample_clip_debug
);

    logic averaged_valid;
    logic [13:0] averaged_sample_u14;
    logic averaged_clip;

    adc_pair_average pair_average_i (
        .clk(clk_acq),
        .rst(rst_acq),
        .in_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .out_valid(averaged_valid),
        .sample_u14(averaged_sample_u14),
        .clip_event(averaged_clip)
    );

    // Readiness crosses separately from the start pulse.  It is used only as
    // an admission guard in the processor domain; data stays in clk_acq.
    (* ASYNC_REG = "TRUE" *) logic [1:0] adc_ready_proc_sync = 2'b00;
    logic guarded_start_pulse;

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            adc_ready_proc_sync <= 2'b00;
            start_rejected_not_ready <= 1'b0;
        end else begin
            adc_ready_proc_sync <= {
                adc_ready_proc_sync[0],
                adc_ready_acq
            };
            start_rejected_not_ready <= start_pulse
                                      && !adc_ready_proc_sync[1];
        end
    end

    assign guarded_start_pulse = start_pulse && adc_ready_proc_sync[1];

    echo_pipeline_top #(
        .N(N),
        .M(M),
        .L(L),
        .K(K),
        .LAG_MIN(LAG_MIN),
        .N_ADDR_W(N_ADDR_W),
        .L_ADDR_W(L_ADDR_W),
        .K_ADDR_W(K_ADDR_W)
    ) pipeline_i (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .start_pulse(guarded_start_pulse),
        .start_accepted(start_accepted),
        .busy(busy),
        .done_pulse(done_pulse),
        .sample_valid(averaged_valid),
        .sample_u14(averaged_sample_u14),
        .sample_clip(averaged_clip),
        .acq_busy(acq_busy),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_active_bank(baseline_active_bank),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_rejected(baseline_commit_rejected),
        .template_shadow_wr_en(template_shadow_wr_en),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .template_commit_pulse(template_commit_pulse),
        .template_active_bank(template_active_bank),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_rejected(template_commit_rejected),
        .result_rd_en(result_rd_en),
        .result_rd_addr(result_rd_addr),
        .result_rd_data_q16(result_rd_data_q16),
        .result_count(result_count),
        .clip_flag_snapshot(clip_flag_snapshot),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count)
    );

    assign sample_valid_debug = averaged_valid;
    assign sample_u14_debug = averaged_sample_u14;
    assign sample_clip_debug = averaged_clip;

endmodule
