`timescale 1ns/1ps

// AXI4-Lite phase-2 bridge with checked baseline/template shadow loading.
// Tables are committable only after a contiguous write from address zero.
// CRC-32 processes each 16-bit coefficient low byte first (little-endian).
module echo_pipeline_axi_bridge_phase2 #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer SAMPLE_RATE_HZ = 200_000_000,
    parameter logic [31:0] IP_VERSION = 32'h0003_0002,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 8,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
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
    output logic [2:0]                        pulse_mode,
    output logic [5:0]                        pulse_width,
    output logic                              pn_enable,
    output logic                              clear_status_pulse,
    output logic                              baseline_commit_pulse,
    output logic                              template_commit_pulse,
    output logic                              soft_reset_pulse,
    output logic                              baseline_shadow_wr_en,
    output logic [N_ADDR_W-1:0]               baseline_shadow_wr_addr,
    output logic signed [15:0]                baseline_shadow_wr_data_q2,
    output logic                              template_shadow_wr_en,
    output logic [L_ADDR_W-1:0]               template_shadow_wr_addr,
    output logic signed [15:0]                template_shadow_wr_data_q14,
    output logic [K_ADDR_W-1:0]               result_select_addr,
    output logic [N_ADDR_W-1:0]               average_select_addr,

    input  logic                              transaction_busy,
    input  logic                              baseline_active_bank,
    input  logic                              template_active_bank,
    input  logic                              baseline_commit_accepted,
    input  logic                              template_commit_accepted,
    input  logic                              baseline_commit_rejected,
    input  logic                              template_commit_rejected,
    input  logic [31:0]                       status_word,
    input  logic [31:0]                       transaction_count,
    input  logic [K_ADDR_W:0]                 result_count,
    input  logic [5:0]                        frames_seen,
    input  logic                              frame_error_sticky,
    input  logic                              average_frame_available,
    input  logic [31:0]                       average_overflow_count,
    input  logic [31:0]                       correlation_overflow_count,
    input  logic signed [63:0]                selected_result_q16,
    input  logic signed [15:0]                selected_average_q2,
    output logic                              irq_f2p
);

    localparam logic [1:0] AXI_OKAY   = 2'b00;
    localparam logic [1:0] AXI_SLVERR = 2'b10;
    localparam logic [7:0] REG_IP_ID           = 8'h00;
    localparam logic [7:0] REG_VERSION         = 8'h04;
    localparam logic [7:0] REG_CONFIG_N_M      = 8'h08;
    localparam logic [7:0] REG_CONFIG_L_K      = 8'h0c;
    localparam logic [7:0] REG_SAMPLE_RATE     = 8'h10;
    localparam logic [7:0] REG_CONTROL         = 8'h14;
    localparam logic [7:0] REG_STATUS          = 8'h18;
    localparam logic [7:0] REG_IRQ_ENABLE      = 8'h1c;
    localparam logic [7:0] REG_IRQ_STATUS      = 8'h20;
    localparam logic [7:0] REG_TRANSACTION     = 8'h24;
    localparam logic [7:0] REG_RESULT_COUNT    = 8'h28;
    localparam logic [7:0] REG_AVG_OVF_COUNT   = 8'h2c;
    localparam logic [7:0] REG_CORR_OVF_COUNT  = 8'h30;
    localparam logic [7:0] REG_BASELINE_ADDR   = 8'h34;
    localparam logic [7:0] REG_BASELINE_DATA   = 8'h38;
    localparam logic [7:0] REG_TEMPLATE_ADDR   = 8'h3c;
    localparam logic [7:0] REG_TEMPLATE_DATA   = 8'h40;
    localparam logic [7:0] REG_RESULT_ADDR     = 8'h44;
    localparam logic [7:0] REG_RESULT_LO       = 8'h48;
    localparam logic [7:0] REG_RESULT_HI       = 8'h4c;
    localparam logic [7:0] REG_LAST_ERROR      = 8'h50;
    localparam logic [7:0] REG_COEFF_CRC       = 8'h54;
    localparam logic [7:0] REG_RESULT_VALID    = 8'h58;
    localparam logic [7:0] REG_BASELINE_COUNT  = 8'h5c;
    localparam logic [7:0] REG_TEMPLATE_COUNT  = 8'h60;
    localparam logic [7:0] REG_BASELINE_CRC    = 8'h64;
    localparam logic [7:0] REG_TEMPLATE_CRC    = 8'h68;
    localparam logic [7:0] REG_COEFF_STATUS    = 8'h6c;
    localparam logic [7:0] REG_CAPABILITIES    = 8'h70;
    localparam logic [7:0] REG_PULSE_CONFIG    = 8'h74;
    localparam logic [7:0] REG_FRAME_CONFIG    = 8'h78;
    localparam logic [7:0] REG_PULSE_STATUS    = 8'h7c;
    localparam logic [7:0] REG_FRAME_COUNT     = 8'h80;
    localparam logic [7:0] REG_PAIR_RATE       = 8'h84;
    localparam logic [7:0] REG_AVERAGE_ADDR    = 8'h88;
    localparam logic [7:0] REG_AVERAGE_DATA    = 8'h8c;
    localparam logic [7:0] REG_AVERAGE_VALID   = 8'h90;
    localparam logic [7:0] REG_WAVEFORM_CONFIG = 8'h94;
    localparam logic [7:0] REG_PN_INFO         = 8'h98;
    localparam logic [7:0] REG_PN_SEED         = 8'h9c;
    localparam logic [7:0] REG_PN_AMPLITUDE    = 8'ha0;

    localparam integer ERR_RESULT_ADDR       = 0;
    localparam integer ERR_COEFF_ADDR        = 1;
    localparam integer ERR_ILLEGAL_WRITE     = 2;
    localparam integer ERR_COEFF_BUSY        = 3;
    localparam integer ERR_BASELINE_LENGTH   = 4;
    localparam integer ERR_TEMPLATE_LENGTH   = 5;
    localparam integer ERR_COEFF_SEQUENCE    = 6;
    localparam integer ERR_COMMIT_REJECTED   = 7;
    localparam integer ERR_FRAME_ALIGNMENT   = 8;
    localparam integer ERR_PULSE_CONFIG      = 9;

    logic [C_S_AXI_ADDR_WIDTH-1:0] awaddr_hold;
    logic [31:0] wdata_hold;
    logic [3:0] wstrb_hold;
    logic aw_pending, w_pending;
    logic [31:0] irq_enable, irq_status, last_error, status_word_d;
    logic [31:0] event_bits;
    logic error_event_pulse;

    logic [N_ADDR_W-1:0] baseline_addr_ptr;
    logic [L_ADDR_W-1:0] template_addr_ptr;
    logic [N_ADDR_W:0] baseline_write_count;
    logic [L_ADDR_W:0] template_write_count;
    logic baseline_sequence_valid, template_sequence_valid;
    logic baseline_load_complete, template_load_complete;
    logic [31:0] baseline_crc_state, template_crc_state;
    logic baseline_commit_accepted_sticky, template_commit_accepted_sticky;
    logic baseline_commit_rejected_sticky, template_commit_rejected_sticky;

    logic result_capture_pending;
    logic [2:0] result_capture_wait;
    logic signed [63:0] result_snapshot_q16;
    logic result_snapshot_valid;
    logic average_capture_pending, average_snapshot_valid;
    logic [2:0] average_capture_wait;
    logic signed [15:0] average_snapshot_q2;
    logic [31:0] masked_write_data, coeff_status_word;
    logic [31:0] pulse_config_word, proposed_pulse_config;
    logic [31:0] proposed_waveform_config;
    integer byte_index;

    function automatic logic [31:0] apply_wstrb(
        input logic [31:0] old_value,
        input logic [31:0] new_value,
        input logic [3:0] strobe
    );
        integer lane;
        begin
            apply_wstrb = old_value;
            for (lane = 0; lane < 4; lane = lane + 1)
                if (strobe[lane])
                    apply_wstrb[lane*8 +: 8] = new_value[lane*8 +: 8];
        end
    endfunction

    function automatic logic [31:0] crc32_byte(
        input logic [31:0] crc_in,
        input logic [7:0] data_in
    );
        logic [31:0] crc;
        integer bit_index;
        begin
            crc = crc_in ^ {24'd0, data_in};
            for (bit_index = 0; bit_index < 8; bit_index = bit_index + 1)
                if (crc[0]) crc = (crc >> 1) ^ 32'hedb8_8320;
                else crc = crc >> 1;
            crc32_byte = crc;
        end
    endfunction

    function automatic logic [31:0] crc32_coeff16(
        input logic [31:0] crc_in,
        input logic [15:0] coeff
    );
        logic [31:0] after_low;
        begin
            after_low = crc32_byte(crc_in, coeff[7:0]);
            crc32_coeff16 = crc32_byte(after_low, coeff[15:8]);
        end
    endfunction

    always_comb begin
        masked_write_data = 32'd0;
        for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1)
            if (wstrb_hold[byte_index])
                masked_write_data[byte_index*8 +: 8] = wdata_hold[byte_index*8 +: 8];

        event_bits = 32'd0;
        event_bits[0] = status_word[6] && !status_word_d[6];
        event_bits[1] = (status_word[3] && !status_word_d[3]) ||
                        error_event_pulse || baseline_commit_rejected ||
                        template_commit_rejected ||
                        (frame_error_sticky && !status_word_d[24]);
        event_bits[2] = status_word[7] && !status_word_d[7];
        event_bits[3] = (status_word[19] && !status_word_d[19]) ||
                        (status_word[20] && !status_word_d[20]);

        coeff_status_word = 32'd0;
        coeff_status_word[0] = baseline_load_complete;
        coeff_status_word[1] = template_load_complete;
        coeff_status_word[2] = baseline_commit_accepted_sticky;
        coeff_status_word[3] = template_commit_accepted_sticky;
        coeff_status_word[4] = baseline_commit_rejected_sticky;
        coeff_status_word[5] = template_commit_rejected_sticky;
        coeff_status_word[6] = transaction_busy;
        coeff_status_word[7] = status_word[0];
        coeff_status_word[8] = baseline_active_bank;
        coeff_status_word[9] = template_active_bank;
        proposed_pulse_config = apply_wstrb(pulse_config_word,
                                           wdata_hold, wstrb_hold);
    end

    assign s_axi_awready = s_axi_aresetn && !aw_pending && !s_axi_bvalid &&
                           !result_capture_pending && !average_capture_pending;
    assign s_axi_wready = s_axi_aresetn && !w_pending && !s_axi_bvalid &&
                          !result_capture_pending && !average_capture_pending;
    assign s_axi_arready = s_axi_aresetn && !s_axi_rvalid;
    assign irq_f2p = |(irq_status & irq_enable);
    assign pulse_mode = pulse_config_word[2:0];
    assign pulse_width = pulse_config_word[13:8];
    assign proposed_waveform_config = apply_wstrb({31'd0,pn_enable}, wdata_hold, wstrb_hold);

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            awaddr_hold <= '0; wdata_hold <= '0; wstrb_hold <= '0;
            aw_pending <= 1'b0; w_pending <= 1'b0;
            s_axi_bresp <= AXI_OKAY; s_axi_bvalid <= 1'b0;
            start_pulse <= 1'b0; clear_status_pulse <= 1'b0;
            baseline_commit_pulse <= 1'b0; template_commit_pulse <= 1'b0;
            soft_reset_pulse <= 1'b0;
            baseline_shadow_wr_en <= 1'b0; baseline_shadow_wr_addr <= '0;
            baseline_shadow_wr_data_q2 <= '0;
            template_shadow_wr_en <= 1'b0; template_shadow_wr_addr <= '0;
            template_shadow_wr_data_q14 <= '0;
            result_select_addr <= '0;
            average_select_addr <= '0;
            baseline_addr_ptr <= '0; template_addr_ptr <= '0;
            baseline_write_count <= '0; template_write_count <= '0;
            baseline_sequence_valid <= 1'b0; template_sequence_valid <= 1'b0;
            baseline_load_complete <= 1'b0; template_load_complete <= 1'b0;
            baseline_crc_state <= 32'hffff_ffff;
            template_crc_state <= 32'hffff_ffff;
            baseline_commit_accepted_sticky <= 1'b0;
            template_commit_accepted_sticky <= 1'b0;
            baseline_commit_rejected_sticky <= 1'b0;
            template_commit_rejected_sticky <= 1'b0;
            result_capture_pending <= 1'b0; result_capture_wait <= '0;
            result_snapshot_q16 <= '0; result_snapshot_valid <= 1'b0;
            average_capture_pending <= 1'b0;
            average_capture_wait <= '0;
            average_snapshot_q2 <= '0;
            average_snapshot_valid <= 1'b0;
            irq_enable <= 32'd0; irq_status <= 32'd0; last_error <= 32'd0;
            status_word_d <= 32'd0; error_event_pulse <= 1'b0;
            pulse_config_word <= 32'h0000_0405;
            pn_enable <= 1'b0;
        end else begin
            start_pulse <= 1'b0; clear_status_pulse <= 1'b0;
            baseline_commit_pulse <= 1'b0; template_commit_pulse <= 1'b0;
            soft_reset_pulse <= 1'b0;
            baseline_shadow_wr_en <= 1'b0; template_shadow_wr_en <= 1'b0;
            error_event_pulse <= 1'b0;
            status_word_d <= status_word;
            if (frame_error_sticky && !clear_status_pulse)
                last_error[ERR_FRAME_ALIGNMENT] <= 1'b1;
            irq_status <= irq_status | event_bits;

            if (baseline_commit_accepted) begin
                baseline_load_complete <= 1'b0;
                baseline_commit_accepted_sticky <= 1'b1;
            end
            if (template_commit_accepted) begin
                template_load_complete <= 1'b0;
                template_commit_accepted_sticky <= 1'b1;
            end
            if (baseline_commit_rejected || template_commit_rejected) begin
                if (baseline_commit_rejected)
                    baseline_commit_rejected_sticky <= 1'b1;
                if (template_commit_rejected)
                    template_commit_rejected_sticky <= 1'b1;
                last_error[ERR_COMMIT_REJECTED] <= 1'b1;
                error_event_pulse <= 1'b1;
            end

            if (s_axi_awready && s_axi_awvalid) begin
                awaddr_hold <= s_axi_awaddr; aw_pending <= 1'b1;
            end
            if (s_axi_wready && s_axi_wvalid) begin
                wdata_hold <= s_axi_wdata; wstrb_hold <= s_axi_wstrb;
                w_pending <= 1'b1;
            end
            if (s_axi_bvalid && s_axi_bready) s_axi_bvalid <= 1'b0;

            if (average_capture_pending) begin
                if (average_capture_wait != 0)
                    average_capture_wait <= average_capture_wait - 1'b1;
                else begin
                    average_snapshot_q2 <= selected_average_q2;
                    average_snapshot_valid <= 1'b1;
                    average_capture_pending <= 1'b0;
                    s_axi_bresp <= AXI_OKAY; s_axi_bvalid <= 1'b1;
                end
            end else if (result_capture_pending) begin
                if (result_capture_wait != 0)
                    result_capture_wait <= result_capture_wait - 1'b1;
                else begin
                    result_snapshot_q16 <= selected_result_q16;
                    result_snapshot_valid <= 1'b1;
                    result_capture_pending <= 1'b0;
                    s_axi_bresp <= AXI_OKAY; s_axi_bvalid <= 1'b1;
                end
            end else if (!s_axi_bvalid && aw_pending && w_pending) begin
                aw_pending <= 1'b0; w_pending <= 1'b0;
                s_axi_bresp <= AXI_OKAY;
                case (awaddr_hold)
                    REG_CONTROL: begin
                        start_pulse <= masked_write_data[0];
                        if (masked_write_data[0]) average_snapshot_valid <= 1'b0;
                        clear_status_pulse <= masked_write_data[1];
                        if (masked_write_data[2]) begin
                            if (transaction_busy) begin
                                last_error[ERR_COEFF_BUSY] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else if (!baseline_load_complete) begin
                                last_error[ERR_BASELINE_LENGTH] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else baseline_commit_pulse <= 1'b1;
                        end
                        if (masked_write_data[3]) begin
                            if (transaction_busy) begin
                                last_error[ERR_COEFF_BUSY] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else if (!template_load_complete) begin
                                last_error[ERR_TEMPLATE_LENGTH] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else template_commit_pulse <= 1'b1;
                        end
                        if (masked_write_data[4]) begin
                            if (transaction_busy) begin
                                last_error[ERR_COEFF_BUSY] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else soft_reset_pulse <= 1'b1;
                        end
                        if (masked_write_data[1]) begin
                            irq_status <= event_bits; last_error <= 32'd0;
                            baseline_commit_accepted_sticky <= 1'b0;
                            template_commit_accepted_sticky <= 1'b0;
                            baseline_commit_rejected_sticky <= 1'b0;
                            template_commit_rejected_sticky <= 1'b0;
                        end
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_IRQ_ENABLE: begin
                        irq_enable <= apply_wstrb(irq_enable, wdata_hold, wstrb_hold);
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_PULSE_CONFIG: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                        end else if ((pn_enable && proposed_pulse_config[2:0] != 3'd5) ||
                                    (proposed_pulse_config[2:0] != 3'd2 &&
                                     proposed_pulse_config[2:0] < 3'd5 ||
                                     proposed_pulse_config[2:0] > 3'd7 ||
                                     proposed_pulse_config[13:8] < 6'd1 ||
                                     proposed_pulse_config[13:8] > 6'd32 ||
                                     (proposed_pulse_config[2:0] == 3'd7 &&
                                      proposed_pulse_config[8]))) begin
                            last_error[ERR_PULSE_CONFIG] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                        end else pulse_config_word <= proposed_pulse_config;
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_IRQ_STATUS: begin
                        irq_status <= (irq_status & ~masked_write_data) | event_bits;
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_WAVEFORM_CONFIG: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                        end else if (proposed_waveform_config > 1 ||
                                     (proposed_waveform_config[0] && pulse_config_word[2:0] != 3'd5)) begin
                            last_error[ERR_PULSE_CONFIG] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                        end else pn_enable <= proposed_waveform_config[0];
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_BASELINE_ADDR: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else if (masked_write_data >= N) begin
                            last_error[ERR_COEFF_ADDR] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else begin
                            baseline_addr_ptr <= masked_write_data[N_ADDR_W-1:0];
                            baseline_write_count <= '0;
                            baseline_sequence_valid <= (masked_write_data == 0);
                            baseline_load_complete <= 1'b0;
                            baseline_crc_state <= 32'hffff_ffff;
                        end
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_BASELINE_DATA: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else if (!wstrb_hold[0] || !wstrb_hold[1] ||
                                     !baseline_sequence_valid || baseline_load_complete) begin
                            last_error[ERR_COEFF_SEQUENCE] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else begin
                            baseline_shadow_wr_en <= 1'b1;
                            baseline_shadow_wr_addr <= baseline_addr_ptr;
                            baseline_shadow_wr_data_q2 <= wdata_hold[15:0];
                            baseline_crc_state <= crc32_coeff16(baseline_crc_state, wdata_hold[15:0]);
                            if ((baseline_addr_ptr == N-1) && (baseline_write_count == N-1)) begin
                                baseline_write_count <= N; baseline_load_complete <= 1'b1;
                            end else if (baseline_addr_ptr == N-1) begin
                                baseline_sequence_valid <= 1'b0;
                                last_error[ERR_COEFF_SEQUENCE] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else begin
                                baseline_addr_ptr <= baseline_addr_ptr + 1'b1;
                                baseline_write_count <= baseline_write_count + 1'b1;
                            end
                        end
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_TEMPLATE_ADDR: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else if (masked_write_data >= L) begin
                            last_error[ERR_COEFF_ADDR] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else begin
                            template_addr_ptr <= masked_write_data[L_ADDR_W-1:0];
                            template_write_count <= '0;
                            template_sequence_valid <= (masked_write_data == 0);
                            template_load_complete <= 1'b0;
                            template_crc_state <= 32'hffff_ffff;
                        end
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_TEMPLATE_DATA: begin
                        if (transaction_busy) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else if (!wstrb_hold[0] || !wstrb_hold[1] ||
                                     !template_sequence_valid || template_load_complete) begin
                            last_error[ERR_COEFF_SEQUENCE] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        end else begin
                            template_shadow_wr_en <= 1'b1;
                            template_shadow_wr_addr <= template_addr_ptr;
                            template_shadow_wr_data_q14 <= wdata_hold[15:0];
                            template_crc_state <= crc32_coeff16(template_crc_state, wdata_hold[15:0]);
                            if ((template_addr_ptr == L-1) && (template_write_count == L-1)) begin
                                template_write_count <= L; template_load_complete <= 1'b1;
                            end else if (template_addr_ptr == L-1) begin
                                template_sequence_valid <= 1'b0;
                                last_error[ERR_COEFF_SEQUENCE] <= 1'b1;
                                error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            end else begin
                                template_addr_ptr <= template_addr_ptr + 1'b1;
                                template_write_count <= template_write_count + 1'b1;
                            end
                        end
                        s_axi_bvalid <= 1'b1;
                    end
                    REG_RESULT_ADDR: begin
                        if (masked_write_data < K) begin
                            result_select_addr <= masked_write_data[K_ADDR_W-1:0];
                            result_snapshot_valid <= 1'b0;
                            result_capture_pending <= 1'b1;
                            result_capture_wait <= 3'd3;
                        end else begin
                            last_error[ERR_RESULT_ADDR] <= 1'b1;
                            error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                            s_axi_bvalid <= 1'b1;
                        end
                    end
                    REG_AVERAGE_ADDR: begin
                        if (transaction_busy || !average_frame_available) begin
                            last_error[ERR_COEFF_BUSY] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                            s_axi_bvalid <= 1'b1;
                        end else if (masked_write_data < N) begin
                            average_select_addr <= masked_write_data[N_ADDR_W-1:0];
                            average_snapshot_valid <= 1'b0;
                            average_capture_pending <= 1'b1;
                            average_capture_wait <= 3'd3;
                        end else begin
                            last_error[ERR_RESULT_ADDR] <= 1'b1;
                            error_event_pulse <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                            s_axi_bvalid <= 1'b1;
                        end
                    end
                    REG_LAST_ERROR: begin
                        last_error <= last_error & ~masked_write_data;
                        s_axi_bvalid <= 1'b1;
                    end
                    default: begin
                        last_error[ERR_ILLEGAL_WRITE] <= 1'b1;
                        error_event_pulse <= 1'b1; s_axi_bresp <= AXI_SLVERR;
                        s_axi_bvalid <= 1'b1;
                    end
                endcase
            end
        end
    end

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            s_axi_rdata <= 32'd0; s_axi_rresp <= AXI_OKAY; s_axi_rvalid <= 1'b0;
        end else begin
            if (s_axi_rvalid && s_axi_rready) s_axi_rvalid <= 1'b0;
            if (s_axi_arready && s_axi_arvalid) begin
                s_axi_rdata <= 32'd0; s_axi_rresp <= AXI_OKAY; s_axi_rvalid <= 1'b1;
                case (s_axi_araddr)
                    REG_IP_ID:          s_axi_rdata <= 32'h4543_484f;
                    REG_VERSION:        s_axi_rdata <= IP_VERSION;
                    REG_CONFIG_N_M:     s_axi_rdata <= ((M & 16'hffff) << 16) | (N & 16'hffff);
                    REG_CONFIG_L_K:     s_axi_rdata <= ((K & 16'hffff) << 16) | (L & 16'hffff);
                    REG_SAMPLE_RATE:    s_axi_rdata <= SAMPLE_RATE_HZ;
                    REG_CONTROL:        s_axi_rdata <= 32'd0;
                    REG_STATUS:         s_axi_rdata <= status_word;
                    REG_IRQ_ENABLE:     s_axi_rdata <= irq_enable;
                    REG_IRQ_STATUS:     s_axi_rdata <= irq_status;
                    REG_TRANSACTION:    s_axi_rdata <= transaction_count;
                    REG_RESULT_COUNT:   s_axi_rdata <= result_count;
                    REG_AVG_OVF_COUNT:  s_axi_rdata <= average_overflow_count;
                    REG_CORR_OVF_COUNT: s_axi_rdata <= correlation_overflow_count;
                    REG_BASELINE_ADDR:  s_axi_rdata <= baseline_addr_ptr;
                    REG_BASELINE_DATA:  s_axi_rdata <= 32'd0;
                    REG_TEMPLATE_ADDR:  s_axi_rdata <= template_addr_ptr;
                    REG_TEMPLATE_DATA:  s_axi_rdata <= 32'd0;
                    REG_RESULT_ADDR:    s_axi_rdata <= result_select_addr;
                    REG_RESULT_LO: begin
                        s_axi_rdata <= result_snapshot_q16[31:0];
                        if (!result_snapshot_valid) s_axi_rresp <= AXI_SLVERR;
                    end
                    REG_RESULT_HI: begin
                        s_axi_rdata <= result_snapshot_q16[63:32];
                        if (!result_snapshot_valid) s_axi_rresp <= AXI_SLVERR;
                    end
                    REG_LAST_ERROR:     s_axi_rdata <= last_error;
                    REG_COEFF_CRC:      s_axi_rdata <= (~baseline_crc_state) ^ (~template_crc_state);
                    REG_RESULT_VALID:   s_axi_rdata <= {31'd0, result_snapshot_valid};
                    REG_BASELINE_COUNT: s_axi_rdata <= baseline_write_count;
                    REG_TEMPLATE_COUNT: s_axi_rdata <= template_write_count;
                    REG_BASELINE_CRC:   s_axi_rdata <= ~baseline_crc_state;
                    REG_TEMPLATE_CRC:   s_axi_rdata <= ~template_crc_state;
                    REG_COEFF_STATUS:   s_axi_rdata <= coeff_status_word;
                    REG_CAPABILITIES:   s_axi_rdata <= 32'h0000_000f;
                    REG_PULSE_CONFIG:   s_axi_rdata <= pulse_config_word;
                    REG_FRAME_CONFIG:   s_axi_rdata <= {16'd64, 16'd512};
                    REG_PULSE_STATUS:   s_axi_rdata <= {24'd0, frame_error_sticky,
                                                       1'b0, frames_seen};
                    REG_FRAME_COUNT:    s_axi_rdata <= {26'd0, frames_seen};
                    REG_PAIR_RATE:      s_axi_rdata <= 32'd100_000_000;
                    REG_AVERAGE_ADDR:   s_axi_rdata <= average_select_addr;
                    REG_AVERAGE_DATA: begin
                        s_axi_rdata <= {{16{average_snapshot_q2[15]}},
                                        average_snapshot_q2};
                        if (!average_snapshot_valid) s_axi_rresp <= AXI_SLVERR;
                    end
                    REG_AVERAGE_VALID:  s_axi_rdata <= {30'd0,
                                                       average_frame_available,
                                                       average_snapshot_valid};
                    REG_WAVEFORM_CONFIG:s_axi_rdata <= {31'd0,pn_enable};
                    REG_PN_INFO:        s_axi_rdata <= 32'h007f_0207;
                    REG_PN_SEED:        s_axi_rdata <= 32'h0000_007f;
                    REG_PN_AMPLITUDE:   s_axi_rdata <= 32'd4096;
                    default: begin s_axi_rdata <= 32'd0; s_axi_rresp <= AXI_SLVERR; end
                endcase
            end
        end
    end
endmodule
