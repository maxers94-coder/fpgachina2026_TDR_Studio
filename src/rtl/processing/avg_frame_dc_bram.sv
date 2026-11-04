`timescale 1ns/1ps

// Average-frame CDC storage. The acquisition domain is the sole writer and
// the processing domain reads only after the synchronized completion event.
module avg_frame_dc_bram #(
    parameter integer DEPTH = 1024,
    parameter integer ADDR_W = $clog2(DEPTH),
    parameter integer WIDTH = 16
) (
    input  logic                         wr_clk,
    input  logic                         wr_en,
    input  logic [ADDR_W-1:0]            wr_addr,
    input  logic signed [WIDTH-1:0]      wr_data,

    input  logic                         rd_clk,
    input  logic                         rd_en,
    input  logic [ADDR_W-1:0]            rd_addr,
    output logic signed [WIDTH-1:0]      rd_data
);

    (* ram_style = "block" *) logic signed [WIDTH-1:0] mem [0:DEPTH-1];

    always_ff @(posedge wr_clk) begin
        if (wr_en)
            mem[wr_addr] <= wr_data;
    end

    always_ff @(posedge rd_clk) begin
        if (rd_en)
            rd_data <= mem[rd_addr];
    end

endmodule

