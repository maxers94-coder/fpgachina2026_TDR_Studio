`timescale 1ns/1ps
// AD9142A word mode: I on rising edge, Q on falling edge of the 100 MHz DCI.
// Forward DCI continuously after DCO reset release, including DAC SPI startup.
// Delay-line tap0 adds internal clock delay; do not add arbitrary 90-degree DCI.
module dac_lvds_tx (
    input wire clk, input wire rst,
    input wire [15:0] i_sample, q_sample,
    output wire dac_dci_p, dac_dci_n,
    output wire [15:0] dac_data_p, dac_data_n
);
    wire dci_se;
    wire [15:0] data_se;
    ODDR #(.DDR_CLK_EDGE("SAME_EDGE"),.INIT(1'b0),.SRTYPE("ASYNC")) dci_oddr (
        .C(clk),.CE(1'b1),.D1(1'b1),.D2(1'b0),.R(rst),.S(1'b0),.Q(dci_se)
    );
    OBUFDS #(.IOSTANDARD("LVDS_25")) dci_buf (.I(dci_se),.O(dac_dci_p),.OB(dac_dci_n));
    genvar n;
    generate for(n=0;n<16;n=n+1) begin: data_bit
        ODDR #(.DDR_CLK_EDGE("SAME_EDGE"),.INIT(1'b0),.SRTYPE("ASYNC")) data_oddr (
            .C(clk),.CE(1'b1),.D1(i_sample[n]),.D2(q_sample[n]),.R(rst),.S(1'b0),.Q(data_se[n])
        );
        OBUFDS #(.IOSTANDARD("LVDS_25")) data_buf (
            .I(data_se[n]),.O(dac_data_p[n]),.OB(dac_data_n[n])
        );
    end endgenerate
endmodule
