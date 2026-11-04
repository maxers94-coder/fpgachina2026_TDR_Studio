`timescale 1ns/1ps

module tb_echo_pipeline_hw_control;

    localparam integer N = 16;
    localparam integer M = 16;
    localparam integer L = 8;
    localparam integer K = 4;
    localparam integer RAW_WORDS = N * M;
    localparam logic signed [63:0] EXPECTED_Q16 = 64'sd6553600;

    logic clk_acq = 1'b0;
    logic clk_proc = 1'b0;
    logic rst_acq = 1'b1;
    logic rst_proc = 1'b1;
    logic adc_ready_acq = 1'b1;
    logic pair_valid = 1'b0;
    logic [13:0] sample_rise_u14 = 14'd8292;
    logic [13:0] sample_fall_u14 = 14'd8292;
    logic sample_clip = 1'b0;
    logic start_request = 1'b0;
    logic clear_status = 1'b0;
    logic [1:0] result_select_addr = '0;

    logic coeff_init_done;
    logic transaction_busy;
    logic acquisition_busy;
    logic done_sticky;
    logic start_accepted_sticky;
    logic start_rejected_sticky;
    logic [31:0] transaction_count;
    logic [2:0] result_count;
    logic signed [63:0] selected_result_q16;
    logic [31:0] average_overflow_count;
    logic [31:0] correlation_overflow_count;
    logic clip_flag_snapshot;
    logic [31:0] status_word;

    integer index;
    integer errors = 0;

    always #10 clk_acq = ~clk_acq;
    always #5.005 clk_proc = ~clk_proc;

    echo_pipeline_hw_control #(
        .N(N), .M(M), .L(L), .K(K)
    ) dut (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .adc_ready_acq(adc_ready_acq),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip),
        .start_request(start_request),
        .clear_status(clear_status),
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

    initial begin
        repeat (8) @(negedge clk_acq);
        rst_acq = 1'b0;
        repeat (8) @(negedge clk_proc);
        rst_proc = 1'b0;

        wait (coeff_init_done === 1'b1);
        if (!status_word[0] || !status_word[8] || !status_word[9]) begin
            $error("Coefficient loader did not publish ready/active banks");
            errors = errors + 1;
        end

        start_request = 1'b1;
        @(negedge clk_proc);
        start_request = 1'b0;

        wait (acquisition_busy === 1'b1);
        @(negedge clk_acq);
        for (index = 0; index < RAW_WORDS; index = index + 1) begin
            pair_valid = 1'b1;
            @(negedge clk_acq);
        end
        pair_valid = 1'b0;

        wait (done_sticky === 1'b1);
        repeat (4) @(negedge clk_proc);

        if (!start_accepted_sticky || start_rejected_sticky) begin
            $error("Unexpected start admission status");
            errors = errors + 1;
        end
        if (transaction_busy || acquisition_busy) begin
            $error("Transaction remained busy after done");
            errors = errors + 1;
        end
        if (transaction_count != 1 || result_count != K) begin
            $error("Count mismatch: transactions=%0d results=%0d", transaction_count, result_count);
            errors = errors + 1;
        end
        if (average_overflow_count != 0 || correlation_overflow_count != 0) begin
            $error("Unexpected arithmetic overflow");
            errors = errors + 1;
        end

        for (index = 0; index < K; index = index + 1) begin
            result_select_addr = index[1:0];
            repeat (3) @(negedge clk_proc);
            if ($signed(selected_result_q16) !== EXPECTED_Q16) begin
                $error(
                    "Result mismatch at %0d: got %0d expected %0d",
                    index, $signed(selected_result_q16), EXPECTED_Q16
                );
                errors = errors + 1;
            end
        end

        clear_status = 1'b1;
        repeat (2) @(negedge clk_proc);
        clear_status = 1'b0;
        @(negedge clk_proc);
        if (done_sticky || transaction_count != 0) begin
            $error("Clear status failed");
            errors = errors + 1;
        end

        if (errors == 0)
            $display("PASS: hardware controller loaded coefficients, processed one transaction and exposed all results");
        else
            $fatal(1, "FAIL: %0d errors", errors);
        $finish;
    end

    initial begin
        #1000000;
        $fatal(1, "Simulation timeout");
    end

endmodule

