`timescale 1ns/1ps

// Complete 100 MHz processing-domain chain:
// average-frame BRAM -> baseline subtraction -> correlation -> result BRAM.
// Baseline and template use active/shadow banks. Commits are accepted only
// when the complete top-level transaction is idle.
module processing_chain #(
    parameter integer N = 1024,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic                         clk_proc,
    input  logic                         rst_proc,
    input  logic                         start_pulse,
    input  logic                         commit_allowed,

    output logic                         avg_rd_en,
    output logic [N_ADDR_W-1:0]          avg_rd_addr,
    input  logic signed [15:0]           avg_rd_data_q2,

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

    output logic                         busy,
    output logic                         done_pulse,
    output logic [31:0]                  corr_overflow_count,
    output logic [K_ADDR_W:0]            result_count
);

    typedef enum logic [2:0] {
        S_IDLE,
        S_BASE_READ,
        S_BASE_DRAIN,
        S_TEMPLATE_READ,
        S_TEMPLATE_DRAIN,
        S_CORR_START,
        S_CORR_RUN
    } state_t;

    state_t state;

    logic [N_ADDR_W-1:0] base_req_addr;
    logic base_rsp_valid;
    logic [N_ADDR_W-1:0] base_rsp_addr;
    logic baseline_rd_en;
    logic signed [15:0] baseline_rd_data_q2;

    logic [L_ADDR_W-1:0] template_req_addr;
    logic template_rsp_valid;
    logic [L_ADDR_W-1:0] template_rsp_addr;
    logic template_rd_en;
    logic signed [15:0] template_rd_data_q14;

    logic diff_valid;
    logic [N_ADDR_W-1:0] diff_addr;
    logic signed [16:0] diff_data_q2;

    logic corr_start;
    logic corr_busy;
    logic corr_done;
    logic corr_result_valid;
    logic [N_ADDR_W-1:0] corr_result_lag;
    logic signed [63:0] corr_result_q16;

    logic result_wr_en;
    logic [K_ADDR_W-1:0] result_wr_addr;

    assign busy = (state != S_IDLE);
    assign avg_rd_en = (state == S_BASE_READ);
    assign avg_rd_addr = base_req_addr;
    assign baseline_rd_en = (state == S_BASE_READ);
    assign template_rd_en = (state == S_TEMPLATE_READ);
    assign corr_start = (state == S_CORR_START);

    assign result_wr_en = corr_result_valid;
    assign result_wr_addr = corr_result_lag - LAG_MIN;

    coeff_shadow_bank #(
        .DEPTH(N),
        .WIDTH(16),
        .ADDR_W(N_ADDR_W)
    ) baseline_bank (
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .processing_idle(commit_allowed && (state == S_IDLE)),
        .shadow_wr_en(baseline_shadow_wr_en),
        .shadow_wr_addr(baseline_shadow_wr_addr),
        .shadow_wr_data(baseline_shadow_wr_data_q2),
        .commit_pulse(baseline_commit_pulse),
        .active_rd_en(baseline_rd_en),
        .active_rd_addr(base_req_addr),
        .active_rd_data(baseline_rd_data_q2),
        .active_bank(baseline_active_bank),
        .commit_accepted(baseline_commit_accepted),
        .commit_rejected(baseline_commit_rejected)
    );

    coeff_shadow_bank #(
        .DEPTH(L),
        .WIDTH(16),
        .ADDR_W(L_ADDR_W)
    ) template_bank (
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .processing_idle(commit_allowed && (state == S_IDLE)),
        .shadow_wr_en(template_shadow_wr_en),
        .shadow_wr_addr(template_shadow_wr_addr),
        .shadow_wr_data(template_shadow_wr_data_q14),
        .commit_pulse(template_commit_pulse),
        .active_rd_en(template_rd_en),
        .active_rd_addr(template_req_addr),
        .active_rd_data(template_rd_data_q14),
        .active_bank(template_active_bank),
        .commit_accepted(template_commit_accepted),
        .commit_rejected(template_commit_rejected)
    );

    baseline_sub #(
        .N(N),
        .ADDR_W(N_ADDR_W)
    ) baseline_sub_i (
        .clk(clk_proc),
        .rst(rst_proc),
        .in_valid(base_rsp_valid),
        .in_addr(base_rsp_addr),
        .measurement_q2(avg_rd_data_q2),
        .baseline_q2(baseline_rd_data_q2),
        .out_valid(diff_valid),
        .out_addr(diff_addr),
        .difference_q2(diff_data_q2)
    );

    corr_mac #(
        .N(N),
        .L(L),
        .K(K),
        .LAG_MIN(LAG_MIN),
        .N_ADDR_W(N_ADDR_W),
        .L_ADDR_W(L_ADDR_W),
        .K_ADDR_W(K_ADDR_W)
    ) corr_mac_i (
        .clk(clk_proc),
        .rst(rst_proc),
        .diff_wr_valid(diff_valid),
        .diff_wr_addr(diff_addr),
        .diff_wr_data_q2(diff_data_q2),
        .template_wr_valid(template_rsp_valid),
        .template_wr_addr(template_rsp_addr),
        .template_wr_data_q14(template_rd_data_q14),
        .start(corr_start),
        .busy(corr_busy),
        .done(corr_done),
        .result_valid(corr_result_valid),
        .result_lag(corr_result_lag),
        .result_q16(corr_result_q16),
        .overflow_count(corr_overflow_count)
    );

    result_bram #(
        .DEPTH(K),
        .ADDR_W(K_ADDR_W),
        .WIDTH(64)
    ) result_store (
        .clk(clk_proc),
        .wr_en(result_wr_en),
        .wr_addr(result_wr_addr),
        .wr_data(corr_result_q16),
        .rd_en(result_rd_en),
        .rd_addr(result_rd_addr),
        .rd_data(result_rd_data_q16)
    );

    initial begin
        if ((LAG_MIN < 0) || ((LAG_MIN + K - 1 + L - 1) >= N))
            $error("processing_chain correlation window is outside the average frame");
    end

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            state <= S_IDLE;
            base_req_addr <= '0;
            base_rsp_valid <= 1'b0;
            base_rsp_addr <= '0;
            template_req_addr <= '0;
            template_rsp_valid <= 1'b0;
            template_rsp_addr <= '0;
            done_pulse <= 1'b0;
            result_count <= '0;
        end else begin
            done_pulse <= 1'b0;

            // These registers align the synchronous memory outputs with the
            // address that generated each read request.
            base_rsp_valid <= (state == S_BASE_READ);
            if (state == S_BASE_READ)
                base_rsp_addr <= base_req_addr;

            template_rsp_valid <= (state == S_TEMPLATE_READ);
            if (state == S_TEMPLATE_READ)
                template_rsp_addr <= template_req_addr;

            if (corr_result_valid)
                result_count <= result_count + 1'b1;

            case (state)
                S_IDLE: begin
                    if (start_pulse) begin
                        base_req_addr <= '0;
                        result_count <= '0;
                        state <= S_BASE_READ;
                    end
                end

                S_BASE_READ: begin
                    if (base_req_addr == N-1) begin
                        state <= S_BASE_DRAIN;
                    end else begin
                        base_req_addr <= base_req_addr + 1'b1;
                    end
                end

                S_BASE_DRAIN: begin
                    if (diff_valid && (diff_addr == N-1)) begin
                        template_req_addr <= '0;
                        state <= S_TEMPLATE_READ;
                    end
                end

                S_TEMPLATE_READ: begin
                    if (template_req_addr == L-1) begin
                        state <= S_TEMPLATE_DRAIN;
                    end else begin
                        template_req_addr <= template_req_addr + 1'b1;
                    end
                end

                S_TEMPLATE_DRAIN: begin
                    if (template_rsp_valid && (template_rsp_addr == L-1))
                        state <= S_CORR_START;
                end

                S_CORR_START: begin
                    state <= S_CORR_RUN;
                end

                S_CORR_RUN: begin
                    if (corr_done) begin
                        done_pulse <= 1'b1;
                        state <= S_IDLE;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule

