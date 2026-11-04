`timescale 1ns/1ps

module baseline_sub #(
    parameter integer N = 1024,
    parameter integer ADDR_W = $clog2(N)
) (
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   in_valid,
    input  logic [ADDR_W-1:0]      in_addr,
    input  logic signed [15:0]     measurement_q2,
    input  logic signed [15:0]     baseline_q2,

    output logic                   out_valid,
    output logic [ADDR_W-1:0]      out_addr,
    output logic signed [16:0]     difference_q2
);

    always_ff @(posedge clk) begin
        if (rst) begin
            out_valid <= 1'b0;
            out_addr <= '0;
            difference_q2 <= '0;
        end else begin
            out_valid <= in_valid;
            if (in_valid) begin
                out_addr <= in_addr;
                difference_q2 <= $signed({measurement_q2[15], measurement_q2})
                               - $signed({baseline_q2[15], baseline_q2});
            end
        end
    end

endmodule

