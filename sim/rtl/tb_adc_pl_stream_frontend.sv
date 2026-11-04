`timescale 1ns/1ps

module tb_adc_pl_stream_frontend;
    localparam integer FIFO_DEPTH = 8;

    logic clk = 1'b0;
    logic rst = 1'b1;
    logic capture_enable = 1'b0;
    logic clear_stats = 1'b0;
    logic [15:0] cfg_frame_words = 16'd4;
    logic adc_ready = 1'b1;
    logic pair_valid = 1'b0;
    logic [13:0] rise = '0;
    logic [13:0] fall = '0;
    logic clip = 1'b0;
    logic [31:0] tdata;
    logic tvalid;
    logic tready = 1'b0;
    logic tlast;
    logic proc_pair_valid;
    logic [13:0] proc_rise;
    logic [13:0] proc_fall;
    logic proc_pair_clip;
    logic avg_valid;
    logic [13:0] avg_sample;
    logic avg_clip;
    logic [31:0] source_count;
    logic [31:0] stream_count;
    logic [31:0] dropped_count;
    logic overflow;
    logic [3:0] fifo_level;
    logic [15:0] frame_index;

    integer errors = 0;
    integer received = 0;
    logic [31:0] received_data [0:15];
    logic received_last [0:15];
    logic [13:0] expected_avg [0:31];
    logic expected_avg_clip [0:31];
    integer avg_expected_wr = 0;
    integer avg_expected_rd = 0;

    always #5 clk = ~clk;

    adc_pl_stream_frontend #(
        .FRAME_WORD_W(16),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) dut (
        .clk_acq(clk),
        .rst_acq(rst),
        .capture_enable(capture_enable),
        .clear_stats(clear_stats),
        .cfg_frame_words(cfg_frame_words),
        .adc_ready(adc_ready),
        .pair_valid(pair_valid),
        .sample_rise_u14(rise),
        .sample_fall_u14(fall),
        .sample_clip(clip),
        .m_axis_tdata(tdata),
        .m_axis_tvalid(tvalid),
        .m_axis_tready(tready),
        .m_axis_tlast(tlast),
        .proc_pair_valid(proc_pair_valid),
        .proc_rise_u14(proc_rise),
        .proc_fall_u14(proc_fall),
        .proc_pair_clip(proc_pair_clip),
        .proc_average_valid(avg_valid),
        .proc_average_u14(avg_sample),
        .proc_average_clip(avg_clip),
        .source_word_count(source_count),
        .stream_word_count(stream_count),
        .dropped_word_count(dropped_count),
        .overflow_sticky(overflow),
        .fifo_level(fifo_level),
        .source_frame_word_index(frame_index)
    );

    function automatic [13:0] offset_average(
        input logic [13:0] rise_u14,
        input logic [13:0] fall_u14
    );
        logic signed [13:0] rise_s;
        logic signed [13:0] fall_s;
        logic signed [14:0] sum_s;
        logic signed [13:0] avg_s;
        begin
            rise_s = $signed({~rise_u14[13], rise_u14[12:0]});
            fall_s = $signed({~fall_u14[13], fall_u14[12:0]});
            sum_s = {rise_s[13], rise_s} + {fall_s[13], fall_s};
            avg_s = sum_s >>> 1;
            offset_average = {~avg_s[13], avg_s[12:0]};
        end
    endfunction

    task automatic check(input logic condition, input string message);
        if (!condition) begin
            $display("ERROR: %s", message);
            errors = errors + 1;
        end
    endtask

    task automatic send_word(
        input logic [13:0] rise_value,
        input logic [13:0] fall_value,
        input logic clip_value
    );
        begin
            @(negedge clk);
            rise = rise_value;
            fall = fall_value;
            clip = clip_value;
            pair_valid = 1'b1;
            expected_avg[avg_expected_wr] = offset_average(rise_value, fall_value);
            expected_avg_clip[avg_expected_wr] = clip_value
                || (rise_value == 14'd0) || (rise_value == 14'd16383)
                || (fall_value == 14'd0) || (fall_value == 14'd16383);
            avg_expected_wr = avg_expected_wr + 1;
        end
    endtask

    always @(posedge clk) begin
        #1;
        if (avg_valid) begin
            check(avg_expected_rd < avg_expected_wr,
                  "average output appeared without an expected input");
            if (avg_expected_rd < avg_expected_wr) begin
                check(avg_sample == expected_avg[avg_expected_rd],
                      $sformatf("average mismatch at %0d: got %0d expected %0d",
                                avg_expected_rd, avg_sample,
                                expected_avg[avg_expected_rd]));
                check(avg_clip == expected_avg_clip[avg_expected_rd],
                      $sformatf("average clip mismatch at %0d", avg_expected_rd));
                avg_expected_rd = avg_expected_rd + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (tvalid && tready) begin
            received_data[received] = tdata;
            received_last[received] = tlast;
            received = received + 1;
        end
    end

    integer i;
    initial begin
        repeat (4) @(posedge clk);
        @(negedge clk);
        rst = 1'b0;
        capture_enable = 1'b1;

        // Hold the consumer off while six words enter the eight-word FIFO.
        for (i = 0; i < 6; i = i + 1)
            send_word(14'd8192 + (i * 2), 14'd8194 + (i * 2), i == 2);
        @(negedge clk);
        pair_valid = 1'b0;
        clip = 1'b0;
        repeat (2) @(posedge clk);

        check(source_count == 6, "source counter must count all six words");
        check(stream_count == 6, "all six words must enter the FIFO");
        check(dropped_count == 0, "no word may be dropped before FIFO full");
        check(fifo_level == 6, "FIFO level must be six before draining");
        check(!overflow, "overflow must remain clear");
        check(avg_expected_rd == 6, "all six averaged samples must be observed");

        // Drain and verify exact data packing plus the four-word frame TLAST.
        @(negedge clk);
        tready = 1'b1;
        wait (received == 6);
        @(negedge clk);
        tready = 1'b0;
        for (i = 0; i < 6; i = i + 1) begin
            check(received_data[i][13:0] == 14'd8192 + (i * 2),
                  $sformatf("rise packing mismatch at %0d", i));
            check(received_data[i][27:14] == 14'd8194 + (i * 2),
                  $sformatf("fall packing mismatch at %0d", i));
            check(received_data[i][28] == (i == 2),
                  $sformatf("clip packing mismatch at %0d", i));
            check(received_data[i][29] == 1'b1,
                  $sformatf("ready packing mismatch at %0d", i));
            check(received_data[i][31:30] == 2'b00,
                  $sformatf("reserved bits not zero at %0d", i));
            check(received_last[i] == (i == 3),
                  $sformatf("TLAST mismatch at %0d", i));
        end

        // Exercise the signed negative-odd rounding rule: (-1 + 0) >>> 1=-1.
        send_word(14'd8191, 14'd8192, 1'b0);
        @(negedge clk);
        pair_valid = 1'b0;
        repeat (2) @(posedge clk);
        check(expected_avg[6] == 14'd8191,
              "negative odd average reference must round toward negative infinity");
        check(avg_expected_rd == 7, "negative odd averaged sample missing");

        // Disable capture to flush the partial frame/FIFO, clear statistics,
        // then overflow an eight-entry FIFO with ten unstalled source words.
        @(negedge clk);
        capture_enable = 1'b0;
        clear_stats = 1'b1;
        @(negedge clk);
        clear_stats = 1'b0;
        capture_enable = 1'b1;
        for (i = 0; i < 10; i = i + 1)
            send_word(14'd9000 + i, 14'd9100 + i, 1'b0);
        @(negedge clk);
        pair_valid = 1'b0;
        repeat (2) @(posedge clk);

        check(source_count == 10, "overflow test source count must be ten");
        check(stream_count == 8, "overflow test must enqueue FIFO_DEPTH words");
        check(dropped_count == 2, "overflow test must report two dropped words");
        check(fifo_level == FIFO_DEPTH, "FIFO must report full level");
        check(overflow, "overflow sticky flag must set");
        check(avg_expected_rd == 17,
              "averaged branch must remain independent of raw FIFO overflow");

        if (errors == 0)
            $display("PASS: ADC PL stream frontend preserved raw pairs, framed AXI data, and detected overflow");
        else
            $fatal(1, "FAIL: %0d frontend checks failed", errors);
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "FAIL: simulation timeout");
    end
endmodule
