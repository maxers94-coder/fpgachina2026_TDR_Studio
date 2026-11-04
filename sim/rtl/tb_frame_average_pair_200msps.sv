`timescale 1ns/1ps
module tb_frame_average_pair_200msps;
    logic clk = 0, rst = 1, start = 0;
    always #5 clk = ~clk;
    logic [13:0] rise = 0, fall = 0;
    logic pair_valid = 0, clip = 0, marker = 0;
    logic [31:0] meta = 0;
    wire busy, done, error_pulse, error_sticky, clip_snapshot;
    wire [5:0] frames_seen;
    wire [31:0] overflow;
    wire rise_we, fall_we;
    wire [8:0] rise_addr, fall_addr;
    wire signed [15:0] rise_data, fall_data;
    integer rise_count = 0, fall_count = 0, done_count = 0;
    integer frame_i, pair_i;

    frame_average_pair_bram dut (
        .clk_acq(clk), .rst_acq(rst), .start_pulse(start),
        .sample_rise_u14(rise), .sample_fall_u14(fall),
        .pair_valid(pair_valid), .sample_clip(clip),
        .tx_marker(marker), .frame_meta(meta),
        .busy(busy), .group_done_pulse(done),
        .frame_error_pulse(error_pulse),
        .frame_error_sticky(error_sticky), .frames_seen(frames_seen),
        .clip_flag_snapshot(clip_snapshot), .overflow_count(overflow),
        .rise_wr_en(rise_we), .rise_wr_addr(rise_addr),
        .rise_wr_data_q2(rise_data),
        .fall_wr_en(fall_we), .fall_wr_addr(fall_addr),
        .fall_wr_data_q2(fall_data)
    );
    always @(posedge clk) begin
        if (rise_we) begin
            if (rise_addr !== rise_count[8:0] ||
                rise_data !== $signed(16'((100 + rise_count%7)*4)))
                $fatal(1, "rise result mismatch at %0d: %0d", rise_count, rise_data);
            rise_count = rise_count + 1;
        end
        if (fall_we) begin
            if (fall_addr !== fall_count[8:0] ||
                fall_data !== $signed(16'((-50 + fall_count%11)*4)))
                $fatal(1, "fall result mismatch at %0d: %0d", fall_count, fall_data);
            fall_count = fall_count + 1;
        end
        if (done) done_count = done_count + 1;
    end
    task automatic arm;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
    endtask
    task automatic send_pair(input integer f, input integer i);
        @(negedge clk);
        pair_valid = 1;
        rise = 14'(8192 + 100 + i%7);
        fall = 14'(8192 - 50 + i%11);
        marker = (i == 64);
        meta = {16'(f+1), 3'd5, 1'(marker), 1'(i==511),
                1'(i==0), 1'b1, 9'(i)};
    endtask
    initial begin
        repeat (5) @(negedge clk); rst = 0;
        arm();
        for (frame_i=0; frame_i<32; frame_i=frame_i+1) begin
            for (pair_i=0; pair_i<512; pair_i=pair_i+1)
                send_pair(frame_i,pair_i);
            @(negedge clk);
            pair_valid = 0; marker = 0; meta = 0;
            repeat (10) @(negedge clk);
        end
        repeat (20) @(negedge clk);
        if (error_sticky || done_count != 1 || frames_seen != 32 ||
            rise_count != 512 || fall_count != 512 || overflow != 0)
            $fatal(1, "32-frame result failed: seen=%0d done=%0d rise=%0d fall=%0d err=%0b",
                   frames_seen,done_count,rise_count,fall_count,error_sticky);
        $display("PASS: 32 aligned pulse frames, 1024 interleaved logical samples");

        // A missing word must reject the transaction, never publish results.
        arm();
        for (pair_i=0; pair_i<15; pair_i=pair_i+1)
            send_pair(32,pair_i);
        send_pair(32,16);
        @(negedge clk); pair_valid = 0; meta = 0;
        repeat (5) @(negedge clk);
        if (!error_sticky || done_count != 1)
            $fatal(1, "missing pair was accepted");
        $display("PASS: missing pair rejected");

        rise_count = 0; fall_count = 0;
        arm();
        for (frame_i=33; frame_i<65; frame_i=frame_i+1) begin
            for (pair_i=0; pair_i<512; pair_i=pair_i+1)
                send_pair(frame_i,pair_i);
            @(negedge clk);
            pair_valid = 0; marker = 0; meta = 0;
            repeat (10) @(negedge clk);
        end
        repeat (20) @(negedge clk);
        if (error_sticky || done_count != 2 || frames_seen != 32 ||
            rise_count != 512 || fall_count != 512)
            $fatal(1, "recovery after missing pair failed");
        $display("PASS: recovery on next START without global reset");
        $finish;
    end
endmodule
