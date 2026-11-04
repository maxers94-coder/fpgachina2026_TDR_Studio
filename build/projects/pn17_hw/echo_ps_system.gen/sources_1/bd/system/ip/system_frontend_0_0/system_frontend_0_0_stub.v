// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Wed Oct 28 18:53:14 2026
// Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado_project/pn17_hw/echo_ps_system.gen/sources_1/bd/system/ip/system_frontend_0_0/system_frontend_0_0_stub.v
// Design      : system_frontend_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "system_frontend_0_0,ac820_adc_dac_frontend_ps,{}" *) (* CORE_GENERATION_INFO = "system_frontend_0_0,ac820_adc_dac_frontend_ps,{x_ipProduct=Vivado 2026.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ac820_adc_dac_frontend_ps,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,PHASE_STEP=0x1999999A,Q_MODE=1,ADC_IDELAY_TAP=4,POWERUP_CYCLES=50000,SPI_HALF_PERIOD=25,CLOCK_SETTLE_CYCLES=5000000,PLL_WAIT_CYCLES=500000,POLL_LIMIT=4096,CLOCK_WAIT_CYCLES=5000000,MONITOR_WINDOW=50000}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "ac820_adc_dac_frontend_ps,Vivado 2026.1" *) 
module system_frontend_0_0(clk_50m, adc_dco_p, adc_dco_n, adc_data_p, 
  adc_data_n, adk_spi_sda, adk_spi_sclk, adk_spi_csb, dac_spi_sdio, dac_spi_sclk, dac_spi_csb, 
  dac_dci_p, dac_dci_n, dac_data_p, dac_data_n, pll_done_led, dac_done_led, adc_ready_led, 
  adc_clip_led, echo_clk_acq, echo_rst_acq, echo_adc_ready, echo_pair_valid, 
  echo_sample_rise_u14, echo_sample_fall_u14, echo_sample_clip, echo_pulse_start_acq, 
  echo_pulse_mode, echo_pulse_width, echo_pn_enable, echo_pulse_ready, echo_tx_marker, 
  echo_frame_meta, echo_pulse_frames_sent)
/* synthesis syn_black_box black_box_pad_pin="adc_dco_p,adc_dco_n,adc_data_p[13:0],adc_data_n[13:0],adk_spi_sda,adk_spi_sclk,adk_spi_csb,dac_spi_sdio,dac_spi_sclk,dac_spi_csb,dac_dci_p,dac_dci_n,dac_data_p[15:0],dac_data_n[15:0],pll_done_led,dac_done_led,adc_ready_led,adc_clip_led,echo_rst_acq,echo_adc_ready,echo_pair_valid,echo_sample_rise_u14[13:0],echo_sample_fall_u14[13:0],echo_sample_clip,echo_pulse_start_acq,echo_pulse_mode[2:0],echo_pulse_width[5:0],echo_pn_enable,echo_pulse_ready,echo_tx_marker,echo_frame_meta[31:0],echo_pulse_frames_sent[5:0]" */
/* synthesis syn_force_seq_prim="clk_50m" */
/* synthesis syn_force_seq_prim="echo_clk_acq" */;
  input clk_50m /* synthesis syn_isclock = 1 */;
  input adc_dco_p;
  input adc_dco_n;
  input [13:0]adc_data_p;
  input [13:0]adc_data_n;
  output adk_spi_sda;
  output adk_spi_sclk;
  output adk_spi_csb;
  inout dac_spi_sdio;
  output dac_spi_sclk;
  output dac_spi_csb;
  output dac_dci_p;
  output dac_dci_n;
  output [15:0]dac_data_p;
  output [15:0]dac_data_n;
  output pll_done_led;
  output dac_done_led;
  output adc_ready_led;
  output adc_clip_led;
  output echo_clk_acq /* synthesis syn_isclock = 1 */;
  output echo_rst_acq;
  output echo_adc_ready;
  output echo_pair_valid;
  output [13:0]echo_sample_rise_u14;
  output [13:0]echo_sample_fall_u14;
  output echo_sample_clip;
  input echo_pulse_start_acq;
  input [2:0]echo_pulse_mode;
  input [5:0]echo_pulse_width;
  input echo_pn_enable;
  output echo_pulse_ready;
  output echo_tx_marker;
  output [31:0]echo_frame_meta;
  output [5:0]echo_pulse_frames_sent;
endmodule
