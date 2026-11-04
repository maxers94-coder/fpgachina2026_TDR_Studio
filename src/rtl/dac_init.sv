`timescale 1ns/1ps
// Board clock table comes from the supplied K7 demo, DAC startup from AD9142A
// Rev.B sequence 2. All sequencing runs on clk_50m; failures latch until reset.
module dac_init #(
    parameter integer SPI_HALF_PERIOD = 25,
    parameter integer CLOCK_SETTLE_CYCLES = 5_000_000, // 100 ms
    parameter integer PLL_WAIT_CYCLES = 500_000,       // 10 ms
    parameter integer POLL_LIMIT = 4096,
    parameter integer CLOCK_WAIT_CYCLES = 5_000_000,
    // Default 0 preserves all existing pure-PL top-level instantiations.
    // Set to 1 when the caller places an explicit IOBUF at its boundary.
    parameter integer EXTERNAL_SDIO_IOBUF = 0
) (
    input wire clk, input wire rst, input wire dco_alive,
    output wire adk_sclk, output wire adk_csb, output wire adk_sda,
    output wire dac_sclk, output wire dac_csb, inout wire dac_sdio,
    input wire dac_sdio_i,
    output wire dac_sdio_o, output wire dac_sdio_t,
    output reg clock_config_done, output reg dac_config_done,
    output reg [3:0] error_code,
    output reg [7:0] pll_status, fifo_status, fifo_level,
    output wire [3:0] state_debug
);
    localparam [3:0] CLOCK_SEND=0, CLOCK_WAIT=1, SETTLE=2, WAIT_DCO=3,
        DAC_SEND=4, DAC_WAIT=5, PLL_DELAY=6, SUCCESS=7, FAILED=8;
    reg [3:0] state;
    assign state_debug = state;
    reg [23:0] clock_rom [0:75];
    initial $readmemh("ad9516_adc200m_dacref200m.mem", clock_rom);
    reg [6:0] clock_index;
    reg [5:0] dac_index;
    reg [31:0] wait_count, poll_count;
    reg adk_start, dac_start;
    wire adk_busy, adk_done, dac_busy, dac_done;
    wire [7:0] dac_rdata;
    wire dac_oe, dac_mosi;
    wire dac_sdio_read;
    spi24_master #(.HALF_PERIOD(SPI_HALF_PERIOD)) clock_spi (
        .clk(clk), .rst(rst), .start(adk_start), .command(clock_rom[clock_index]),
        .sdio_in(1'b0), .sclk(adk_sclk), .cs_n(adk_csb),
        .sdio_out(adk_sda), .sdio_oe(), .busy(adk_busy), .done(adk_done), .read_data()
    );
    spi24_master #(.HALF_PERIOD(SPI_HALF_PERIOD)) dac_spi (
        .clk(clk), .rst(rst), .start(dac_start), .command(dac_command(dac_index)),
        .sdio_in(dac_sdio_read), .sclk(dac_sclk), .cs_n(dac_csb),
        .sdio_out(dac_mosi), .sdio_oe(dac_oe), .busy(dac_busy),
        .done(dac_done), .read_data(dac_rdata)
    );
    assign dac_sdio_o = dac_mosi;
    assign dac_sdio_t = ~dac_oe;
    generate
        if (EXTERNAL_SDIO_IOBUF != 0) begin : g_external_sdio_iobuf
            assign dac_sdio = 1'bz;
            assign dac_sdio_read = dac_sdio_i;
        end else begin : g_inferred_sdio_iobuf
            assign dac_sdio = dac_oe ? dac_mosi : 1'bz;
            assign dac_sdio_read = dac_sdio;
        end
    endgenerate
    function automatic [23:0] dac_command(input [5:0] index);
        case(index)
            0: dac_command=24'h000020; // software reset
            1: dac_command=24'h002001; // required startup
            2: dac_command=24'h0014e7; // PLL loop filter
            3: dac_command=24'h0015c5; // 200M REF *4 =800M DAC, VCO /2 =1.6G
            4: dac_command=24'h0012c0; // enable, enter manual mode
            5: dac_command=24'h001280; // trigger automatic VCO band search
            6: dac_command=24'h801600; // PLL lock, bit 7
            7: dac_command=24'h005e00; // delay line setting 0
            8: dac_command=24'h005f60;
            9: dac_command=24'h000d16; // DC coupling; DLL disabled
           10: dac_command=24'h000a00;
           11: dac_command=24'h002803; // 8x interpolation
           12: dac_command=24'h002600; // two's complement, word interface
           13: dac_command=24'h002501; // FIFO reset request (DCI already running!)
           14: dac_command=24'h802500; // poll FIFO reset acknowledge, bit 1
           15: dac_command=24'h802400; // validate FIFO pointer separation
           16: dac_command=24'h002780; // inverse sinc, NCO disabled
           17: dac_command=24'h0018f9; // nominal 20 mA full-scale; preserve reserved bits
           18: dac_command=24'h0019e1;
           19: dac_command=24'h001af9;
           20: dac_command=24'h001b01;
           21: dac_command=24'h000100; // power up analog outputs
           22: dac_command=24'h802600; // verify data-format register readback
           23: dac_command=24'h802800; // verify interpolation register readback
           default: dac_command=24'h000000;
        endcase
    endfunction
    always @(posedge clk) begin
        if (rst) begin
            state<=CLOCK_SEND; clock_index<=0; dac_index<=0;
            wait_count<=0; poll_count<=0; adk_start<=0; dac_start<=0;
            clock_config_done<=0; dac_config_done<=0; error_code<=0;
            pll_status<=0; fifo_status<=0; fifo_level<=0;
        end else begin
            adk_start<=0; dac_start<=0;
            case(state)
                CLOCK_SEND: if (!adk_busy) begin adk_start<=1; state<=CLOCK_WAIT; end
                CLOCK_WAIT: if (adk_done) begin
                    if (clock_index==75) begin
                        clock_config_done<=1; wait_count<=0; state<=SETTLE;
                    end else begin clock_index<=clock_index+1'b1; state<=CLOCK_SEND; end
                end
                SETTLE: if (wait_count>=CLOCK_SETTLE_CYCLES-1) begin
                    wait_count<=0; state<=WAIT_DCO;
                end else wait_count<=wait_count+1'b1;
                WAIT_DCO: if (dco_alive) begin
                    wait_count<=0; dac_index<=0; state<=DAC_SEND;
                end else if (wait_count>=CLOCK_WAIT_CYCLES-1) begin
                    error_code<=1; state<=FAILED;
                end else wait_count<=wait_count+1'b1;
                DAC_SEND: if (!dac_busy) begin dac_start<=1; state<=DAC_WAIT; end
                DAC_WAIT: if (dac_done) begin
                    if (dac_index==6) pll_status<=dac_rdata;
                    if (dac_index==14) fifo_status<=dac_rdata;
                    if (dac_index==15) fifo_level<=dac_rdata;
                    if (((dac_index==6) && !dac_rdata[7]) ||
                        ((dac_index==14) && !dac_rdata[1]) ||
                        ((dac_index==15) && !(dac_rdata==8'h37 || dac_rdata==8'h40 || dac_rdata==8'h41))) begin
                        if (poll_count>=POLL_LIMIT-1) begin
                            if (dac_index==6) error_code<=2;
                            else if (dac_index==14) error_code<=3;
                            else error_code<=4;
                            state<=FAILED;
                        end else begin poll_count<=poll_count+1'b1; state<=DAC_SEND; end
                    end else if ((dac_index==22 && dac_rdata!=0) ||
                                 (dac_index==23 && dac_rdata!=8'h03)) begin
                        error_code<=5; state<=FAILED;
                    end else if (dac_index==23) begin
                        dac_config_done<=1; state<=SUCCESS;
                    end else begin
                        poll_count<=0; dac_index<=dac_index+1'b1;
                        if (dac_index==5) begin wait_count<=0; state<=PLL_DELAY; end
                        else state<=DAC_SEND;
                    end
                end
                PLL_DELAY: if (wait_count>=PLL_WAIT_CYCLES-1) state<=DAC_SEND;
                    else wait_count<=wait_count+1'b1;
                SUCCESS: if (!dco_alive) begin
                    dac_config_done<=0; error_code<=1; state<=FAILED;
                end
                FAILED: dac_config_done<=0;
                default: begin error_code<=15; state<=FAILED; end
            endcase
        end
    end
endmodule
