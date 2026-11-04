`timescale 1ns/1ps

// PS-facing phase-2 wrapper: AXI4-Lite coefficient loading, transaction
// control, status/interrupts and atomic result reads around the verified
// ADC-pair echo pipeline.  The existing VIO controller remains untouched.
module echo_pipeline_axi_control_phase2 #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer SAMPLE_RATE_HZ = 200_000_000,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 8,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic                              clk_acq,
    input  logic                              rst_acq,
    input  logic                              adc_ready_acq,
    input  logic                              pair_valid,
    input  logic [13:0]                       sample_rise_u14,
    input  logic [13:0]                       sample_fall_u14,
    input  logic                              sample_clip,
    input  logic                              pulse_ready_acq,
    input  logic                              tx_marker,
    input  logic [31:0]                       frame_meta,
    output logic                              pulse_start_acq,
    output logic [2:0]                        pulse_mode,
    output logic [5:0]                        pulse_width,
    output logic                              pn_enable,

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000" *)
    input  logic                              s_axi_aclk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW" *)
    input  logic                              s_axi_aresetn,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, PROTOCOL AXI4LITE, DATA_WIDTH 32, ADDR_WIDTH 8, FREQ_HZ 100000000, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1" *)
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
    input  logic                              s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
    output logic                              s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
    input  logic [C_S_AXI_DATA_WIDTH-1:0]     s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
    input  logic [(C_S_AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
    input  logic                              s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
    output logic                              s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
    output logic [1:0]                        s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
    output logic                              s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
    input  logic                              s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
    input  logic                              s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
    output logic                              s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
    output logic [C_S_AXI_DATA_WIDTH-1:0]     s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
    output logic [1:0]                        s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
    output logic                              s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
    input  logic                              s_axi_rready,
    (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 irq_f2p INTERRUPT" *)
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME irq_f2p, SENSITIVITY LEVEL_HIGH" *)
    output logic                              irq_f2p
);

    logic start_pulse, clear_status_pulse, soft_reset_pulse;
    logic baseline_commit_pulse, template_commit_pulse;
    logic baseline_shadow_wr_en, template_shadow_wr_en;
    logic [N_ADDR_W-1:0] baseline_shadow_wr_addr;
    logic [L_ADDR_W-1:0] template_shadow_wr_addr;
    logic signed [15:0] baseline_shadow_wr_data_q2;
    logic signed [15:0] template_shadow_wr_data_q14;
    logic [K_ADDR_W-1:0] result_select_addr;
    logic [N_ADDR_W-1:0] average_select_addr;
    logic signed [15:0] selected_average_q2;

    logic baseline_active_bank, template_active_bank;
    logic baseline_commit_accepted, template_commit_accepted;
    logic baseline_commit_rejected, template_commit_rejected;
    logic baseline_coeff_valid, template_coeff_valid, coeff_valid;
    logic transaction_busy, acq_busy_acq, acquisition_busy;
    logic start_accepted, start_rejected_not_ready, done_pulse;
    logic done_sticky, start_accepted_sticky, start_rejected_sticky;
    logic [31:0] transaction_count;
    logic [K_ADDR_W:0] result_count;
    logic signed [63:0] selected_result_q16;
    logic [31:0] average_overflow_count, correlation_overflow_count;
    logic clip_flag_snapshot;
    logic [31:0] status_word;
    logic frame_error_sticky_proc;
    logic [5:0] frames_seen_proc;
    logic average_frame_available_proc;
    logic [2:0] control_state;
    logic start_command_pulse;
    (* ASYNC_REG = "TRUE" *) logic [1:0] adc_ready_proc_sync;
    (* ASYNC_REG = "TRUE" *) logic [1:0] pulse_ready_proc_sync;
    (* ASYNC_REG = "TRUE" *) logic [1:0] acq_busy_proc_sync;

    assign coeff_valid = baseline_coeff_valid && template_coeff_valid;
    assign start_command_pulse = start_pulse && coeff_valid;
    assign acquisition_busy = acq_busy_proc_sync[1];
    assign control_state = coeff_valid ? 3'd4 : 3'd0;

    pulse_pair_echo_pipeline #(
        .N(N), .M(M), .L(L), .K(K), .LAG_MIN(LAG_MIN),
        .N_ADDR_W(N_ADDR_W), .L_ADDR_W(L_ADDR_W), .K_ADDR_W(K_ADDR_W)
    ) pipeline_i (
        .clk_acq(clk_acq), .rst_acq(rst_acq),
        .clk_proc(s_axi_aclk), .rst_proc(!s_axi_aresetn),
        .adc_ready_acq(adc_ready_acq),
        .pulse_ready_acq(pulse_ready_acq), .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip), .tx_marker(tx_marker),
        .frame_meta(frame_meta), .pulse_start_acq(pulse_start_acq),
        .start_pulse(start_command_pulse),
        .clear_error_proc(clear_status_pulse),
        .start_accepted(start_accepted),
        .start_rejected_not_ready(start_rejected_not_ready),
        .busy(transaction_busy), .done_pulse(done_pulse),
        .acq_busy(acq_busy_acq),
        .frame_error_sticky_proc(frame_error_sticky_proc),
        .frames_seen_proc(frames_seen_proc),
        .average_frame_available_proc(average_frame_available_proc),
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
        .result_rd_en(1'b1), .result_rd_addr(result_select_addr),
        .result_rd_data_q16(selected_result_q16), .result_count(result_count),
        .average_debug_rd_addr(average_select_addr),
        .average_debug_rd_data_q2(selected_average_q2),
        .clip_flag_snapshot(clip_flag_snapshot),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count)
    );

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            adc_ready_proc_sync <= 2'b00;
            pulse_ready_proc_sync <= 2'b00;
            acq_busy_proc_sync <= 2'b00;
        end else begin
            adc_ready_proc_sync <= {adc_ready_proc_sync[0],adc_ready_acq};
            pulse_ready_proc_sync <= {pulse_ready_proc_sync[0],pulse_ready_acq};
            acq_busy_proc_sync <= {acq_busy_proc_sync[0], acq_busy_acq};
        end
    end

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            baseline_coeff_valid <= 1'b0;
            template_coeff_valid <= 1'b0;
            done_sticky <= 1'b0;
            start_accepted_sticky <= 1'b0;
            start_rejected_sticky <= 1'b0;
            transaction_count <= 32'd0;
        end else begin
            if (baseline_commit_accepted) baseline_coeff_valid <= 1'b1;
            if (template_commit_accepted) template_coeff_valid <= 1'b1;

            if (clear_status_pulse || soft_reset_pulse) begin
                done_sticky <= 1'b0;
                start_accepted_sticky <= 1'b0;
                start_rejected_sticky <= 1'b0;
                transaction_count <= 32'd0;
            end else begin
                if (start_pulse && !coeff_valid)
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
        7'd0,
        frame_error_sticky_proc,
        control_state,
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
        (adc_ready_proc_sync[1] && pulse_ready_proc_sync[1]),
        coeff_valid
    };

    echo_pipeline_axi_bridge_phase2 #(
        .N(N), .M(M), .L(L), .K(K),
        .SAMPLE_RATE_HZ(SAMPLE_RATE_HZ),
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
        .N_ADDR_W(N_ADDR_W), .L_ADDR_W(L_ADDR_W), .K_ADDR_W(K_ADDR_W)
    ) bridge_i (
        .s_axi_aclk(s_axi_aclk), .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr), .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready), .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb), .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready), .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid), .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr), .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready), .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp), .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .start_pulse(start_pulse), .clear_status_pulse(clear_status_pulse),
        .pulse_mode(pulse_mode), .pulse_width(pulse_width),
        .pn_enable(pn_enable),
        .baseline_commit_pulse(baseline_commit_pulse),
        .template_commit_pulse(template_commit_pulse),
        .soft_reset_pulse(soft_reset_pulse),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .template_shadow_wr_en(template_shadow_wr_en),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .result_select_addr(result_select_addr),
        .average_select_addr(average_select_addr),
        .transaction_busy(transaction_busy),
        .baseline_active_bank(baseline_active_bank),
        .template_active_bank(template_active_bank),
        .baseline_commit_accepted(baseline_commit_accepted),
        .template_commit_accepted(template_commit_accepted),
        .baseline_commit_rejected(baseline_commit_rejected),
        .template_commit_rejected(template_commit_rejected),
        .status_word(status_word), .transaction_count(transaction_count),
        .result_count(result_count),
        .frames_seen(frames_seen_proc),
        .frame_error_sticky(frame_error_sticky_proc),
        .average_frame_available(average_frame_available_proc),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .selected_result_q16(selected_result_q16),
        .selected_average_q2(selected_average_q2),
        .irq_f2p(irq_f2p)
    );

endmodule
