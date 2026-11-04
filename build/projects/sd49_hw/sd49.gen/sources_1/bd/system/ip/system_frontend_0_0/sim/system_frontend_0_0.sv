// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:ac820_adc_dac_frontend_ps:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_frontend_0_0 (
  clk_50m,
  adc_dco_p,
  adc_dco_n,
  adc_data_p,
  adc_data_n,
  adk_spi_sda,
  adk_spi_sclk,
  adk_spi_csb,
  dac_spi_sdio,
  dac_spi_sclk,
  dac_spi_csb,
  dac_dci_p,
  dac_dci_n,
  dac_data_p,
  dac_data_n,
  pll_done_led,
  dac_done_led,
  adc_ready_led,
  adc_clip_led,
  echo_clk_acq,
  echo_rst_acq,
  echo_adc_ready,
  echo_pair_valid,
  echo_sample_rise_u14,
  echo_sample_fall_u14,
  echo_sample_clip,
  echo_pulse_start_acq,
  echo_pulse_mode,
  echo_pulse_width,
  echo_pn_enable,
  echo_pulse_ready,
  echo_tx_marker,
  echo_frame_meta,
  echo_pulse_frames_sent
);

input wire clk_50m;
input wire adc_dco_p;
input wire adc_dco_n;
input wire [13 : 0] adc_data_p;
input wire [13 : 0] adc_data_n;
output wire adk_spi_sda;
output wire adk_spi_sclk;
output wire adk_spi_csb;
inout wire dac_spi_sdio;
output wire dac_spi_sclk;
output wire dac_spi_csb;
output wire dac_dci_p;
output wire dac_dci_n;
output wire [15 : 0] dac_data_p;
output wire [15 : 0] dac_data_n;
output wire pll_done_led;
output wire dac_done_led;
output wire adc_ready_led;
output wire adc_clip_led;
output wire echo_clk_acq;
output wire echo_rst_acq;
output wire echo_adc_ready;
output wire echo_pair_valid;
output wire [13 : 0] echo_sample_rise_u14;
output wire [13 : 0] echo_sample_fall_u14;
output wire echo_sample_clip;
input wire echo_pulse_start_acq;
input wire [2 : 0] echo_pulse_mode;
input wire [5 : 0] echo_pulse_width;
input wire echo_pn_enable;
output wire echo_pulse_ready;
output wire echo_tx_marker;
output wire [31 : 0] echo_frame_meta;
output wire [5 : 0] echo_pulse_frames_sent;

  ac820_adc_dac_frontend_ps #(
    .PHASE_STEP(32'H1999999A),
    .Q_MODE(1),
    .ADC_IDELAY_TAP(4),
    .POWERUP_CYCLES(50000),
    .SPI_HALF_PERIOD(25),
    .CLOCK_SETTLE_CYCLES(5000000),
    .PLL_WAIT_CYCLES(500000),
    .POLL_LIMIT(4096),
    .CLOCK_WAIT_CYCLES(5000000),
    .MONITOR_WINDOW(50000)
  ) inst (
    .clk_50m(clk_50m),
    .adc_dco_p(adc_dco_p),
    .adc_dco_n(adc_dco_n),
    .adc_data_p(adc_data_p),
    .adc_data_n(adc_data_n),
    .adk_spi_sda(adk_spi_sda),
    .adk_spi_sclk(adk_spi_sclk),
    .adk_spi_csb(adk_spi_csb),
    .dac_spi_sdio(dac_spi_sdio),
    .dac_spi_sclk(dac_spi_sclk),
    .dac_spi_csb(dac_spi_csb),
    .dac_dci_p(dac_dci_p),
    .dac_dci_n(dac_dci_n),
    .dac_data_p(dac_data_p),
    .dac_data_n(dac_data_n),
    .pll_done_led(pll_done_led),
    .dac_done_led(dac_done_led),
    .adc_ready_led(adc_ready_led),
    .adc_clip_led(adc_clip_led),
    .echo_clk_acq(echo_clk_acq),
    .echo_rst_acq(echo_rst_acq),
    .echo_adc_ready(echo_adc_ready),
    .echo_pair_valid(echo_pair_valid),
    .echo_sample_rise_u14(echo_sample_rise_u14),
    .echo_sample_fall_u14(echo_sample_fall_u14),
    .echo_sample_clip(echo_sample_clip),
    .echo_pulse_start_acq(echo_pulse_start_acq),
    .echo_pulse_mode(echo_pulse_mode),
    .echo_pulse_width(echo_pulse_width),
    .echo_pn_enable(echo_pn_enable),
    .echo_pulse_ready(echo_pulse_ready),
    .echo_tx_marker(echo_tx_marker),
    .echo_frame_meta(echo_frame_meta),
    .echo_pulse_frames_sent(echo_pulse_frames_sent)
  );
endmodule
