`timescale 1ns/1ps

// P0 serial end-to-end RTL chain. One transaction performs acquisition and
// frame averaging in clk_acq, then processing and result storage in clk_proc.
module echo_pipeline_top #(
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

    input  logic                         start_pulse,
    output logic                         start_accepted,
    output logic                         busy,
    output logic                         done_pulse,

    input  logic                         sample_valid,
    input  logic [13:0]                  sample_u14,
    input  logic                         sample_clip,
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
    output logic [31:0]                  correlation_overflow_count
);

    logic start_acq_pulse;
    logic acq_done_pulse;
    logic acq_done_proc_pulse;
    logic acq_clip_flag;
    logic [31:0] acq_overflow_count;

    logic avg_wr_en;
    logic [N_ADDR_W-1:0] avg_wr_addr;
    logic signed [15:0] avg_wr_data_q2;
    logic avg_rd_en;
    logic [N_ADDR_W-1:0] avg_rd_addr;
    logic signed [15:0] avg_rd_data_q2;

    logic processing_busy;
    logic processing_done_pulse;

    cdc_pulse_toggle start_cdc (
        .src_clk(clk_proc),
        .src_rst(rst_proc),
        .src_pulse(start_accepted),
        .dst_clk(clk_acq),
        .dst_rst(rst_acq),
        .dst_pulse(start_acq_pulse)
    );

    frame_average_bram #(
        .N(N),
        .M(M),
        .ADDR_W(N_ADDR_W),
        .FRAME_W($clog2(M))
    ) frame_average_i (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .start_pulse(start_acq_pulse),
        .sample_valid(sample_valid),
        .sample_u14(sample_u14),
        .sample_clip(sample_clip),
        .busy(acq_busy),
        .group_done_pulse(acq_done_pulse),
        .clip_flag_snapshot(acq_clip_flag),
        .overflow_count(acq_overflow_count),
        .avg_wr_en(avg_wr_en),
        .avg_wr_addr(avg_wr_addr),
        .avg_wr_data_q2(avg_wr_data_q2)
    );

    avg_frame_dc_bram #(
        .DEPTH(N),
        .ADDR_W(N_ADDR_W),
        .WIDTH(16)
    ) average_frame_store (
        .wr_clk(clk_acq),
        .wr_en(avg_wr_en),
        .wr_addr(avg_wr_addr),
        .wr_data(avg_wr_data_q2),
        .rd_clk(clk_proc),
        .rd_en(avg_rd_en),
        .rd_addr(avg_rd_addr),
        .rd_data(avg_rd_data_q2)
    );

    cdc_pulse_toggle done_cdc (
        .src_clk(clk_acq),
        .src_rst(rst_acq),
        .src_pulse(acq_done_pulse),
        .dst_clk(clk_proc),
        .dst_rst(rst_proc),
        .dst_pulse(acq_done_proc_pulse)
    );

    processing_chain #(
        .N(N),
        .L(L),
        .K(K),
        .LAG_MIN(LAG_MIN),
        .N_ADDR_W(N_ADDR_W),
        .L_ADDR_W(L_ADDR_W),
        .K_ADDR_W(K_ADDR_W)
    ) processing_chain_i (
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .start_pulse(acq_done_proc_pulse && busy),
        .commit_allowed(!busy),
        .avg_rd_en(avg_rd_en),
        .avg_rd_addr(avg_rd_addr),
        .avg_rd_data_q2(avg_rd_data_q2),
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
        .busy(processing_busy),
        .done_pulse(processing_done_pulse),
        .corr_overflow_count(correlation_overflow_count),
        .result_count(result_count)
    );

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            start_accepted <= 1'b0;
            busy <= 1'b0;
            done_pulse <= 1'b0;
            clip_flag_snapshot <= 1'b0;
            average_overflow_count <= '0;
        end else begin
            start_accepted <= 1'b0;
            done_pulse <= 1'b0;

            if (start_pulse && !busy) begin
                start_accepted <= 1'b1;
                busy <= 1'b1;
            end

            if (acq_done_proc_pulse) begin
                clip_flag_snapshot <= acq_clip_flag;
                average_overflow_count <= acq_overflow_count;
            end

            if (processing_done_pulse) begin
                busy <= 1'b0;
                done_pulse <= 1'b1;
            end
        end
    end

endmodule

