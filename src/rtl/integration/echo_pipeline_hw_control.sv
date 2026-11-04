`timescale 1ns/1ps

// Board-facing controller for the already verified echo-processing chain.
// It supplies deterministic coefficients without a PS:
//   baseline[n] = 0 in Q2
//   template[0] = 1.0 in Q14, template[1..L-1] = 0
// This turns correlation result k into the baseline-subtracted average sample
// at lag k and is therefore a useful hardware continuity test.  The final
// application will replace this loader with PS-written coefficient banks.
module echo_pipeline_hw_control #(
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
    input  logic                         sample_clip,

    input  logic                         start_request,
    input  logic                         clear_status,
    input  logic [K_ADDR_W-1:0]          result_select_addr,

    output logic                         coeff_init_done,
    output logic                         transaction_busy,
    output logic                         acquisition_busy,
    output logic                         done_sticky,
    output logic                         start_accepted_sticky,
    output logic                         start_rejected_sticky,
    output logic [31:0]                  transaction_count,
    output logic [K_ADDR_W:0]            result_count,
    output logic signed [63:0]           selected_result_q16,
    output logic [31:0]                  average_overflow_count,
    output logic [31:0]                  correlation_overflow_count,
    output logic                         clip_flag_snapshot,
    output logic [31:0]                  status_word
);

    typedef enum logic [2:0] {
        LOAD_BASELINE,
        LOAD_TEMPLATE,
        COMMIT_BANKS,
        WAIT_COMMIT,
        READY
    } loader_state_t;

    loader_state_t loader_state;
    logic [N_ADDR_W-1:0] baseline_addr;
    logic [L_ADDR_W-1:0] template_addr;
    logic baseline_wr_en;
    logic template_wr_en;
    logic baseline_commit_pulse;
    logic template_commit_pulse;
    logic baseline_active_bank;
    logic template_active_bank;
    logic baseline_commit_accepted;
    logic template_commit_accepted;
    logic baseline_commit_rejected;
    logic template_commit_rejected;

    logic start_request_d;
    logic start_command_pulse;
    logic start_accepted;
    logic start_rejected_not_ready;
    logic done_pulse;
    logic acq_busy_acq;

    logic sample_valid_debug;
    logic [13:0] sample_u14_debug;
    logic sample_clip_debug;

    (* ASYNC_REG = "TRUE" *) logic [1:0] adc_ready_proc_sync;
    (* ASYNC_REG = "TRUE" *) logic [1:0] acq_busy_proc_sync;

    assign start_command_pulse = start_request && !start_request_d
                               && coeff_init_done;
    assign acquisition_busy = acq_busy_proc_sync[1];

    // The selected result port is always enabled.  The BRAM is synchronous,
    // so VIO shows the requested address after a few processor clocks.
    adc_pair_echo_pipeline #(
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
        .adc_ready_acq(adc_ready_acq),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .start_pulse(start_command_pulse),
        .start_accepted(start_accepted),
        .start_rejected_not_ready(start_rejected_not_ready),
        .busy(transaction_busy),
        .done_pulse(done_pulse),
        .acq_busy(acq_busy_acq),
        .baseline_shadow_wr_en(baseline_wr_en),
        .baseline_shadow_wr_addr(baseline_addr),
        .baseline_shadow_wr_data_q2(16'sd0),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_active_bank(baseline_active_bank),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_rejected(baseline_commit_rejected),
        .template_shadow_wr_en(template_wr_en),
        .template_shadow_wr_addr(template_addr),
        .template_shadow_wr_data_q14(
            (template_addr == '0) ? 16'sd16384 : 16'sd0
        ),
        .template_commit_pulse(template_commit_pulse),
        .template_active_bank(template_active_bank),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_rejected(template_commit_rejected),
        .result_rd_en(1'b1),
        .result_rd_addr(result_select_addr),
        .result_rd_data_q16(selected_result_q16),
        .result_count(result_count),
        .clip_flag_snapshot(clip_flag_snapshot),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .sample_valid_debug(sample_valid_debug),
        .sample_u14_debug(sample_u14_debug),
        .sample_clip_debug(sample_clip_debug)
    );

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            adc_ready_proc_sync <= 2'b00;
            acq_busy_proc_sync <= 2'b00;
        end else begin
            adc_ready_proc_sync <= {adc_ready_proc_sync[0], adc_ready_acq};
            acq_busy_proc_sync <= {acq_busy_proc_sync[0], acq_busy_acq};
        end
    end

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            loader_state <= LOAD_BASELINE;
            baseline_addr <= '0;
            template_addr <= '0;
            baseline_wr_en <= 1'b0;
            template_wr_en <= 1'b0;
            baseline_commit_pulse <= 1'b0;
            template_commit_pulse <= 1'b0;
            coeff_init_done <= 1'b0;
        end else begin
            baseline_wr_en <= 1'b0;
            template_wr_en <= 1'b0;
            baseline_commit_pulse <= 1'b0;
            template_commit_pulse <= 1'b0;

            case (loader_state)
                LOAD_BASELINE: begin
                    baseline_wr_en <= 1'b1;
                    if (baseline_addr == N-1) begin
                        baseline_addr <= '0;
                        template_addr <= '0;
                        loader_state <= LOAD_TEMPLATE;
                    end else begin
                        baseline_addr <= baseline_addr + 1'b1;
                    end
                end

                LOAD_TEMPLATE: begin
                    template_wr_en <= 1'b1;
                    if (template_addr == L-1) begin
                        template_addr <= '0;
                        loader_state <= COMMIT_BANKS;
                    end else begin
                        template_addr <= template_addr + 1'b1;
                    end
                end

                COMMIT_BANKS: begin
                    baseline_commit_pulse <= 1'b1;
                    template_commit_pulse <= 1'b1;
                    loader_state <= WAIT_COMMIT;
                end

                WAIT_COMMIT: begin
                    if (baseline_commit_accepted && template_commit_accepted) begin
                        coeff_init_done <= 1'b1;
                        loader_state <= READY;
                    end
                end

                READY: loader_state <= READY;
                default: loader_state <= LOAD_BASELINE;
            endcase
        end
    end

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            start_request_d <= 1'b0;
            done_sticky <= 1'b0;
            start_accepted_sticky <= 1'b0;
            start_rejected_sticky <= 1'b0;
            transaction_count <= 32'd0;
        end else begin
            start_request_d <= start_request;

            if (clear_status) begin
                done_sticky <= 1'b0;
                start_accepted_sticky <= 1'b0;
                start_rejected_sticky <= 1'b0;
                transaction_count <= 32'd0;
            end else begin
                if (start_request && !start_request_d && !coeff_init_done)
                    start_rejected_sticky <= 1'b1;
                if (start_accepted)
                    start_accepted_sticky <= 1'b1;
                if (start_rejected_not_ready)
                    start_rejected_sticky <= 1'b1;
                if (done_pulse) begin
                    done_sticky <= 1'b1;
                    transaction_count <= transaction_count + 1'b1;
                end
            end
        end
    end

    assign status_word = {
        8'd0,
        loader_state,
        (correlation_overflow_count != 0),
        (average_overflow_count != 0),
        result_count,
        template_active_bank,
        baseline_active_bank,
        clip_flag_snapshot,
        done_sticky,
        acquisition_busy,
        transaction_busy,
        start_rejected_sticky,
        start_accepted_sticky,
        adc_ready_proc_sync[1],
        coeff_init_done
    };

endmodule

