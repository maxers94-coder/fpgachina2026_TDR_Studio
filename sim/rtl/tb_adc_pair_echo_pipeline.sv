`timescale 1ns/1ps

module tb_adc_pair_echo_pipeline;

    localparam integer N = 1024;
    localparam integer M = 32;
    localparam integer L = 640;
    localparam integer K = 256;
    localparam integer RAW_COUNT = N * M;

    logic clk_acq = 1'b0;
    logic clk_proc = 1'b0;
    logic rst_acq = 1'b1;
    logic rst_proc = 1'b1;

    logic start_pulse = 1'b0;
    logic start_accepted;
    logic busy;
    logic done_pulse;
    logic pair_valid = 1'b0;
    logic [13:0] sample_rise_u14 = '0;
    logic [13:0] sample_fall_u14 = '0;
    logic acq_busy;
    logic start_rejected_not_ready;
    logic sample_valid_debug;
    logic [13:0] sample_u14_debug;
    logic sample_clip_debug;

    logic baseline_shadow_wr_en = 1'b0;
    logic [9:0] baseline_shadow_wr_addr = '0;
    logic signed [15:0] baseline_shadow_wr_data_q2 = '0;
    logic baseline_commit_pulse = 1'b0;
    logic baseline_active_bank;
    logic baseline_commit_accepted;
    logic baseline_commit_rejected;

    logic template_shadow_wr_en = 1'b0;
    logic [9:0] template_shadow_wr_addr = '0;
    logic signed [15:0] template_shadow_wr_data_q14 = '0;
    logic template_commit_pulse = 1'b0;
    logic template_active_bank;
    logic template_commit_accepted;
    logic template_commit_rejected;

    logic result_rd_en = 1'b0;
    logic [7:0] result_rd_addr = '0;
    logic signed [63:0] result_rd_data_q16;
    logic [8:0] result_count;
    logic clip_flag_snapshot;
    logic [31:0] average_overflow_count;
    logic [31:0] correlation_overflow_count;

    logic [13:0] raw_measurement [0:RAW_COUNT-1];
    integer baseline_values [0:N-1];
    integer template_values [0:L-1];
    logic signed [63:0] expected_correlation [0:K-1];

    string vector_dir;
    string file_name;
    integer fd;
    integer scan_status;
    integer error_count = 0;

    // Current hardware-validation mode: one averaged sample per 50 MHz DCO
    // word.  Processor domain remains approximately 100 MHz and asynchronous.
    always #10 clk_acq = ~clk_acq;
    always #5.005 clk_proc = ~clk_proc;

    adc_pair_echo_pipeline #(
        .N(N),
        .M(M),
        .L(L),
        .K(K),
        .LAG_MIN(0)
    ) dut (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_proc(clk_proc),
        .rst_proc(rst_proc),
        .adc_ready_acq(1'b1),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .start_pulse(start_pulse),
        .start_accepted(start_accepted),
        .start_rejected_not_ready(start_rejected_not_ready),
        .busy(busy),
        .done_pulse(done_pulse),
        .acq_busy(acq_busy),
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
        .result_rd_en(result_rd_en),
        .result_rd_addr(result_rd_addr),
        .result_rd_data_q16(result_rd_data_q16),
        .result_count(result_count),
        .clip_flag_snapshot(clip_flag_snapshot),
        .average_overflow_count(average_overflow_count),
        .correlation_overflow_count(correlation_overflow_count),
        .sample_valid_debug(sample_valid_debug),
        .sample_u14_debug(sample_u14_debug),
        .sample_clip_debug(sample_clip_debug)
    );

    task automatic read_decimal_file(
        input string path,
        input integer count,
        input integer which
    );
        integer index;
        integer value;
        begin
            fd = $fopen(path, "r");
            if (fd == 0)
                $fatal(1, "Cannot open vector: %s", path);
            for (index = 0; index < count; index = index + 1) begin
                scan_status = $fscanf(fd, "%d", value);
                if (scan_status != 1)
                    $fatal(1, "Failed reading %s at %0d", path, index);
                if (which == 0)
                    baseline_values[index] = value;
                else
                    template_values[index] = value;
            end
            $fclose(fd);
        end
    endtask

    task automatic program_coefficients;
        integer index;
        begin
            for (index = 0; index < N; index = index + 1) begin
                baseline_shadow_wr_en = 1'b1;
                baseline_shadow_wr_addr = index[9:0];
                baseline_shadow_wr_data_q2 = baseline_values[index];
                @(negedge clk_proc);
            end
            baseline_shadow_wr_en = 1'b0;

            for (index = 0; index < L; index = index + 1) begin
                template_shadow_wr_en = 1'b1;
                template_shadow_wr_addr = index[9:0];
                template_shadow_wr_data_q14 = template_values[index];
                @(negedge clk_proc);
            end
            template_shadow_wr_en = 1'b0;

            baseline_commit_pulse = 1'b1;
            template_commit_pulse = 1'b1;
            @(negedge clk_proc);
            baseline_commit_pulse = 1'b0;
            template_commit_pulse = 1'b0;

            if (!baseline_commit_accepted || !template_commit_accepted) begin
                $error("Baseline/template commit was not accepted in IDLE");
                error_count = error_count + 1;
            end
            if (!baseline_active_bank || !template_active_bank) begin
                $error("Baseline/template active banks did not switch to bank 1");
                error_count = error_count + 1;
            end
        end
    endtask

    task automatic feed_measurement_frames;
        integer index;
        begin
            wait (acq_busy === 1'b1);
            @(negedge clk_acq);
            for (index = 0; index < RAW_COUNT; index = index + 1) begin
                pair_valid = 1'b1;
                // Equal edge codes make the signed pair average exactly equal
                // to the frozen golden-model sample.
                sample_rise_u14 = raw_measurement[index];
                sample_fall_u14 = raw_measurement[index];
                @(negedge clk_acq);
            end
            pair_valid = 1'b0;
            sample_rise_u14 = '0;
            sample_fall_u14 = '0;
        end
    endtask

    task automatic check_busy_commit_rejected;
        begin
            baseline_commit_pulse = 1'b1;
            template_commit_pulse = 1'b1;
            @(negedge clk_proc);
            baseline_commit_pulse = 1'b0;
            template_commit_pulse = 1'b0;

            if (!baseline_commit_rejected || !template_commit_rejected) begin
                $error("Baseline/template commit was not rejected while transaction busy");
                error_count = error_count + 1;
            end
            if (!baseline_active_bank || !template_active_bank) begin
                $error("A rejected busy commit changed an active bank");
                error_count = error_count + 1;
            end
        end
    endtask

    task automatic compare_results;
        integer index;
        begin
            @(negedge clk_proc);
            result_rd_en = 1'b1;
            for (index = 0; index < K; index = index + 1) begin
                result_rd_addr = index[7:0];
                @(negedge clk_proc);
                if ($signed(result_rd_data_q16) !== $signed(expected_correlation[index])) begin
                    $error(
                        "End-to-end mismatch at lag %0d: RTL=%0d Python=%0d",
                        index,
                        $signed(result_rd_data_q16),
                        $signed(expected_correlation[index])
                    );
                    error_count = error_count + 1;
                end
            end
            result_rd_en = 1'b0;
        end
    endtask

    initial begin
        if (!$value$plusargs("VECTOR_DIR=%s", vector_dir))
            vector_dir = "vectors/echo_pipeline_example";

        file_name = {vector_dir, "/raw_measurement_u14.mem"};
        $readmemh(file_name, raw_measurement);
        file_name = {vector_dir, "/baseline_q2.txt"};
        read_decimal_file(file_name, N, 0);
        file_name = {vector_dir, "/template_q14.txt"};
        read_decimal_file(file_name, L, 1);
        file_name = {vector_dir, "/corr_int64.mem"};
        $readmemh(file_name, expected_correlation);

        repeat (10) @(negedge clk_acq);
        rst_acq = 1'b0;
        repeat (10) @(negedge clk_proc);
        rst_proc = 1'b0;
        repeat (5) @(negedge clk_proc);

        program_coefficients();

        start_pulse = 1'b1;
        @(negedge clk_proc);
        start_pulse = 1'b0;

        check_busy_commit_rejected();
        feed_measurement_frames();
        wait (done_pulse === 1'b1);
        @(negedge clk_proc);

        if (busy !== 1'b0) begin
            $error("Top-level busy did not clear after processing");
            error_count = error_count + 1;
        end
        if (result_count !== K) begin
            $error("Result count mismatch: RTL=%0d expected=%0d", result_count, K);
            error_count = error_count + 1;
        end
        if (clip_flag_snapshot !== 1'b0) begin
            $error("Unexpected ADC clip flag");
            error_count = error_count + 1;
        end
        if (average_overflow_count != 0) begin
            $error("Unexpected average accumulator overflow count: %0d", average_overflow_count);
            error_count = error_count + 1;
        end
        if (correlation_overflow_count != 0) begin
            $error("Unexpected correlation accumulator overflow count: %0d", correlation_overflow_count);
            error_count = error_count + 1;
        end

        compare_results();

        if (error_count == 0)
            $display("PASS: ADC pair adapter and complete RTL chain matched %0d/%0d correlation results", K, K);
        else
            $fatal(1, "FAIL: complete RTL chain had %0d errors", error_count);
        $finish;
    end

    initial begin
        #5000000;
        $fatal(1, "Simulation timeout");
    end

endmodule

