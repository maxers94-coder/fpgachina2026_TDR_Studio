`timescale 1ns/1ps

// Even addresses are ADC rise samples; odd addresses are ADC fall samples.
// Both RAM ports run at 100 MHz while the logical processing grid is 200 MS/s.
module avg_frame_pair_dc_bram #(
    parameter integer PAIRS = 512,
    parameter integer PAIR_ADDR_W = $clog2(PAIRS)
) (
    input  logic                          wr_clk,
    input  logic                          rise_wr_en,
    input  logic [PAIR_ADDR_W-1:0]        rise_wr_addr,
    input  logic signed [15:0]            rise_wr_data_q2,
    input  logic                          fall_wr_en,
    input  logic [PAIR_ADDR_W-1:0]        fall_wr_addr,
    input  logic signed [15:0]            fall_wr_data_q2,
    input  logic                          rd_clk,
    input  logic                          rd_en,
    input  logic [PAIR_ADDR_W:0]          rd_addr,
    output logic signed [15:0]            rd_data_q2
);
    logic signed [15:0] rise_data, fall_data;
    logic lane_d;

    avg_frame_dc_bram #(.DEPTH(PAIRS), .ADDR_W(PAIR_ADDR_W)) rise_ram_i (
        .wr_clk(wr_clk), .wr_en(rise_wr_en), .wr_addr(rise_wr_addr),
        .wr_data(rise_wr_data_q2), .rd_clk(rd_clk), .rd_en(rd_en),
        .rd_addr(rd_addr[PAIR_ADDR_W:1]), .rd_data(rise_data)
    );
    avg_frame_dc_bram #(.DEPTH(PAIRS), .ADDR_W(PAIR_ADDR_W)) fall_ram_i (
        .wr_clk(wr_clk), .wr_en(fall_wr_en), .wr_addr(fall_wr_addr),
        .wr_data(fall_wr_data_q2), .rd_clk(rd_clk), .rd_en(rd_en),
        .rd_addr(rd_addr[PAIR_ADDR_W:1]), .rd_data(fall_data)
    );
    always_ff @(posedge rd_clk)
        if (rd_en) lane_d <= rd_addr[0];
    assign rd_data_q2 = lane_d ? fall_data : rise_data;
endmodule
