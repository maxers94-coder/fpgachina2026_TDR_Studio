`timescale 1ns/1ps
module tb_avg_pair_store;
    logic clk=0;
    always #5 clk=~clk;
    logic rise_we=0, fall_we=0, rd_en=0;
    logic [8:0] rise_addr=0, fall_addr=0;
    logic signed [15:0] rise_data=0, fall_data=0;
    logic [9:0] rd_addr=0;
    wire signed [15:0] rd_data;
    integer i;
    avg_frame_pair_dc_bram dut (
        .wr_clk(clk), .rise_wr_en(rise_we), .rise_wr_addr(rise_addr),
        .rise_wr_data_q2(rise_data), .fall_wr_en(fall_we),
        .fall_wr_addr(fall_addr), .fall_wr_data_q2(fall_data),
        .rd_clk(clk), .rd_en(rd_en), .rd_addr(rd_addr),
        .rd_data_q2(rd_data)
    );
    initial begin
        for (i=0;i<512;i=i+1) begin
            @(negedge clk);
            rise_we=1; fall_we=1;
            rise_addr=9'(i); fall_addr=9'(i);
            rise_data=16'(i+100); fall_data=16'(-i-100);
        end
        @(negedge clk); rise_we=0; fall_we=0;
        for (i=0;i<1024;i=i+1) begin
            @(negedge clk); rd_en=1; rd_addr=10'(i);
            @(negedge clk);
            if (rd_data !== (i[0] ? 16'(-((i/2)+100)) :
                                  16'((i/2)+100)))
                $fatal(1,"interleave mismatch at logical address %0d",i);
        end
        $display("PASS: even=rise odd=fall over all 1024 logical addresses");
        $finish;
    end
endmodule
