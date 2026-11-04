`timescale 1ns/1ps
// Gate the tested repeat engine to exactly 32 frames. REPEAT must remain high
// through the gap preceding frame 32, then drop once that frame has begun.
module pulse_burst_32 (
    input wire clk, rst, start, ready,
    input wire source_frame_start, source_frame_last,
    output wire repeat_enable,
    output reg active = 0,
    output reg [5:0] frames_sent = 0
);
    reg last_frame_started = 0;
    assign repeat_enable = active &&
        (frames_sent < 6'd31 || !last_frame_started);
    always @(posedge clk) begin
        if (rst || !ready) begin
            active <= 1'b0;
            frames_sent <= '0;
            last_frame_started <= 1'b0;
        end else if (start && !active) begin
            active <= 1'b1;
            frames_sent <= '0;
            last_frame_started <= 1'b0;
        end else if (source_frame_start && frames_sent == 6'd31) begin
            last_frame_started <= 1'b1;
        end else if (source_frame_last && active) begin
            frames_sent <= frames_sent + 1'b1;
            if (frames_sent == 6'd31) active <= 1'b0;
        end
    end
endmodule
