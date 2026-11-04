`timescale 1ns/1ps

module tb_echo_pipeline_axi_bridge;

    localparam integer K = 4;
    localparam integer K_ADDR_W = $clog2(K);
    localparam logic [1:0] AXI_OKAY = 2'b00;
    localparam logic [1:0] AXI_SLVERR = 2'b10;

    localparam logic [7:0] REG_IP_ID        = 8'h00;
    localparam logic [7:0] REG_VERSION      = 8'h04;
    localparam logic [7:0] REG_CONFIG_N_M   = 8'h08;
    localparam logic [7:0] REG_CONFIG_L_K   = 8'h0c;
    localparam logic [7:0] REG_SAMPLE_RATE  = 8'h10;
    localparam logic [7:0] REG_CONTROL      = 8'h14;
    localparam logic [7:0] REG_STATUS       = 8'h18;
    localparam logic [7:0] REG_IRQ_ENABLE   = 8'h1c;
    localparam logic [7:0] REG_IRQ_STATUS   = 8'h20;
    localparam logic [7:0] REG_TRANSACTION  = 8'h24;
    localparam logic [7:0] REG_RESULT_COUNT = 8'h28;
    localparam logic [7:0] REG_RESULT_ADDR  = 8'h44;
    localparam logic [7:0] REG_RESULT_LO    = 8'h48;
    localparam logic [7:0] REG_RESULT_HI    = 8'h4c;
    localparam logic [7:0] REG_LAST_ERROR   = 8'h50;
    localparam logic [7:0] REG_RESULT_VALID = 8'h58;

    logic clk = 1'b0;
    logic resetn = 1'b0;

    logic [7:0] awaddr = '0;
    logic awvalid = 1'b0;
    logic awready;
    logic [31:0] wdata = '0;
    logic [3:0] wstrb = 4'hf;
    logic wvalid = 1'b0;
    logic wready;
    logic [1:0] bresp;
    logic bvalid;
    logic bready = 1'b0;

    logic [7:0] araddr = '0;
    logic arvalid = 1'b0;
    logic arready;
    logic [31:0] rdata;
    logic [1:0] rresp;
    logic rvalid;
    logic rready = 1'b0;

    logic start_pulse;
    logic clear_status_pulse;
    logic baseline_commit_pulse;
    logic template_commit_pulse;
    logic soft_reset_pulse;
    logic [K_ADDR_W-1:0] result_select_addr;
    logic [31:0] status_word = 32'h0000_0303;
    logic [31:0] transaction_count = 32'h1234_5678;
    logic [K_ADDR_W:0] result_count = K;
    logic [31:0] average_overflow_count = 32'd7;
    logic [31:0] correlation_overflow_count = 32'd9;
    logic signed [63:0] selected_result_q16 = '0;
    logic irq_f2p;

    logic signed [63:0] result_memory [0:K-1];
    integer start_pulse_count = 0;
    integer clear_pulse_count = 0;
    integer baseline_commit_count = 0;
    integer template_commit_count = 0;
    integer soft_reset_count = 0;
    integer errors = 0;
    logic [31:0] read_value;
    logic [1:0] read_response;
    logic [63:0] combined_result;

    always #5 clk = ~clk;

    always_ff @(posedge clk) begin
        selected_result_q16 <= result_memory[result_select_addr];
        if (start_pulse) start_pulse_count <= start_pulse_count + 1;
        if (clear_status_pulse) clear_pulse_count <= clear_pulse_count + 1;
        if (baseline_commit_pulse)
            baseline_commit_count <= baseline_commit_count + 1;
        if (template_commit_pulse)
            template_commit_count <= template_commit_count + 1;
        if (soft_reset_pulse) soft_reset_count <= soft_reset_count + 1;
    end

    echo_pipeline_axi_bridge #(
        .N(16), .M(16), .L(8), .K(K),
        .SAMPLE_RATE_HZ(100_000_000)
    ) dut (
        .s_axi_aclk(clk),
        .s_axi_aresetn(resetn),
        .s_axi_awaddr(awaddr),
        .s_axi_awvalid(awvalid),
        .s_axi_awready(awready),
        .s_axi_wdata(wdata),
        .s_axi_wstrb(wstrb),
        .s_axi_wvalid(wvalid),
        .s_axi_wready(wready),
        .s_axi_bresp(bresp),
        .s_axi_bvalid(bvalid),
        .s_axi_bready(bready),
        .s_axi_araddr(araddr),
        .s_axi_arvalid(arvalid),
        .s_axi_arready(arready),
        .s_axi_rdata(rdata),
        .s_axi_rresp(rresp),
        .s_axi_rvalid(rvalid),
        .s_axi_rready(rready),
        .start_pulse(start_pulse),
        .clear_status_pulse(clear_status_pulse),
        .baseline_commit_pulse(baseline_commit_pulse),
        .template_commit_pulse(template_commit_pulse),
        .soft_reset_pulse(soft_reset_pulse),
        .result_select_addr(result_select_addr),
        .status_word(status_word),
        .transaction_count(transaction_count),
        .result_count(result_count),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .selected_result_q16(selected_result_q16),
        .irq_f2p(irq_f2p)
    );

    task automatic drive_aw(input logic [7:0] address, input integer delay_cycles);
        integer count;
        begin
            for (count = 0; count < delay_cycles; count = count + 1)
                @(negedge clk);
            awaddr = address;
            awvalid = 1'b1;
            do @(posedge clk); while (!awready);
            @(negedge clk);
            awvalid = 1'b0;
        end
    endtask

    task automatic drive_w(
        input logic [31:0] data,
        input logic [3:0] strobe,
        input integer delay_cycles
    );
        integer count;
        begin
            for (count = 0; count < delay_cycles; count = count + 1)
                @(negedge clk);
            wdata = data;
            wstrb = strobe;
            wvalid = 1'b1;
            do @(posedge clk); while (!wready);
            @(negedge clk);
            wvalid = 1'b0;
        end
    endtask

    task automatic axi_write(
        input logic [7:0] address,
        input logic [31:0] data,
        input logic [3:0] strobe,
        input integer ordering,
        input logic [1:0] expected_response
    );
        begin
            fork
                drive_aw(address, (ordering == 2) ? 3 : 0);
                drive_w(data, strobe, (ordering == 1) ? 3 : 0);
            join

            bready = 1'b1;
            do @(posedge clk); while (!bvalid);
            if (bresp !== expected_response) begin
                $error(
                    "Write response mismatch addr=%02h got=%02b expected=%02b",
                    address, bresp, expected_response
                );
                errors = errors + 1;
            end
            @(negedge clk);
            bready = 1'b0;
        end
    endtask

    task automatic axi_read(
        input logic [7:0] address,
        output logic [31:0] data,
        output logic [1:0] response
    );
        begin
            araddr = address;
            arvalid = 1'b1;
            do @(posedge clk); while (!arready);
            @(negedge clk);
            arvalid = 1'b0;
            rready = 1'b1;
            do @(posedge clk); while (!rvalid);
            data = rdata;
            response = rresp;
            @(negedge clk);
            rready = 1'b0;
        end
    endtask

    task automatic expect_read(
        input logic [7:0] address,
        input logic [31:0] expected_data,
        input logic [1:0] expected_response
    );
        begin
            axi_read(address, read_value, read_response);
            if ((read_value !== expected_data) ||
                (read_response !== expected_response)) begin
                $error(
                    "Read mismatch addr=%02h data=%08h/%08h resp=%02b/%02b",
                    address, read_value, expected_data,
                    read_response, expected_response
                );
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        result_memory[0] = 64'sh0000_0000_0001_0000;
        result_memory[1] = -64'sh0000_0000_0002_0000;
        result_memory[2] = 64'sh0123_4567_89ab_cdef;
        result_memory[3] = -64'sh0011_2233_4455_6677;

        repeat (8) @(negedge clk);
        resetn = 1'b1;
        repeat (3) @(negedge clk);

        expect_read(REG_IP_ID, 32'h4543_484f, AXI_OKAY);
        expect_read(REG_VERSION, 32'h0001_0001, AXI_OKAY);
        expect_read(REG_CONFIG_N_M, 32'h0010_0010, AXI_OKAY);
        expect_read(REG_CONFIG_L_K, 32'h0004_0008, AXI_OKAY);
        expect_read(REG_SAMPLE_RATE, 32'd100_000_000, AXI_OKAY);
        expect_read(REG_STATUS, status_word, AXI_OKAY);
        expect_read(REG_TRANSACTION, transaction_count, AXI_OKAY);
        expect_read(REG_RESULT_COUNT, K, AXI_OKAY);

        // AW first, then W: START must be exactly one clock pulse.
        axi_write(REG_CONTROL, 32'h0000_0001, 4'hf, 1, AXI_OKAY);
        repeat (3) @(negedge clk);
        if (start_pulse_count != 1) begin
            $error("START W1P count=%0d expected=1", start_pulse_count);
            errors = errors + 1;
        end

        // W first, then AW: future commit/soft-reset outputs are preserved.
        axi_write(REG_CONTROL, 32'h0000_001c, 4'hf, 2, AXI_OKAY);
        repeat (3) @(negedge clk);
        if (baseline_commit_count != 1 || template_commit_count != 1 ||
            soft_reset_count != 1) begin
            $error("W1P auxiliary pulse mismatch");
            errors = errors + 1;
        end

        // Enable all phase-1 interrupts and create a DONE rising edge.
        axi_write(REG_IRQ_ENABLE, 32'h0000_000f, 4'hf, 0, AXI_OKAY);
        status_word[6] = 1'b1;
        repeat (3) @(negedge clk);
        if (!irq_f2p) begin
            $error("DONE event did not assert irq_f2p");
            errors = errors + 1;
        end
        expect_read(REG_IRQ_STATUS, 32'h0000_0001, AXI_OKAY);

        // W1C clears the interrupt without changing the controller status.
        axi_write(REG_IRQ_STATUS, 32'h0000_0001, 4'hf, 0, AXI_OKAY);
        repeat (2) @(negedge clk);
        if (irq_f2p) begin
            $error("IRQ W1C did not clear irq_f2p");
            errors = errors + 1;
        end

        // Atomic result snapshot: write response is delayed until BRAM data
        // is captured. LO/HI must then reconstruct the same 64-bit value.
        axi_write(REG_RESULT_ADDR, 32'd2, 4'hf, 0, AXI_OKAY);
        expect_read(REG_RESULT_VALID, 32'd1, AXI_OKAY);
        expect_read(REG_RESULT_LO, 32'h89ab_cdef, AXI_OKAY);
        axi_read(REG_RESULT_HI, read_value, read_response);
        combined_result = {read_value, 32'h89ab_cdef};
        if (read_response != AXI_OKAY ||
            combined_result !== 64'h0123_4567_89ab_cdef) begin
            $error("Atomic result snapshot mismatch: %016h", combined_result);
            errors = errors + 1;
        end

        // Invalid address produces SLVERR and preserves the prior snapshot.
        axi_write(REG_RESULT_ADDR, 32'd7, 4'hf, 0, AXI_SLVERR);
        expect_read(REG_LAST_ERROR, 32'h0000_0001, AXI_OKAY);
        expect_read(REG_RESULT_LO, 32'h89ab_cdef, AXI_OKAY);

        // CLEAR_STATUS clears bridge-local sticky error and emits one pulse.
        axi_write(REG_CONTROL, 32'h0000_0002, 4'hf, 0, AXI_OKAY);
        repeat (3) @(negedge clk);
        if (clear_pulse_count != 1) begin
            $error("CLEAR_STATUS W1P count=%0d expected=1", clear_pulse_count);
            errors = errors + 1;
        end
        expect_read(REG_LAST_ERROR, 32'd0, AXI_OKAY);

        // Unknown accesses report SLVERR rather than silently succeeding.
        expect_read(8'hfc, 32'd0, AXI_SLVERR);

        if (errors == 0)
            $display("PASS: AXI4-Lite bridge register, IRQ and atomic result tests passed");
        else
            $fatal(1, "FAIL: %0d AXI bridge errors", errors);
        $finish;
    end

    initial begin
        #2_000_000;
        $fatal(1, "Simulation timeout");
    end

endmodule
