`timescale 1ns/1ps
module tb_pulse_burst_32;
    reg clk=0, rst=1, start=0, ready=0;
    always #5 clk=~clk;
    wire repeat_enable, active, busy;
    wire [5:0] frames_sent;
    wire source_frame_start, source_frame_last;
    wire [15:0] frame_id;
    integer starts=0, lasts=0;
    pulse_burst_32 gate_i (
        .clk(clk), .rst(rst), .start(start), .ready(ready),
        .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last),
        .repeat_enable(repeat_enable), .active(active),
        .frames_sent(frames_sent)
    );
    sync_pulse_engine engine_i (
        .clk(clk), .rst(rst), .ready(ready),
        .requested_mode(3'd5), .requested_width(6'd4),
        .single_request(1'b0), .repeat_enable(repeat_enable),
        .clear_request(1'b0), .busy(busy), .clear_accepted(),
        .rejected_sticky(), .aborted_sticky(), .completed_count(),
        .rejected_count(), .aborted_count(), .source_owned(),
        .source_sample(), .source_marker(), .source_tx_active(),
        .source_frame_active(), .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last), .source_index(),
        .source_frame_id(frame_id), .source_mode()
    );
    always @(posedge clk) begin
        if (source_frame_start) begin
            starts=starts+1;
            if (frame_id !== starts[15:0])
                $fatal(1,"nonsequential frame id %0d at %0d",frame_id,starts);
        end
        if (source_frame_last) lasts=lasts+1;
    end
    initial begin
        repeat (4) @(negedge clk);
        rst=0; ready=1;
        @(negedge clk); start=1;
        @(negedge clk); start=0;
        repeat (68000) @(negedge clk);
        if (starts != 32 || lasts != 32 || frames_sent != 32 ||
            active || busy || repeat_enable)
            $fatal(1,"burst mismatch starts=%0d lasts=%0d sent=%0d active=%0b busy=%0b",
                   starts,lasts,frames_sent,active,busy);
        $display("PASS: PS start launched exactly 32 numbered pulse frames");
        $finish;
    end
endmodule
