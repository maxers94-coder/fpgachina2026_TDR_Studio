`timescale 1ns/1ps
// 32-bit phase accumulator, signed 16-bit ROM, peak 8192 (-12 dBFS).
// f_out = f_DCI * PHASE_STEP / 2^32; 429496730 -> 10 MHz at 100 MHz.
module sine_dds #(
    parameter [31:0] PHASE_STEP=32'd429496730,
    parameter integer Q_MODE=1 // 0=zero, 1=same sine, 2=cosine
) (
    input wire clk, input wire rst, input wire enable,
    input wire [2:0] test_mode,
    output reg signed [15:0] i_sample, q_sample
);
    // Small distributed read-only table avoids BRAM asynchronous address/control
    // optimization at reset; no block RAM write/control behavior is involved.
    (* rom_style="distributed" *) reg signed [15:0] sine_rom [0:1023];
    reg [31:0] phase;
    wire [31:0] phase_step = test_mode==3 ? 32'd214748365 :
                                  test_mode==4 ? 32'd858993459 : PHASE_STEP;
    wire [9:0] sine_address=phase[31:22];
    wire [9:0] cosine_address=sine_address+10'd256;
    wire signed [15:0] lut_i=sine_rom[sine_address];
    wire signed [15:0] lut_q=sine_rom[cosine_address];
    initial begin
        $readmemh("sine_q15.mem", sine_rom);
        if (Q_MODE<0 || Q_MODE>2) $error("Q_MODE must be 0,1,2");
    end
    always @(posedge clk) begin
        if (rst || !enable || test_mode==2) begin phase<=0; i_sample<=0; q_sample<=0; end
        else begin
            phase<=phase+phase_step;
            i_sample<=test_mode==1 ? (lut_i >>> 1) : lut_i;
            if (Q_MODE==0) q_sample<=0;
            else if (Q_MODE==1) q_sample<=test_mode==1 ? (lut_i >>> 1) : lut_i;
            else q_sample<=test_mode==1 ? (lut_q >>> 1) : lut_q;
        end
    end
endmodule
