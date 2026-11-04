`timescale 1ns/1ps

// One synchronous read port plus one write port on the acquisition clock.
// Reading address n while writing the previous pipeline address n-1 permits
// one accepted ADC sample per acquisition clock.
module accum_tdp_bram #(
    parameter integer DEPTH = 1024,
    parameter integer ADDR_W = $clog2(DEPTH),
    parameter integer WIDTH = 22
) (
    input  logic                         clk,
    input  logic                         rd_en,
    input  logic [ADDR_W-1:0]            rd_addr,
    output logic signed [WIDTH-1:0]      rd_data,
    input  logic                         wr_en,
    input  logic [ADDR_W-1:0]            wr_addr,
    input  logic signed [WIDTH-1:0]      wr_data
);

    (* ram_style = "block" *) logic signed [WIDTH-1:0] mem [0:DEPTH-1];

    always_ff @(posedge clk) begin
        if (rd_en)
            rd_data <= mem[rd_addr];
        if (wr_en)
            mem[wr_addr] <= wr_data;
    end

endmodule

