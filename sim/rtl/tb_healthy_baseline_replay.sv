`timescale 1ns/1ps

// Arithmetic replay starts at the saved averaged-frame BRAM boundary.
// These inputs are not reconstructed raw ADC frames or live measurements.
module tb_healthy_baseline_replay;
    localparam integer N = 1024;
    localparam integer L = 640;
    localparam integer K = 256;
    localparam integer MAX_CASES = 64;
    logic clk = 0;
    logic rst = 1;
    logic start_pulse = 0;
    logic busy, done_pulse;
    logic avg_rd_en;
    logic [9:0] avg_rd_addr;
    logic signed [15:0] avg_rd_data_q2 = 0;
    logic base_wr_en = 0, base_commit = 0;
    logic [9:0] base_wr_addr = 0;
    logic signed [15:0] base_wr_data = 0;
    logic base_bank, base_accepted, base_rejected;
    logic tmpl_wr_en = 0, tmpl_commit = 0;
    logic [9:0] tmpl_wr_addr = 0;
    logic signed [15:0] tmpl_wr_data = 0;
    logic tmpl_bank, tmpl_accepted, tmpl_rejected;
    logic result_rd_en = 0;
    logic [7:0] result_rd_addr = 0;
    logic signed [63:0] result_rd_data;
    logic [31:0] overflow_count;
    logic [8:0] result_count;

    logic signed [15:0] raw_vectors [0:MAX_CASES*N-1];
    logic signed [15:0] base_vectors [0:MAX_CASES*N-1];
    logic signed [15:0] template_vector [0:L-1];
    logic signed [16:0] expected_difference [0:MAX_CASES*N-1];
    logic signed [63:0] expected_correlation [0:MAX_CASES*K-1];
    integer case_count;
    integer current_case = 0;
    integer difference_count = 0;
    integer correlation_count = 0;
    integer total_difference_count = 0;
    integer total_correlation_count = 0;
    integer total_readback_count = 0;
    logic checking = 0;
    string vector_dir;

    always #5 clk = ~clk;
    always_ff @(posedge clk)
        if (avg_rd_en)
            avg_rd_data_q2 <= raw_vectors[current_case*N + avg_rd_addr];

    processing_chain dut (
        .clk_proc(clk), .rst_proc(rst), .start_pulse(start_pulse),
        .commit_allowed(!busy),
        .avg_rd_en(avg_rd_en), .avg_rd_addr(avg_rd_addr), .avg_rd_data_q2(avg_rd_data_q2),
        .baseline_shadow_wr_en(base_wr_en), .baseline_shadow_wr_addr(base_wr_addr),
        .baseline_shadow_wr_data_q2(base_wr_data), .baseline_commit_pulse(base_commit),
        .baseline_active_bank(base_bank), .baseline_commit_accepted(base_accepted),
        .baseline_commit_rejected(base_rejected),
        .template_shadow_wr_en(tmpl_wr_en), .template_shadow_wr_addr(tmpl_wr_addr),
        .template_shadow_wr_data_q14(tmpl_wr_data), .template_commit_pulse(tmpl_commit),
        .template_active_bank(tmpl_bank), .template_commit_accepted(tmpl_accepted),
        .template_commit_rejected(tmpl_rejected),
        .result_rd_en(result_rd_en), .result_rd_addr(result_rd_addr), .result_rd_data_q16(result_rd_data),
        .busy(busy), .done_pulse(done_pulse), .corr_overflow_count(overflow_count), .result_count(result_count)
    );

    // Sample settled synchronous outputs half a cycle after the active edge.
    always @(negedge clk) begin
        if (checking && dut.diff_valid) begin
            if (difference_count >= N || dut.diff_addr !== difference_count[9:0])
                $fatal(1, "Difference address/order mismatch case=%0d count=%0d addr=%0d", current_case, difference_count, dut.diff_addr);
            if (dut.diff_data_q2 !== expected_difference[current_case*N + difference_count])
                $fatal(1, "17-bit difference mismatch case=%0d sample=%0d RTL=%0d expected=%0d", current_case, difference_count,
                    $signed(dut.diff_data_q2), $signed(expected_difference[current_case*N + difference_count]));
            difference_count = difference_count + 1;
            total_difference_count = total_difference_count + 1;
        end
        if (checking && dut.corr_result_valid) begin
            if (correlation_count >= K || dut.corr_result_lag !== correlation_count[9:0])
                $fatal(1, "Correlation address/order mismatch case=%0d lag=%0d", current_case, correlation_count);
            if (dut.corr_result_q16 !== expected_correlation[current_case*K + correlation_count])
                $fatal(1, "Correlation mismatch case=%0d lag=%0d RTL=%0d expected=%0d", current_case, correlation_count,
                    $signed(dut.corr_result_q16), $signed(expected_correlation[current_case*K + correlation_count]));
            correlation_count = correlation_count + 1;
            total_correlation_count = total_correlation_count + 1;
        end
    end

    task automatic load_coefficients;
        integer i;
        logic previous_base, previous_template;
        begin
            previous_base = base_bank;
            previous_template = tmpl_bank;
            @(negedge clk);
            for (i = 0; i < N; i = i + 1) begin
                base_wr_en = 1;
                base_wr_addr = i[9:0];
                base_wr_data = base_vectors[current_case*N + i];
                @(negedge clk);
            end
            base_wr_en = 0;
            for (i = 0; i < L; i = i + 1) begin
                tmpl_wr_en = 1;
                tmpl_wr_addr = i[9:0];
                tmpl_wr_data = template_vector[i];
                @(negedge clk);
            end
            tmpl_wr_en = 0;
            base_commit = 1;
            tmpl_commit = 1;
            @(negedge clk);
            base_commit = 0;
            tmpl_commit = 0;
            if (!base_accepted || !tmpl_accepted || base_rejected || tmpl_rejected)
                $fatal(1, "Coefficient commit failed case=%0d", current_case);
            if (base_bank === previous_base || tmpl_bank === previous_template)
                $fatal(1, "Atomic active-bank switch failed case=%0d", current_case);
        end
    endtask

    task automatic run_case;
        integer cycles;
        integer i;
        begin
            load_coefficients();
            difference_count = 0;
            correlation_count = 0;
            checking = 1;
            @(negedge clk);
            start_pulse = 1;
            @(negedge clk);
            start_pulse = 0;
            cycles = 0;
            while (!done_pulse && cycles < 300000) begin
                @(negedge clk);
                cycles = cycles + 1;
            end
            if (!done_pulse)
                $fatal(1, "Processing timeout case=%0d", current_case);
            @(negedge clk);
            checking = 0;
            if (busy || difference_count != N || correlation_count != K || result_count != K || overflow_count != 0)
                $fatal(1, "Completion/count/overflow mismatch case=%0d diff=%0d corr=%0d count=%0d ovf=%0d", current_case,
                    difference_count, correlation_count, result_count, overflow_count);
            result_rd_en = 1;
            for (i = 0; i < K; i = i + 1) begin
                result_rd_addr = i[7:0];
                @(negedge clk);
                if (result_rd_data !== expected_correlation[current_case*K + i])
                    $fatal(1, "BRAM readback mismatch case=%0d lag=%0d RTL=%0d expected=%0d", current_case, i,
                        $signed(result_rd_data), $signed(expected_correlation[current_case*K + i]));
                total_readback_count = total_readback_count + 1;
            end
            result_rd_en = 0;
            $display("HEALTHY_BASELINE_CASE_PASS,CASE=%0d,DIFF=%0d,CORR=%0d,BRAM=%0d,CYCLES=%0d", current_case, N, K, K, cycles);
        end
    endtask

    initial begin
        if (!$value$plusargs("VECTOR_DIR=%s", vector_dir))
            vector_dir = "..";
        if (!$value$plusargs("CASE_COUNT=%d", case_count))
            case_count = 53;
        if (case_count != 53)
            $fatal(1, "Expected 51 real averaged captures and 2 signed-boundary synthetic cases");
        $readmemh({vector_dir, "/case_raw_i16.mem"}, raw_vectors, 0, case_count*N-1);
        $readmemh({vector_dir, "/case_baseline_i16.mem"}, base_vectors, 0, case_count*N-1);
        $readmemh({vector_dir, "/template_i16.mem"}, template_vector);
        $readmemh({vector_dir, "/case_difference_i17.mem"}, expected_difference, 0, case_count*N-1);
        $readmemh({vector_dir, "/case_correlation_i64.mem"}, expected_correlation, 0, case_count*K-1);
        repeat (5) @(negedge clk);
        rst = 0;
        for (current_case = 0; current_case < case_count; current_case = current_case + 1)
            run_case();
        $display("HEALTHY_BASELINE_REPLAY_PASS,REAL=51,SYNTHETIC=2,DIFF=%0d,CORR=%0d,BRAM=%0d", total_difference_count,
            total_correlation_count, total_readback_count);
        $finish;
    end

    initial begin
        #500000000;
        $fatal(1, "Global replay timeout");
    end
endmodule
