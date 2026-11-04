`timescale 1ns/1ps

// Processing-domain correlation result store. The processing engine is the
// sole writer; software reads the completed frame through a synchronous port.
module result_bram #(
    parameter integer DEPTH = 256,
    parameter integer ADDR_W = $clog2(DEPTH),
    parameter integer WIDTH = 64
) (
    input  logic                         clk,
    input  logic                         wr_en,
    input  logic [ADDR_W-1:0]            wr_addr,
    input  logic signed [WIDTH-1:0]      wr_data,

    input  logic                         rd_en,
    input  logic [ADDR_W-1:0]            rd_addr,
    output logic signed [WIDTH-1:0]      rd_data
);

    (* ram_style = "block" *) logic signed [WIDTH-1:0] mem [0:DEPTH-1];

    always_ff @(posedge clk) begin
        if (wr_en)
            mem[wr_addr] <= wr_data;
        if (rd_en)
            rd_data <= mem[rd_addr];
    end

endmodule

