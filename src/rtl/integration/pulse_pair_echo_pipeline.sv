`timescale 1ns/1ps

// One PS START arms 32 numbered pulse frames. One DCO clock carries two
// successive physical ADC samples. These lanes remain separate through the
// 32-frame average, and are interleaved only on the processing RAM read port.
module pulse_pair_echo_pipeline #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic clk_acq, rst_acq, clk_proc, rst_proc,
    input  logic adc_ready_acq, pulse_ready_acq, pair_valid,
    input  logic [13:0] sample_rise_u14, sample_fall_u14,
    input  logic sample_clip, tx_marker,
    input  logic [31:0] frame_meta,
    output logic pulse_start_acq,
    input  logic start_pulse,
    input  logic clear_error_proc,
    output logic start_accepted, start_rejected_not_ready,
    output logic busy, done_pulse, acq_busy,
    output logic frame_error_sticky_proc,
    output logic [5:0] frames_seen_proc,
    output logic average_frame_available_proc,
    input  logic baseline_shadow_wr_en,
    input  logic [N_ADDR_W-1:0] baseline_shadow_wr_addr,
    input  logic signed [15:0] baseline_shadow_wr_data_q2,
    input  logic baseline_commit_pulse,
    output logic baseline_active_bank,
    output logic baseline_commit_accepted, baseline_commit_rejected,
    input  logic template_shadow_wr_en,
    input  logic [L_ADDR_W-1:0] template_shadow_wr_addr,
    input  logic signed [15:0] template_shadow_wr_data_q14,
    input  logic template_commit_pulse,
    output logic template_active_bank,
    output logic template_commit_accepted, template_commit_rejected,
    input  logic result_rd_en,
    input  logic [K_ADDR_W-1:0] result_rd_addr,
    output logic signed [63:0] result_rd_data_q16,
    output logic [K_ADDR_W:0] result_count,
    input  logic [N_ADDR_W-1:0] average_debug_rd_addr,
    output logic signed [15:0] average_debug_rd_data_q2,
    output logic clip_flag_snapshot,
    output logic [31:0] average_overflow_count, correlation_overflow_count
);
    localparam integer PAIRS = N/2;
    localparam integer PAIR_W = $clog2(PAIRS);
    logic start_acq_pulse, acq_done_pulse, acq_done_proc_pulse;
    logic acq_error_pulse, acq_error_proc_pulse, acq_error_sticky;
    logic [5:0] acq_frames_seen;
    logic [2:0] launch_delay;
    logic rise_wr_en, fall_wr_en;
    logic [PAIR_W-1:0] rise_wr_addr, fall_wr_addr;
    logic signed [15:0] rise_wr_data, fall_wr_data;
    logic avg_rd_en;
    logic [N_ADDR_W-1:0] avg_rd_addr;
    logic avg_mem_rd_en;
    logic [N_ADDR_W-1:0] avg_mem_rd_addr;
    logic signed [15:0] avg_rd_data;
    logic acq_clip;
    logic [31:0] acq_overflow;
    logic processing_busy, processing_done;
    (* ASYNC_REG = "TRUE" *) logic [1:0] ready_sync;
    (* ASYNC_REG = "TRUE" *) logic [1:0] pulse_ready_sync;
    (* ASYNC_REG = "TRUE" *) logic [5:0] frames_sync_1, frames_sync_2;

    initial if (N != 1024 || M != 32) $fatal(1, "Pulse pair path needs N=1024 M=32");

    cdc_pulse_toggle start_cdc (
        .src_clk(clk_proc), .src_rst(rst_proc), .src_pulse(start_accepted),
        .dst_clk(clk_acq), .dst_rst(rst_acq), .dst_pulse(start_acq_pulse)
    );
    // Arm the frame accumulators before starting the source in the DAC domain.
    always_ff @(posedge clk_acq) begin
        if (rst_acq) begin
            launch_delay <= '0;
            pulse_start_acq <= 1'b0;
        end else begin
            pulse_start_acq <= 1'b0;
            if (start_acq_pulse) launch_delay <= 3'd4;
            else if (launch_delay != 0) begin
                launch_delay <= launch_delay - 1'b1;
                if (launch_delay == 1) pulse_start_acq <= 1'b1;
            end
        end
    end

    frame_average_pair_bram #(.PAIRS(PAIRS), .M(M)) average_i (
        .clk_acq(clk_acq), .rst_acq(rst_acq), .start_pulse(start_acq_pulse),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14), .pair_valid(pair_valid),
        .sample_clip(sample_clip), .tx_marker(tx_marker),
        .frame_meta(frame_meta), .busy(acq_busy),
        .group_done_pulse(acq_done_pulse),
        .frame_error_pulse(acq_error_pulse),
        .frame_error_sticky(acq_error_sticky),
        .frames_seen(acq_frames_seen),
        .clip_flag_snapshot(acq_clip), .overflow_count(acq_overflow),
        .rise_wr_en(rise_wr_en), .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data),
        .fall_wr_en(fall_wr_en), .fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data)
    );
`ifdef SYNTHESIS
    // Trigger on frame_meta[10] for the first pair, [11] for the last pair,
    // or on either average write enable to compare the interleaved result.
    ila_echo_200 debug_i (
        .clk(clk_acq),
        .probe0(sample_rise_u14), .probe1(sample_fall_u14),
        .probe2(frame_meta),
        .probe3({pair_valid,tx_marker,acq_error_sticky,
                 acq_frames_seen,rise_wr_en,fall_wr_en}),
        .probe4({rise_wr_addr,fall_wr_addr,
                 rise_wr_data,fall_wr_data})
    );
