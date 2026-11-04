`timescale 1ns/1ps
// Mode-0, MSB-first, 16 instruction bits + 8 data bits. No fabric clocks.
// AD9516: {R/W, 2'b00, address[12:0]}; AD9142A: {R/W, address[14:0]}.
module spi24_master #(
    parameter integer HALF_PERIOD = 25
) (
    input wire clk, input wire rst,
    input wire start, input wire [23:0] command,
    input wire sdio_in,
    output reg sclk, output reg cs_n,
    output reg sdio_out, output reg sdio_oe,
    output reg busy, output reg done, output reg [7:0] read_data
);
    localparam integer CW = (HALF_PERIOD < 2) ? 1 : $clog2(HALF_PERIOD);
    reg [CW-1:0] divider;
    reg [4:0] bit_index;
    reg [23:0] tx;
    reg is_read;
    // External SDIO is stable for nearly half an SPI cycle before sampling.
    (* ASYNC_REG="TRUE" *) reg sdio_meta, sdio_sync;
    always @(posedge clk) begin
        if (rst) begin sdio_meta <= 0; sdio_sync <= 0; end
        else begin sdio_meta <= sdio_in; sdio_sync <= sdio_meta; end
    end
    initial if (HALF_PERIOD < 4) $error("SPI HALF_PERIOD must be >=4 for input synchronizer");
    always @(posedge clk) begin
        if (rst) begin
            divider <= 0; bit_index <= 0; tx <= 0; is_read <= 0;
            sclk <= 0; cs_n <= 1; sdio_out <= 0; sdio_oe <= 0;
            busy <= 0; done <= 0; read_data <= 0;
        end else begin
            done <= 0;
            if (!busy) begin
                sclk <= 0; cs_n <= 1; sdio_oe <= 0;
                if (start) begin
                    tx <= command; is_read <= command[23];
                    bit_index <= 23; divider <= 0;
                    sdio_out <= command[23]; sdio_oe <= 1;
                    cs_n <= 0; busy <= 1; read_data <= 0;
                end
            end else if (divider == HALF_PERIOD-1) begin
                divider <= 0;
                if (!sclk) begin
                    sclk <= 1;
                    if (is_read && bit_index < 8)
                        read_data <= {read_data[6:0], sdio_sync};
                end else begin
                    sclk <= 0;
                    if (bit_index == 0) begin
                        cs_n <= 1; sdio_oe <= 0; busy <= 0; done <= 1;
                    end else begin
                        bit_index <= bit_index - 1'b1;
                        sdio_out <= tx[bit_index-1'b1];
                        if (is_read && bit_index == 8) sdio_oe <= 0;
                    end
                end
            end else divider <= divider + 1'b1;
        end
    end
endmodule
