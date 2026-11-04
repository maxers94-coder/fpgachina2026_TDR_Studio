//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
//Date        : Wed Oct 28 18:51:32 2026
//Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    adc_clip_led,
    adc_data_n,
    adc_data_p,
    adc_dco_n,
    adc_dco_p,
    adc_ready_led,
    adk_spi_csb,
    adk_spi_sclk,
    adk_spi_sda,
    clk_50m,
    dac_data_n,
    dac_data_p,
    dac_dci_n,
    dac_dci_p,
    dac_done_led,
    dac_spi_csb,
    dac_spi_sclk,
    dac_spi_sdio,
    pll_done_led);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output adc_clip_led;
  input [13:0]adc_data_n;
  input [13:0]adc_data_p;
  input adc_dco_n;
  input adc_dco_p;
  output adc_ready_led;
  output adk_spi_csb;
  output adk_spi_sclk;
  output adk_spi_sda;
  input clk_50m;
  output [15:0]dac_data_n;
  output [15:0]dac_data_p;
  output dac_dci_n;
  output dac_dci_p;
  output dac_done_led;
  output dac_spi_csb;
  output dac_spi_sclk;
  inout dac_spi_sdio;
  output pll_done_led;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire adc_clip_led;
  wire [13:0]adc_data_n;
  wire [13:0]adc_data_p;
  wire adc_dco_n;
  wire adc_dco_p;
  wire adc_ready_led;
  wire adk_spi_csb;
  wire adk_spi_sclk;
  wire adk_spi_sda;
  wire clk_50m;
  wire [15:0]dac_data_n;
  wire [15:0]dac_data_p;
  wire dac_dci_n;
  wire dac_dci_p;
  wire dac_done_led;
  wire dac_spi_csb;
  wire dac_spi_sclk;
  wire dac_spi_sdio;
  wire pll_done_led;

  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .adc_clip_led(adc_clip_led),
        .adc_data_n(adc_data_n),
        .adc_data_p(adc_data_p),
        .adc_dco_n(adc_dco_n),
        .adc_dco_p(adc_dco_p),
        .adc_ready_led(adc_ready_led),
        .adk_spi_csb(adk_spi_csb),
        .adk_spi_sclk(adk_spi_sclk),
        .adk_spi_sda(adk_spi_sda),
        .clk_50m(clk_50m),
        .dac_data_n(dac_data_n),
        .dac_data_p(dac_data_p),
        .dac_dci_n(dac_dci_n),
        .dac_dci_p(dac_dci_p),
        .dac_done_led(dac_done_led),
        .dac_spi_csb(dac_spi_csb),
        .dac_spi_sclk(dac_spi_sclk),
        .dac_spi_sdio(dac_spi_sdio),
        .pll_done_led(pll_done_led));
endmodule