`endif
    avg_frame_pair_dc_bram #(.PAIRS(PAIRS)) average_store_i (
        .wr_clk(clk_acq),
        .rise_wr_en(rise_wr_en), .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data),
        .fall_wr_en(fall_wr_en), .fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data),
        .rd_clk(clk_proc), .rd_en(avg_mem_rd_en),
        .rd_addr(avg_mem_rd_addr),
        .rd_data_q2(avg_rd_data)
    );
    assign avg_mem_rd_en = avg_rd_en || !busy;
    assign avg_mem_rd_addr = busy ? avg_rd_addr : average_debug_rd_addr;
    assign average_debug_rd_data_q2 = avg_rd_data;
    cdc_pulse_toggle done_cdc (
        .src_clk(clk_acq), .src_rst(rst_acq), .src_pulse(acq_done_pulse),
        .dst_clk(clk_proc), .dst_rst(rst_proc), .dst_pulse(acq_done_proc_pulse)
    );
    cdc_pulse_toggle error_cdc (
        .src_clk(clk_acq), .src_rst(rst_acq), .src_pulse(acq_error_pulse),
        .dst_clk(clk_proc), .dst_rst(rst_proc), .dst_pulse(acq_error_proc_pulse)
    );

    processing_chain #(
        .N(N), .L(L), .K(K), .LAG_MIN(LAG_MIN),
        .N_ADDR_W(N_ADDR_W), .L_ADDR_W(L_ADDR_W), .K_ADDR_W(K_ADDR_W)
    ) processing_i (
        .clk_proc(clk_proc), .rst_proc(rst_proc),
        .start_pulse(acq_done_proc_pulse && busy),
        .commit_allowed(!busy),
        .avg_rd_en(avg_rd_en), .avg_rd_addr(avg_rd_addr),
        .avg_rd_data_q2(avg_rd_data),
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
        .result_rd_en(result_rd_en), .result_rd_addr(result_rd_addr),
        .result_rd_data_q16(result_rd_data_q16),
        .result_count(result_count), .busy(processing_busy),
        .done_pulse(processing_done),
        .corr_overflow_count(correlation_overflow_count)
    );

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            ready_sync <= '0;
            pulse_ready_sync <= '0;
            frames_sync_1 <= '0;
            frames_sync_2 <= '0;
            start_accepted <= 1'b0;
            start_rejected_not_ready <= 1'b0;
            busy <= 1'b0;
            done_pulse <= 1'b0;
            frame_error_sticky_proc <= 1'b0;
            frames_seen_proc <= '0;
            average_frame_available_proc <= 1'b0;
            clip_flag_snapshot <= 1'b0;
            average_overflow_count <= '0;
        end else begin
            ready_sync <= {ready_sync[0], adc_ready_acq};
            pulse_ready_sync <= {pulse_ready_sync[0], pulse_ready_acq};
            frames_sync_1 <= acq_frames_seen;
            frames_sync_2 <= frames_sync_1;
            start_accepted <= 1'b0;
            start_rejected_not_ready <= 1'b0;
            done_pulse <= 1'b0;
            if (start_pulse) begin
                if (!ready_sync[1] || !pulse_ready_sync[1])
                    start_rejected_not_ready <= 1'b1;
                else if (!busy) begin
                    start_accepted <= 1'b1;
                    busy <= 1'b1;
                    frame_error_sticky_proc <= 1'b0;
                    frames_seen_proc <= '0;
                    average_frame_available_proc <= 1'b0;
                end
            end
            if (clear_error_proc) frame_error_sticky_proc <= 1'b0;
            if (acq_done_proc_pulse && busy) begin
                average_frame_available_proc <= 1'b1;
                frames_seen_proc <= frames_sync_2;
                clip_flag_snapshot <= acq_clip;
                average_overflow_count <= acq_overflow;
            end
            if (acq_error_proc_pulse && busy) begin
                average_frame_available_proc <= 1'b0;
                busy <= 1'b0;
                frame_error_sticky_proc <= 1'b1;
                frames_seen_proc <= frames_sync_2;
            end
            if (processing_done && busy) begin
                busy <= 1'b0;
                done_pulse <= 1'b1;
            end
        end
    end
endmodule
