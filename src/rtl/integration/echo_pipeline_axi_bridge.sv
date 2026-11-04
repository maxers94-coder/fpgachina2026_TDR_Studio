`timescale 1ns/1ps

// AXI4-Lite register bridge for the echo-processing hardware controller.
//
// Phase 1 exposes identification, configuration, W1P control, status,
// interrupt state, counters and an atomic 64-bit result snapshot.  Baseline
// and template loading are deliberately left for the next integration step;
// their register addresses return SLVERR in this version.
module echo_pipeline_axi_bridge #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer SAMPLE_RATE_HZ = 100_000_000,
    parameter logic [31:0] IP_VERSION = 32'h0001_0001,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 8,
    parameter integer K_ADDR_W = $clog2(K)
) (
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

    output logic                              start_pulse,
    output logic                              clear_status_pulse,
    output logic                              baseline_commit_pulse,
    output logic                              template_commit_pulse,
    output logic                              soft_reset_pulse,
    output logic [K_ADDR_W-1:0]               result_select_addr,

    input  logic [31:0]                       status_word,
    input  logic [31:0]                       transaction_count,
    input  logic [K_ADDR_W:0]                 result_count,
    input  logic [31:0]                       average_overflow_count,
    input  logic [31:0]                       correlation_overflow_count,
    input  logic signed [63:0]                selected_result_q16,

    output logic                              irq_f2p
);

    localparam logic [1:0] AXI_OKAY   = 2'b00;
    localparam logic [1:0] AXI_SLVERR = 2'b10;

    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_IP_ID          = 8'h00;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_VERSION        = 8'h04;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_CONFIG_N_M     = 8'h08;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_CONFIG_L_K     = 8'h0c;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_SAMPLE_RATE    = 8'h10;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_CONTROL        = 8'h14;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_STATUS         = 8'h18;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_IRQ_ENABLE     = 8'h1c;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_IRQ_STATUS     = 8'h20;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_TRANSACTION    = 8'h24;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_RESULT_COUNT   = 8'h28;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_AVG_OVF_COUNT  = 8'h2c;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_CORR_OVF_COUNT = 8'h30;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_BASELINE_ADDR  = 8'h34;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_BASELINE_DATA  = 8'h38;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_TEMPLATE_ADDR  = 8'h3c;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_TEMPLATE_DATA  = 8'h40;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_RESULT_ADDR    = 8'h44;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_RESULT_LO      = 8'h48;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_RESULT_HI      = 8'h4c;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_LAST_ERROR     = 8'h50;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_COEFF_CRC      = 8'h54;
    localparam logic [C_S_AXI_ADDR_WIDTH-1:0] REG_RESULT_VALID   = 8'h58;

    localparam logic [31:0] IP_ID_VALUE = 32'h4543_484f; // "ECHO"
    localparam logic [31:0] CONFIG_N_M_VALUE =
        ((M & 16'hffff) << 16) | (N & 16'hffff);
    localparam logic [31:0] CONFIG_L_K_VALUE =
        ((K & 16'hffff) << 16) | (L & 16'hffff);

    logic [C_S_AXI_ADDR_WIDTH-1:0] awaddr_hold;
    logic [C_S_AXI_DATA_WIDTH-1:0] wdata_hold;
    logic [(C_S_AXI_DATA_WIDTH/8)-1:0] wstrb_hold;
    logic aw_pending;
    logic w_pending;

    logic [31:0] irq_enable;
    logic [31:0] irq_status;
    logic [31:0] last_error;
    logic [31:0] status_word_d;
    logic [31:0] event_bits;

    logic result_capture_pending;
    logic [2:0] result_capture_wait;
    logic signed [63:0] result_snapshot_q16;
    logic result_snapshot_valid;

    logic [31:0] masked_write_data;
    integer byte_index;

    function automatic logic [31:0] apply_wstrb(
        input logic [31:0] previous_value,
        input logic [31:0] new_value,
        input logic [3:0]  write_strobe
    );
        integer lane;
        begin
            apply_wstrb = previous_value;
            for (lane = 0; lane < 4; lane = lane + 1) begin
                if (write_strobe[lane])
                    apply_wstrb[lane*8 +: 8] = new_value[lane*8 +: 8];
            end
        end
    endfunction

    always_comb begin
        masked_write_data = 32'd0;
        for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1) begin
            if (wstrb_hold[byte_index])
                masked_write_data[byte_index*8 +: 8] =
                    wdata_hold[byte_index*8 +: 8];
        end

        event_bits = 32'd0;
        event_bits[0] = status_word[6]  && !status_word_d[6];
        event_bits[1] = status_word[3]  && !status_word_d[3];
        event_bits[2] = status_word[7]  && !status_word_d[7];
        event_bits[3] = (status_word[19] && !status_word_d[19]) ||
                        (status_word[20] && !status_word_d[20]);
    end

    assign s_axi_awready = s_axi_aresetn && !aw_pending && !s_axi_bvalid &&
                           !result_capture_pending;
    assign s_axi_wready  = s_axi_aresetn && !w_pending && !s_axi_bvalid &&
                           !result_capture_pending;
    assign s_axi_arready = s_axi_aresetn && !s_axi_rvalid;
    assign irq_f2p = |(irq_status & irq_enable);

    // Write channel. AW and W are captured independently so the bridge is
    // legal for masters that do not present the two channels together.
    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            awaddr_hold <= '0;
            wdata_hold <= '0;
            wstrb_hold <= '0;
            aw_pending <= 1'b0;
            w_pending <= 1'b0;
            s_axi_bresp <= AXI_OKAY;
            s_axi_bvalid <= 1'b0;
            start_pulse <= 1'b0;
            clear_status_pulse <= 1'b0;
            baseline_commit_pulse <= 1'b0;
            template_commit_pulse <= 1'b0;
            soft_reset_pulse <= 1'b0;
            result_select_addr <= '0;
            result_capture_pending <= 1'b0;
            result_capture_wait <= '0;
            result_snapshot_q16 <= '0;
            result_snapshot_valid <= 1'b0;
            irq_enable <= 32'd0;
            irq_status <= 32'd0;
            last_error <= 32'd0;
            status_word_d <= 32'd0;
        end else begin
            start_pulse <= 1'b0;
            clear_status_pulse <= 1'b0;
            baseline_commit_pulse <= 1'b0;
            template_commit_pulse <= 1'b0;
            soft_reset_pulse <= 1'b0;
            status_word_d <= status_word;

            // Set-dominant event capture prevents a simultaneous W1C write
            // from losing a newly arriving hardware event.
            irq_status <= irq_status | event_bits;

            if (s_axi_awready && s_axi_awvalid) begin
                awaddr_hold <= s_axi_awaddr;
                aw_pending <= 1'b1;
            end

            if (s_axi_wready && s_axi_wvalid) begin
                wdata_hold <= s_axi_wdata;
                wstrb_hold <= s_axi_wstrb;
                w_pending <= 1'b1;
            end

            if (s_axi_bvalid && s_axi_bready)
                s_axi_bvalid <= 1'b0;

            if (result_capture_pending) begin
                if (result_capture_wait != 0) begin
                    result_capture_wait <= result_capture_wait - 1'b1;
                end else begin
                    result_snapshot_q16 <= selected_result_q16;
                    result_snapshot_valid <= 1'b1;
                    result_capture_pending <= 1'b0;
                    s_axi_bresp <= AXI_OKAY;
                    s_axi_bvalid <= 1'b1;
                end
            end else if (!s_axi_bvalid && aw_pending && w_pending) begin
                aw_pending <= 1'b0;
                w_pending <= 1'b0;
                s_axi_bresp <= AXI_OKAY;

                case (awaddr_hold)
                    REG_CONTROL: begin
                        start_pulse <= masked_write_data[0];
                        clear_status_pulse <= masked_write_data[1];
                        baseline_commit_pulse <= masked_write_data[2];
                        template_commit_pulse <= masked_write_data[3];
                        soft_reset_pulse <= masked_write_data[4];
                        if (masked_write_data[1]) begin
                            irq_status <= event_bits;
                            last_error <= 32'd0;
                        end
                        if (masked_write_data[4]) begin
                            irq_status <= event_bits;
                            last_error <= 32'd0;
                            result_snapshot_valid <= 1'b0;
                        end
                        s_axi_bvalid <= 1'b1;
                    end

                    REG_IRQ_ENABLE: begin
                        irq_enable <= apply_wstrb(
                            irq_enable, wdata_hold, wstrb_hold
                        );
                        s_axi_bvalid <= 1'b1;
                    end

                    REG_IRQ_STATUS: begin
                        irq_status <= (irq_status & ~masked_write_data) |
                                      event_bits;
                        s_axi_bvalid <= 1'b1;
                    end

                    REG_RESULT_ADDR: begin
                        if (masked_write_data < K) begin
                            result_select_addr <=
                                masked_write_data[K_ADDR_W-1:0];
                            result_snapshot_valid <= 1'b0;
                            result_capture_pending <= 1'b1;
                            // Includes address-register update plus a
                            // synchronous BRAM read before snapshot capture.
                            result_capture_wait <= 3'd3;
                        end else begin
                            last_error[0] <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                            s_axi_bvalid <= 1'b1;
                        end
                    end

                    // Coefficient write ports are reserved for phase 2.
                    REG_BASELINE_ADDR,
                    REG_BASELINE_DATA,
                    REG_TEMPLATE_ADDR,
                    REG_TEMPLATE_DATA: begin
                        last_error[1] <= 1'b1;
                        s_axi_bresp <= AXI_SLVERR;
                        s_axi_bvalid <= 1'b1;
                    end

                    default: begin
                        last_error[2] <= 1'b1;
                        s_axi_bresp <= AXI_SLVERR;
                        s_axi_bvalid <= 1'b1;
                    end
                endcase
            end
        end
    end

    // Read channel. One outstanding read is supported, as required for the
    // Zynq GP0 AXI4-Lite control path used by this project.
    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            s_axi_rdata <= 32'd0;
            s_axi_rresp <= AXI_OKAY;
            s_axi_rvalid <= 1'b0;
        end else begin
            if (s_axi_rvalid && s_axi_rready)
                s_axi_rvalid <= 1'b0;

            if (s_axi_arready && s_axi_arvalid) begin
                s_axi_rdata <= 32'd0;
                s_axi_rresp <= AXI_OKAY;
                s_axi_rvalid <= 1'b1;

                case (s_axi_araddr)
                    REG_IP_ID:          s_axi_rdata <= IP_ID_VALUE;
                    REG_VERSION:        s_axi_rdata <= IP_VERSION;
                    REG_CONFIG_N_M:     s_axi_rdata <= CONFIG_N_M_VALUE;
                    REG_CONFIG_L_K:     s_axi_rdata <= CONFIG_L_K_VALUE;
                    REG_SAMPLE_RATE:    s_axi_rdata <= SAMPLE_RATE_HZ;
                    REG_CONTROL:        s_axi_rdata <= 32'd0;
                    REG_STATUS:         s_axi_rdata <= status_word;
                    REG_IRQ_ENABLE:     s_axi_rdata <= irq_enable;
                    REG_IRQ_STATUS:     s_axi_rdata <= irq_status;
                    REG_TRANSACTION:    s_axi_rdata <= transaction_count;
                    REG_RESULT_COUNT:   s_axi_rdata <=
                        {{(31-K_ADDR_W){1'b0}}, result_count};
                    REG_AVG_OVF_COUNT:  s_axi_rdata <= average_overflow_count;
                    REG_CORR_OVF_COUNT: s_axi_rdata <= correlation_overflow_count;
                    REG_RESULT_ADDR:    s_axi_rdata <=
                        {{(32-K_ADDR_W){1'b0}}, result_select_addr};
                    REG_RESULT_LO: begin
                        s_axi_rdata <= result_snapshot_q16[31:0];
                        if (!result_snapshot_valid)
                            s_axi_rresp <= AXI_SLVERR;
                    end
                    REG_RESULT_HI: begin
                        s_axi_rdata <= result_snapshot_q16[63:32];
                        if (!result_snapshot_valid)
                            s_axi_rresp <= AXI_SLVERR;
                    end
                    REG_LAST_ERROR:   s_axi_rdata <= last_error;
                    REG_COEFF_CRC:    s_axi_rdata <= 32'd0;
                    REG_RESULT_VALID: s_axi_rdata <= {31'd0, result_snapshot_valid};
                    default: begin
                        s_axi_rdata <= 32'd0;
                        s_axi_rresp <= AXI_SLVERR;
                    end
                endcase
            end
        end
    end

endmodule
