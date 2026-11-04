`timescale 1ns/1ps

// Phase-1 PS-facing wrapper. It retains the already validated deterministic
// coefficient loader inside echo_pipeline_hw_control and replaces only the
// VIO control/result path with AXI4-Lite.
module echo_pipeline_axi_control #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer SAMPLE_RATE_HZ = 100_000_000,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 8,
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic                              clk_acq,
    input  logic                              rst_acq,
    input  logic                              adc_ready_acq,
    input  logic                              pair_valid,
    input  logic [13:0]                       sample_rise_u14,
    input  logic [13:0]                       sample_fall_u14,
    input  logic                              sample_clip,

    input  logic                              s_axi_aclk,
    input  logic                              s_axi_aresetn,
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_awaddr,
    input  logic                              s_axi_awvalid,
    output logic                              s_axi_awready,
    input  logic [C_S_AXI_DATA_WIDTH-1:0]     s_axi_wdata,
    input  logic [(C_S_AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    input  logic                              s_axi_wvalid,
    output logic                              s_axi_wready,
    output logic [1:0]                        s_axi_bresp,
    output logic                              s_axi_bvalid,
    input  logic                              s_axi_bready,
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_araddr,
    input  logic                              s_axi_arvalid,
    output logic                              s_axi_arready,
    output logic [C_S_AXI_DATA_WIDTH-1:0]     s_axi_rdata,
    output logic [1:0]                        s_axi_rresp,
    output logic                              s_axi_rvalid,
    input  logic                              s_axi_rready,
    output logic                              irq_f2p
);

    logic start_pulse;
    logic clear_status_pulse;
    logic baseline_commit_pulse_unused;
    logic template_commit_pulse_unused;
    logic soft_reset_pulse_unused;
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
        .N(N), .M(M), .L(L), .K(K), .LAG_MIN(LAG_MIN)
    ) control_i (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_proc(s_axi_aclk),
        .rst_proc(!s_axi_aresetn),
        .adc_ready_acq(adc_ready_acq),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip),
        .start_request(start_pulse),
        .clear_status(clear_status_pulse),
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

    echo_pipeline_axi_bridge #(
        .N(N), .M(M), .L(L), .K(K),
        .SAMPLE_RATE_HZ(SAMPLE_RATE_HZ),
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) bridge_i (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .start_pulse(start_pulse),
        .clear_status_pulse(clear_status_pulse),
        .baseline_commit_pulse(baseline_commit_pulse_unused),
        .template_commit_pulse(template_commit_pulse_unused),
        .soft_reset_pulse(soft_reset_pulse_unused),
        .result_select_addr(result_select_addr),
        .status_word(status_word),
        .transaction_count(transaction_count),
        .result_count(result_count),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .selected_result_q16(selected_result_q16),
        .irq_f2p(irq_f2p)
    );

endmodule
