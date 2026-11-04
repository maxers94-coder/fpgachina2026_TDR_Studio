// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Wed Oct 28 18:53:14 2026
// Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vivado_project/pn17_hw/echo_ps_system.gen/sources_1/bd/system/ip/system_frontend_0_0/system_frontend_0_0_sim_netlist.v
// Design      : system_frontend_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_frontend_0_0,ac820_adc_dac_frontend_ps,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ac820_adc_dac_frontend_ps,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module system_frontend_0_0
   (clk_50m,
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
    echo_pulse_frames_sent);
  input clk_50m;
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
  output echo_clk_acq;
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

  wire adc_clip_led;
  (* DIFF_TERM *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire [13:0]adc_data_n;
  (* DIFF_TERM *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire [13:0]adc_data_p;
  (* DIFF_TERM *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire adc_dco_n;
  (* DIFF_TERM *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire adc_dco_p;
  wire adc_ready_led;
  wire adk_spi_csb;
  wire adk_spi_sclk;
  wire adk_spi_sda;
  wire clk_50m;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire [15:0]dac_data_n;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire [15:0]dac_data_p;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire dac_dci_n;
  (* IOSTANDARD = "LVDS_25" *) (* SLEW = "SLOW" *) wire dac_dci_p;
  wire dac_done_led;
  wire dac_spi_csb;
  wire dac_spi_sclk;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire dac_spi_sdio;
  wire echo_adc_ready;
  wire echo_clk_acq;
  wire [31:0]echo_frame_meta;
  wire echo_pair_valid;
  wire echo_pn_enable;
  wire [5:0]echo_pulse_frames_sent;
  wire [2:0]echo_pulse_mode;
  wire echo_pulse_ready;
  wire echo_pulse_start_acq;
  wire [5:0]echo_pulse_width;
  wire echo_rst_acq;
  wire echo_sample_clip;
  wire [13:0]echo_sample_fall_u14;
  wire [13:0]echo_sample_rise_u14;
  wire echo_tx_marker;
  wire pll_done_led;

  system_frontend_0_0_ac820_adc_dac_frontend_ps inst
       (.D({echo_pn_enable,echo_pulse_mode,echo_pulse_width}),
        .adc_clip_led(adc_clip_led),
        .adc_data_n(adc_data_n),
        .adc_data_p(adc_data_p),
        .adc_dco_n(adc_dco_n),
        .adc_dco_p(adc_dco_p),
        .adc_ready_led(adc_ready_led),
        .adk_spi_csb(adk_spi_csb),
        .adk_spi_sda(adk_spi_sda),
        .clk_50m(clk_50m),
        .dac_data_n(dac_data_n),
        .dac_data_p(dac_data_p),
        .dac_dci_n(dac_dci_n),
        .dac_dci_p(dac_dci_p),
        .dac_done_led(dac_done_led),
        .dac_spi_csb(dac_spi_csb),
        .dac_spi_sdio(dac_spi_sdio),
        .echo_clk_acq(echo_clk_acq),
        .echo_frame_meta(echo_frame_meta),
        .echo_pair_valid(echo_pair_valid),
        .echo_pulse_frames_sent(echo_pulse_frames_sent),
        .echo_pulse_ready(echo_pulse_ready),
        .echo_pulse_start_acq(echo_pulse_start_acq),
        .echo_rst_acq(echo_rst_acq),
        .echo_sample_clip(echo_sample_clip),
        .echo_sample_fall_u14(echo_sample_fall_u14),
        .echo_sample_rise_u14(echo_sample_rise_u14),
        .echo_tx_marker(echo_tx_marker),
        .idelay_ready_reg(echo_adc_ready),
        .pll_done_led(pll_done_led),
        .sclk_reg(adk_spi_sclk),
        .sclk_reg_0(dac_spi_sclk));
endmodule

(* ORIG_REF_NAME = "ac820_adc_dac_frontend_ps" *) 
module system_frontend_0_0_ac820_adc_dac_frontend_ps
   (sclk_reg,
    idelay_ready_reg,
    dac_data_p,
    dac_data_n,
    dac_dci_p,
    dac_dci_n,
    echo_clk_acq,
    echo_rst_acq,
    pll_done_led,
    dac_done_led,
    adc_ready_led,
    adc_clip_led,
    echo_pair_valid,
    echo_sample_rise_u14,
    echo_sample_fall_u14,
    echo_sample_clip,
    echo_pulse_ready,
    echo_tx_marker,
    echo_frame_meta,
    sclk_reg_0,
    echo_pulse_frames_sent,
    adk_spi_csb,
    adk_spi_sda,
    dac_spi_csb,
    dac_spi_sdio,
    clk_50m,
    adc_data_p,
    adc_data_n,
    adc_dco_p,
    adc_dco_n,
    D,
    echo_pulse_start_acq);
  output sclk_reg;
  output idelay_ready_reg;
  output [15:0]dac_data_p;
  output [15:0]dac_data_n;
  output dac_dci_p;
  output dac_dci_n;
  output echo_clk_acq;
  output echo_rst_acq;
  output pll_done_led;
  output dac_done_led;
  output adc_ready_led;
  output adc_clip_led;
  output echo_pair_valid;
  output [13:0]echo_sample_rise_u14;
  output [13:0]echo_sample_fall_u14;
  output echo_sample_clip;
  output echo_pulse_ready;
  output echo_tx_marker;
  output [31:0]echo_frame_meta;
  output sclk_reg_0;
  output [5:0]echo_pulse_frames_sent;
  output adk_spi_csb;
  output adk_spi_sda;
  output dac_spi_csb;
  inout dac_spi_sdio;
  input clk_50m;
  input [13:0]adc_data_p;
  input [13:0]adc_data_n;
  input adc_dco_p;
  input adc_dco_n;
  input [9:0]D;
  input echo_pulse_start_acq;

  wire [9:0]D;
  wire adc_clip_led;
  wire adc_clip_sticky;
  wire adc_clip_sticky_1;
  (* async_reg = "true" *) wire [1:0]adc_clip_sync;
  wire adc_clock_unbuffered;
  wire [13:0]adc_data_n;
  wire [13:0]adc_data_p;
  wire adc_dco_n;
  wire adc_dco_p;
  wire adc_ready_led;
  (* async_reg = "true" *) wire [1:0]adc_ready_sync;
  wire adc_reset_source;
  wire adk_spi_csb;
  wire adk_spi_sda;
  wire \blink_count[0]_i_1_n_0 ;
  wire \blink_count[0]_i_3_n_0 ;
  wire \blink_count[0]_i_4_n_0 ;
  wire \blink_count[0]_i_5_n_0 ;
  wire \blink_count[0]_i_6_n_0 ;
  wire \blink_count[0]_i_7_n_0 ;
  wire \blink_count[0]_i_8_n_0 ;
  wire [24:0]blink_count_reg;
  wire \blink_count_reg[0]_i_2_n_0 ;
  wire \blink_count_reg[0]_i_2_n_1 ;
  wire \blink_count_reg[0]_i_2_n_2 ;
  wire \blink_count_reg[0]_i_2_n_3 ;
  wire \blink_count_reg[0]_i_2_n_4 ;
  wire \blink_count_reg[0]_i_2_n_5 ;
  wire \blink_count_reg[0]_i_2_n_6 ;
  wire \blink_count_reg[0]_i_2_n_7 ;
  wire \blink_count_reg[12]_i_1_n_0 ;
  wire \blink_count_reg[12]_i_1_n_1 ;
  wire \blink_count_reg[12]_i_1_n_2 ;
  wire \blink_count_reg[12]_i_1_n_3 ;
  wire \blink_count_reg[12]_i_1_n_4 ;
  wire \blink_count_reg[12]_i_1_n_5 ;
  wire \blink_count_reg[12]_i_1_n_6 ;
  wire \blink_count_reg[12]_i_1_n_7 ;
  wire \blink_count_reg[16]_i_1_n_0 ;
  wire \blink_count_reg[16]_i_1_n_1 ;
  wire \blink_count_reg[16]_i_1_n_2 ;
  wire \blink_count_reg[16]_i_1_n_3 ;
  wire \blink_count_reg[16]_i_1_n_4 ;
  wire \blink_count_reg[16]_i_1_n_5 ;
  wire \blink_count_reg[16]_i_1_n_6 ;
  wire \blink_count_reg[16]_i_1_n_7 ;
  wire \blink_count_reg[20]_i_1_n_0 ;
  wire \blink_count_reg[20]_i_1_n_1 ;
  wire \blink_count_reg[20]_i_1_n_2 ;
  wire \blink_count_reg[20]_i_1_n_3 ;
  wire \blink_count_reg[20]_i_1_n_4 ;
  wire \blink_count_reg[20]_i_1_n_5 ;
  wire \blink_count_reg[20]_i_1_n_6 ;
  wire \blink_count_reg[20]_i_1_n_7 ;
  wire \blink_count_reg[24]_i_1_n_7 ;
  wire \blink_count_reg[4]_i_1_n_0 ;
  wire \blink_count_reg[4]_i_1_n_1 ;
  wire \blink_count_reg[4]_i_1_n_2 ;
  wire \blink_count_reg[4]_i_1_n_3 ;
  wire \blink_count_reg[4]_i_1_n_4 ;
  wire \blink_count_reg[4]_i_1_n_5 ;
  wire \blink_count_reg[4]_i_1_n_6 ;
  wire \blink_count_reg[4]_i_1_n_7 ;
  wire \blink_count_reg[8]_i_1_n_0 ;
  wire \blink_count_reg[8]_i_1_n_1 ;
  wire \blink_count_reg[8]_i_1_n_2 ;
  wire \blink_count_reg[8]_i_1_n_3 ;
  wire \blink_count_reg[8]_i_1_n_4 ;
  wire \blink_count_reg[8]_i_1_n_5 ;
  wire \blink_count_reg[8]_i_1_n_6 ;
  wire \blink_count_reg[8]_i_1_n_7 ;
  wire burst_i_n_0;
  wire burst_start_cdc_n_1;
  wire burst_start_dac;
  wire clk_50m;
  wire clk_dac;
  wire clk_dco;
  wire clock_config_done;
  wire dac_clock_unbuffered;
  wire dac_config_done;
  wire [15:0]dac_data_n;
  wire [15:0]dac_data_p;
  wire dac_dci_n;
  wire dac_dci_p;
  wire dac_done_led;
  wire dac_done_led0;
  wire dac_done_led_i_2_n_0;
  wire dac_done_led_i_3_n_0;
  wire dac_done_led_i_5_n_0;
  wire dac_done_led_i_6_n_0;
  wire dac_done_led_i_7_n_0;
  wire dac_sdio_i;
  wire dac_sdio_o;
  wire dac_sdio_t;
  wire dac_spi_csb;
  wire dac_spi_sdio;
  wire dco_alive;
  wire dco_alive_i_1_n_0;
  wire dco_se;
  wire echo_clk_acq;
  wire [31:0]echo_frame_meta;
  wire echo_pair_valid;
  wire [5:0]echo_pulse_frames_sent;
  wire echo_pulse_ready;
  wire echo_pulse_start_acq;
  wire echo_rst_acq;
  wire echo_sample_clip;
  wire [13:0]echo_sample_fall_u14;
  wire [13:0]echo_sample_rise_u14;
  wire echo_tx_marker;
  wire edge_seen;
  wire edge_seen_i_1_n_0;
  (* async_reg = "true" *) wire [1:0]enable_sync;
  wire frame_meta_q0;
  wire \heartbeat_div[9]_i_2_n_0 ;
  wire [9:9]heartbeat_div_reg;
  wire \heartbeat_div_reg_n_0_[0] ;
  wire \heartbeat_div_reg_n_0_[1] ;
  wire \heartbeat_div_reg_n_0_[2] ;
  wire \heartbeat_div_reg_n_0_[3] ;
  wire \heartbeat_div_reg_n_0_[4] ;
  wire \heartbeat_div_reg_n_0_[5] ;
  wire \heartbeat_div_reg_n_0_[6] ;
  wire \heartbeat_div_reg_n_0_[7] ;
  wire \heartbeat_div_reg_n_0_[8] ;
  wire heartbeat_previous;
  (* async_reg = "true" *) wire [2:0]heartbeat_sync;
  (* async_reg = "true" *) wire [1:0]idelay_ready_dac;
  wire idelay_ready_reg;
  wire launch_marker;
  wire launch_marker0;
  wire [9:9]launch_meta;
  wire \launch_meta_reg_n_0_[0] ;
  wire \launch_meta_reg_n_0_[10] ;
  wire \launch_meta_reg_n_0_[11] ;
  wire \launch_meta_reg_n_0_[12] ;
  wire \launch_meta_reg_n_0_[13] ;
  wire \launch_meta_reg_n_0_[14] ;
  wire \launch_meta_reg_n_0_[15] ;
  wire \launch_meta_reg_n_0_[16] ;
  wire \launch_meta_reg_n_0_[17] ;
  wire \launch_meta_reg_n_0_[18] ;
  wire \launch_meta_reg_n_0_[19] ;
  wire \launch_meta_reg_n_0_[1] ;
  wire \launch_meta_reg_n_0_[20] ;
  wire \launch_meta_reg_n_0_[21] ;
  wire \launch_meta_reg_n_0_[22] ;
  wire \launch_meta_reg_n_0_[23] ;
  wire \launch_meta_reg_n_0_[24] ;
  wire \launch_meta_reg_n_0_[25] ;
  wire \launch_meta_reg_n_0_[26] ;
  wire \launch_meta_reg_n_0_[27] ;
  wire \launch_meta_reg_n_0_[28] ;
  wire \launch_meta_reg_n_0_[29] ;
  wire \launch_meta_reg_n_0_[2] ;
  wire \launch_meta_reg_n_0_[30] ;
  wire \launch_meta_reg_n_0_[31] ;
  wire \launch_meta_reg_n_0_[3] ;
  wire \launch_meta_reg_n_0_[4] ;
  wire \launch_meta_reg_n_0_[5] ;
  wire \launch_meta_reg_n_0_[6] ;
  wire \launch_meta_reg_n_0_[7] ;
  wire \launch_meta_reg_n_0_[8] ;
  (* async_reg = "true" *) wire [1:0]locked_sync;
  wire mmcm_feedback;
  wire mmcm_feedback_buf;
  wire mmcm_locked;
  wire \monitor_count[0]_i_1_n_0 ;
  wire \monitor_count[0]_i_3_n_0 ;
  wire \monitor_count[0]_i_4_n_0 ;
  wire \monitor_count[0]_i_5_n_0 ;
  wire \monitor_count[0]_i_6_n_0 ;
  wire \monitor_count[0]_i_7_n_0 ;
  wire [15:0]monitor_count_reg;
  wire \monitor_count_reg[0]_i_2_n_0 ;
  wire \monitor_count_reg[0]_i_2_n_1 ;
  wire \monitor_count_reg[0]_i_2_n_2 ;
  wire \monitor_count_reg[0]_i_2_n_3 ;
  wire \monitor_count_reg[0]_i_2_n_4 ;
  wire \monitor_count_reg[0]_i_2_n_5 ;
  wire \monitor_count_reg[0]_i_2_n_6 ;
  wire \monitor_count_reg[0]_i_2_n_7 ;
  wire \monitor_count_reg[12]_i_1_n_1 ;
  wire \monitor_count_reg[12]_i_1_n_2 ;
  wire \monitor_count_reg[12]_i_1_n_3 ;
  wire \monitor_count_reg[12]_i_1_n_4 ;
  wire \monitor_count_reg[12]_i_1_n_5 ;
  wire \monitor_count_reg[12]_i_1_n_6 ;
  wire \monitor_count_reg[12]_i_1_n_7 ;
  wire \monitor_count_reg[4]_i_1_n_0 ;
  wire \monitor_count_reg[4]_i_1_n_1 ;
  wire \monitor_count_reg[4]_i_1_n_2 ;
  wire \monitor_count_reg[4]_i_1_n_3 ;
  wire \monitor_count_reg[4]_i_1_n_4 ;
  wire \monitor_count_reg[4]_i_1_n_5 ;
  wire \monitor_count_reg[4]_i_1_n_6 ;
  wire \monitor_count_reg[4]_i_1_n_7 ;
  wire \monitor_count_reg[8]_i_1_n_0 ;
  wire \monitor_count_reg[8]_i_1_n_1 ;
  wire \monitor_count_reg[8]_i_1_n_2 ;
  wire \monitor_count_reg[8]_i_1_n_3 ;
  wire \monitor_count_reg[8]_i_1_n_4 ;
  wire \monitor_count_reg[8]_i_1_n_5 ;
  wire \monitor_count_reg[8]_i_1_n_6 ;
  wire \monitor_count_reg[8]_i_1_n_7 ;
  wire [9:0]p_0_in;
  wire [12:9]p_0_out;
  wire p_29_in;
  wire pll_done_led;
  wire \power_count[0]_i_2_n_0 ;
  wire [15:4]power_count_reg;
  wire \power_count_reg[0]_i_1_n_0 ;
  wire \power_count_reg[0]_i_1_n_1 ;
  wire \power_count_reg[0]_i_1_n_2 ;
  wire \power_count_reg[0]_i_1_n_3 ;
  wire \power_count_reg[0]_i_1_n_4 ;
  wire \power_count_reg[0]_i_1_n_5 ;
  wire \power_count_reg[0]_i_1_n_6 ;
  wire \power_count_reg[0]_i_1_n_7 ;
  wire \power_count_reg[12]_i_1_n_1 ;
  wire \power_count_reg[12]_i_1_n_2 ;
  wire \power_count_reg[12]_i_1_n_3 ;
  wire \power_count_reg[12]_i_1_n_4 ;
  wire \power_count_reg[12]_i_1_n_5 ;
  wire \power_count_reg[12]_i_1_n_6 ;
  wire \power_count_reg[12]_i_1_n_7 ;
  wire \power_count_reg[4]_i_1_n_0 ;
  wire \power_count_reg[4]_i_1_n_1 ;
  wire \power_count_reg[4]_i_1_n_2 ;
  wire \power_count_reg[4]_i_1_n_3 ;
  wire \power_count_reg[4]_i_1_n_4 ;
  wire \power_count_reg[4]_i_1_n_5 ;
  wire \power_count_reg[4]_i_1_n_6 ;
  wire \power_count_reg[4]_i_1_n_7 ;
  wire \power_count_reg[8]_i_1_n_0 ;
  wire \power_count_reg[8]_i_1_n_1 ;
  wire \power_count_reg[8]_i_1_n_2 ;
  wire \power_count_reg[8]_i_1_n_3 ;
  wire \power_count_reg[8]_i_1_n_4 ;
  wire \power_count_reg[8]_i_1_n_5 ;
  wire \power_count_reg[8]_i_1_n_6 ;
  wire \power_count_reg[8]_i_1_n_7 ;
  wire \power_count_reg_n_0_[0] ;
  wire \power_count_reg_n_0_[1] ;
  wire \power_count_reg_n_0_[2] ;
  wire \power_count_reg_n_0_[3] ;
  (* async_reg = "true" *) wire [9:0]pulse_cfg_sync1;
  (* async_reg = "true" *) wire [9:0]pulse_cfg_sync2;
  wire pulse_i_n_3;
  wire pulse_i_n_6;
  wire pulse_i_n_7;
  wire pulse_ready_dac__1;
  wire pulse_ready_q0;
  wire [13:0]raw_fall;
  wire [13:0]raw_rise;
  wire ref_clk_200m;
  wire ref_feedback;
  wire ref_feedback_buf;
  wire ref_locked;
  wire ref_unbuffered;
  wire repeat_enable;
  wire reset_source;
  (* async_reg = "true" *) wire [2:0]rst_dac_sync;
  wire rst_sys;
  wire rst_sys_i_1_n_0;
  wire rst_sys_i_2_n_0;
  wire rst_sys_i_3_n_0;
  wire running15_out;
  wire rx_i_n_29;
  (* async_reg = "true" *) wire [1:0]rx_reset_sync;
  wire sample_valid;
  wire sclk_reg;
  wire sclk_reg_0;
  wire [15:0]source_frame_id;
  wire source_frame_last;
  wire source_frame_start;
  wire [8:0]source_index;
  wire [2:0]source_mode;
  wire tx_reset;
  (* async_reg = "true" *) wire [2:0]tx_reset_sync;
  wire \tx_reset_sync[2]_i_1_n_0 ;
  wire [3:0]\NLW_blink_count_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_blink_count_reg[24]_i_1_O_UNCONNECTED ;
  wire NLW_dac_clock_mmcm_CLKFBOUTB_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKINSTOPPED_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT0B_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT1B_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT2_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT2B_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT3_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT3B_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT4_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT5_UNCONNECTED;
  wire NLW_dac_clock_mmcm_CLKOUT6_UNCONNECTED;
  wire NLW_dac_clock_mmcm_DRDY_UNCONNECTED;
  wire NLW_dac_clock_mmcm_PSDONE_UNCONNECTED;
  wire [15:0]NLW_dac_clock_mmcm_DO_UNCONNECTED;
  wire [3:3]\NLW_monitor_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_power_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire NLW_ref_mmcm_CLKFBOUTB_UNCONNECTED;
  wire NLW_ref_mmcm_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_ref_mmcm_CLKINSTOPPED_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT0B_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT1_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT1B_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT2_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT2B_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT3_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT3B_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT4_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT5_UNCONNECTED;
  wire NLW_ref_mmcm_CLKOUT6_UNCONNECTED;
  wire NLW_ref_mmcm_DRDY_UNCONNECTED;
  wire NLW_ref_mmcm_PSDONE_UNCONNECTED;
  wire [15:0]NLW_ref_mmcm_DO_UNCONNECTED;

  FDRE adc_clip_led_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(adc_clip_sync[1]),
        .Q(adc_clip_led),
        .R(rst_sys));
  FDRE #(
    .INIT(1'b0)) 
    adc_clip_sticky_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(rx_i_n_29),
        .Q(adc_clip_sticky),
        .R(rx_reset_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \adc_clip_sync_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(adc_clip_sticky),
        .Q(adc_clip_sync[0]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \adc_clip_sync_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(adc_clip_sync[0]),
        .Q(adc_clip_sync[1]),
        .R(rst_sys));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG adc_clock_bufg
       (.I(adc_clock_unbuffered),
        .O(echo_clk_acq));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[0] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[0]),
        .Q(echo_sample_fall_u14[0]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[10] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[10]),
        .Q(echo_sample_fall_u14[10]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[11] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[11]),
        .Q(echo_sample_fall_u14[11]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[12] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[12]),
        .Q(echo_sample_fall_u14[12]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[13] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[13]),
        .Q(echo_sample_fall_u14[13]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[1] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[1]),
        .Q(echo_sample_fall_u14[1]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[2] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[2]),
        .Q(echo_sample_fall_u14[2]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[3] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[3]),
        .Q(echo_sample_fall_u14[3]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[4] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[4]),
        .Q(echo_sample_fall_u14[4]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[5] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[5]),
        .Q(echo_sample_fall_u14[5]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[6] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[6]),
        .Q(echo_sample_fall_u14[6]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[7] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[7]),
        .Q(echo_sample_fall_u14[7]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[8] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[8]),
        .Q(echo_sample_fall_u14[8]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_fall_u14_reg[9] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_fall[9]),
        .Q(echo_sample_fall_u14[9]),
        .R(rx_reset_sync[1]));
  FDRE adc_ready_led_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(adc_ready_sync[1]),
        .Q(adc_ready_led),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \adc_ready_sync_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(idelay_ready_reg),
        .Q(adc_ready_sync[0]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \adc_ready_sync_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(adc_ready_sync[0]),
        .Q(adc_ready_sync[1]),
        .R(rst_sys));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[0] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[0]),
        .Q(echo_sample_rise_u14[0]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[10] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[10]),
        .Q(echo_sample_rise_u14[10]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[11] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[11]),
        .Q(echo_sample_rise_u14[11]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[12] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[12]),
        .Q(echo_sample_rise_u14[12]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[13] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[13]),
        .Q(echo_sample_rise_u14[13]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[1] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[1]),
        .Q(echo_sample_rise_u14[1]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[2] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[2]),
        .Q(echo_sample_rise_u14[2]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[3] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[3]),
        .Q(echo_sample_rise_u14[3]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[4] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[4]),
        .Q(echo_sample_rise_u14[4]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[5] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[5]),
        .Q(echo_sample_rise_u14[5]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[6] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[6]),
        .Q(echo_sample_rise_u14[6]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[7] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[7]),
        .Q(echo_sample_rise_u14[7]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[8] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[8]),
        .Q(echo_sample_rise_u14[8]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \adc_rise_u14_reg[9] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(raw_rise[9]),
        .Q(echo_sample_rise_u14[9]),
        .R(rx_reset_sync[1]));
  LUT3 #(
    .INIT(8'hF4)) 
    \blink_count[0]_i_1 
       (.I0(\blink_count[0]_i_3_n_0 ),
        .I1(\blink_count[0]_i_4_n_0 ),
        .I2(rst_sys),
        .O(\blink_count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \blink_count[0]_i_3 
       (.I0(\blink_count[0]_i_6_n_0 ),
        .I1(blink_count_reg[7]),
        .I2(blink_count_reg[8]),
        .I3(blink_count_reg[9]),
        .I4(blink_count_reg[10]),
        .O(\blink_count[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \blink_count[0]_i_4 
       (.I0(dac_done_led_i_6_n_0),
        .I1(blink_count_reg[0]),
        .I2(blink_count_reg[1]),
        .I3(blink_count_reg[2]),
        .I4(\blink_count[0]_i_7_n_0 ),
        .I5(\blink_count[0]_i_8_n_0 ),
        .O(\blink_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \blink_count[0]_i_5 
       (.I0(blink_count_reg[0]),
        .O(\blink_count[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \blink_count[0]_i_6 
       (.I0(blink_count_reg[23]),
        .I1(blink_count_reg[15]),
        .I2(blink_count_reg[6]),
        .I3(blink_count_reg[24]),
        .I4(blink_count_reg[17]),
        .O(\blink_count[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \blink_count[0]_i_7 
       (.I0(blink_count_reg[14]),
        .I1(blink_count_reg[5]),
        .I2(blink_count_reg[4]),
        .I3(blink_count_reg[3]),
        .O(\blink_count[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \blink_count[0]_i_8 
       (.I0(blink_count_reg[16]),
        .I1(blink_count_reg[18]),
        .I2(blink_count_reg[19]),
        .I3(blink_count_reg[20]),
        .I4(blink_count_reg[22]),
        .I5(blink_count_reg[21]),
        .O(\blink_count[0]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[0]_i_2_n_7 ),
        .Q(blink_count_reg[0]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\blink_count_reg[0]_i_2_n_0 ,\blink_count_reg[0]_i_2_n_1 ,\blink_count_reg[0]_i_2_n_2 ,\blink_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\blink_count_reg[0]_i_2_n_4 ,\blink_count_reg[0]_i_2_n_5 ,\blink_count_reg[0]_i_2_n_6 ,\blink_count_reg[0]_i_2_n_7 }),
        .S({blink_count_reg[3:1],\blink_count[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[10] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[8]_i_1_n_5 ),
        .Q(blink_count_reg[10]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[11] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[8]_i_1_n_4 ),
        .Q(blink_count_reg[11]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[12] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[12]_i_1_n_7 ),
        .Q(blink_count_reg[12]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[12]_i_1 
       (.CI(\blink_count_reg[8]_i_1_n_0 ),
        .CO({\blink_count_reg[12]_i_1_n_0 ,\blink_count_reg[12]_i_1_n_1 ,\blink_count_reg[12]_i_1_n_2 ,\blink_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\blink_count_reg[12]_i_1_n_4 ,\blink_count_reg[12]_i_1_n_5 ,\blink_count_reg[12]_i_1_n_6 ,\blink_count_reg[12]_i_1_n_7 }),
        .S(blink_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[13] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[12]_i_1_n_6 ),
        .Q(blink_count_reg[13]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[14] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[12]_i_1_n_5 ),
        .Q(blink_count_reg[14]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[15] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[12]_i_1_n_4 ),
        .Q(blink_count_reg[15]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[16] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[16]_i_1_n_7 ),
        .Q(blink_count_reg[16]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[16]_i_1 
       (.CI(\blink_count_reg[12]_i_1_n_0 ),
        .CO({\blink_count_reg[16]_i_1_n_0 ,\blink_count_reg[16]_i_1_n_1 ,\blink_count_reg[16]_i_1_n_2 ,\blink_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\blink_count_reg[16]_i_1_n_4 ,\blink_count_reg[16]_i_1_n_5 ,\blink_count_reg[16]_i_1_n_6 ,\blink_count_reg[16]_i_1_n_7 }),
        .S(blink_count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[17] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[16]_i_1_n_6 ),
        .Q(blink_count_reg[17]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[18] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[16]_i_1_n_5 ),
        .Q(blink_count_reg[18]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[19] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[16]_i_1_n_4 ),
        .Q(blink_count_reg[19]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[0]_i_2_n_6 ),
        .Q(blink_count_reg[1]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[20] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[20]_i_1_n_7 ),
        .Q(blink_count_reg[20]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[20]_i_1 
       (.CI(\blink_count_reg[16]_i_1_n_0 ),
        .CO({\blink_count_reg[20]_i_1_n_0 ,\blink_count_reg[20]_i_1_n_1 ,\blink_count_reg[20]_i_1_n_2 ,\blink_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\blink_count_reg[20]_i_1_n_4 ,\blink_count_reg[20]_i_1_n_5 ,\blink_count_reg[20]_i_1_n_6 ,\blink_count_reg[20]_i_1_n_7 }),
        .S(blink_count_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[21] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[20]_i_1_n_6 ),
        .Q(blink_count_reg[21]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[22] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[20]_i_1_n_5 ),
        .Q(blink_count_reg[22]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[23] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[20]_i_1_n_4 ),
        .Q(blink_count_reg[23]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[24] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[24]_i_1_n_7 ),
        .Q(blink_count_reg[24]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[24]_i_1 
       (.CI(\blink_count_reg[20]_i_1_n_0 ),
        .CO(\NLW_blink_count_reg[24]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_blink_count_reg[24]_i_1_O_UNCONNECTED [3:1],\blink_count_reg[24]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,blink_count_reg[24]}));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[2] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[0]_i_2_n_5 ),
        .Q(blink_count_reg[2]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[3] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[0]_i_2_n_4 ),
        .Q(blink_count_reg[3]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[4] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[4]_i_1_n_7 ),
        .Q(blink_count_reg[4]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[4]_i_1 
       (.CI(\blink_count_reg[0]_i_2_n_0 ),
        .CO({\blink_count_reg[4]_i_1_n_0 ,\blink_count_reg[4]_i_1_n_1 ,\blink_count_reg[4]_i_1_n_2 ,\blink_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\blink_count_reg[4]_i_1_n_4 ,\blink_count_reg[4]_i_1_n_5 ,\blink_count_reg[4]_i_1_n_6 ,\blink_count_reg[4]_i_1_n_7 }),
        .S(blink_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[5] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[4]_i_1_n_6 ),
        .Q(blink_count_reg[5]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[6] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[4]_i_1_n_5 ),
        .Q(blink_count_reg[6]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[7] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[4]_i_1_n_4 ),
        .Q(blink_count_reg[7]),
        .R(\blink_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[8] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[8]_i_1_n_7 ),
        .Q(blink_count_reg[8]),
        .R(\blink_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \blink_count_reg[8]_i_1 
       (.CI(\blink_count_reg[4]_i_1_n_0 ),
        .CO({\blink_count_reg[8]_i_1_n_0 ,\blink_count_reg[8]_i_1_n_1 ,\blink_count_reg[8]_i_1_n_2 ,\blink_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\blink_count_reg[8]_i_1_n_4 ,\blink_count_reg[8]_i_1_n_5 ,\blink_count_reg[8]_i_1_n_6 ,\blink_count_reg[8]_i_1_n_7 }),
        .S(blink_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \blink_count_reg[9] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\blink_count_reg[8]_i_1_n_6 ),
        .Q(blink_count_reg[9]),
        .R(\blink_count[0]_i_1_n_0 ));
  system_frontend_0_0_pulse_burst_32 burst_i
       (.Q(echo_pulse_frames_sent),
        .SR(burst_start_cdc_n_1),
        .active_reg_0(burst_i_n_0),
        .active_reg_1(idelay_ready_dac[1]),
        .active_reg_2(rst_dac_sync[2]),
        .active_reg_3(tx_reset_sync[2]),
        .burst_start_dac(burst_start_dac),
        .clk_dac(clk_dac),
        .out(enable_sync[1]),
        .p_29_in(p_29_in),
        .pulse_ready_dac__1(pulse_ready_dac__1),
        .repeat_enable(repeat_enable),
        .running15_out(running15_out),
        .running_reg(pulse_i_n_3),
        .source_frame_last(source_frame_last),
        .source_frame_start(source_frame_start),
        .tx_reset(tx_reset));
  system_frontend_0_0_cdc_pulse_toggle burst_start_cdc
       (.SR(burst_start_cdc_n_1),
        .burst_start_dac(burst_start_dac),
        .clk_dac(clk_dac),
        .echo_clk_acq(echo_clk_acq),
        .echo_pulse_start_acq(echo_pulse_start_acq),
        .echo_rst_acq(echo_rst_acq),
        .\frames_sent_reg[5] (idelay_ready_dac[1]),
        .\frames_sent_reg[5]_0 (rst_dac_sync[2]),
        .\frames_sent_reg[5]_1 (tx_reset_sync[2]),
        .\frames_sent_reg[5]_2 (burst_i_n_0),
        .out(enable_sync[1]),
        .tx_reset(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    clip_q_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(adc_clip_sticky_1),
        .Q(echo_sample_clip),
        .R(rx_reset_sync[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG dac_clock_bufg
       (.I(dac_clock_unbuffered),
        .O(clk_dac));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "MMCME2_BASE" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CLKINSEL GND:PSINCDEC,PSEN,PSCLK,DWE,DEN,DCLK,DI[15],DI[14],DI[13],DI[12],DI[11],DI[10],DI[9],DI[8],DI[7],DI[6],DI[5],DI[4],DI[3],DI[2],DI[1],DI[0],DADDR[6],DADDR[5],DADDR[4],DADDR[3],DADDR[2],DADDR[1],DADDR[0],CLKIN2" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(10.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(10.000000),
    .CLKOUT0_DIVIDE_F(10.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(175.500000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.010000),
    .STARTUP_WAIT("FALSE")) 
    dac_clock_mmcm
       (.CLKFBIN(mmcm_feedback_buf),
        .CLKFBOUT(mmcm_feedback),
        .CLKFBOUTB(NLW_dac_clock_mmcm_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_dac_clock_mmcm_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(dco_se),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_dac_clock_mmcm_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(dac_clock_unbuffered),
        .CLKOUT0B(NLW_dac_clock_mmcm_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(adc_clock_unbuffered),
        .CLKOUT1B(NLW_dac_clock_mmcm_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_dac_clock_mmcm_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_dac_clock_mmcm_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_dac_clock_mmcm_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_dac_clock_mmcm_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_dac_clock_mmcm_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_dac_clock_mmcm_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_dac_clock_mmcm_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_dac_clock_mmcm_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_dac_clock_mmcm_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(mmcm_locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_dac_clock_mmcm_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(rst_sys));
  LUT6 #(
    .INIT(64'hFFBFBFBFFFFFBFBF)) 
    dac_done_led_i_2
       (.I0(dac_done_led_i_5_n_0),
        .I1(blink_count_reg[18]),
        .I2(blink_count_reg[19]),
        .I3(dac_done_led_i_6_n_0),
        .I4(dac_done_led_i_7_n_0),
        .I5(blink_count_reg[10]),
        .O(dac_done_led_i_2_n_0));
  LUT5 #(
    .INIT(32'h57FFFFFF)) 
    dac_done_led_i_3
       (.I0(blink_count_reg[17]),
        .I1(blink_count_reg[16]),
        .I2(blink_count_reg[15]),
        .I3(blink_count_reg[21]),
        .I4(blink_count_reg[20]),
        .O(dac_done_led_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    dac_done_led_i_5
       (.I0(blink_count_reg[8]),
        .I1(blink_count_reg[9]),
        .I2(dac_done_led_i_7_n_0),
        .I3(blink_count_reg[5]),
        .I4(blink_count_reg[6]),
        .I5(blink_count_reg[7]),
        .O(dac_done_led_i_5_n_0));
  LUT3 #(
    .INIT(8'h7F)) 
    dac_done_led_i_6
       (.I0(blink_count_reg[12]),
        .I1(blink_count_reg[13]),
        .I2(blink_count_reg[11]),
        .O(dac_done_led_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h1)) 
    dac_done_led_i_7
       (.I0(blink_count_reg[16]),
        .I1(blink_count_reg[14]),
        .O(dac_done_led_i_7_n_0));
  FDRE dac_done_led_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(dac_done_led0),
        .Q(dac_done_led),
        .R(rst_sys));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    dac_sdio_iobuf
       (.I(dac_sdio_o),
        .IO(dac_spi_sdio),
        .O(dac_sdio_i),
        .T(dac_sdio_t));
  LUT6 #(
    .INIT(64'hB888B8B8B8B8B888)) 
    dco_alive_i_1
       (.I0(dco_alive),
        .I1(\monitor_count[0]_i_3_n_0 ),
        .I2(locked_sync[1]),
        .I3(edge_seen),
        .I4(heartbeat_sync[2]),
        .I5(heartbeat_previous),
        .O(dco_alive_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dco_alive_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(dco_alive_i_1_n_0),
        .Q(dco_alive),
        .R(rst_sys));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG dco_bufg
       (.I(dco_se),
        .O(clk_dco));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS dco_ibuf
       (.I(adc_dco_p),
        .IB(adc_dco_n),
        .O(dco_se));
  FDRE #(
    .INIT(1'b1)) 
    echo_rst_acq_sync_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(rx_reset_sync[1]),
        .Q(echo_rst_acq),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h55140000)) 
    edge_seen_i_1
       (.I0(rst_sys),
        .I1(heartbeat_previous),
        .I2(heartbeat_sync[2]),
        .I3(edge_seen),
        .I4(\monitor_count[0]_i_3_n_0 ),
        .O(edge_seen_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    edge_seen_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(edge_seen_i_1_n_0),
        .Q(edge_seen),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \enable_sync_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(dac_config_done),
        .Q(enable_sync[0]),
        .R(rst_dac_sync[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \enable_sync_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(enable_sync[0]),
        .Q(enable_sync[1]),
        .R(rst_dac_sync[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG feedback_bufg
       (.I(mmcm_feedback),
        .O(mmcm_feedback_buf));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[0] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[0] ),
        .Q(echo_frame_meta[0]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[10] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[10] ),
        .Q(echo_frame_meta[10]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[11] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[11] ),
        .Q(echo_frame_meta[11]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[12] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[12] ),
        .Q(echo_frame_meta[12]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[13] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[13] ),
        .Q(echo_frame_meta[13]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[14] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[14] ),
        .Q(echo_frame_meta[14]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[15] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[15] ),
        .Q(echo_frame_meta[15]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[16] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[16] ),
        .Q(echo_frame_meta[16]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[17] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[17] ),
        .Q(echo_frame_meta[17]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[18] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[18] ),
        .Q(echo_frame_meta[18]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[19] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[19] ),
        .Q(echo_frame_meta[19]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[1] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[1] ),
        .Q(echo_frame_meta[1]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[20] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[20] ),
        .Q(echo_frame_meta[20]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[21] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[21] ),
        .Q(echo_frame_meta[21]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[22] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[22] ),
        .Q(echo_frame_meta[22]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[23] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[23] ),
        .Q(echo_frame_meta[23]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[24] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[24] ),
        .Q(echo_frame_meta[24]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[25] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[25] ),
        .Q(echo_frame_meta[25]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[26] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[26] ),
        .Q(echo_frame_meta[26]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[27] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[27] ),
        .Q(echo_frame_meta[27]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[28] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[28] ),
        .Q(echo_frame_meta[28]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[29] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[29] ),
        .Q(echo_frame_meta[29]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[2] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[2] ),
        .Q(echo_frame_meta[2]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[30] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[30] ),
        .Q(echo_frame_meta[30]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[31] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[31] ),
        .Q(echo_frame_meta[31]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[3] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[3] ),
        .Q(echo_frame_meta[3]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[4] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[4] ),
        .Q(echo_frame_meta[4]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[5] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[5] ),
        .Q(echo_frame_meta[5]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[6] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[6] ),
        .Q(echo_frame_meta[6]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[7] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[7] ),
        .Q(echo_frame_meta[7]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[8] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(\launch_meta_reg_n_0_[8] ),
        .Q(echo_frame_meta[8]),
        .R(rx_reset_sync[1]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_meta_q_reg[9] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(frame_meta_q0),
        .Q(echo_frame_meta[9]),
        .R(rx_reset_sync[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \heartbeat_div[0]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \heartbeat_div[1]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[0] ),
        .I1(\heartbeat_div_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \heartbeat_div[2]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[0] ),
        .I1(\heartbeat_div_reg_n_0_[1] ),
        .I2(\heartbeat_div_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \heartbeat_div[3]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[1] ),
        .I1(\heartbeat_div_reg_n_0_[0] ),
        .I2(\heartbeat_div_reg_n_0_[2] ),
        .I3(\heartbeat_div_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \heartbeat_div[4]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[2] ),
        .I1(\heartbeat_div_reg_n_0_[0] ),
        .I2(\heartbeat_div_reg_n_0_[1] ),
        .I3(\heartbeat_div_reg_n_0_[3] ),
        .I4(\heartbeat_div_reg_n_0_[4] ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \heartbeat_div[5]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[3] ),
        .I1(\heartbeat_div_reg_n_0_[1] ),
        .I2(\heartbeat_div_reg_n_0_[0] ),
        .I3(\heartbeat_div_reg_n_0_[2] ),
        .I4(\heartbeat_div_reg_n_0_[4] ),
        .I5(\heartbeat_div_reg_n_0_[5] ),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \heartbeat_div[6]_i_1 
       (.I0(\heartbeat_div[9]_i_2_n_0 ),
        .I1(\heartbeat_div_reg_n_0_[6] ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \heartbeat_div[7]_i_1 
       (.I0(\heartbeat_div[9]_i_2_n_0 ),
        .I1(\heartbeat_div_reg_n_0_[6] ),
        .I2(\heartbeat_div_reg_n_0_[7] ),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \heartbeat_div[8]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[6] ),
        .I1(\heartbeat_div[9]_i_2_n_0 ),
        .I2(\heartbeat_div_reg_n_0_[7] ),
        .I3(\heartbeat_div_reg_n_0_[8] ),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \heartbeat_div[9]_i_1 
       (.I0(\heartbeat_div_reg_n_0_[7] ),
        .I1(\heartbeat_div[9]_i_2_n_0 ),
        .I2(\heartbeat_div_reg_n_0_[6] ),
        .I3(\heartbeat_div_reg_n_0_[8] ),
        .I4(heartbeat_div_reg),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \heartbeat_div[9]_i_2 
       (.I0(\heartbeat_div_reg_n_0_[5] ),
        .I1(\heartbeat_div_reg_n_0_[3] ),
        .I2(\heartbeat_div_reg_n_0_[1] ),
        .I3(\heartbeat_div_reg_n_0_[0] ),
        .I4(\heartbeat_div_reg_n_0_[2] ),
        .I5(\heartbeat_div_reg_n_0_[4] ),
        .O(\heartbeat_div[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[0] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(\heartbeat_div_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[1] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(\heartbeat_div_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[2] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(\heartbeat_div_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[3] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(\heartbeat_div_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[4] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(\heartbeat_div_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[5] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(\heartbeat_div_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[6] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(\heartbeat_div_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[7] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(\heartbeat_div_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[8] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[8]),
        .Q(\heartbeat_div_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_div_reg[9] 
       (.C(clk_dco),
        .CE(1'b1),
        .D(p_0_in[9]),
        .Q(heartbeat_div_reg),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    heartbeat_previous_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(heartbeat_sync[2]),
        .Q(heartbeat_previous),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_sync_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(heartbeat_div_reg),
        .Q(heartbeat_sync[0]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_sync_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(heartbeat_sync[0]),
        .Q(heartbeat_sync[1]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \heartbeat_sync_reg[2] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(heartbeat_sync[1]),
        .Q(heartbeat_sync[2]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \idelay_ready_dac_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(idelay_ready_reg),
        .Q(idelay_ready_dac[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \idelay_ready_dac_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(idelay_ready_dac[0]),
        .Q(idelay_ready_dac[1]),
        .R(1'b0));
  system_frontend_0_0_dac_init init_i
       (.D(dac_config_done),
        .adk_spi_csb(adk_spi_csb),
        .adk_spi_sda(adk_spi_sda),
        .blink_count_reg(blink_count_reg[24:22]),
        .clk_50m(clk_50m),
        .clock_config_done(clock_config_done),
        .dac_done_led0(dac_done_led0),
        .dac_done_led_reg(dac_done_led_i_2_n_0),
        .dac_done_led_reg_0(dac_done_led_i_3_n_0),
        .dac_sdio_i(dac_sdio_i),
        .dac_sdio_o(dac_sdio_o),
        .dac_sdio_t(dac_sdio_t),
        .dac_spi_csb(dac_spi_csb),
        .dco_alive(dco_alive),
        .rst_sys(rst_sys),
        .sclk_reg(sclk_reg),
        .sclk_reg_0(sclk_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    launch_marker_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(launch_marker0),
        .Q(launch_marker),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[0]),
        .Q(\launch_meta_reg_n_0_[0] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[10] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(p_0_out[10]),
        .Q(\launch_meta_reg_n_0_[10] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[11] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(p_0_out[11]),
        .Q(\launch_meta_reg_n_0_[11] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[12] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(p_0_out[12]),
        .Q(\launch_meta_reg_n_0_[12] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[13] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_mode[0]),
        .Q(\launch_meta_reg_n_0_[13] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[14] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_mode[1]),
        .Q(\launch_meta_reg_n_0_[14] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[15] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_mode[2]),
        .Q(\launch_meta_reg_n_0_[15] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[16] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[0]),
        .Q(\launch_meta_reg_n_0_[16] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[17] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[1]),
        .Q(\launch_meta_reg_n_0_[17] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[18] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[2]),
        .Q(\launch_meta_reg_n_0_[18] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[19] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[3]),
        .Q(\launch_meta_reg_n_0_[19] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[1]),
        .Q(\launch_meta_reg_n_0_[1] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[20] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[4]),
        .Q(\launch_meta_reg_n_0_[20] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[21] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[5]),
        .Q(\launch_meta_reg_n_0_[21] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[22] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[6]),
        .Q(\launch_meta_reg_n_0_[22] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[23] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[7]),
        .Q(\launch_meta_reg_n_0_[23] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[24] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[8]),
        .Q(\launch_meta_reg_n_0_[24] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[25] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[9]),
        .Q(\launch_meta_reg_n_0_[25] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[26] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[10]),
        .Q(\launch_meta_reg_n_0_[26] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[27] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[11]),
        .Q(\launch_meta_reg_n_0_[27] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[28] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[12]),
        .Q(\launch_meta_reg_n_0_[28] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[29] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[13]),
        .Q(\launch_meta_reg_n_0_[29] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[2]),
        .Q(\launch_meta_reg_n_0_[2] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[30] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[14]),
        .Q(\launch_meta_reg_n_0_[30] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[31] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_id[15]),
        .Q(\launch_meta_reg_n_0_[31] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[3] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[3]),
        .Q(\launch_meta_reg_n_0_[3] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[4] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[4]),
        .Q(\launch_meta_reg_n_0_[4] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[5] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[5]),
        .Q(\launch_meta_reg_n_0_[5] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[6] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[6]),
        .Q(\launch_meta_reg_n_0_[6] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[7] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[7]),
        .Q(\launch_meta_reg_n_0_[7] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[8] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_index[8]),
        .Q(\launch_meta_reg_n_0_[8] ),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \launch_meta_reg[9] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(p_0_out[9]),
        .Q(launch_meta),
        .R(tx_reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \locked_sync_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(mmcm_locked),
        .Q(locked_sync[0]),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \locked_sync_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(locked_sync[0]),
        .Q(locked_sync[1]),
        .R(rst_sys));
  LUT2 #(
    .INIT(4'hB)) 
    \monitor_count[0]_i_1 
       (.I0(rst_sys),
        .I1(\monitor_count[0]_i_3_n_0 ),
        .O(\monitor_count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01FFFFFF)) 
    \monitor_count[0]_i_3 
       (.I0(\monitor_count[0]_i_5_n_0 ),
        .I1(monitor_count_reg[13]),
        .I2(monitor_count_reg[10]),
        .I3(monitor_count_reg[15]),
        .I4(monitor_count_reg[14]),
        .O(\monitor_count[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \monitor_count[0]_i_4 
       (.I0(monitor_count_reg[0]),
        .O(\monitor_count[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEEEEEEEEEEE)) 
    \monitor_count[0]_i_5 
       (.I0(monitor_count_reg[12]),
        .I1(monitor_count_reg[11]),
        .I2(monitor_count_reg[6]),
        .I3(\monitor_count[0]_i_6_n_0 ),
        .I4(monitor_count_reg[7]),
        .I5(\monitor_count[0]_i_7_n_0 ),
        .O(\monitor_count[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8000)) 
    \monitor_count[0]_i_6 
       (.I0(monitor_count_reg[2]),
        .I1(monitor_count_reg[3]),
        .I2(monitor_count_reg[0]),
        .I3(monitor_count_reg[1]),
        .I4(monitor_count_reg[5]),
        .I5(monitor_count_reg[4]),
        .O(\monitor_count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \monitor_count[0]_i_7 
       (.I0(monitor_count_reg[8]),
        .I1(monitor_count_reg[9]),
        .O(\monitor_count[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[0] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[0]_i_2_n_7 ),
        .Q(monitor_count_reg[0]),
        .R(\monitor_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \monitor_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\monitor_count_reg[0]_i_2_n_0 ,\monitor_count_reg[0]_i_2_n_1 ,\monitor_count_reg[0]_i_2_n_2 ,\monitor_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\monitor_count_reg[0]_i_2_n_4 ,\monitor_count_reg[0]_i_2_n_5 ,\monitor_count_reg[0]_i_2_n_6 ,\monitor_count_reg[0]_i_2_n_7 }),
        .S({monitor_count_reg[3:1],\monitor_count[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[10] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[8]_i_1_n_5 ),
        .Q(monitor_count_reg[10]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[11] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[8]_i_1_n_4 ),
        .Q(monitor_count_reg[11]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[12] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[12]_i_1_n_7 ),
        .Q(monitor_count_reg[12]),
        .R(\monitor_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \monitor_count_reg[12]_i_1 
       (.CI(\monitor_count_reg[8]_i_1_n_0 ),
        .CO({\NLW_monitor_count_reg[12]_i_1_CO_UNCONNECTED [3],\monitor_count_reg[12]_i_1_n_1 ,\monitor_count_reg[12]_i_1_n_2 ,\monitor_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\monitor_count_reg[12]_i_1_n_4 ,\monitor_count_reg[12]_i_1_n_5 ,\monitor_count_reg[12]_i_1_n_6 ,\monitor_count_reg[12]_i_1_n_7 }),
        .S(monitor_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[13] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[12]_i_1_n_6 ),
        .Q(monitor_count_reg[13]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[14] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[12]_i_1_n_5 ),
        .Q(monitor_count_reg[14]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[15] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[12]_i_1_n_4 ),
        .Q(monitor_count_reg[15]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[1] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[0]_i_2_n_6 ),
        .Q(monitor_count_reg[1]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[2] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[0]_i_2_n_5 ),
        .Q(monitor_count_reg[2]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[3] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[0]_i_2_n_4 ),
        .Q(monitor_count_reg[3]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[4] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[4]_i_1_n_7 ),
        .Q(monitor_count_reg[4]),
        .R(\monitor_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \monitor_count_reg[4]_i_1 
       (.CI(\monitor_count_reg[0]_i_2_n_0 ),
        .CO({\monitor_count_reg[4]_i_1_n_0 ,\monitor_count_reg[4]_i_1_n_1 ,\monitor_count_reg[4]_i_1_n_2 ,\monitor_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\monitor_count_reg[4]_i_1_n_4 ,\monitor_count_reg[4]_i_1_n_5 ,\monitor_count_reg[4]_i_1_n_6 ,\monitor_count_reg[4]_i_1_n_7 }),
        .S(monitor_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[5] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[4]_i_1_n_6 ),
        .Q(monitor_count_reg[5]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[6] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[4]_i_1_n_5 ),
        .Q(monitor_count_reg[6]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[7] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[4]_i_1_n_4 ),
        .Q(monitor_count_reg[7]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[8] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[8]_i_1_n_7 ),
        .Q(monitor_count_reg[8]),
        .R(\monitor_count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \monitor_count_reg[8]_i_1 
       (.CI(\monitor_count_reg[4]_i_1_n_0 ),
        .CO({\monitor_count_reg[8]_i_1_n_0 ,\monitor_count_reg[8]_i_1_n_1 ,\monitor_count_reg[8]_i_1_n_2 ,\monitor_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\monitor_count_reg[8]_i_1_n_4 ,\monitor_count_reg[8]_i_1_n_5 ,\monitor_count_reg[8]_i_1_n_6 ,\monitor_count_reg[8]_i_1_n_7 }),
        .S(monitor_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \monitor_count_reg[9] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\monitor_count_reg[8]_i_1_n_6 ),
        .Q(monitor_count_reg[9]),
        .R(\monitor_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    pair_valid_q_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(sample_valid),
        .Q(echo_pair_valid),
        .R(rx_reset_sync[1]));
  FDRE pll_done_led_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(clock_config_done),
        .Q(pll_done_led),
        .R(rst_sys));
  LUT1 #(
    .INIT(2'h1)) 
    \power_count[0]_i_2 
       (.I0(\power_count_reg_n_0_[0] ),
        .O(\power_count[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[0] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[0]_i_1_n_7 ),
        .Q(\power_count_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \power_count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\power_count_reg[0]_i_1_n_0 ,\power_count_reg[0]_i_1_n_1 ,\power_count_reg[0]_i_1_n_2 ,\power_count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\power_count_reg[0]_i_1_n_4 ,\power_count_reg[0]_i_1_n_5 ,\power_count_reg[0]_i_1_n_6 ,\power_count_reg[0]_i_1_n_7 }),
        .S({\power_count_reg_n_0_[3] ,\power_count_reg_n_0_[2] ,\power_count_reg_n_0_[1] ,\power_count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[10] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[8]_i_1_n_5 ),
        .Q(power_count_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[11] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[8]_i_1_n_4 ),
        .Q(power_count_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[12] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[12]_i_1_n_7 ),
        .Q(power_count_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \power_count_reg[12]_i_1 
       (.CI(\power_count_reg[8]_i_1_n_0 ),
        .CO({\NLW_power_count_reg[12]_i_1_CO_UNCONNECTED [3],\power_count_reg[12]_i_1_n_1 ,\power_count_reg[12]_i_1_n_2 ,\power_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\power_count_reg[12]_i_1_n_4 ,\power_count_reg[12]_i_1_n_5 ,\power_count_reg[12]_i_1_n_6 ,\power_count_reg[12]_i_1_n_7 }),
        .S(power_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[13] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[12]_i_1_n_6 ),
        .Q(power_count_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[14] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[12]_i_1_n_5 ),
        .Q(power_count_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[15] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[12]_i_1_n_4 ),
        .Q(power_count_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[1] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[0]_i_1_n_6 ),
        .Q(\power_count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[2] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[0]_i_1_n_5 ),
        .Q(\power_count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[3] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[0]_i_1_n_4 ),
        .Q(\power_count_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[4] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[4]_i_1_n_7 ),
        .Q(power_count_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \power_count_reg[4]_i_1 
       (.CI(\power_count_reg[0]_i_1_n_0 ),
        .CO({\power_count_reg[4]_i_1_n_0 ,\power_count_reg[4]_i_1_n_1 ,\power_count_reg[4]_i_1_n_2 ,\power_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\power_count_reg[4]_i_1_n_4 ,\power_count_reg[4]_i_1_n_5 ,\power_count_reg[4]_i_1_n_6 ,\power_count_reg[4]_i_1_n_7 }),
        .S(power_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[5] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[4]_i_1_n_6 ),
        .Q(power_count_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[6] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[4]_i_1_n_5 ),
        .Q(power_count_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[7] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[4]_i_1_n_4 ),
        .Q(power_count_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[8] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[8]_i_1_n_7 ),
        .Q(power_count_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \power_count_reg[8]_i_1 
       (.CI(\power_count_reg[4]_i_1_n_0 ),
        .CO({\power_count_reg[8]_i_1_n_0 ,\power_count_reg[8]_i_1_n_1 ,\power_count_reg[8]_i_1_n_2 ,\power_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\power_count_reg[8]_i_1_n_4 ,\power_count_reg[8]_i_1_n_5 ,\power_count_reg[8]_i_1_n_6 ,\power_count_reg[8]_i_1_n_7 }),
        .S(power_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \power_count_reg[9] 
       (.C(clk_50m),
        .CE(rst_sys_i_1_n_0),
        .D(\power_count_reg[8]_i_1_n_6 ),
        .Q(power_count_reg[9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[0]),
        .Q(pulse_cfg_sync1[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[1]),
        .Q(pulse_cfg_sync1[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync1_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[2]),
        .Q(pulse_cfg_sync1[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[3] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[3]),
        .Q(pulse_cfg_sync1[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[4] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[4]),
        .Q(pulse_cfg_sync1[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[5] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[5]),
        .Q(pulse_cfg_sync1[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync1_reg[6] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[6]),
        .Q(pulse_cfg_sync1[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[7] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[7]),
        .Q(pulse_cfg_sync1[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync1_reg[8] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[8]),
        .Q(pulse_cfg_sync1[8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync1_reg[9] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(D[9]),
        .Q(pulse_cfg_sync1[9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[0]),
        .Q(pulse_cfg_sync2[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[1]),
        .Q(pulse_cfg_sync2[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync2_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[2]),
        .Q(pulse_cfg_sync2[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[3] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[3]),
        .Q(pulse_cfg_sync2[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[4] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[4]),
        .Q(pulse_cfg_sync2[4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[5] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[5]),
        .Q(pulse_cfg_sync2[5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync2_reg[6] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[6]),
        .Q(pulse_cfg_sync2[6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[7] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[7]),
        .Q(pulse_cfg_sync2[7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \pulse_cfg_sync2_reg[8] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[8]),
        .Q(pulse_cfg_sync2[8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \pulse_cfg_sync2_reg[9] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_cfg_sync1[9]),
        .Q(pulse_cfg_sync2[9]),
        .R(1'b0));
  system_frontend_0_0_sync_pulse_engine pulse_i
       (.D({source_frame_id,source_mode,p_0_out,source_index}),
        .clk_dac(clk_dac),
        .i_sample({pulse_i_n_6,pulse_i_n_7}),
        .launch_marker0(launch_marker0),
        .out(pulse_cfg_sync2),
        .p_29_in(p_29_in),
        .pulse_ready_dac__1(pulse_ready_dac__1),
        .repeat_enable(repeat_enable),
        .running15_out(running15_out),
        .running_reg_0(pulse_i_n_3),
        .source_frame_last(source_frame_last),
        .source_frame_start(source_frame_start),
        .\source_sample_reg[12]_0 (tx_reset_sync[2]),
        .\source_sample_reg[12]_1 (rst_dac_sync[2]),
        .\source_sample_reg[14]_0 (enable_sync[1]),
        .\source_sample_reg[14]_1 (idelay_ready_dac[1]),
        .tx_reset(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    pulse_ready_q_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(pulse_ready_q0),
        .Q(echo_pulse_ready),
        .R(rx_reset_sync[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG ref_clk_bufg
       (.I(ref_unbuffered),
        .O(ref_clk_200m));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG ref_fb_bufg
       (.I(ref_feedback),
        .O(ref_feedback_buf));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "MMCME2_BASE" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CLKINSEL GND:PSINCDEC,PSEN,PSCLK,DWE,DEN,DCLK,DI[15],DI[14],DI[13],DI[12],DI[11],DI[10],DI[9],DI[8],DI[7],DI[6],DI[5],DI[4],DI[3],DI[2],DI[1],DI[0],DADDR[6],DADDR[5],DADDR[4],DADDR[3],DADDR[2],DADDR[1],DADDR[0],CLKIN2" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(20.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN1_PERIOD(20.000000),
    .CLKOUT0_DIVIDE_F(5.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.010000),
    .STARTUP_WAIT("FALSE")) 
    ref_mmcm
       (.CLKFBIN(ref_feedback_buf),
        .CLKFBOUT(ref_feedback),
        .CLKFBOUTB(NLW_ref_mmcm_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_ref_mmcm_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_50m),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_ref_mmcm_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(ref_unbuffered),
        .CLKOUT0B(NLW_ref_mmcm_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_ref_mmcm_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_ref_mmcm_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_ref_mmcm_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_ref_mmcm_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_ref_mmcm_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_ref_mmcm_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_ref_mmcm_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_ref_mmcm_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_ref_mmcm_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_ref_mmcm_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_ref_mmcm_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(ref_locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_ref_mmcm_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(rst_sys));
  LUT2 #(
    .INIT(4'hB)) 
    \rst_dac_sync[2]_i_1 
       (.I0(rst_sys),
        .I1(mmcm_locked),
        .O(reset_source));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \rst_dac_sync_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_source),
        .Q(rst_dac_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \rst_dac_sync_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(rst_dac_sync[0]),
        .PRE(reset_source),
        .Q(rst_dac_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \rst_dac_sync_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(rst_dac_sync[1]),
        .PRE(reset_source),
        .Q(rst_dac_sync[2]));
  LUT4 #(
    .INIT(16'hF777)) 
    rst_sys_i_1
       (.I0(power_count_reg[15]),
        .I1(power_count_reg[14]),
        .I2(rst_sys_i_2_n_0),
        .I3(rst_sys_i_3_n_0),
        .O(rst_sys_i_1_n_0));
  LUT6 #(
    .INIT(64'h0155FFFFFFFFFFFF)) 
    rst_sys_i_2
       (.I0(power_count_reg[7]),
        .I1(power_count_reg[4]),
        .I2(power_count_reg[5]),
        .I3(power_count_reg[6]),
        .I4(power_count_reg[9]),
        .I5(power_count_reg[8]),
        .O(rst_sys_i_2_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    rst_sys_i_3
       (.I0(power_count_reg[11]),
        .I1(power_count_reg[10]),
        .I2(power_count_reg[13]),
        .I3(power_count_reg[12]),
        .O(rst_sys_i_3_n_0));
  FDRE #(
    .INIT(1'b1)) 
    rst_sys_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(rst_sys_i_1_n_0),
        .Q(rst_sys),
        .R(1'b0));
  system_frontend_0_0_adc_loopback_rx rx_i
       (.AS(adc_reset_source),
        .CLK(echo_clk_acq),
        .D(raw_rise),
        .Q(launch_meta),
        .\acq_reset_sync_reg[2]_0 (mmcm_locked),
        .adc_clip_sticky_1(adc_clip_sticky_1),
        .adc_clip_sticky_reg(rx_i_n_29),
        .adc_clip_sticky_reg_0(adc_clip_sticky),
        .adc_data_n(adc_data_n),
        .adc_data_p(adc_data_p),
        .\bits_rx[13].iddr_0 (raw_fall),
        .\enable_sync_reg[0]_0 (dac_config_done),
        .idelay_ready_reg_0(idelay_ready_reg),
        .\launch_meta_reg[9] (frame_meta_q0),
        .pulse_ready_q0(pulse_ready_q0),
        .ref_clk_200m(ref_clk_200m),
        .ref_locked(ref_locked),
        .rst_sys(rst_sys),
        .sample_valid(sample_valid));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \rx_reset_sync_reg[0] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(1'b0),
        .PRE(adc_reset_source),
        .Q(rx_reset_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \rx_reset_sync_reg[1] 
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(rx_reset_sync[0]),
        .PRE(adc_reset_source),
        .Q(rx_reset_sync[1]));
  system_frontend_0_0_dac_lvds_tx tx_i
       (.SR(tx_reset),
        .clk_dac(clk_dac),
        .dac_data_n(dac_data_n),
        .dac_data_p(dac_data_p),
        .dac_dci_n(dac_dci_n),
        .dac_dci_p(dac_dci_p),
        .i_sample({pulse_i_n_6,pulse_i_n_7}));
  FDRE #(
    .INIT(1'b0)) 
    tx_marker_q_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(launch_marker),
        .Q(echo_tx_marker),
        .R(rx_reset_sync[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \tx_reset_sync[2]_i_1 
       (.I0(dco_alive),
        .O(\tx_reset_sync[2]_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \tx_reset_sync_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\tx_reset_sync[2]_i_1_n_0 ),
        .Q(tx_reset_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \tx_reset_sync_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(tx_reset_sync[0]),
        .PRE(\tx_reset_sync[2]_i_1_n_0 ),
        .Q(tx_reset_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \tx_reset_sync_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(tx_reset_sync[1]),
        .PRE(\tx_reset_sync[2]_i_1_n_0 ),
        .Q(tx_reset_sync[2]));
endmodule

(* ORIG_REF_NAME = "adc_loopback_rx" *) 
module system_frontend_0_0_adc_loopback_rx
   (D,
    \bits_rx[13].iddr_0 ,
    idelay_ready_reg_0,
    adc_clip_sticky_reg,
    sample_valid,
    AS,
    pulse_ready_q0,
    \launch_meta_reg[9] ,
    adc_clip_sticky_1,
    adc_data_p,
    adc_data_n,
    CLK,
    ref_clk_200m,
    adc_clip_sticky_reg_0,
    \acq_reset_sync_reg[2]_0 ,
    rst_sys,
    ref_locked,
    \enable_sync_reg[0]_0 ,
    Q);
  output [13:0]D;
  output [13:0]\bits_rx[13].iddr_0 ;
  output [0:0]idelay_ready_reg_0;
  output adc_clip_sticky_reg;
  output sample_valid;
  output [0:0]AS;
  output pulse_ready_q0;
  output [0:0]\launch_meta_reg[9] ;
  output adc_clip_sticky_1;
  input [13:0]adc_data_p;
  input [13:0]adc_data_n;
  input CLK;
  input ref_clk_200m;
  input [0:0]adc_clip_sticky_reg_0;
  input [0:0]\acq_reset_sync_reg[2]_0 ;
  input rst_sys;
  input ref_locked;
  input [0:0]\enable_sync_reg[0]_0 ;
  input [0:0]Q;

  wire [0:0]AS;
  wire CLK;
  wire [13:0]D;
  wire [0:0]Q;
  (* async_reg = "true" *) wire [2:0]acq_reset_sync;
  wire [0:0]\acq_reset_sync_reg[2]_0 ;
  wire adc_clip_sticky_1;
  wire adc_clip_sticky_reg;
  wire [0:0]adc_clip_sticky_reg_0;
  wire [13:0]adc_data_n;
  wire [13:0]adc_data_p;
  wire [13:0]\bits_rx[13].iddr_0 ;
  wire clip_now0;
  wire clip_now1;
  wire clip_now2;
  wire clip_now20_in;
  wire clip_q_i_10_n_0;
  wire clip_q_i_11_n_0;
  wire clip_q_i_12_n_0;
  wire clip_q_i_13_n_0;
  wire clip_q_i_6_n_0;
  wire clip_q_i_7_n_0;
  wire clip_q_i_8_n_0;
  wire clip_q_i_9_n_0;
  wire ctrl_reset;
  wire ctrl_reset_i_1_n_0;
  wire delayed_0;
  wire delayed_1;
  wire delayed_10;
  wire delayed_11;
  wire delayed_12;
  wire delayed_13;
  wire delayed_2;
  wire delayed_3;
  wire delayed_4;
  wire delayed_5;
  wire delayed_6;
  wire delayed_7;
  wire delayed_8;
  wire delayed_9;
  (* async_reg = "true" *) wire [1:0]enable_sync;
  wire [0:0]\enable_sync_reg[0]_0 ;
  wire idelay_ready_i_1_n_0;
  wire [0:0]idelay_ready_reg_0;
  wire [0:0]\launch_meta_reg[9] ;
  wire p_0_in0_in;
  wire [5:0]p_0_in__1;
  wire pulse_ready_q0;
  wire ready34;
  (* async_reg = "true" *) wire [2:0]ready34_sync;
  wire ready35;
  (* async_reg = "true" *) wire [2:0]ready35_sync;
  wire ref_clk_200m;
  wire ref_locked;
  (* async_reg = "true" *) wire [2:0]ref_reset_sync;
  wire \reset_count_reg_n_0_[0] ;
  wire \reset_count_reg_n_0_[1] ;
  wire \reset_count_reg_n_0_[2] ;
  wire \reset_count_reg_n_0_[3] ;
  wire \reset_count_reg_n_0_[4] ;
  wire rst_sys;
  wire sample_valid;
  wire se_0;
  wire se_1;
  wire se_10;
  wire se_11;
  wire se_12;
  wire se_13;
  wire se_2;
  wire se_3;
  wire se_4;
  wire se_5;
  wire se_6;
  wire se_7;
  wire se_8;
  wire se_9;
  wire sel;
  wire \warmup[2]_i_1_n_0 ;
  wire \warmup_reg_n_0_[0] ;
  wire \warmup_reg_n_0_[1] ;
  wire [4:0]\NLW_bits_rx[0].bank34.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[10].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[11].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[12].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[13].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[1].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[2].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[3].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[4].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[5].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[6].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[7].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[8].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_bits_rx[9].bank35.delay_i_CNTVALUEOUT_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hDF)) 
    \acq_reset_sync[2]_i_1 
       (.I0(\acq_reset_sync_reg[2]_0 ),
        .I1(rst_sys),
        .I2(ref_locked),
        .O(AS));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \acq_reset_sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AS),
        .Q(acq_reset_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \acq_reset_sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(acq_reset_sync[0]),
        .PRE(AS),
        .Q(acq_reset_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \acq_reset_sync_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(acq_reset_sync[1]),
        .PRE(AS),
        .Q(acq_reset_sync[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAAAA8)) 
    adc_clip_sticky_i_1
       (.I0(sample_valid),
        .I1(clip_now1),
        .I2(clip_now20_in),
        .I3(clip_now2),
        .I4(clip_now0),
        .I5(adc_clip_sticky_reg_0),
        .O(adc_clip_sticky_reg));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B34" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[0].bank34.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[0].bank34.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_0),
        .IDATAIN(se_0),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[0].ibuf 
       (.I(adc_data_p[0]),
        .IB(adc_data_n[0]),
        .O(se_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[0].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_0),
        .Q1(D[0]),
        .Q2(\bits_rx[13].iddr_0 [0]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[10].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[10].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_10),
        .IDATAIN(se_10),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[10].ibuf 
       (.I(adc_data_p[10]),
        .IB(adc_data_n[10]),
        .O(se_10));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[10].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_10),
        .Q1(D[10]),
        .Q2(\bits_rx[13].iddr_0 [10]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[11].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[11].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_11),
        .IDATAIN(se_11),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[11].ibuf 
       (.I(adc_data_p[11]),
        .IB(adc_data_n[11]),
        .O(se_11));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[11].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_11),
        .Q1(D[11]),
        .Q2(\bits_rx[13].iddr_0 [11]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[12].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[12].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_12),
        .IDATAIN(se_12),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[12].ibuf 
       (.I(adc_data_p[12]),
        .IB(adc_data_n[12]),
        .O(se_12));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[12].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_12),
        .Q1(D[12]),
        .Q2(\bits_rx[13].iddr_0 [12]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[13].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[13].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_13),
        .IDATAIN(se_13),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[13].ibuf 
       (.I(adc_data_p[13]),
        .IB(adc_data_n[13]),
        .O(se_13));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[13].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_13),
        .Q1(D[13]),
        .Q2(\bits_rx[13].iddr_0 [13]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[1].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[1].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_1),
        .IDATAIN(se_1),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[1].ibuf 
       (.I(adc_data_p[1]),
        .IB(adc_data_n[1]),
        .O(se_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[1].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_1),
        .Q1(D[1]),
        .Q2(\bits_rx[13].iddr_0 [1]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[2].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[2].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_2),
        .IDATAIN(se_2),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[2].ibuf 
       (.I(adc_data_p[2]),
        .IB(adc_data_n[2]),
        .O(se_2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[2].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_2),
        .Q1(D[2]),
        .Q2(\bits_rx[13].iddr_0 [2]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[3].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[3].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_3),
        .IDATAIN(se_3),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[3].ibuf 
       (.I(adc_data_p[3]),
        .IB(adc_data_n[3]),
        .O(se_3));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[3].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_3),
        .Q1(D[3]),
        .Q2(\bits_rx[13].iddr_0 [3]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[4].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[4].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_4),
        .IDATAIN(se_4),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[4].ibuf 
       (.I(adc_data_p[4]),
        .IB(adc_data_n[4]),
        .O(se_4));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[4].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_4),
        .Q1(D[4]),
        .Q2(\bits_rx[13].iddr_0 [4]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[5].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[5].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_5),
        .IDATAIN(se_5),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[5].ibuf 
       (.I(adc_data_p[5]),
        .IB(adc_data_n[5]),
        .O(se_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[5].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_5),
        .Q1(D[5]),
        .Q2(\bits_rx[13].iddr_0 [5]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[6].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[6].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_6),
        .IDATAIN(se_6),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[6].ibuf 
       (.I(adc_data_p[6]),
        .IB(adc_data_n[6]),
        .O(se_6));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[6].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_6),
        .Q1(D[6]),
        .Q2(\bits_rx[13].iddr_0 [6]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[7].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[7].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_7),
        .IDATAIN(se_7),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[7].ibuf 
       (.I(adc_data_p[7]),
        .IB(adc_data_n[7]),
        .O(se_7));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[7].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_7),
        .Q1(D[7]),
        .Q2(\bits_rx[13].iddr_0 [7]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[8].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[8].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_8),
        .IDATAIN(se_8),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[8].ibuf 
       (.I(adc_data_p[8]),
        .IB(adc_data_n[8]),
        .O(se_8));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[8].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_8),
        .Q1(D[8]),
        .Q2(\bits_rx[13].iddr_0 [8]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("FIXED"),
    .IDELAY_VALUE(4),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \bits_rx[9].bank35.delay_i 
       (.C(1'b0),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(\NLW_bits_rx[9].bank35.delay_i_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b0),
        .DATAOUT(delayed_9),
        .IDATAIN(se_9),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \bits_rx[9].ibuf 
       (.I(adc_data_p[9]),
        .IB(adc_data_n[9]),
        .O(se_9));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \bits_rx[9].iddr 
       (.C(CLK),
        .CE(1'b1),
        .D(delayed_9),
        .Q1(D[9]),
        .Q2(\bits_rx[13].iddr_0 [9]),
        .R(1'b0),
        .S(1'b0));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    clip_q_i_1
       (.I0(sample_valid),
        .I1(clip_now1),
        .I2(clip_now20_in),
        .I3(clip_now2),
        .I4(clip_now0),
        .O(adc_clip_sticky_1));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    clip_q_i_10
       (.I0(D[13]),
        .I1(D[12]),
        .I2(D[9]),
        .I3(D[8]),
        .I4(D[11]),
        .I5(D[10]),
        .O(clip_q_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    clip_q_i_11
       (.I0(D[2]),
        .I1(D[3]),
        .I2(D[0]),
        .I3(D[1]),
        .O(clip_q_i_11_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    clip_q_i_12
       (.I0(\bits_rx[13].iddr_0 [13]),
        .I1(\bits_rx[13].iddr_0 [12]),
        .I2(\bits_rx[13].iddr_0 [9]),
        .I3(\bits_rx[13].iddr_0 [8]),
        .I4(\bits_rx[13].iddr_0 [11]),
        .I5(\bits_rx[13].iddr_0 [10]),
        .O(clip_q_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    clip_q_i_13
       (.I0(\bits_rx[13].iddr_0 [2]),
        .I1(\bits_rx[13].iddr_0 [3]),
        .I2(\bits_rx[13].iddr_0 [0]),
        .I3(\bits_rx[13].iddr_0 [1]),
        .O(clip_q_i_13_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clip_q_i_2
       (.I0(clip_q_i_6_n_0),
        .I1(clip_q_i_7_n_0),
        .I2(\bits_rx[13].iddr_0 [6]),
        .I3(\bits_rx[13].iddr_0 [7]),
        .I4(\bits_rx[13].iddr_0 [4]),
        .I5(\bits_rx[13].iddr_0 [5]),
        .O(clip_now1));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clip_q_i_3
       (.I0(clip_q_i_8_n_0),
        .I1(clip_q_i_9_n_0),
        .I2(D[6]),
        .I3(D[7]),
        .I4(D[4]),
        .I5(D[5]),
        .O(clip_now20_in));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    clip_q_i_4
       (.I0(clip_q_i_10_n_0),
        .I1(clip_q_i_11_n_0),
        .I2(D[6]),
        .I3(D[7]),
        .I4(D[4]),
        .I5(D[5]),
        .O(clip_now2));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    clip_q_i_5
       (.I0(clip_q_i_12_n_0),
        .I1(clip_q_i_13_n_0),
        .I2(\bits_rx[13].iddr_0 [6]),
        .I3(\bits_rx[13].iddr_0 [7]),
        .I4(\bits_rx[13].iddr_0 [4]),
        .I5(\bits_rx[13].iddr_0 [5]),
        .O(clip_now0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    clip_q_i_6
       (.I0(\bits_rx[13].iddr_0 [13]),
        .I1(\bits_rx[13].iddr_0 [12]),
        .I2(\bits_rx[13].iddr_0 [9]),
        .I3(\bits_rx[13].iddr_0 [8]),
        .I4(\bits_rx[13].iddr_0 [11]),
        .I5(\bits_rx[13].iddr_0 [10]),
        .O(clip_q_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_q_i_7
       (.I0(\bits_rx[13].iddr_0 [2]),
        .I1(\bits_rx[13].iddr_0 [3]),
        .I2(\bits_rx[13].iddr_0 [0]),
        .I3(\bits_rx[13].iddr_0 [1]),
        .O(clip_q_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    clip_q_i_8
       (.I0(D[13]),
        .I1(D[12]),
        .I2(D[9]),
        .I3(D[8]),
        .I4(D[11]),
        .I5(D[10]),
        .O(clip_q_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_q_i_9
       (.I0(D[2]),
        .I1(D[3]),
        .I2(D[0]),
        .I3(D[1]),
        .O(clip_q_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B34" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("7SERIES")) 
    ctrl34
       (.RDY(ready34),
        .REFCLK(ref_clk_200m),
        .RST(ctrl_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "ADC1_RX_B35" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("7SERIES")) 
    ctrl35
       (.RDY(ready35),
        .REFCLK(ref_clk_200m),
        .RST(ctrl_reset));
  LUT2 #(
    .INIT(4'hE)) 
    ctrl_reset_i_1
       (.I0(sel),
        .I1(ref_reset_sync[2]),
        .O(ctrl_reset_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    ctrl_reset_reg
       (.C(ref_clk_200m),
        .CE(1'b1),
        .D(ctrl_reset_i_1_n_0),
        .Q(ctrl_reset),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \enable_sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(\enable_sync_reg[0]_0 ),
        .Q(enable_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \enable_sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(enable_sync[0]),
        .Q(enable_sync[1]));
  LUT4 #(
    .INIT(16'h8000)) 
    \frame_meta_q[9]_i_1 
       (.I0(Q),
        .I1(enable_sync[1]),
        .I2(idelay_ready_reg_0),
        .I3(p_0_in0_in),
        .O(\launch_meta_reg[9] ));
  LUT3 #(
    .INIT(8'h08)) 
    idelay_ready_i_1
       (.I0(ready35_sync[2]),
        .I1(ready34_sync[2]),
        .I2(acq_reset_sync[2]),
        .O(idelay_ready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    idelay_ready_reg
       (.C(CLK),
        .CE(1'b1),
        .D(idelay_ready_i_1_n_0),
        .Q(idelay_ready_reg_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    pair_valid_q_i_1
       (.I0(p_0_in0_in),
        .I1(idelay_ready_reg_0),
        .I2(enable_sync[1]),
        .O(sample_valid));
  LUT2 #(
    .INIT(4'h8)) 
    pulse_ready_q_i_1
       (.I0(idelay_ready_reg_0),
        .I1(enable_sync[1]),
        .O(pulse_ready_q0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready34_sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready34),
        .Q(ready34_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready34_sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready34_sync[0]),
        .Q(ready34_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready34_sync_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready34_sync[1]),
        .Q(ready34_sync[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready35_sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready35),
        .Q(ready35_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready35_sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready35_sync[0]),
        .Q(ready35_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ready35_sync_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AS),
        .D(ready35_sync[1]),
        .Q(ready35_sync[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ref_reset_sync_reg[0] 
       (.C(ref_clk_200m),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AS),
        .Q(ref_reset_sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ref_reset_sync_reg[1] 
       (.C(ref_clk_200m),
        .CE(1'b1),
        .D(ref_reset_sync[0]),
        .PRE(AS),
        .Q(ref_reset_sync[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ref_reset_sync_reg[2] 
       (.C(ref_clk_200m),
        .CE(1'b1),
        .D(ref_reset_sync[1]),
        .PRE(AS),
        .Q(ref_reset_sync[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \reset_count[0]_i_1 
       (.I0(\reset_count_reg_n_0_[0] ),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \reset_count[1]_i_1 
       (.I0(\reset_count_reg_n_0_[0] ),
        .I1(\reset_count_reg_n_0_[1] ),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \reset_count[2]_i_1 
       (.I0(\reset_count_reg_n_0_[0] ),
        .I1(\reset_count_reg_n_0_[1] ),
        .I2(\reset_count_reg_n_0_[2] ),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \reset_count[3]_i_1 
       (.I0(\reset_count_reg_n_0_[1] ),
        .I1(\reset_count_reg_n_0_[0] ),
        .I2(\reset_count_reg_n_0_[2] ),
        .I3(\reset_count_reg_n_0_[3] ),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \reset_count[4]_i_1 
       (.I0(\reset_count_reg_n_0_[2] ),
        .I1(\reset_count_reg_n_0_[0] ),
        .I2(\reset_count_reg_n_0_[1] ),
        .I3(\reset_count_reg_n_0_[3] ),
        .I4(\reset_count_reg_n_0_[4] ),
        .O(p_0_in__1[4]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \reset_count[5]_inv_i_1 
       (.I0(\reset_count_reg_n_0_[3] ),
        .I1(\reset_count_reg_n_0_[1] ),
        .I2(\reset_count_reg_n_0_[0] ),
        .I3(\reset_count_reg_n_0_[2] ),
        .I4(\reset_count_reg_n_0_[4] ),
        .O(p_0_in__1[5]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_count_reg[0] 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[0]),
        .Q(\reset_count_reg_n_0_[0] ),
        .R(ref_reset_sync[2]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_count_reg[1] 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[1]),
        .Q(\reset_count_reg_n_0_[1] ),
        .R(ref_reset_sync[2]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_count_reg[2] 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[2]),
        .Q(\reset_count_reg_n_0_[2] ),
        .R(ref_reset_sync[2]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_count_reg[3] 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[3]),
        .Q(\reset_count_reg_n_0_[3] ),
        .R(ref_reset_sync[2]));
  FDRE #(
    .INIT(1'b0)) 
    \reset_count_reg[4] 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[4]),
        .Q(\reset_count_reg_n_0_[4] ),
        .R(ref_reset_sync[2]));
  (* inverted = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \reset_count_reg[5]_inv 
       (.C(ref_clk_200m),
        .CE(sel),
        .D(p_0_in__1[5]),
        .Q(sel),
        .S(ref_reset_sync[2]));
  LUT3 #(
    .INIT(8'hBF)) 
    \warmup[2]_i_1 
       (.I0(acq_reset_sync[2]),
        .I1(idelay_ready_reg_0),
        .I2(enable_sync[1]),
        .O(\warmup[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \warmup_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(1'b1),
        .Q(\warmup_reg_n_0_[0] ),
        .R(\warmup[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \warmup_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\warmup_reg_n_0_[0] ),
        .Q(\warmup_reg_n_0_[1] ),
        .R(\warmup[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \warmup_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\warmup_reg_n_0_[1] ),
        .Q(p_0_in0_in),
        .R(\warmup[2]_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "cdc_pulse_toggle" *) 
module system_frontend_0_0_cdc_pulse_toggle
   (burst_start_dac,
    SR,
    tx_reset,
    clk_dac,
    echo_clk_acq,
    out,
    \frames_sent_reg[5] ,
    \frames_sent_reg[5]_0 ,
    \frames_sent_reg[5]_1 ,
    \frames_sent_reg[5]_2 ,
    echo_pulse_start_acq,
    echo_rst_acq);
  output burst_start_dac;
  output [0:0]SR;
  input tx_reset;
  input clk_dac;
  input echo_clk_acq;
  input [0:0]out;
  input [0:0]\frames_sent_reg[5] ;
  input [0:0]\frames_sent_reg[5]_0 ;
  input [0:0]\frames_sent_reg[5]_1 ;
  input \frames_sent_reg[5]_2 ;
  input echo_pulse_start_acq;
  input echo_rst_acq;

  wire [0:0]SR;
  wire burst_start_dac;
  wire clk_dac;
  wire dst_pulse_i_1_n_0;
  (* async_reg = "true" *) wire dst_sync_1;
  (* async_reg = "true" *) wire dst_sync_2;
  wire dst_sync_2_d;
  wire echo_clk_acq;
  wire echo_pulse_start_acq;
  wire echo_rst_acq;
  wire [0:0]\frames_sent_reg[5] ;
  wire [0:0]\frames_sent_reg[5]_0 ;
  wire [0:0]\frames_sent_reg[5]_1 ;
  wire \frames_sent_reg[5]_2 ;
  wire [0:0]out;
  wire src_toggle;
  wire src_toggle_i_1_n_0;
  wire tx_reset;

  LUT2 #(
    .INIT(4'h6)) 
    dst_pulse_i_1
       (.I0(dst_sync_2_d),
        .I1(dst_sync_2),
        .O(dst_pulse_i_1_n_0));
  FDRE dst_pulse_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(dst_pulse_i_1_n_0),
        .Q(burst_start_dac),
        .R(tx_reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_1_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(src_toggle),
        .Q(dst_sync_1),
        .R(tx_reset));
  FDRE dst_sync_2_d_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(dst_sync_2),
        .Q(dst_sync_2_d),
        .R(tx_reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_2_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(dst_sync_1),
        .Q(dst_sync_2),
        .R(tx_reset));
  LUT6 #(
    .INIT(64'hFFF7FFF7FFFFFFF7)) 
    \frames_sent[5]_i_1 
       (.I0(out),
        .I1(\frames_sent_reg[5] ),
        .I2(\frames_sent_reg[5]_0 ),
        .I3(\frames_sent_reg[5]_1 ),
        .I4(burst_start_dac),
        .I5(\frames_sent_reg[5]_2 ),
        .O(SR));
  LUT3 #(
    .INIT(8'h06)) 
    src_toggle_i_1
       (.I0(src_toggle),
        .I1(echo_pulse_start_acq),
        .I2(echo_rst_acq),
        .O(src_toggle_i_1_n_0));
  FDRE src_toggle_reg
       (.C(echo_clk_acq),
        .CE(1'b1),
        .D(src_toggle_i_1_n_0),
        .Q(src_toggle),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "dac_init" *) 
module system_frontend_0_0_dac_init
   (sclk_reg,
    adk_spi_csb,
    adk_spi_sda,
    sclk_reg_0,
    dac_spi_csb,
    dac_sdio_o,
    clock_config_done,
    D,
    dac_done_led0,
    dac_sdio_t,
    rst_sys,
    clk_50m,
    dac_sdio_i,
    dco_alive,
    blink_count_reg,
    dac_done_led_reg,
    dac_done_led_reg_0);
  output sclk_reg;
  output adk_spi_csb;
  output adk_spi_sda;
  output sclk_reg_0;
  output dac_spi_csb;
  output dac_sdio_o;
  output clock_config_done;
  output [0:0]D;
  output dac_done_led0;
  output dac_sdio_t;
  input rst_sys;
  input clk_50m;
  input dac_sdio_i;
  input dco_alive;
  input [2:0]blink_count_reg;
  input dac_done_led_reg;
  input dac_done_led_reg_0;

  wire [0:0]D;
  wire adk_done;
  wire adk_spi_csb;
  wire adk_spi_sda;
  wire adk_start;
  wire [2:0]blink_count_reg;
  wire clk_50m;
  wire clock_config_done;
  wire [6:0]clock_index;
  wire \clock_index[0]_i_1_n_0 ;
  wire \clock_index[1]_i_1_n_0 ;
  wire \clock_index[2]_i_1_n_0 ;
  wire \clock_index[3]_i_2_n_0 ;
  wire \clock_index[3]_i_4_n_0 ;
  wire \clock_index[4]_i_1_n_0 ;
  wire \clock_index[5]_i_1_n_0 ;
  wire \clock_index[6]_i_1_n_0 ;
  wire \clock_index[6]_i_2_n_0 ;
  wire clock_spi_n_4;
  wire clock_spi_n_5;
  wire clock_spi_n_6;
  wire clock_spi_n_7;
  wire clock_spi_n_8;
  wire dac_config_done_i_3_n_0;
  wire dac_config_done_i_4_n_0;
  wire dac_done_led0;
  wire dac_done_led_i_4_n_0;
  wire dac_done_led_reg;
  wire dac_done_led_reg_0;
  wire \dac_index[0]_i_1_n_0 ;
  wire \dac_index[1]_i_1_n_0 ;
  wire \dac_index[2]_i_1_n_0 ;
  wire \dac_index[3]_i_1_n_0 ;
  wire \dac_index[4]_i_1_n_0 ;
  wire \dac_index[5]_i_2_n_0 ;
  wire \dac_index[5]_i_3_n_0 ;
  wire \dac_index[5]_i_5_n_0 ;
  wire \dac_index[5]_i_6_n_0 ;
  wire \dac_index[5]_i_9_n_0 ;
  wire dac_sdio_i;
  wire dac_sdio_o;
  wire dac_sdio_t;
  wire dac_spi_csb;
  wire dac_spi_n_10;
  wire dac_spi_n_11;
  wire dac_spi_n_12;
  wire dac_spi_n_13;
  wire dac_spi_n_14;
  wire dac_spi_n_15;
  wire dac_spi_n_16;
  wire dac_spi_n_17;
  wire dac_spi_n_18;
  wire dac_spi_n_19;
  wire dac_spi_n_20;
  wire dac_spi_n_21;
  wire dac_spi_n_22;
  wire dac_spi_n_23;
  wire dac_spi_n_24;
  wire dac_spi_n_25;
  wire dac_spi_n_26;
  wire dac_spi_n_27;
  wire dac_spi_n_29;
  wire dac_spi_n_3;
  wire dac_spi_n_4;
  wire dac_spi_n_5;
  wire dac_spi_n_6;
  wire dac_spi_n_7;
  wire dac_spi_n_8;
  wire dac_spi_n_9;
  wire dac_start;
  wire [31:1]data2;
  wire data6;
  wire dco_alive;
  wire [3:0]error_code;
  wire \error_code[0]_i_2_n_0 ;
  wire \error_code[2]_i_2_n_0 ;
  wire \error_code[3]_i_2_n_0 ;
  wire \error_code[3]_i_4_n_0 ;
  wire \i_/tx[0]_i_1_n_0 ;
  wire \i_/tx[0]_i_2_n_0 ;
  wire \i_/tx[10]_i_1_n_0 ;
  wire \i_/tx[10]_i_2_n_0 ;
  wire \i_/tx[11]_i_1_n_0 ;
  wire \i_/tx[11]_i_2_n_0 ;
  wire \i_/tx[12]_i_1_n_0 ;
  wire \i_/tx[12]_i_2_n_0 ;
  wire \i_/tx[13]_i_1_n_0 ;
  wire \i_/tx[13]_i_2_n_0 ;
  wire \i_/tx[14]_i_1_n_0 ;
  wire \i_/tx[14]_i_2_n_0 ;
  wire \i_/tx[15]_i_1_n_0 ;
  wire \i_/tx[15]_i_2_n_0 ;
  wire \i_/tx[16]_i_1_n_0 ;
  wire \i_/tx[16]_i_2_n_0 ;
  wire \i_/tx[17]_i_2_n_0 ;
  wire \i_/tx[1]_i_1_n_0 ;
  wire \i_/tx[1]_i_2_n_0 ;
  wire \i_/tx[2]_i_1_n_0 ;
  wire \i_/tx[2]_i_2_n_0 ;
  wire \i_/tx[3]_i_1_n_0 ;
  wire \i_/tx[3]_i_2_n_0 ;
  wire \i_/tx[4]_i_1_n_0 ;
  wire \i_/tx[4]_i_2_n_0 ;
  wire \i_/tx[5]_i_1_n_0 ;
  wire \i_/tx[5]_i_2_n_0 ;
  wire \i_/tx[6]_i_1_n_0 ;
  wire \i_/tx[6]_i_2_n_0 ;
  wire \i_/tx[7]_i_1_n_0 ;
  wire \i_/tx[7]_i_2_n_0 ;
  wire \i_/tx[8]_i_1_n_0 ;
  wire \i_/tx[8]_i_2_n_0 ;
  wire \i_/tx[9]_i_1_n_0 ;
  wire \i_/tx[9]_i_2_n_0 ;
  wire [5:0]index;
  wire [11:1]poll_count0;
  wire \poll_count[11]_i_11_n_0 ;
  wire \poll_count[11]_i_12_n_0 ;
  wire \poll_count[11]_i_4_n_0 ;
  wire \poll_count[11]_i_5_n_0 ;
  wire [11:0]poll_count__0;
  wire \poll_count_reg[11]_i_8_n_2 ;
  wire \poll_count_reg[11]_i_8_n_3 ;
  wire \poll_count_reg[4]_i_2_n_0 ;
  wire \poll_count_reg[4]_i_2_n_1 ;
  wire \poll_count_reg[4]_i_2_n_2 ;
  wire \poll_count_reg[4]_i_2_n_3 ;
  wire \poll_count_reg[8]_i_2_n_0 ;
  wire \poll_count_reg[8]_i_2_n_1 ;
  wire \poll_count_reg[8]_i_2_n_2 ;
  wire \poll_count_reg[8]_i_2_n_3 ;
  wire rst_sys;
  wire sclk_reg;
  wire sclk_reg_0;
  wire \state[1]_i_2_n_0 ;
  wire \state[1]_i_3_n_0 ;
  wire \state[3]_i_10_n_0 ;
  wire \state[3]_i_11_n_0 ;
  wire \state[3]_i_12_n_0 ;
  wire \state[3]_i_13_n_0 ;
  wire \state[3]_i_15_n_0 ;
  wire \state[3]_i_16_n_0 ;
  wire \state[3]_i_17_n_0 ;
  wire \state[3]_i_18_n_0 ;
  wire \state[3]_i_19_n_0 ;
  wire \state[3]_i_20_n_0 ;
  wire \state[3]_i_21_n_0 ;
  wire \state[3]_i_22_n_0 ;
  wire \state[3]_i_4_n_0 ;
  wire \state[3]_i_8_n_0 ;
  wire \state[3]_i_9_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire \state_reg_n_0_[3] ;
  wire [0:0]wait_count;
  wire wait_count0_carry__0_n_0;
  wire wait_count0_carry__0_n_1;
  wire wait_count0_carry__0_n_2;
  wire wait_count0_carry__0_n_3;
  wire wait_count0_carry__1_n_0;
  wire wait_count0_carry__1_n_1;
  wire wait_count0_carry__1_n_2;
  wire wait_count0_carry__1_n_3;
  wire wait_count0_carry__2_n_0;
  wire wait_count0_carry__2_n_1;
  wire wait_count0_carry__2_n_2;
  wire wait_count0_carry__2_n_3;
  wire wait_count0_carry__3_n_0;
  wire wait_count0_carry__3_n_1;
  wire wait_count0_carry__3_n_2;
  wire wait_count0_carry__3_n_3;
  wire wait_count0_carry__4_n_0;
  wire wait_count0_carry__4_n_1;
  wire wait_count0_carry__4_n_2;
  wire wait_count0_carry__4_n_3;
  wire wait_count0_carry__5_n_0;
  wire wait_count0_carry__5_n_1;
  wire wait_count0_carry__5_n_2;
  wire wait_count0_carry__5_n_3;
  wire wait_count0_carry__6_n_2;
  wire wait_count0_carry__6_n_3;
  wire wait_count0_carry_n_0;
  wire wait_count0_carry_n_1;
  wire wait_count0_carry_n_2;
  wire wait_count0_carry_n_3;
  wire \wait_count[0]_i_1_n_0 ;
  wire \wait_count[10]_i_1_n_0 ;
  wire \wait_count[11]_i_1_n_0 ;
  wire \wait_count[12]_i_1_n_0 ;
  wire \wait_count[13]_i_1_n_0 ;
  wire \wait_count[14]_i_1_n_0 ;
  wire \wait_count[15]_i_1_n_0 ;
  wire \wait_count[16]_i_1_n_0 ;
  wire \wait_count[17]_i_1_n_0 ;
  wire \wait_count[18]_i_1_n_0 ;
  wire \wait_count[19]_i_1_n_0 ;
  wire \wait_count[1]_i_1_n_0 ;
  wire \wait_count[20]_i_1_n_0 ;
  wire \wait_count[21]_i_1_n_0 ;
  wire \wait_count[22]_i_1_n_0 ;
  wire \wait_count[23]_i_1_n_0 ;
  wire \wait_count[24]_i_1_n_0 ;
  wire \wait_count[25]_i_1_n_0 ;
  wire \wait_count[26]_i_1_n_0 ;
  wire \wait_count[27]_i_1_n_0 ;
  wire \wait_count[28]_i_1_n_0 ;
  wire \wait_count[29]_i_1_n_0 ;
  wire \wait_count[2]_i_1_n_0 ;
  wire \wait_count[30]_i_1_n_0 ;
  wire \wait_count[31]_i_2_n_0 ;
  wire \wait_count[31]_i_4_n_0 ;
  wire \wait_count[3]_i_1_n_0 ;
  wire \wait_count[4]_i_1_n_0 ;
  wire \wait_count[5]_i_1_n_0 ;
  wire \wait_count[6]_i_1_n_0 ;
  wire \wait_count[7]_i_1_n_0 ;
  wire \wait_count[8]_i_1_n_0 ;
  wire \wait_count[9]_i_1_n_0 ;
  wire \wait_count_reg_n_0_[0] ;
  wire \wait_count_reg_n_0_[10] ;
  wire \wait_count_reg_n_0_[11] ;
  wire \wait_count_reg_n_0_[12] ;
  wire \wait_count_reg_n_0_[13] ;
  wire \wait_count_reg_n_0_[14] ;
  wire \wait_count_reg_n_0_[15] ;
  wire \wait_count_reg_n_0_[16] ;
  wire \wait_count_reg_n_0_[17] ;
  wire \wait_count_reg_n_0_[18] ;
  wire \wait_count_reg_n_0_[19] ;
  wire \wait_count_reg_n_0_[1] ;
  wire \wait_count_reg_n_0_[20] ;
  wire \wait_count_reg_n_0_[21] ;
  wire \wait_count_reg_n_0_[22] ;
  wire \wait_count_reg_n_0_[23] ;
  wire \wait_count_reg_n_0_[24] ;
  wire \wait_count_reg_n_0_[25] ;
  wire \wait_count_reg_n_0_[26] ;
  wire \wait_count_reg_n_0_[27] ;
  wire \wait_count_reg_n_0_[28] ;
  wire \wait_count_reg_n_0_[29] ;
  wire \wait_count_reg_n_0_[2] ;
  wire \wait_count_reg_n_0_[30] ;
  wire \wait_count_reg_n_0_[31] ;
  wire \wait_count_reg_n_0_[3] ;
  wire \wait_count_reg_n_0_[4] ;
  wire \wait_count_reg_n_0_[5] ;
  wire \wait_count_reg_n_0_[6] ;
  wire \wait_count_reg_n_0_[7] ;
  wire \wait_count_reg_n_0_[8] ;
  wire \wait_count_reg_n_0_[9] ;
  wire [3:2]\NLW_poll_count_reg[11]_i_8_CO_UNCONNECTED ;
  wire [3:3]\NLW_poll_count_reg[11]_i_8_O_UNCONNECTED ;
  wire [3:2]NLW_wait_count0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_wait_count0_carry__6_O_UNCONNECTED;

  FDRE adk_start_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(clock_spi_n_7),
        .Q(adk_start),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    clock_config_done_i_2
       (.I0(clock_index[5]),
        .I1(clock_index[6]),
        .I2(clock_index[3]),
        .I3(clock_index[4]),
        .I4(clock_index[2]),
        .I5(\clock_index[6]_i_2_n_0 ),
        .O(wait_count));
  FDRE clock_config_done_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(clock_spi_n_8),
        .Q(clock_config_done),
        .R(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clock_index[0]_i_1 
       (.I0(clock_index[0]),
        .O(\clock_index[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \clock_index[1]_i_1 
       (.I0(clock_index[0]),
        .I1(clock_index[1]),
        .O(\clock_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \clock_index[2]_i_1 
       (.I0(clock_index[2]),
        .I1(clock_index[1]),
        .I2(clock_index[0]),
        .O(\clock_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clock_index[3]_i_2 
       (.I0(clock_index[0]),
        .I1(clock_index[1]),
        .I2(clock_index[2]),
        .I3(clock_index[3]),
        .O(\clock_index[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \clock_index[3]_i_4 
       (.I0(clock_index[0]),
        .I1(clock_index[1]),
        .I2(clock_index[2]),
        .O(\clock_index[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \clock_index[4]_i_1 
       (.I0(clock_index[2]),
        .I1(clock_index[1]),
        .I2(clock_index[0]),
        .I3(clock_index[3]),
        .I4(clock_index[4]),
        .O(\clock_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \clock_index[5]_i_1 
       (.I0(clock_index[4]),
        .I1(clock_index[3]),
        .I2(clock_index[0]),
        .I3(clock_index[1]),
        .I4(clock_index[2]),
        .I5(clock_index[5]),
        .O(\clock_index[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCC6CCCCCCCCCCCCC)) 
    \clock_index[6]_i_1 
       (.I0(clock_index[5]),
        .I1(clock_index[6]),
        .I2(clock_index[2]),
        .I3(\clock_index[6]_i_2_n_0 ),
        .I4(clock_index[3]),
        .I5(clock_index[4]),
        .O(\clock_index[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \clock_index[6]_i_2 
       (.I0(clock_index[1]),
        .I1(clock_index[0]),
        .O(\clock_index[6]_i_2_n_0 ));
  FDRE \clock_index_reg[0] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[0]_i_1_n_0 ),
        .Q(clock_index[0]),
        .R(rst_sys));
  FDRE \clock_index_reg[1] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[1]_i_1_n_0 ),
        .Q(clock_index[1]),
        .R(rst_sys));
  FDRE \clock_index_reg[2] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[2]_i_1_n_0 ),
        .Q(clock_index[2]),
        .R(rst_sys));
  FDRE \clock_index_reg[3] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[3]_i_2_n_0 ),
        .Q(clock_index[3]),
        .R(rst_sys));
  FDRE \clock_index_reg[4] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[4]_i_1_n_0 ),
        .Q(clock_index[4]),
        .R(rst_sys));
  FDRE \clock_index_reg[5] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[5]_i_1_n_0 ),
        .Q(clock_index[5]),
        .R(rst_sys));
  FDRE \clock_index_reg[6] 
       (.C(clk_50m),
        .CE(clock_spi_n_5),
        .D(\clock_index[6]_i_1_n_0 ),
        .Q(clock_index[6]),
        .R(rst_sys));
  system_frontend_0_0_spi24_master clock_spi
       (.D({\i_/tx[17]_i_2_n_0 ,\i_/tx[16]_i_1_n_0 ,\i_/tx[15]_i_1_n_0 ,\i_/tx[14]_i_1_n_0 ,\i_/tx[13]_i_1_n_0 ,\i_/tx[12]_i_1_n_0 ,\i_/tx[11]_i_1_n_0 ,\i_/tx[10]_i_1_n_0 ,\i_/tx[9]_i_1_n_0 ,\i_/tx[8]_i_1_n_0 ,\i_/tx[7]_i_1_n_0 ,\i_/tx[6]_i_1_n_0 ,\i_/tx[5]_i_1_n_0 ,\i_/tx[4]_i_1_n_0 ,\i_/tx[3]_i_1_n_0 ,\i_/tx[2]_i_1_n_0 ,\i_/tx[1]_i_1_n_0 ,\i_/tx[0]_i_1_n_0 }),
        .E(clock_spi_n_4),
        .Q({\state_reg_n_0_[3] ,\state_reg_n_0_[2] ,\state_reg_n_0_[1] ,\state_reg_n_0_[0] }),
        .adk_done(adk_done),
        .adk_spi_csb(adk_spi_csb),
        .adk_spi_sda(adk_spi_sda),
        .adk_start(adk_start),
        .busy_reg_0(clock_spi_n_6),
        .busy_reg_1(clock_spi_n_7),
        .clk_50m(clk_50m),
        .clock_config_done(clock_config_done),
        .clock_config_done_reg(\poll_count[11]_i_4_n_0 ),
        .clock_index(clock_index[6:3]),
        .\clock_index_reg[4] (clock_spi_n_5),
        .\clock_index_reg[6] (\clock_index[3]_i_4_n_0 ),
        .data6(data6),
        .dco_alive(dco_alive),
        .rst_sys(rst_sys),
        .sclk_reg_0(sclk_reg),
        .\state_reg[2] (clock_spi_n_8),
        .wait_count(wait_count),
        .\wait_count_reg[0] (\state[1]_i_3_n_0 ),
        .\wait_count_reg[0]_0 (dac_spi_n_13),
        .\wait_count_reg[0]_1 (\wait_count[31]_i_4_n_0 ),
        .\wait_count_reg[0]_2 (\state[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    dac_config_done_i_3
       (.I0(dco_alive),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[0] ),
        .O(dac_config_done_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    dac_config_done_i_4
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[3] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[0] ),
        .O(dac_config_done_i_4_n_0));
  FDRE dac_config_done_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(dac_spi_n_29),
        .Q(D),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hFFFFFFFF54FF0000)) 
    dac_done_led_i_1
       (.I0(blink_count_reg[0]),
        .I1(dac_done_led_reg),
        .I2(dac_done_led_reg_0),
        .I3(blink_count_reg[1]),
        .I4(dac_done_led_i_4_n_0),
        .I5(D),
        .O(dac_done_led0));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    dac_done_led_i_4
       (.I0(error_code[2]),
        .I1(error_code[3]),
        .I2(error_code[1]),
        .I3(error_code[0]),
        .I4(blink_count_reg[2]),
        .O(dac_done_led_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \dac_index[0]_i_1 
       (.I0(\state_reg_n_0_[2] ),
        .I1(index[0]),
        .O(\dac_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \dac_index[1]_i_1 
       (.I0(index[0]),
        .I1(\state_reg_n_0_[2] ),
        .I2(index[1]),
        .O(\dac_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h60C0)) 
    \dac_index[2]_i_1 
       (.I0(index[0]),
        .I1(index[2]),
        .I2(\state_reg_n_0_[2] ),
        .I3(index[1]),
        .O(\dac_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \dac_index[3]_i_1 
       (.I0(index[1]),
        .I1(index[2]),
        .I2(index[0]),
        .I3(\state_reg_n_0_[2] ),
        .I4(index[3]),
        .O(\dac_index[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \dac_index[4]_i_1 
       (.I0(index[0]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[3]),
        .I4(\state_reg_n_0_[2] ),
        .I5(index[4]),
        .O(\dac_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF000020000000)) 
    \dac_index[5]_i_2 
       (.I0(index[3]),
        .I1(\dac_index[5]_i_6_n_0 ),
        .I2(index[0]),
        .I3(index[4]),
        .I4(\state_reg_n_0_[2] ),
        .I5(index[5]),
        .O(\dac_index[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    \dac_index[5]_i_3 
       (.I0(index[0]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[4]),
        .I4(index[5]),
        .I5(index[3]),
        .O(\dac_index[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \dac_index[5]_i_5 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[3] ),
        .O(\dac_index[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \dac_index[5]_i_6 
       (.I0(index[2]),
        .I1(index[1]),
        .O(\dac_index[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \dac_index[5]_i_9 
       (.I0(index[0]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[4]),
        .I4(index[5]),
        .I5(index[3]),
        .O(\dac_index[5]_i_9_n_0 ));
  FDRE \dac_index_reg[0] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[0]_i_1_n_0 ),
        .Q(index[0]),
        .R(rst_sys));
  FDRE \dac_index_reg[1] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[1]_i_1_n_0 ),
        .Q(index[1]),
        .R(rst_sys));
  FDRE \dac_index_reg[2] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[2]_i_1_n_0 ),
        .Q(index[2]),
        .R(rst_sys));
  FDRE \dac_index_reg[3] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[3]_i_1_n_0 ),
        .Q(index[3]),
        .R(rst_sys));
  FDRE \dac_index_reg[4] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[4]_i_1_n_0 ),
        .Q(index[4]),
        .R(rst_sys));
  FDRE \dac_index_reg[5] 
       (.C(clk_50m),
        .CE(dac_spi_n_12),
        .D(\dac_index[5]_i_2_n_0 ),
        .Q(index[5]),
        .R(rst_sys));
  system_frontend_0_0_spi24_master_0 dac_spi
       (.D({dac_spi_n_3,dac_spi_n_4,dac_spi_n_5}),
        .E(dac_spi_n_6),
        .Q(index),
        .adk_done(adk_done),
        .busy_reg_0(dac_spi_n_26),
        .clk_50m(clk_50m),
        .dac_config_done_reg(dac_spi_n_29),
        .dac_config_done_reg_0(\dac_index[5]_i_3_n_0 ),
        .dac_config_done_reg_1(dac_config_done_i_3_n_0),
        .dac_config_done_reg_2(dac_config_done_i_4_n_0),
        .dac_config_done_reg_3(D),
        .\dac_index_reg[0] (\dac_index[5]_i_5_n_0 ),
        .dac_sdio_i(dac_sdio_i),
        .dac_sdio_o(dac_sdio_o),
        .dac_sdio_t(dac_sdio_t),
        .dac_spi_csb(dac_spi_csb),
        .dac_start(dac_start),
        .data6(data6),
        .dco_alive(dco_alive),
        .done_reg_0(dac_spi_n_13),
        .\error_code_reg[0] (\poll_count[11]_i_4_n_0 ),
        .\error_code_reg[0]_0 (\error_code[0]_i_2_n_0 ),
        .\error_code_reg[0]_1 (\error_code[3]_i_2_n_0 ),
        .\error_code_reg[0]_2 (\state[3]_i_4_n_0 ),
        .\error_code_reg[0]_3 (\error_code[3]_i_4_n_0 ),
        .\error_code_reg[1] ({\state_reg_n_0_[3] ,\state_reg_n_0_[2] ,\state_reg_n_0_[1] ,\state_reg_n_0_[0] }),
        .\error_code_reg[1]_0 (\error_code[2]_i_2_n_0 ),
        .poll_count0(poll_count0),
        .\poll_count_reg[0] (\poll_count[11]_i_5_n_0 ),
        .\poll_count_reg[0]_0 (poll_count__0[0]),
        .\poll_count_reg[11] (\dac_index[5]_i_6_n_0 ),
        .\read_data_reg[1]_0 (dac_spi_n_11),
        .\read_data_reg[1]_1 ({dac_spi_n_14,dac_spi_n_15,dac_spi_n_16,dac_spi_n_17,dac_spi_n_18,dac_spi_n_19,dac_spi_n_20,dac_spi_n_21,dac_spi_n_22,dac_spi_n_23,dac_spi_n_24,dac_spi_n_25}),
        .rst_sys(rst_sys),
        .sclk_reg_0(sclk_reg_0),
        .\state[3]_i_3_0 (clock_spi_n_6),
        .\state[3]_i_6_0 (\dac_index[5]_i_9_n_0 ),
        .\state_reg[1] ({dac_spi_n_7,dac_spi_n_8,dac_spi_n_9,dac_spi_n_10}),
        .\state_reg[1]_0 (\state[1]_i_2_n_0 ),
        .\state_reg[1]_1 (\state[1]_i_3_n_0 ),
        .\state_reg[2] (dac_spi_n_12),
        .\state_reg[2]_0 (dac_spi_n_27));
  FDRE dac_start_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(dac_spi_n_26),
        .Q(dac_start),
        .R(rst_sys));
  LUT3 #(
    .INIT(8'h02)) 
    \error_code[0]_i_2 
       (.I0(index[3]),
        .I1(index[4]),
        .I2(index[5]),
        .O(\error_code[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \error_code[2]_i_2 
       (.I0(index[1]),
        .I1(index[2]),
        .I2(index[0]),
        .O(\error_code[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hFFFA2000)) 
    \error_code[3]_i_2 
       (.I0(\state_reg_n_0_[1] ),
        .I1(dco_alive),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(\state_reg_n_0_[3] ),
        .O(\error_code[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \error_code[3]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\error_code[3]_i_4_n_0 ));
  FDRE \error_code_reg[0] 
       (.C(clk_50m),
        .CE(dac_spi_n_6),
        .D(dac_spi_n_5),
        .Q(error_code[0]),
        .R(rst_sys));
  FDRE \error_code_reg[1] 
       (.C(clk_50m),
        .CE(dac_spi_n_6),
        .D(dac_spi_n_4),
        .Q(error_code[1]),
        .R(rst_sys));
  FDRE \error_code_reg[2] 
       (.C(clk_50m),
        .CE(dac_spi_n_6),
        .D(dac_spi_n_3),
        .Q(error_code[2]),
        .R(rst_sys));
  FDRE \error_code_reg[3] 
       (.C(clk_50m),
        .CE(dac_spi_n_6),
        .D(\state_reg_n_0_[3] ),
        .Q(error_code[3]),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hFACAFACA3A0ACACA)) 
    \i_/tx[0]_i_1 
       (.I0(\i_/tx[0]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9251490014000044)) 
    \i_/tx[0]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .I5(clock_index[1]),
        .O(\i_/tx[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[10]_i_1 
       (.I0(\i_/tx[10]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h285402DC02DC5588)) 
    \i_/tx[10]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .I5(clock_index[1]),
        .O(\i_/tx[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A3A0A)) 
    \i_/tx[11]_i_1 
       (.I0(\i_/tx[11]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .O(\i_/tx[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5858580C0C848486)) 
    \i_/tx[11]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .I5(clock_index[2]),
        .O(\i_/tx[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAFAFAFACA)) 
    \i_/tx[12]_i_1 
       (.I0(\i_/tx[12]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h393B3B3E3E9E9E9C)) 
    \i_/tx[12]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .I5(clock_index[2]),
        .O(\i_/tx[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'hFACAFAFA)) 
    \i_/tx[13]_i_1 
       (.I0(\i_/tx[13]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[0]),
        .I4(clock_index[2]),
        .O(\i_/tx[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCC4C4C442626222)) 
    \i_/tx[13]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[2]),
        .I3(clock_index[1]),
        .I4(clock_index[0]),
        .I5(clock_index[3]),
        .O(\i_/tx[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A0A0A0A0A0A3A)) 
    \i_/tx[14]_i_1 
       (.I0(\i_/tx[14]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .I5(clock_index[2]),
        .O(\i_/tx[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h80000000002AAAA8)) 
    \i_/tx[14]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[0]),
        .I2(clock_index[1]),
        .I3(clock_index[2]),
        .I4(clock_index[3]),
        .I5(clock_index[4]),
        .O(\i_/tx[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A0A0A0A0A0A3A)) 
    \i_/tx[15]_i_1 
       (.I0(\i_/tx[15]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .I5(clock_index[2]),
        .O(\i_/tx[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEECECECCAEAEAAA)) 
    \i_/tx[15]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[2]),
        .I3(clock_index[1]),
        .I4(clock_index[0]),
        .I5(clock_index[3]),
        .O(\i_/tx[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A0A0A0A0A0A3A)) 
    \i_/tx[16]_i_1 
       (.I0(\i_/tx[16]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .I5(clock_index[2]),
        .O(\i_/tx[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA8888888)) 
    \i_/tx[16]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[3]),
        .I2(clock_index[0]),
        .I3(clock_index[1]),
        .I4(clock_index[2]),
        .I5(clock_index[4]),
        .O(\i_/tx[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'hCC8CCC88)) 
    \i_/tx[17]_i_2 
       (.I0(clock_index[3]),
        .I1(clock_index[6]),
        .I2(clock_index[2]),
        .I3(clock_index[0]),
        .I4(clock_index[1]),
        .O(\i_/tx[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A0A0A3A0A3A3A)) 
    \i_/tx[1]_i_1 
       (.I0(\i_/tx[1]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h821202060B262620)) 
    \i_/tx[1]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[1]),
        .I4(clock_index[0]),
        .I5(clock_index[2]),
        .O(\i_/tx[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A3A0A)) 
    \i_/tx[2]_i_1 
       (.I0(\i_/tx[2]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .O(\i_/tx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1010113000201424)) 
    \i_/tx[2]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[3]_i_1 
       (.I0(\i_/tx[3]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002031202060615)) 
    \i_/tx[3]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[4]_i_1 
       (.I0(\i_/tx[4]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000100141)) 
    \i_/tx[4]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[0]),
        .I2(clock_index[2]),
        .I3(clock_index[1]),
        .I4(clock_index[3]),
        .I5(clock_index[4]),
        .O(\i_/tx[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[5]_i_1 
       (.I0(\i_/tx[5]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800010000009004)) 
    \i_/tx[5]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[1]),
        .I5(clock_index[0]),
        .O(\i_/tx[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[6]_i_1 
       (.I0(\i_/tx[6]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1001002001200024)) 
    \i_/tx[6]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .I5(clock_index[1]),
        .O(\i_/tx[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \i_/tx[7]_i_1 
       (.I0(\i_/tx[7]_i_2_n_0 ),
        .I1(clock_index[6]),
        .O(\i_/tx[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2000003000000804)) 
    \i_/tx[7]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[1]),
        .I4(clock_index[0]),
        .I5(clock_index[2]),
        .O(\i_/tx[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A0A3A)) 
    \i_/tx[8]_i_1 
       (.I0(\i_/tx[8]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .O(\i_/tx[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000101FFFEFEFE)) 
    \i_/tx[8]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[1]),
        .I4(clock_index[2]),
        .I5(clock_index[0]),
        .O(\i_/tx[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAFA0A0AFACA0A0A)) 
    \i_/tx[9]_i_1 
       (.I0(\i_/tx[9]_i_2_n_0 ),
        .I1(clock_index[3]),
        .I2(clock_index[6]),
        .I3(clock_index[2]),
        .I4(clock_index[0]),
        .I5(clock_index[1]),
        .O(\i_/tx[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55A857A9A856A856)) 
    \i_/tx[9]_i_2 
       (.I0(clock_index[5]),
        .I1(clock_index[4]),
        .I2(clock_index[3]),
        .I3(clock_index[0]),
        .I4(clock_index[2]),
        .I5(clock_index[1]),
        .O(\i_/tx[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \poll_count[11]_i_11 
       (.I0(poll_count__0[7]),
        .I1(poll_count__0[6]),
        .I2(poll_count__0[5]),
        .I3(poll_count__0[4]),
        .O(\poll_count[11]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \poll_count[11]_i_12 
       (.I0(poll_count__0[1]),
        .I1(poll_count__0[0]),
        .I2(poll_count__0[3]),
        .I3(poll_count__0[2]),
        .O(\poll_count[11]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \poll_count[11]_i_4 
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[1] ),
        .O(\poll_count[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \poll_count[11]_i_5 
       (.I0(\poll_count[11]_i_11_n_0 ),
        .I1(poll_count__0[11]),
        .I2(poll_count__0[10]),
        .I3(poll_count__0[9]),
        .I4(poll_count__0[8]),
        .I5(\poll_count[11]_i_12_n_0 ),
        .O(\poll_count[11]_i_5_n_0 ));
  FDRE \poll_count_reg[0] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_25),
        .Q(poll_count__0[0]),
        .R(rst_sys));
  FDRE \poll_count_reg[10] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_15),
        .Q(poll_count__0[10]),
        .R(rst_sys));
  FDRE \poll_count_reg[11] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_14),
        .Q(poll_count__0[11]),
        .R(rst_sys));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \poll_count_reg[11]_i_8 
       (.CI(\poll_count_reg[8]_i_2_n_0 ),
        .CO({\NLW_poll_count_reg[11]_i_8_CO_UNCONNECTED [3:2],\poll_count_reg[11]_i_8_n_2 ,\poll_count_reg[11]_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_poll_count_reg[11]_i_8_O_UNCONNECTED [3],poll_count0[11:9]}),
        .S({1'b0,poll_count__0[11:9]}));
  FDRE \poll_count_reg[1] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_24),
        .Q(poll_count__0[1]),
        .R(rst_sys));
  FDRE \poll_count_reg[2] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_23),
        .Q(poll_count__0[2]),
        .R(rst_sys));
  FDRE \poll_count_reg[3] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_22),
        .Q(poll_count__0[3]),
        .R(rst_sys));
  FDRE \poll_count_reg[4] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_21),
        .Q(poll_count__0[4]),
        .R(rst_sys));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \poll_count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\poll_count_reg[4]_i_2_n_0 ,\poll_count_reg[4]_i_2_n_1 ,\poll_count_reg[4]_i_2_n_2 ,\poll_count_reg[4]_i_2_n_3 }),
        .CYINIT(poll_count__0[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(poll_count0[4:1]),
        .S(poll_count__0[4:1]));
  FDRE \poll_count_reg[5] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_20),
        .Q(poll_count__0[5]),
        .R(rst_sys));
  FDRE \poll_count_reg[6] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_19),
        .Q(poll_count__0[6]),
        .R(rst_sys));
  FDRE \poll_count_reg[7] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_18),
        .Q(poll_count__0[7]),
        .R(rst_sys));
  FDRE \poll_count_reg[8] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_17),
        .Q(poll_count__0[8]),
        .R(rst_sys));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \poll_count_reg[8]_i_2 
       (.CI(\poll_count_reg[4]_i_2_n_0 ),
        .CO({\poll_count_reg[8]_i_2_n_0 ,\poll_count_reg[8]_i_2_n_1 ,\poll_count_reg[8]_i_2_n_2 ,\poll_count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(poll_count0[8:5]),
        .S(poll_count__0[8:5]));
  FDRE \poll_count_reg[9] 
       (.C(clk_50m),
        .CE(dac_spi_n_11),
        .D(dac_spi_n_16),
        .Q(poll_count__0[9]),
        .R(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00000308)) 
    \state[1]_i_2 
       (.I0(wait_count),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[2] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(\state_reg_n_0_[3] ),
        .O(\state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \state[1]_i_3 
       (.I0(index[0]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[4]),
        .I4(index[5]),
        .I5(index[3]),
        .O(\state[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[3]_i_10 
       (.I0(\wait_count_reg_n_0_[29] ),
        .I1(\wait_count_reg_n_0_[30] ),
        .O(\state[3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \state[3]_i_11 
       (.I0(\state[3]_i_19_n_0 ),
        .I1(\state[3]_i_15_n_0 ),
        .I2(\wait_count_reg_n_0_[19] ),
        .I3(\wait_count_reg_n_0_[21] ),
        .I4(\wait_count_reg_n_0_[20] ),
        .O(\state[3]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \state[3]_i_12 
       (.I0(\wait_count_reg_n_0_[16] ),
        .I1(\wait_count_reg_n_0_[15] ),
        .I2(\wait_count_reg_n_0_[18] ),
        .I3(\wait_count_reg_n_0_[17] ),
        .O(\state[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAAAA8)) 
    \state[3]_i_13 
       (.I0(\wait_count_reg_n_0_[13] ),
        .I1(\state[3]_i_20_n_0 ),
        .I2(\state[3]_i_21_n_0 ),
        .I3(\wait_count_reg_n_0_[10] ),
        .I4(\wait_count_reg_n_0_[11] ),
        .I5(\wait_count_reg_n_0_[14] ),
        .O(\state[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[3]_i_15 
       (.I0(\wait_count_reg_n_0_[28] ),
        .I1(\wait_count_reg_n_0_[27] ),
        .I2(\wait_count_reg_n_0_[26] ),
        .I3(\wait_count_reg_n_0_[25] ),
        .O(\state[3]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state[3]_i_16 
       (.I0(\wait_count_reg_n_0_[20] ),
        .I1(\wait_count_reg_n_0_[21] ),
        .O(\state[3]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFE000000)) 
    \state[3]_i_17 
       (.I0(\state[3]_i_22_n_0 ),
        .I1(\wait_count_reg_n_0_[7] ),
        .I2(\wait_count_reg_n_0_[6] ),
        .I3(\wait_count_reg_n_0_[8] ),
        .I4(\wait_count_reg_n_0_[9] ),
        .I5(\wait_count_reg_n_0_[10] ),
        .O(\state[3]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFEEE)) 
    \state[3]_i_18 
       (.I0(\wait_count_reg_n_0_[16] ),
        .I1(\wait_count_reg_n_0_[15] ),
        .I2(\wait_count_reg_n_0_[12] ),
        .I3(\wait_count_reg_n_0_[14] ),
        .O(\state[3]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[3]_i_19 
       (.I0(\wait_count_reg_n_0_[30] ),
        .I1(\wait_count_reg_n_0_[29] ),
        .I2(\wait_count_reg_n_0_[23] ),
        .I3(\wait_count_reg_n_0_[31] ),
        .O(\state[3]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF0E0)) 
    \state[3]_i_20 
       (.I0(\wait_count_reg_n_0_[7] ),
        .I1(\wait_count_reg_n_0_[6] ),
        .I2(\wait_count_reg_n_0_[8] ),
        .I3(\wait_count_reg_n_0_[5] ),
        .I4(\wait_count_reg_n_0_[12] ),
        .I5(\wait_count_reg_n_0_[9] ),
        .O(\state[3]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \state[3]_i_21 
       (.I0(\wait_count_reg_n_0_[1] ),
        .I1(\wait_count_reg_n_0_[2] ),
        .I2(\wait_count_reg_n_0_[8] ),
        .I3(\wait_count_reg_n_0_[0] ),
        .I4(\wait_count_reg_n_0_[4] ),
        .I5(\wait_count_reg_n_0_[3] ),
        .O(\state[3]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \state[3]_i_22 
       (.I0(\wait_count_reg_n_0_[2] ),
        .I1(\wait_count_reg_n_0_[3] ),
        .I2(\wait_count_reg_n_0_[0] ),
        .I3(\wait_count_reg_n_0_[1] ),
        .I4(\wait_count_reg_n_0_[5] ),
        .I5(\wait_count_reg_n_0_[4] ),
        .O(\state[3]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAAAAAA)) 
    \state[3]_i_4 
       (.I0(\state[3]_i_8_n_0 ),
        .I1(\wait_count_reg_n_0_[22] ),
        .I2(\wait_count_reg_n_0_[18] ),
        .I3(\wait_count_reg_n_0_[19] ),
        .I4(\state[3]_i_9_n_0 ),
        .I5(\state[3]_i_10_n_0 ),
        .O(\state[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEA)) 
    \state[3]_i_5 
       (.I0(\state[3]_i_11_n_0 ),
        .I1(\state[3]_i_12_n_0 ),
        .I2(\state[3]_i_13_n_0 ),
        .I3(\wait_count_reg_n_0_[24] ),
        .I4(\wait_count_reg_n_0_[22] ),
        .O(data6));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \state[3]_i_8 
       (.I0(\state[3]_i_15_n_0 ),
        .I1(\state[3]_i_16_n_0 ),
        .I2(\wait_count_reg_n_0_[22] ),
        .I3(\wait_count_reg_n_0_[31] ),
        .I4(\wait_count_reg_n_0_[23] ),
        .I5(\wait_count_reg_n_0_[24] ),
        .O(\state[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFCC80)) 
    \state[3]_i_9 
       (.I0(\wait_count_reg_n_0_[11] ),
        .I1(\wait_count_reg_n_0_[14] ),
        .I2(\state[3]_i_17_n_0 ),
        .I3(\wait_count_reg_n_0_[13] ),
        .I4(\wait_count_reg_n_0_[17] ),
        .I5(\state[3]_i_18_n_0 ),
        .O(\state[3]_i_9_n_0 ));
  FDRE \state_reg[0] 
       (.C(clk_50m),
        .CE(dac_spi_n_27),
        .D(dac_spi_n_10),
        .Q(\state_reg_n_0_[0] ),
        .R(rst_sys));
  FDRE \state_reg[1] 
       (.C(clk_50m),
        .CE(dac_spi_n_27),
        .D(dac_spi_n_9),
        .Q(\state_reg_n_0_[1] ),
        .R(rst_sys));
  FDRE \state_reg[2] 
       (.C(clk_50m),
        .CE(dac_spi_n_27),
        .D(dac_spi_n_8),
        .Q(\state_reg_n_0_[2] ),
        .R(rst_sys));
  FDRE \state_reg[3] 
       (.C(clk_50m),
        .CE(dac_spi_n_27),
        .D(dac_spi_n_7),
        .Q(\state_reg_n_0_[3] ),
        .R(rst_sys));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry
       (.CI(1'b0),
        .CO({wait_count0_carry_n_0,wait_count0_carry_n_1,wait_count0_carry_n_2,wait_count0_carry_n_3}),
        .CYINIT(\wait_count_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[4:1]),
        .S({\wait_count_reg_n_0_[4] ,\wait_count_reg_n_0_[3] ,\wait_count_reg_n_0_[2] ,\wait_count_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__0
       (.CI(wait_count0_carry_n_0),
        .CO({wait_count0_carry__0_n_0,wait_count0_carry__0_n_1,wait_count0_carry__0_n_2,wait_count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[8:5]),
        .S({\wait_count_reg_n_0_[8] ,\wait_count_reg_n_0_[7] ,\wait_count_reg_n_0_[6] ,\wait_count_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__1
       (.CI(wait_count0_carry__0_n_0),
        .CO({wait_count0_carry__1_n_0,wait_count0_carry__1_n_1,wait_count0_carry__1_n_2,wait_count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[12:9]),
        .S({\wait_count_reg_n_0_[12] ,\wait_count_reg_n_0_[11] ,\wait_count_reg_n_0_[10] ,\wait_count_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__2
       (.CI(wait_count0_carry__1_n_0),
        .CO({wait_count0_carry__2_n_0,wait_count0_carry__2_n_1,wait_count0_carry__2_n_2,wait_count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[16:13]),
        .S({\wait_count_reg_n_0_[16] ,\wait_count_reg_n_0_[15] ,\wait_count_reg_n_0_[14] ,\wait_count_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__3
       (.CI(wait_count0_carry__2_n_0),
        .CO({wait_count0_carry__3_n_0,wait_count0_carry__3_n_1,wait_count0_carry__3_n_2,wait_count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[20:17]),
        .S({\wait_count_reg_n_0_[20] ,\wait_count_reg_n_0_[19] ,\wait_count_reg_n_0_[18] ,\wait_count_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__4
       (.CI(wait_count0_carry__3_n_0),
        .CO({wait_count0_carry__4_n_0,wait_count0_carry__4_n_1,wait_count0_carry__4_n_2,wait_count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[24:21]),
        .S({\wait_count_reg_n_0_[24] ,\wait_count_reg_n_0_[23] ,\wait_count_reg_n_0_[22] ,\wait_count_reg_n_0_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__5
       (.CI(wait_count0_carry__4_n_0),
        .CO({wait_count0_carry__5_n_0,wait_count0_carry__5_n_1,wait_count0_carry__5_n_2,wait_count0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data2[28:25]),
        .S({\wait_count_reg_n_0_[28] ,\wait_count_reg_n_0_[27] ,\wait_count_reg_n_0_[26] ,\wait_count_reg_n_0_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wait_count0_carry__6
       (.CI(wait_count0_carry__5_n_0),
        .CO({NLW_wait_count0_carry__6_CO_UNCONNECTED[3:2],wait_count0_carry__6_n_2,wait_count0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_wait_count0_carry__6_O_UNCONNECTED[3],data2[31:29]}),
        .S({1'b0,\wait_count_reg_n_0_[31] ,\wait_count_reg_n_0_[30] ,\wait_count_reg_n_0_[29] }));
  LUT6 #(
    .INIT(64'h00000000AAAA02A2)) 
    \wait_count[0]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(\wait_count_reg_n_0_[0] ),
        .O(\wait_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[10]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[10]),
        .O(\wait_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[11]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[11]),
        .O(\wait_count[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[12]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[12]),
        .O(\wait_count[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[13]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[13]),
        .O(\wait_count[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[14]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[14]),
        .O(\wait_count[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[15]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[15]),
        .O(\wait_count[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[16]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[16]),
        .O(\wait_count[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[17]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[17]),
        .O(\wait_count[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[18]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[18]),
        .O(\wait_count[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[19]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[19]),
        .O(\wait_count[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[1]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[1]),
        .O(\wait_count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[20]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[20]),
        .O(\wait_count[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[21]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[21]),
        .O(\wait_count[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[22]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[22]),
        .O(\wait_count[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[23]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[23]),
        .O(\wait_count[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[24]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[24]),
        .O(\wait_count[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[25]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[25]),
        .O(\wait_count[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[26]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[26]),
        .O(\wait_count[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[27]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[27]),
        .O(\wait_count[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[28]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[28]),
        .O(\wait_count[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[29]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[29]),
        .O(\wait_count[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[2]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[2]),
        .O(\wait_count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[30]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[30]),
        .O(\wait_count[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[31]_i_2 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[31]),
        .O(\wait_count[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \wait_count[31]_i_4 
       (.I0(\state_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[2] ),
        .O(\wait_count[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[3]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[3]),
        .O(\wait_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[4]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[4]),
        .O(\wait_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[5]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[5]),
        .O(\wait_count[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[6]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[6]),
        .O(\wait_count[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[7]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[7]),
        .O(\wait_count[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[8]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[8]),
        .O(\wait_count[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA02A200000000)) 
    \wait_count[9]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state[3]_i_4_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(dco_alive),
        .I4(\state_reg_n_0_[2] ),
        .I5(data2[9]),
        .O(\wait_count[9]_i_1_n_0 ));
  FDRE \wait_count_reg[0] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[0]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[0] ),
        .R(rst_sys));
  FDRE \wait_count_reg[10] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[10]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[10] ),
        .R(rst_sys));
  FDRE \wait_count_reg[11] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[11]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[11] ),
        .R(rst_sys));
  FDRE \wait_count_reg[12] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[12]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[12] ),
        .R(rst_sys));
  FDRE \wait_count_reg[13] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[13]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[13] ),
        .R(rst_sys));
  FDRE \wait_count_reg[14] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[14]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[14] ),
        .R(rst_sys));
  FDRE \wait_count_reg[15] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[15]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[15] ),
        .R(rst_sys));
  FDRE \wait_count_reg[16] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[16]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[16] ),
        .R(rst_sys));
  FDRE \wait_count_reg[17] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[17]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[17] ),
        .R(rst_sys));
  FDRE \wait_count_reg[18] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[18]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[18] ),
        .R(rst_sys));
  FDRE \wait_count_reg[19] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[19]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[19] ),
        .R(rst_sys));
  FDRE \wait_count_reg[1] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[1]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[1] ),
        .R(rst_sys));
  FDRE \wait_count_reg[20] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[20]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[20] ),
        .R(rst_sys));
  FDRE \wait_count_reg[21] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[21]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[21] ),
        .R(rst_sys));
  FDRE \wait_count_reg[22] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[22]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[22] ),
        .R(rst_sys));
  FDRE \wait_count_reg[23] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[23]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[23] ),
        .R(rst_sys));
  FDRE \wait_count_reg[24] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[24]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[24] ),
        .R(rst_sys));
  FDRE \wait_count_reg[25] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[25]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[25] ),
        .R(rst_sys));
  FDRE \wait_count_reg[26] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[26]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[26] ),
        .R(rst_sys));
  FDRE \wait_count_reg[27] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[27]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[27] ),
        .R(rst_sys));
  FDRE \wait_count_reg[28] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[28]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[28] ),
        .R(rst_sys));
  FDRE \wait_count_reg[29] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[29]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[29] ),
        .R(rst_sys));
  FDRE \wait_count_reg[2] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[2]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[2] ),
        .R(rst_sys));
  FDRE \wait_count_reg[30] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[30]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[30] ),
        .R(rst_sys));
  FDRE \wait_count_reg[31] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[31]_i_2_n_0 ),
        .Q(\wait_count_reg_n_0_[31] ),
        .R(rst_sys));
  FDRE \wait_count_reg[3] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[3]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[3] ),
        .R(rst_sys));
  FDRE \wait_count_reg[4] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[4]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[4] ),
        .R(rst_sys));
  FDRE \wait_count_reg[5] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[5]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[5] ),
        .R(rst_sys));
  FDRE \wait_count_reg[6] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[6]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[6] ),
        .R(rst_sys));
  FDRE \wait_count_reg[7] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[7]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[7] ),
        .R(rst_sys));
  FDRE \wait_count_reg[8] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[8]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[8] ),
        .R(rst_sys));
  FDRE \wait_count_reg[9] 
       (.C(clk_50m),
        .CE(clock_spi_n_4),
        .D(\wait_count[9]_i_1_n_0 ),
        .Q(\wait_count_reg_n_0_[9] ),
        .R(rst_sys));
endmodule

(* ORIG_REF_NAME = "dac_lvds_tx" *) 
module system_frontend_0_0_dac_lvds_tx
   (dac_data_p,
    dac_data_n,
    dac_dci_p,
    dac_dci_n,
    clk_dac,
    SR,
    i_sample);
  output [15:0]dac_data_p;
  output [15:0]dac_data_n;
  output dac_dci_p;
  output dac_dci_n;
  input clk_dac;
  input [0:0]SR;
  input [1:0]i_sample;

  wire [0:0]SR;
  wire clk_dac;
  wire [15:0]dac_data_n;
  wire [15:0]dac_data_p;
  wire dac_dci_n;
  wire dac_dci_p;
  wire [15:0]data_se;
  wire dci_se;
  wire [1:0]i_sample;
  wire \NLW_data_bit[0].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[10].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[11].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[12].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[13].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[14].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[15].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[1].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[2].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[3].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[4].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[5].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[6].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[7].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[8].data_oddr_S_UNCONNECTED ;
  wire \NLW_data_bit[9].data_oddr_S_UNCONNECTED ;
  wire NLW_dci_oddr_S_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[0].data_buf 
       (.I(data_se[0]),
        .O(dac_data_p[0]),
        .OB(dac_data_n[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[0].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[0]),
        .R(SR),
        .S(\NLW_data_bit[0].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[10].data_buf 
       (.I(data_se[10]),
        .O(dac_data_p[10]),
        .OB(dac_data_n[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[10].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[10]),
        .R(SR),
        .S(\NLW_data_bit[10].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[11].data_buf 
       (.I(data_se[11]),
        .O(dac_data_p[11]),
        .OB(dac_data_n[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[11].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[11]),
        .R(SR),
        .S(\NLW_data_bit[11].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[12].data_buf 
       (.I(data_se[12]),
        .O(dac_data_p[12]),
        .OB(dac_data_n[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[12].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(i_sample[0]),
        .D2(1'b0),
        .Q(data_se[12]),
        .R(SR),
        .S(\NLW_data_bit[12].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[13].data_buf 
       (.I(data_se[13]),
        .O(dac_data_p[13]),
        .OB(dac_data_n[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[13].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(i_sample[1]),
        .D2(1'b0),
        .Q(data_se[13]),
        .R(SR),
        .S(\NLW_data_bit[13].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[14].data_buf 
       (.I(data_se[14]),
        .O(dac_data_p[14]),
        .OB(dac_data_n[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[14].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(i_sample[1]),
        .D2(1'b0),
        .Q(data_se[14]),
        .R(SR),
        .S(\NLW_data_bit[14].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[15].data_buf 
       (.I(data_se[15]),
        .O(dac_data_p[15]),
        .OB(dac_data_n[15]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[15].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(i_sample[1]),
        .D2(1'b0),
        .Q(data_se[15]),
        .R(SR),
        .S(\NLW_data_bit[15].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[1].data_buf 
       (.I(data_se[1]),
        .O(dac_data_p[1]),
        .OB(dac_data_n[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[1].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[1]),
        .R(SR),
        .S(\NLW_data_bit[1].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[2].data_buf 
       (.I(data_se[2]),
        .O(dac_data_p[2]),
        .OB(dac_data_n[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[2].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[2]),
        .R(SR),
        .S(\NLW_data_bit[2].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[3].data_buf 
       (.I(data_se[3]),
        .O(dac_data_p[3]),
        .OB(dac_data_n[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[3].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[3]),
        .R(SR),
        .S(\NLW_data_bit[3].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[4].data_buf 
       (.I(data_se[4]),
        .O(dac_data_p[4]),
        .OB(dac_data_n[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[4].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[4]),
        .R(SR),
        .S(\NLW_data_bit[4].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[5].data_buf 
       (.I(data_se[5]),
        .O(dac_data_p[5]),
        .OB(dac_data_n[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[5].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[5]),
        .R(SR),
        .S(\NLW_data_bit[5].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[6].data_buf 
       (.I(data_se[6]),
        .O(dac_data_p[6]),
        .OB(dac_data_n[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[6].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[6]),
        .R(SR),
        .S(\NLW_data_bit[6].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[7].data_buf 
       (.I(data_se[7]),
        .O(dac_data_p[7]),
        .OB(dac_data_n[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[7].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[7]),
        .R(SR),
        .S(\NLW_data_bit[7].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[8].data_buf 
       (.I(data_se[8]),
        .O(dac_data_p[8]),
        .OB(dac_data_n[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[8].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[8]),
        .R(SR),
        .S(\NLW_data_bit[8].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS \data_bit[9].data_buf 
       (.I(data_se[9]),
        .O(dac_data_p[9]),
        .OB(dac_data_n[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \data_bit[9].data_oddr 
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b0),
        .Q(data_se[9]),
        .R(SR),
        .S(\NLW_data_bit[9].data_oddr_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  OBUFDS dci_buf
       (.I(dci_se),
        .O(dac_dci_p),
        .OB(dac_dci_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "FALSE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    dci_oddr
       (.C(clk_dac),
        .CE(1'b1),
        .D1(1'b1),
        .D2(1'b0),
        .Q(dci_se),
        .R(SR),
        .S(NLW_dci_oddr_S_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "pulse_burst_32" *) 
module system_frontend_0_0_pulse_burst_32
   (active_reg_0,
    Q,
    running15_out,
    repeat_enable,
    clk_dac,
    out,
    active_reg_1,
    active_reg_2,
    active_reg_3,
    burst_start_dac,
    pulse_ready_dac__1,
    tx_reset,
    running_reg,
    p_29_in,
    source_frame_last,
    source_frame_start,
    SR);
  output active_reg_0;
  output [5:0]Q;
  output running15_out;
  output repeat_enable;
  input clk_dac;
  input [0:0]out;
  input [0:0]active_reg_1;
  input [0:0]active_reg_2;
  input [0:0]active_reg_3;
  input burst_start_dac;
  input pulse_ready_dac__1;
  input tx_reset;
  input running_reg;
  input p_29_in;
  input source_frame_last;
  input source_frame_start;
  input [0:0]SR;

  wire [5:0]Q;
  wire [0:0]SR;
  wire active14_out;
  wire active_i_1_n_0;
  wire active_i_2_n_0;
  wire active_reg_0;
  wire [0:0]active_reg_1;
  wire [0:0]active_reg_2;
  wire [0:0]active_reg_3;
  wire burst_start_dac;
  wire clk_dac;
  wire \frames_sent[5]_i_2_n_0 ;
  wire \frames_sent[5]_i_4_n_0 ;
  wire last_frame_started;
  wire last_frame_started_i_1_n_0;
  wire [0:0]out;
  wire [5:0]p_0_in__0;
  wire p_29_in;
  wire pulse_ready_dac__1;
  wire repeat_enable;
  wire running15_out;
  wire running_reg;
  wire source_frame_last;
  wire source_frame_start;
  wire tx_reset;

  LUT5 #(
    .INIT(32'h00000080)) 
    active_i_1
       (.I0(active_i_2_n_0),
        .I1(out),
        .I2(active_reg_1),
        .I3(active_reg_2),
        .I4(active_reg_3),
        .O(active_i_1_n_0));
  LUT6 #(
    .INIT(64'hFEFFFEFFFFFF0000)) 
    active_i_2
       (.I0(Q[5]),
        .I1(source_frame_start),
        .I2(\frames_sent[5]_i_4_n_0 ),
        .I3(source_frame_last),
        .I4(burst_start_dac),
        .I5(active_reg_0),
        .O(active_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    active_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(active_i_1_n_0),
        .Q(active_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \frames_sent[0]_i_1 
       (.I0(Q[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \frames_sent[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \frames_sent[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \frames_sent[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \frames_sent[4]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[4]),
        .O(p_0_in__0[4]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \frames_sent[5]_i_2 
       (.I0(active_reg_0),
        .I1(source_frame_last),
        .I2(\frames_sent[5]_i_4_n_0 ),
        .I3(source_frame_start),
        .I4(Q[5]),
        .O(\frames_sent[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \frames_sent[5]_i_3 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \frames_sent[5]_i_4 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[4]),
        .O(\frames_sent[5]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[0] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[1] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[2] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[3] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[4] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \frames_sent_reg[5] 
       (.C(clk_dac),
        .CE(\frames_sent[5]_i_2_n_0 ),
        .D(p_0_in__0[5]),
        .Q(Q[5]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000E0EE0000)) 
    last_frame_started_i_1
       (.I0(active14_out),
        .I1(last_frame_started),
        .I2(active_reg_0),
        .I3(burst_start_dac),
        .I4(pulse_ready_dac__1),
        .I5(tx_reset),
        .O(last_frame_started_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    last_frame_started_i_2
       (.I0(Q[5]),
        .I1(source_frame_start),
        .I2(\frames_sent[5]_i_4_n_0 ),
        .O(active14_out));
  FDRE #(
    .INIT(1'b0)) 
    last_frame_started_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(last_frame_started_i_1_n_0),
        .Q(last_frame_started),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0455000000000000)) 
    \width_latched[5]_i_2 
       (.I0(running_reg),
        .I1(\frames_sent[5]_i_4_n_0 ),
        .I2(Q[5]),
        .I3(last_frame_started),
        .I4(active_reg_0),
        .I5(p_29_in),
        .O(running15_out));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2F00)) 
    \width_latched[5]_i_9 
       (.I0(\frames_sent[5]_i_4_n_0 ),
        .I1(Q[5]),
        .I2(last_frame_started),
        .I3(active_reg_0),
        .O(repeat_enable));
endmodule

(* ORIG_REF_NAME = "spi24_master" *) 
module system_frontend_0_0_spi24_master
   (sclk_reg_0,
    adk_spi_csb,
    adk_spi_sda,
    adk_done,
    E,
    \clock_index_reg[4] ,
    busy_reg_0,
    busy_reg_1,
    \state_reg[2] ,
    rst_sys,
    clk_50m,
    adk_start,
    \wait_count_reg[0] ,
    \wait_count_reg[0]_0 ,
    \wait_count_reg[0]_1 ,
    \wait_count_reg[0]_2 ,
    dco_alive,
    Q,
    data6,
    wait_count,
    clock_index,
    \clock_index_reg[6] ,
    clock_config_done_reg,
    clock_config_done,
    D);
  output sclk_reg_0;
  output adk_spi_csb;
  output adk_spi_sda;
  output adk_done;
  output [0:0]E;
  output \clock_index_reg[4] ;
  output busy_reg_0;
  output busy_reg_1;
  output \state_reg[2] ;
  input rst_sys;
  input clk_50m;
  input adk_start;
  input \wait_count_reg[0] ;
  input \wait_count_reg[0]_0 ;
  input \wait_count_reg[0]_1 ;
  input \wait_count_reg[0]_2 ;
  input dco_alive;
  input [3:0]Q;
  input data6;
  input [0:0]wait_count;
  input [3:0]clock_index;
  input \clock_index_reg[6] ;
  input clock_config_done_reg;
  input clock_config_done;
  input [17:0]D;

  wire [17:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire adk_done;
  wire adk_spi_csb;
  wire adk_spi_sda;
  wire adk_start;
  wire [0:0]bit_index;
  wire \bit_index[0]_i_1_n_0 ;
  wire \bit_index[1]_i_1_n_0 ;
  wire \bit_index[2]_i_1_n_0 ;
  wire \bit_index[3]_i_1_n_0 ;
  wire \bit_index[3]_i_2_n_0 ;
  wire \bit_index[4]_i_1_n_0 ;
  wire \bit_index[4]_i_2_n_0 ;
  wire \bit_index[4]_i_3_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire \bit_index_reg_n_0_[3] ;
  wire \bit_index_reg_n_0_[4] ;
  wire busy_i_1_n_0;
  wire busy_reg_0;
  wire busy_reg_1;
  wire busy_reg_n_0;
  wire clk_50m;
  wire clock_config_done;
  wire clock_config_done_reg;
  wire [3:0]clock_index;
  wire \clock_index[3]_i_3_n_0 ;
  wire \clock_index_reg[4] ;
  wire \clock_index_reg[6] ;
  wire cs_n_i_1_n_0;
  wire cs_n_i_2_n_0;
  wire data6;
  wire dco_alive;
  wire [4:0]divider0_out;
  wire \divider[4]_i_1_n_0 ;
  wire [4:0]divider__0;
  wire done_i_1_n_0;
  wire is_read4_out;
  wire rst_sys;
  wire sclk_i_1_n_0;
  wire sclk_i_2_n_0;
  wire sclk_reg_0;
  (* async_reg = "true" *) wire sdio_meta;
  wire sdio_out_i_10_n_0;
  wire sdio_out_i_11_n_0;
  wire sdio_out_i_12_n_0;
  wire sdio_out_i_1_n_0;
  wire sdio_out_i_2_n_0;
  wire sdio_out_i_3_n_0;
  wire sdio_out_i_4_n_0;
  wire sdio_out_i_5_n_0;
  wire sdio_out_i_6_n_0;
  wire sdio_out_i_7_n_0;
  wire sdio_out_i_8_n_0;
  wire sdio_out_i_9_n_0;
  (* async_reg = "true" *) wire sdio_sync;
  wire \state_reg[2] ;
  wire [17:0]tx;
  wire [0:0]wait_count;
  wire \wait_count[31]_i_3_n_0 ;
  wire \wait_count[31]_i_5_n_0 ;
  wire \wait_count_reg[0] ;
  wire \wait_count_reg[0]_0 ;
  wire \wait_count_reg[0]_1 ;
  wire \wait_count_reg[0]_2 ;

  LUT5 #(
    .INIT(32'h00000001)) 
    adk_start_i_1
       (.I0(busy_reg_n_0),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[0]),
        .O(busy_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    \bit_index[0]_i_1 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(adk_start),
        .I2(busy_reg_n_0),
        .O(\bit_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h99F9)) 
    \bit_index[1]_i_1 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(adk_start),
        .I3(busy_reg_n_0),
        .O(\bit_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hA9A9FFA9)) 
    \bit_index[2]_i_1 
       (.I0(\bit_index_reg_n_0_[2] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(adk_start),
        .I4(busy_reg_n_0),
        .O(\bit_index[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4540454000004540)) 
    \bit_index[3]_i_1 
       (.I0(rst_sys),
        .I1(\bit_index[3]_i_2_n_0 ),
        .I2(bit_index),
        .I3(\bit_index_reg_n_0_[3] ),
        .I4(adk_start),
        .I5(busy_reg_n_0),
        .O(\bit_index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \bit_index[3]_i_2 
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .O(\bit_index[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \bit_index[3]_i_3 
       (.I0(busy_reg_n_0),
        .I1(sclk_i_2_n_0),
        .I2(sclk_reg_0),
        .I3(cs_n_i_2_n_0),
        .O(bit_index));
  LUT5 #(
    .INIT(32'h8080FF00)) 
    \bit_index[4]_i_1 
       (.I0(cs_n_i_2_n_0),
        .I1(sclk_reg_0),
        .I2(sclk_i_2_n_0),
        .I3(adk_start),
        .I4(busy_reg_n_0),
        .O(\bit_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE0001FFFFFFFF)) 
    \bit_index[4]_i_2 
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[4] ),
        .I5(\bit_index[4]_i_3_n_0 ),
        .O(\bit_index[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \bit_index[4]_i_3 
       (.I0(busy_reg_n_0),
        .I1(adk_start),
        .O(\bit_index[4]_i_3_n_0 ));
  FDRE \bit_index_reg[0] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1_n_0 ),
        .D(\bit_index[0]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ),
        .R(rst_sys));
  FDRE \bit_index_reg[1] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1_n_0 ),
        .D(\bit_index[1]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ),
        .R(rst_sys));
  FDRE \bit_index_reg[2] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1_n_0 ),
        .D(\bit_index[2]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ),
        .R(rst_sys));
  FDRE \bit_index_reg[3] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\bit_index[3]_i_1_n_0 ),
        .Q(\bit_index_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \bit_index_reg[4] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1_n_0 ),
        .D(\bit_index[4]_i_2_n_0 ),
        .Q(\bit_index_reg_n_0_[4] ),
        .R(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hF7F7FF00)) 
    busy_i_1
       (.I0(sclk_i_2_n_0),
        .I1(sclk_reg_0),
        .I2(cs_n_i_2_n_0),
        .I3(adk_start),
        .I4(busy_reg_n_0),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    clock_config_done_i_1
       (.I0(clock_config_done_reg),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(adk_done),
        .I4(wait_count),
        .I5(clock_config_done),
        .O(\state_reg[2] ));
  LUT6 #(
    .INIT(64'hAAAAAA8AAAAAAAAA)) 
    \clock_index[3]_i_1 
       (.I0(\clock_index[3]_i_3_n_0 ),
        .I1(clock_index[1]),
        .I2(clock_index[3]),
        .I3(clock_index[2]),
        .I4(\clock_index_reg[6] ),
        .I5(clock_index[0]),
        .O(\clock_index_reg[4] ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \clock_index[3]_i_3 
       (.I0(adk_done),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(\clock_index[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF555530005555)) 
    cs_n_i_1
       (.I0(adk_start),
        .I1(cs_n_i_2_n_0),
        .I2(sclk_i_2_n_0),
        .I3(sclk_reg_0),
        .I4(busy_reg_n_0),
        .I5(adk_spi_csb),
        .O(cs_n_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cs_n_i_2
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[4] ),
        .O(cs_n_i_2_n_0));
  FDSE cs_n_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(cs_n_i_1_n_0),
        .Q(adk_spi_csb),
        .S(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0000EFFF)) 
    \divider[0]_i_1 
       (.I0(divider__0[1]),
        .I1(divider__0[2]),
        .I2(divider__0[3]),
        .I3(divider__0[4]),
        .I4(divider__0[0]),
        .O(divider0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \divider[1]_i_1 
       (.I0(divider__0[1]),
        .I1(divider__0[0]),
        .O(divider0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \divider[2]_i_1 
       (.I0(divider__0[2]),
        .I1(divider__0[1]),
        .I2(divider__0[0]),
        .O(divider0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h3CCCCCC4)) 
    \divider[3]_i_1 
       (.I0(divider__0[4]),
        .I1(divider__0[3]),
        .I2(divider__0[2]),
        .I3(divider__0[1]),
        .I4(divider__0[0]),
        .O(divider0_out[3]));
  LUT3 #(
    .INIT(8'hAE)) 
    \divider[4]_i_1 
       (.I0(rst_sys),
        .I1(adk_start),
        .I2(busy_reg_n_0),
        .O(\divider[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA2)) 
    \divider[4]_i_2 
       (.I0(divider__0[4]),
        .I1(divider__0[3]),
        .I2(divider__0[2]),
        .I3(divider__0[1]),
        .I4(divider__0[0]),
        .O(divider0_out[4]));
  FDRE \divider_reg[0] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[0]),
        .Q(divider__0[0]),
        .R(\divider[4]_i_1_n_0 ));
  FDRE \divider_reg[1] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[1]),
        .Q(divider__0[1]),
        .R(\divider[4]_i_1_n_0 ));
  FDRE \divider_reg[2] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[2]),
        .Q(divider__0[2]),
        .R(\divider[4]_i_1_n_0 ));
  FDRE \divider_reg[3] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[3]),
        .Q(divider__0[3]),
        .R(\divider[4]_i_1_n_0 ));
  FDRE \divider_reg[4] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[4]),
        .Q(divider__0[4]),
        .R(\divider[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    done_i_1
       (.I0(cs_n_i_2_n_0),
        .I1(busy_reg_n_0),
        .I2(rst_sys),
        .I3(sclk_i_2_n_0),
        .I4(sclk_reg_0),
        .O(done_i_1_n_0));
  FDRE done_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(adk_done),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0440)) 
    sclk_i_1
       (.I0(rst_sys),
        .I1(busy_reg_n_0),
        .I2(sclk_reg_0),
        .I3(sclk_i_2_n_0),
        .O(sclk_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    sclk_i_2
       (.I0(divider__0[4]),
        .I1(divider__0[3]),
        .I2(divider__0[2]),
        .I3(divider__0[1]),
        .I4(divider__0[0]),
        .O(sclk_i_2_n_0));
  FDRE sclk_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sclk_i_1_n_0),
        .Q(sclk_reg_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE sdio_meta_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(1'b0),
        .Q(sdio_meta),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hAAC0FFFFAAC00000)) 
    sdio_out_i_1
       (.I0(sdio_out_i_2_n_0),
        .I1(sdio_out_i_3_n_0),
        .I2(busy_reg_n_0),
        .I3(sdio_out_i_4_n_0),
        .I4(\bit_index[4]_i_1_n_0 ),
        .I5(adk_spi_sda),
        .O(sdio_out_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000000C0A00)) 
    sdio_out_i_10
       (.I0(tx[0]),
        .I1(tx[1]),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(\bit_index_reg_n_0_[3] ),
        .O(sdio_out_i_10_n_0));
  LUT6 #(
    .INIT(64'hFCAF0CAFFCA00CA0)) 
    sdio_out_i_11
       (.I0(tx[12]),
        .I1(tx[13]),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(tx[14]),
        .I5(tx[15]),
        .O(sdio_out_i_11_n_0));
  LUT6 #(
    .INIT(64'hAACCFFF0AACC00F0)) 
    sdio_out_i_12
       (.I0(tx[6]),
        .I1(tx[4]),
        .I2(tx[7]),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(tx[5]),
        .O(sdio_out_i_12_n_0));
  LUT6 #(
    .INIT(64'h0000000000A08800)) 
    sdio_out_i_2
       (.I0(busy_reg_n_0),
        .I1(tx[16]),
        .I2(tx[17]),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(\bit_index_reg_n_0_[2] ),
        .O(sdio_out_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFEEEEEE)) 
    sdio_out_i_3
       (.I0(sdio_out_i_5_n_0),
        .I1(sdio_out_i_6_n_0),
        .I2(sdio_out_i_7_n_0),
        .I3(sdio_out_i_8_n_0),
        .I4(sdio_out_i_9_n_0),
        .I5(sdio_out_i_10_n_0),
        .O(sdio_out_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    sdio_out_i_4
       (.I0(\bit_index_reg_n_0_[4] ),
        .I1(\bit_index_reg_n_0_[2] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[3] ),
        .O(sdio_out_i_4_n_0));
  LUT6 #(
    .INIT(64'h000C0A0000000000)) 
    sdio_out_i_5
       (.I0(tx[8]),
        .I1(tx[9]),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(\bit_index_reg_n_0_[3] ),
        .O(sdio_out_i_5_n_0));
  LUT6 #(
    .INIT(64'hBBB0000E88800002)) 
    sdio_out_i_6
       (.I0(sdio_out_i_11_n_0),
        .I1(\bit_index_reg_n_0_[3] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[2] ),
        .I5(sdio_out_i_12_n_0),
        .O(sdio_out_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sdio_out_i_7
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .O(sdio_out_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h1E)) 
    sdio_out_i_8
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[2] ),
        .O(sdio_out_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    sdio_out_i_9
       (.I0(tx[10]),
        .I1(tx[11]),
        .I2(\bit_index[3]_i_2_n_0 ),
        .I3(tx[2]),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(tx[3]),
        .O(sdio_out_i_9_n_0));
  FDRE sdio_out_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sdio_out_i_1_n_0),
        .Q(adk_spi_sda),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE sdio_sync_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sdio_meta),
        .Q(sdio_sync),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hCCCCFCCCCCC1CCC1)) 
    \state[3]_i_14 
       (.I0(busy_reg_n_0),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(dco_alive),
        .I5(Q[1]),
        .O(busy_reg_0));
  LUT2 #(
    .INIT(4'h2)) 
    \tx[17]_i_1 
       (.I0(adk_start),
        .I1(busy_reg_n_0),
        .O(is_read4_out));
  FDRE \tx_reg[0] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[0]),
        .Q(tx[0]),
        .R(rst_sys));
  FDRE \tx_reg[10] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[10]),
        .Q(tx[10]),
        .R(rst_sys));
  FDRE \tx_reg[11] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[11]),
        .Q(tx[11]),
        .R(rst_sys));
  FDRE \tx_reg[12] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[12]),
        .Q(tx[12]),
        .R(rst_sys));
  FDRE \tx_reg[13] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[13]),
        .Q(tx[13]),
        .R(rst_sys));
  FDRE \tx_reg[14] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[14]),
        .Q(tx[14]),
        .R(rst_sys));
  FDRE \tx_reg[15] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[15]),
        .Q(tx[15]),
        .R(rst_sys));
  FDRE \tx_reg[16] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[16]),
        .Q(tx[16]),
        .R(rst_sys));
  FDRE \tx_reg[17] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[17]),
        .Q(tx[17]),
        .R(rst_sys));
  FDRE \tx_reg[1] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[1]),
        .Q(tx[1]),
        .R(rst_sys));
  FDRE \tx_reg[2] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[2]),
        .Q(tx[2]),
        .R(rst_sys));
  FDRE \tx_reg[3] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[3]),
        .Q(tx[3]),
        .R(rst_sys));
  FDRE \tx_reg[4] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[4]),
        .Q(tx[4]),
        .R(rst_sys));
  FDRE \tx_reg[5] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[5]),
        .Q(tx[5]),
        .R(rst_sys));
  FDRE \tx_reg[6] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[6]),
        .Q(tx[6]),
        .R(rst_sys));
  FDRE \tx_reg[7] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[7]),
        .Q(tx[7]),
        .R(rst_sys));
  FDRE \tx_reg[8] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[8]),
        .Q(tx[8]),
        .R(rst_sys));
  FDRE \tx_reg[9] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(D[9]),
        .Q(tx[9]),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hFFEAFFEAEAEAFFEA)) 
    \wait_count[31]_i_1 
       (.I0(\wait_count[31]_i_3_n_0 ),
        .I1(\wait_count_reg[0] ),
        .I2(\wait_count_reg[0]_0 ),
        .I3(\wait_count_reg[0]_1 ),
        .I4(\wait_count_reg[0]_2 ),
        .I5(dco_alive),
        .O(E));
  LUT6 #(
    .INIT(64'hAAAAAAAAAABFAAAA)) 
    \wait_count[31]_i_3 
       (.I0(\wait_count[31]_i_5_n_0 ),
        .I1(Q[2]),
        .I2(data6),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\wait_count[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \wait_count[31]_i_5 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(adk_done),
        .I5(wait_count),
        .O(\wait_count[31]_i_5_n_0 ));
endmodule

(* ORIG_REF_NAME = "spi24_master" *) 
module system_frontend_0_0_spi24_master_0
   (sclk_reg_0,
    dac_spi_csb,
    dac_sdio_o,
    D,
    E,
    \state_reg[1] ,
    \read_data_reg[1]_0 ,
    \state_reg[2] ,
    done_reg_0,
    \read_data_reg[1]_1 ,
    busy_reg_0,
    \state_reg[2]_0 ,
    dac_sdio_t,
    dac_config_done_reg,
    rst_sys,
    clk_50m,
    dac_sdio_i,
    dac_start,
    Q,
    \error_code_reg[0] ,
    \error_code_reg[0]_0 ,
    \error_code_reg[1] ,
    \error_code_reg[1]_0 ,
    \error_code_reg[0]_1 ,
    dco_alive,
    \error_code_reg[0]_2 ,
    \error_code_reg[0]_3 ,
    \poll_count_reg[0] ,
    dac_config_done_reg_0,
    \state_reg[1]_0 ,
    \state_reg[1]_1 ,
    \dac_index_reg[0] ,
    \state[3]_i_6_0 ,
    \poll_count_reg[0]_0 ,
    poll_count0,
    \poll_count_reg[11] ,
    data6,
    adk_done,
    \state[3]_i_3_0 ,
    dac_config_done_reg_1,
    dac_config_done_reg_2,
    dac_config_done_reg_3);
  output sclk_reg_0;
  output dac_spi_csb;
  output dac_sdio_o;
  output [2:0]D;
  output [0:0]E;
  output [3:0]\state_reg[1] ;
  output [0:0]\read_data_reg[1]_0 ;
  output [0:0]\state_reg[2] ;
  output done_reg_0;
  output [11:0]\read_data_reg[1]_1 ;
  output busy_reg_0;
  output [0:0]\state_reg[2]_0 ;
  output dac_sdio_t;
  output dac_config_done_reg;
  input rst_sys;
  input clk_50m;
  input dac_sdio_i;
  input dac_start;
  input [5:0]Q;
  input \error_code_reg[0] ;
  input \error_code_reg[0]_0 ;
  input [3:0]\error_code_reg[1] ;
  input \error_code_reg[1]_0 ;
  input \error_code_reg[0]_1 ;
  input dco_alive;
  input \error_code_reg[0]_2 ;
  input \error_code_reg[0]_3 ;
  input \poll_count_reg[0] ;
  input dac_config_done_reg_0;
  input \state_reg[1]_0 ;
  input \state_reg[1]_1 ;
  input \dac_index_reg[0] ;
  input \state[3]_i_6_0 ;
  input [0:0]\poll_count_reg[0]_0 ;
  input [10:0]poll_count0;
  input \poll_count_reg[11] ;
  input data6;
  input adk_done;
  input \state[3]_i_3_0 ;
  input dac_config_done_reg_1;
  input dac_config_done_reg_2;
  input [0:0]dac_config_done_reg_3;

  wire [2:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire adk_done;
  wire [0:0]bit_index;
  wire \bit_index[0]_i_1__0_n_0 ;
  wire \bit_index[1]_i_1__0_n_0 ;
  wire \bit_index[2]_i_1__0_n_0 ;
  wire \bit_index[3]_i_1__0_n_0 ;
  wire \bit_index[3]_i_2__0_n_0 ;
  wire \bit_index[4]_i_1__0_n_0 ;
  wire \bit_index[4]_i_2__0_n_0 ;
  wire \bit_index[4]_i_4_n_0 ;
  wire \bit_index[4]_i_5_n_0 ;
  wire \bit_index_reg_n_0_[0] ;
  wire \bit_index_reg_n_0_[1] ;
  wire \bit_index_reg_n_0_[2] ;
  wire \bit_index_reg_n_0_[3] ;
  wire \bit_index_reg_n_0_[4] ;
  wire busy_i_1__0_n_0;
  wire busy_reg_0;
  wire busy_reg_n_0;
  wire clk_50m;
  wire cs_n_i_1__0_n_0;
  wire cs_n_i_2__0_n_0;
  wire dac_config_done_i_2_n_0;
  wire dac_config_done_reg;
  wire dac_config_done_reg_0;
  wire dac_config_done_reg_1;
  wire dac_config_done_reg_2;
  wire [0:0]dac_config_done_reg_3;
  wire dac_done;
  wire \dac_index[5]_i_8_n_0 ;
  wire \dac_index_reg[0] ;
  wire [7:0]dac_rdata;
  wire dac_sdio_i;
  wire dac_sdio_o;
  wire dac_sdio_t;
  wire dac_spi_csb;
  wire dac_start;
  wire data6;
  wire dco_alive;
  wire [4:0]divider0_out;
  wire \divider[4]_i_1__0_n_0 ;
  wire [4:0]divider__0;
  wire done_i_1__0_n_0;
  wire done_reg_0;
  wire \error_code[3]_i_3_n_0 ;
  wire \error_code_reg[0] ;
  wire \error_code_reg[0]_0 ;
  wire \error_code_reg[0]_1 ;
  wire \error_code_reg[0]_2 ;
  wire \error_code_reg[0]_3 ;
  wire [3:0]\error_code_reg[1] ;
  wire \error_code_reg[1]_0 ;
  wire is_read4_out;
  wire [10:0]poll_count0;
  wire \poll_count[11]_i_13_n_0 ;
  wire \poll_count[11]_i_6_n_0 ;
  wire \poll_count[11]_i_7_n_0 ;
  wire \poll_count[11]_i_9_n_0 ;
  wire \poll_count_reg[0] ;
  wire [0:0]\poll_count_reg[0]_0 ;
  wire \poll_count_reg[11] ;
  wire \read_data[7]_i_1_n_0 ;
  wire [0:0]\read_data_reg[1]_0 ;
  wire [11:0]\read_data_reg[1]_1 ;
  wire rst_sys;
  wire sclk_i_1__0_n_0;
  wire sclk_i_2__0_n_0;
  wire sclk_reg_0;
  (* async_reg = "true" *) wire sdio_meta;
  wire sdio_oe_i_1_n_0;
  wire sdio_oe_i_2_n_0;
  wire sdio_oe_i_3_n_0;
  wire sdio_oe_reg_n_0;
  wire sdio_out_i_10__0_n_0;
  wire sdio_out_i_11__0_n_0;
  wire sdio_out_i_12__0_n_0;
  wire sdio_out_i_1__0_n_0;
  wire sdio_out_i_2__0_n_0;
  wire sdio_out_i_3__0_n_0;
  wire sdio_out_i_4__0_n_0;
  wire sdio_out_i_5__0_n_0;
  wire sdio_out_i_6__0_n_0;
  wire sdio_out_i_7__0_n_0;
  wire sdio_out_i_8__0_n_0;
  wire sdio_out_i_9__0_n_0;
  (* async_reg = "true" *) wire sdio_sync;
  wire state14_out;
  wire state1__11;
  wire state4;
  wire \state[3]_i_3_0 ;
  wire \state[3]_i_3_n_0 ;
  wire \state[3]_i_6_0 ;
  wire \state[3]_i_6_n_0 ;
  wire \state[3]_i_7_n_0 ;
  wire [3:0]\state_reg[1] ;
  wire \state_reg[1]_0 ;
  wire \state_reg[1]_1 ;
  wire [0:0]\state_reg[2] ;
  wire [0:0]\state_reg[2]_0 ;
  wire [23:0]tx;
  wire \tx[0]_i_1_n_0 ;
  wire \tx[10]_i_1_n_0 ;
  wire \tx[11]_i_1_n_0 ;
  wire \tx[12]_i_1_n_0 ;
  wire \tx[13]_i_1_n_0 ;
  wire \tx[14]_i_2_n_0 ;
  wire \tx[1]_i_1_n_0 ;
  wire \tx[23]_i_1_n_0 ;
  wire \tx[2]_i_1_n_0 ;
  wire \tx[3]_i_1_n_0 ;
  wire \tx[4]_i_1_n_0 ;
  wire \tx[5]_i_1_n_0 ;
  wire \tx[6]_i_1_n_0 ;
  wire \tx[7]_i_1_n_0 ;
  wire \tx[8]_i_1_n_0 ;
  wire \tx[9]_i_1_n_0 ;

  LUT3 #(
    .INIT(8'h5D)) 
    \bit_index[0]_i_1__0 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(dac_start),
        .I2(busy_reg_n_0),
        .O(\bit_index[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h99F9)) 
    \bit_index[1]_i_1__0 
       (.I0(\bit_index_reg_n_0_[0] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(dac_start),
        .I3(busy_reg_n_0),
        .O(\bit_index[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hE1E1FFE1)) 
    \bit_index[2]_i_1__0 
       (.I0(\bit_index_reg_n_0_[1] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[2] ),
        .I3(dac_start),
        .I4(busy_reg_n_0),
        .O(\bit_index[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h4540454000004540)) 
    \bit_index[3]_i_1__0 
       (.I0(rst_sys),
        .I1(\bit_index[3]_i_2__0_n_0 ),
        .I2(bit_index),
        .I3(\bit_index_reg_n_0_[3] ),
        .I4(dac_start),
        .I5(busy_reg_n_0),
        .O(\bit_index[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hAAA9)) 
    \bit_index[3]_i_2__0 
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .O(\bit_index[3]_i_2__0_n_0 ));
  LUT3 #(
    .INIT(8'hAE)) 
    \bit_index[4]_i_1__0 
       (.I0(bit_index),
        .I1(dac_start),
        .I2(busy_reg_n_0),
        .O(\bit_index[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE0001FFFFFFFF)) 
    \bit_index[4]_i_2__0 
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[4] ),
        .I5(\bit_index[4]_i_4_n_0 ),
        .O(\bit_index[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \bit_index[4]_i_3__0 
       (.I0(busy_reg_n_0),
        .I1(\bit_index[4]_i_5_n_0 ),
        .I2(cs_n_i_2__0_n_0),
        .I3(divider__0[3]),
        .I4(divider__0[4]),
        .I5(sclk_reg_0),
        .O(bit_index));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \bit_index[4]_i_4 
       (.I0(busy_reg_n_0),
        .I1(dac_start),
        .O(\bit_index[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \bit_index[4]_i_5 
       (.I0(divider__0[0]),
        .I1(divider__0[2]),
        .I2(divider__0[1]),
        .O(\bit_index[4]_i_5_n_0 ));
  FDRE \bit_index_reg[0] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1__0_n_0 ),
        .D(\bit_index[0]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[0] ),
        .R(rst_sys));
  FDRE \bit_index_reg[1] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1__0_n_0 ),
        .D(\bit_index[1]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[1] ),
        .R(rst_sys));
  FDRE \bit_index_reg[2] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1__0_n_0 ),
        .D(\bit_index[2]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[2] ),
        .R(rst_sys));
  FDRE \bit_index_reg[3] 
       (.C(clk_50m),
        .CE(1'b1),
        .D(\bit_index[3]_i_1__0_n_0 ),
        .Q(\bit_index_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \bit_index_reg[4] 
       (.C(clk_50m),
        .CE(\bit_index[4]_i_1__0_n_0 ),
        .D(\bit_index[4]_i_2__0_n_0 ),
        .Q(\bit_index_reg_n_0_[4] ),
        .R(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h7F7FFF00)) 
    busy_i_1__0
       (.I0(cs_n_i_2__0_n_0),
        .I1(sclk_reg_0),
        .I2(sclk_i_2__0_n_0),
        .I3(dac_start),
        .I4(busy_reg_n_0),
        .O(busy_i_1__0_n_0));
  FDRE busy_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(busy_i_1__0_n_0),
        .Q(busy_reg_n_0),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'hFFFF5555C0005555)) 
    cs_n_i_1__0
       (.I0(dac_start),
        .I1(cs_n_i_2__0_n_0),
        .I2(sclk_i_2__0_n_0),
        .I3(sclk_reg_0),
        .I4(busy_reg_n_0),
        .I5(dac_spi_csb),
        .O(cs_n_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    cs_n_i_2__0
       (.I0(\bit_index_reg_n_0_[3] ),
        .I1(\bit_index_reg_n_0_[1] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[4] ),
        .O(cs_n_i_2__0_n_0));
  FDSE cs_n_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(cs_n_i_1__0_n_0),
        .Q(dac_spi_csb),
        .S(rst_sys));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    dac_config_done_i_1
       (.I0(dac_config_done_i_2_n_0),
        .I1(done_reg_0),
        .I2(dac_config_done_reg_0),
        .I3(dac_config_done_reg_1),
        .I4(dac_config_done_reg_2),
        .I5(dac_config_done_reg_3),
        .O(dac_config_done_reg));
  LUT4 #(
    .INIT(16'h88C0)) 
    dac_config_done_i_2
       (.I0(dco_alive),
        .I1(\error_code_reg[1] [0]),
        .I2(dac_done),
        .I3(\error_code_reg[1] [1]),
        .O(dac_config_done_i_2_n_0));
  LUT6 #(
    .INIT(64'h88F8888888888888)) 
    \dac_index[5]_i_1 
       (.I0(dac_config_done_reg_0),
        .I1(done_reg_0),
        .I2(\dac_index_reg[0] ),
        .I3(\error_code_reg[1] [2]),
        .I4(\error_code_reg[1] [0]),
        .I5(dco_alive),
        .O(\state_reg[2] ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \dac_index[5]_i_4 
       (.I0(\error_code_reg[0] ),
        .I1(state1__11),
        .I2(state14_out),
        .I3(dac_done),
        .I4(\error_code_reg[1] [0]),
        .I5(\error_code_reg[1] [2]),
        .O(done_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFD55555515)) 
    \dac_index[5]_i_7 
       (.I0(dac_config_done_reg_0),
        .I1(dac_rdata[0]),
        .I2(dac_rdata[1]),
        .I3(\dac_index[5]_i_8_n_0 ),
        .I4(dac_rdata[6]),
        .I5(\state[3]_i_6_0 ),
        .O(state1__11));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \dac_index[5]_i_8 
       (.I0(dac_rdata[5]),
        .I1(dac_rdata[7]),
        .I2(dac_rdata[3]),
        .I3(dac_rdata[2]),
        .I4(dac_rdata[4]),
        .O(\dac_index[5]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    dac_sdio_iobuf_i_1
       (.I0(sdio_oe_reg_n_0),
        .O(dac_sdio_t));
  LUT5 #(
    .INIT(32'h00010000)) 
    dac_start_i_1
       (.I0(busy_reg_n_0),
        .I1(\error_code_reg[1] [3]),
        .I2(\error_code_reg[1] [1]),
        .I3(\error_code_reg[1] [0]),
        .I4(\error_code_reg[1] [2]),
        .O(busy_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h0000FFF7)) 
    \divider[0]_i_1__0 
       (.I0(divider__0[4]),
        .I1(divider__0[3]),
        .I2(divider__0[2]),
        .I3(divider__0[1]),
        .I4(divider__0[0]),
        .O(divider0_out[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \divider[1]_i_1__0 
       (.I0(divider__0[1]),
        .I1(divider__0[0]),
        .O(divider0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h6C)) 
    \divider[2]_i_1__0 
       (.I0(divider__0[1]),
        .I1(divider__0[2]),
        .I2(divider__0[0]),
        .O(divider0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7E807F80)) 
    \divider[3]_i_1__0 
       (.I0(divider__0[1]),
        .I1(divider__0[2]),
        .I2(divider__0[0]),
        .I3(divider__0[3]),
        .I4(divider__0[4]),
        .O(divider0_out[3]));
  LUT3 #(
    .INIT(8'hAE)) 
    \divider[4]_i_1__0 
       (.I0(rst_sys),
        .I1(dac_start),
        .I2(busy_reg_n_0),
        .O(\divider[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7EFF8000)) 
    \divider[4]_i_2__0 
       (.I0(divider__0[1]),
        .I1(divider__0[2]),
        .I2(divider__0[0]),
        .I3(divider__0[3]),
        .I4(divider__0[4]),
        .O(divider0_out[4]));
  FDRE \divider_reg[0] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[0]),
        .Q(divider__0[0]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \divider_reg[1] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[1]),
        .Q(divider__0[1]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \divider_reg[2] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[2]),
        .Q(divider__0[2]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \divider_reg[3] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[3]),
        .Q(divider__0[3]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \divider_reg[4] 
       (.C(clk_50m),
        .CE(busy_reg_n_0),
        .D(divider0_out[4]),
        .Q(divider__0[4]),
        .R(\divider[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    done_i_1__0
       (.I0(cs_n_i_2__0_n_0),
        .I1(busy_reg_n_0),
        .I2(rst_sys),
        .I3(sclk_i_2__0_n_0),
        .I4(sclk_reg_0),
        .O(done_i_1__0_n_0));
  FDRE done_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(done_i_1__0_n_0),
        .Q(dac_done),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDDDDFDDDDDDDDDDD)) 
    \error_code[0]_i_1 
       (.I0(state14_out),
        .I1(\error_code_reg[0] ),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(\error_code_reg[0]_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000004)) 
    \error_code[1]_i_1 
       (.I0(\error_code_reg[1] [1]),
        .I1(state14_out),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(\error_code_reg[1]_0 ),
        .I5(\error_code_reg[1] [3]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFF55555551)) 
    \error_code[2]_i_1 
       (.I0(\error_code_reg[1] [1]),
        .I1(state14_out),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(\error_code_reg[1]_0 ),
        .I5(\error_code_reg[1] [3]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hEAFFEAEAEAEAEAEA)) 
    \error_code[3]_i_1 
       (.I0(\error_code_reg[0]_1 ),
        .I1(\error_code[3]_i_3_n_0 ),
        .I2(\state[3]_i_6_n_0 ),
        .I3(dco_alive),
        .I4(\error_code_reg[0]_2 ),
        .I5(\error_code_reg[0]_3 ),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \error_code[3]_i_3 
       (.I0(dac_done),
        .I1(\error_code_reg[1] [0]),
        .I2(\error_code_reg[1] [2]),
        .I3(\error_code_reg[1] [1]),
        .O(\error_code[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \poll_count[0]_i_1 
       (.I0(state14_out),
        .I1(\poll_count_reg[0]_0 ),
        .O(\read_data_reg[1]_1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[10]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[9]),
        .O(\read_data_reg[1]_1 [10]));
  LUT6 #(
    .INIT(64'hFF02020200000000)) 
    \poll_count[11]_i_1 
       (.I0(state14_out),
        .I1(\error_code_reg[0] ),
        .I2(\poll_count_reg[0] ),
        .I3(dac_config_done_reg_0),
        .I4(\poll_count[11]_i_6_n_0 ),
        .I5(\poll_count[11]_i_7_n_0 ),
        .O(\read_data_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0000808000FF0000)) 
    \poll_count[11]_i_10 
       (.I0(dac_rdata[2]),
        .I1(dac_rdata[0]),
        .I2(\poll_count[11]_i_13_n_0 ),
        .I3(\dac_index[5]_i_8_n_0 ),
        .I4(dac_rdata[6]),
        .I5(dac_rdata[1]),
        .O(state4));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \poll_count[11]_i_13 
       (.I0(dac_rdata[5]),
        .I1(dac_rdata[4]),
        .I2(dac_rdata[3]),
        .I3(dac_rdata[7]),
        .O(\poll_count[11]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[11]_i_2 
       (.I0(state14_out),
        .I1(poll_count0[10]),
        .O(\read_data_reg[1]_1 [11]));
  LUT6 #(
    .INIT(64'h000000000F00BBAA)) 
    \poll_count[11]_i_3 
       (.I0(\poll_count[11]_i_9_n_0 ),
        .I1(dac_rdata[1]),
        .I2(state4),
        .I3(\error_code_reg[0]_0 ),
        .I4(Q[0]),
        .I5(\poll_count_reg[11] ),
        .O(state14_out));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \poll_count[11]_i_6 
       (.I0(state14_out),
        .I1(state1__11),
        .I2(\error_code_reg[1] [1]),
        .I3(\error_code_reg[1] [3]),
        .O(\poll_count[11]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \poll_count[11]_i_7 
       (.I0(\error_code_reg[1] [2]),
        .I1(\error_code_reg[1] [0]),
        .I2(dac_done),
        .O(\poll_count[11]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \poll_count[11]_i_9 
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[3]),
        .I3(dac_rdata[7]),
        .O(\poll_count[11]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[1]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[0]),
        .O(\read_data_reg[1]_1 [1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[2]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[1]),
        .O(\read_data_reg[1]_1 [2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[3]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[2]),
        .O(\read_data_reg[1]_1 [3]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[4]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[3]),
        .O(\read_data_reg[1]_1 [4]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[5]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[4]),
        .O(\read_data_reg[1]_1 [5]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[6]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[5]),
        .O(\read_data_reg[1]_1 [6]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[7]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[6]),
        .O(\read_data_reg[1]_1 [7]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[8]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[7]),
        .O(\read_data_reg[1]_1 [8]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \poll_count[9]_i_1 
       (.I0(state14_out),
        .I1(poll_count0[8]),
        .O(\read_data_reg[1]_1 [9]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \read_data[7]_i_1 
       (.I0(busy_reg_n_0),
        .I1(sclk_reg_0),
        .I2(\bit_index_reg_n_0_[4] ),
        .I3(\bit_index_reg_n_0_[3] ),
        .I4(tx[23]),
        .I5(sclk_i_2__0_n_0),
        .O(\read_data[7]_i_1_n_0 ));
  FDRE \read_data_reg[0] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(sdio_sync),
        .Q(dac_rdata[0]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[1] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[0]),
        .Q(dac_rdata[1]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[2] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[1]),
        .Q(dac_rdata[2]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[3] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[2]),
        .Q(dac_rdata[3]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[4] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[3]),
        .Q(dac_rdata[4]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[5] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[4]),
        .Q(dac_rdata[5]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[6] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[5]),
        .Q(dac_rdata[6]),
        .R(\divider[4]_i_1__0_n_0 ));
  FDRE \read_data_reg[7] 
       (.C(clk_50m),
        .CE(\read_data[7]_i_1_n_0 ),
        .D(dac_rdata[6]),
        .Q(dac_rdata[7]),
        .R(\divider[4]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h0440)) 
    sclk_i_1__0
       (.I0(rst_sys),
        .I1(busy_reg_n_0),
        .I2(sclk_reg_0),
        .I3(sclk_i_2__0_n_0),
        .O(sclk_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    sclk_i_2__0
       (.I0(divider__0[1]),
        .I1(divider__0[2]),
        .I2(divider__0[0]),
        .I3(divider__0[3]),
        .I4(divider__0[4]),
        .O(sclk_i_2__0_n_0));
  FDRE sclk_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sclk_i_1__0_n_0),
        .Q(sclk_reg_0),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE sdio_meta_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(dac_sdio_i),
        .Q(sdio_meta),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'h22222FFF22222000)) 
    sdio_oe_i_1
       (.I0(dac_start),
        .I1(busy_reg_n_0),
        .I2(sclk_i_2__0_n_0),
        .I3(sdio_oe_i_2_n_0),
        .I4(sdio_oe_i_3_n_0),
        .I5(sdio_oe_reg_n_0),
        .O(sdio_oe_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    sdio_oe_i_2
       (.I0(tx[23]),
        .I1(sclk_reg_0),
        .I2(\bit_index_reg_n_0_[4] ),
        .I3(\bit_index_reg_n_0_[2] ),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(\bit_index_reg_n_0_[1] ),
        .O(sdio_oe_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h80FF)) 
    sdio_oe_i_3
       (.I0(cs_n_i_2__0_n_0),
        .I1(sclk_i_2__0_n_0),
        .I2(sclk_reg_0),
        .I3(busy_reg_n_0),
        .O(sdio_oe_i_3_n_0));
  FDRE sdio_oe_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sdio_oe_i_1_n_0),
        .Q(sdio_oe_reg_n_0),
        .R(rst_sys));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    sdio_out_i_10__0
       (.I0(\bit_index_reg_n_0_[2] ),
        .I1(\bit_index_reg_n_0_[0] ),
        .I2(\bit_index_reg_n_0_[1] ),
        .O(sdio_out_i_10__0_n_0));
  LUT6 #(
    .INIT(64'hAFFCA0FCAF0CA00C)) 
    sdio_out_i_11__0
       (.I0(tx[2]),
        .I1(tx[3]),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(tx[0]),
        .I5(tx[1]),
        .O(sdio_out_i_11__0_n_0));
  LUT6 #(
    .INIT(64'hAFFCA0FCAF0CA00C)) 
    sdio_out_i_12__0
       (.I0(tx[10]),
        .I1(tx[11]),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(tx[8]),
        .I5(tx[9]),
        .O(sdio_out_i_12__0_n_0));
  LUT5 #(
    .INIT(32'hBBAB88A8)) 
    sdio_out_i_1__0
       (.I0(sdio_out_i_2__0_n_0),
        .I1(sdio_out_i_3__0_n_0),
        .I2(dac_start),
        .I3(busy_reg_n_0),
        .I4(dac_sdio_o),
        .O(sdio_out_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hF0F0F1F1FF001111)) 
    sdio_out_i_2__0
       (.I0(Q[5]),
        .I1(sdio_out_i_4__0_n_0),
        .I2(sdio_out_i_5__0_n_0),
        .I3(sdio_out_i_6__0_n_0),
        .I4(busy_reg_n_0),
        .I5(sdio_out_i_7__0_n_0),
        .O(sdio_out_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    sdio_out_i_3__0
       (.I0(\bit_index[4]_i_5_n_0 ),
        .I1(divider__0[3]),
        .I2(busy_reg_n_0),
        .I3(cs_n_i_2__0_n_0),
        .I4(divider__0[4]),
        .I5(sclk_reg_0),
        .O(sdio_out_i_3__0_n_0));
  LUT5 #(
    .INIT(32'hF77FF777)) 
    sdio_out_i_4__0
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[0]),
        .O(sdio_out_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000008)) 
    sdio_out_i_5__0
       (.I0(tx[23]),
        .I1(busy_reg_n_0),
        .I2(\bit_index_reg_n_0_[1] ),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[2] ),
        .O(sdio_out_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hCFCFAFA0CCCCAFA0)) 
    sdio_out_i_6__0
       (.I0(sdio_out_i_8__0_n_0),
        .I1(sdio_out_i_9__0_n_0),
        .I2(sdio_out_i_10__0_n_0),
        .I3(sdio_out_i_11__0_n_0),
        .I4(\bit_index[3]_i_2__0_n_0 ),
        .I5(sdio_out_i_12__0_n_0),
        .O(sdio_out_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    sdio_out_i_7__0
       (.I0(\bit_index_reg_n_0_[4] ),
        .I1(\bit_index_reg_n_0_[2] ),
        .I2(\bit_index_reg_n_0_[0] ),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[3] ),
        .O(sdio_out_i_7__0_n_0));
  LUT6 #(
    .INIT(64'hCCF0AAFFCCF0AA00)) 
    sdio_out_i_8__0
       (.I0(tx[4]),
        .I1(tx[6]),
        .I2(tx[5]),
        .I3(\bit_index_reg_n_0_[0] ),
        .I4(\bit_index_reg_n_0_[1] ),
        .I5(tx[7]),
        .O(sdio_out_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hF0CCAA0000000000)) 
    sdio_out_i_9__0
       (.I0(tx[13]),
        .I1(tx[12]),
        .I2(tx[14]),
        .I3(\bit_index_reg_n_0_[1] ),
        .I4(\bit_index_reg_n_0_[0] ),
        .I5(\bit_index_reg_n_0_[2] ),
        .O(sdio_out_i_9__0_n_0));
  FDRE sdio_out_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sdio_out_i_1__0_n_0),
        .Q(dac_sdio_o),
        .R(rst_sys));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE sdio_sync_reg
       (.C(clk_50m),
        .CE(1'b1),
        .D(sdio_meta),
        .Q(sdio_sync),
        .R(rst_sys));
  LUT6 #(
    .INIT(64'h01011111FF011111)) 
    \state[0]_i_1 
       (.I0(\error_code_reg[1] [0]),
        .I1(\error_code_reg[1] [3]),
        .I2(\error_code_reg[1] [1]),
        .I3(\poll_count[11]_i_6_n_0 ),
        .I4(\error_code_reg[1] [2]),
        .I5(dac_config_done_reg_0),
        .O(\state_reg[1] [0]));
  LUT6 #(
    .INIT(64'hEEAEAAAAAAAAAAAA)) 
    \state[1]_i_1 
       (.I0(\state_reg[1]_0 ),
        .I1(\poll_count[11]_i_6_n_0 ),
        .I2(dac_config_done_reg_0),
        .I3(\state_reg[1]_1 ),
        .I4(\error_code_reg[1] [2]),
        .I5(\error_code_reg[1] [0]),
        .O(\state_reg[1] [1]));
  LUT6 #(
    .INIT(64'h0000000055885F00)) 
    \state[2]_i_1 
       (.I0(\error_code_reg[1] [0]),
        .I1(dco_alive),
        .I2(\state[3]_i_6_n_0 ),
        .I3(\error_code_reg[1] [2]),
        .I4(\error_code_reg[1] [1]),
        .I5(\error_code_reg[1] [3]),
        .O(\state_reg[1] [2]));
  LUT6 #(
    .INIT(64'hBAAAFAEABAAABAAA)) 
    \state[3]_i_1 
       (.I0(\state[3]_i_3_n_0 ),
        .I1(\error_code_reg[1] [2]),
        .I2(\error_code_reg[1] [1]),
        .I3(\error_code_reg[0]_2 ),
        .I4(\error_code_reg[1] [0]),
        .I5(data6),
        .O(\state_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFFF0F2F0FAF0F2F0)) 
    \state[3]_i_2 
       (.I0(\error_code_reg[1] [1]),
        .I1(dco_alive),
        .I2(\error_code_reg[1] [3]),
        .I3(\error_code_reg[1] [0]),
        .I4(\error_code_reg[1] [2]),
        .I5(\state[3]_i_6_n_0 ),
        .O(\state_reg[1] [3]));
  LUT6 #(
    .INIT(64'hAAAAFAEAAAAAAAEA)) 
    \state[3]_i_3 
       (.I0(\state[3]_i_7_n_0 ),
        .I1(adk_done),
        .I2(\error_code_reg[1] [0]),
        .I3(\error_code_reg[1] [2]),
        .I4(\error_code_reg[1] [1]),
        .I5(dac_done),
        .O(\state[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \state[3]_i_6 
       (.I0(\poll_count_reg[0] ),
        .I1(state14_out),
        .I2(state1__11),
        .O(\state[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF01C00100)) 
    \state[3]_i_7 
       (.I0(busy_reg_n_0),
        .I1(\error_code_reg[1] [1]),
        .I2(\error_code_reg[1] [0]),
        .I3(\error_code_reg[1] [2]),
        .I4(dco_alive),
        .I5(\state[3]_i_3_0 ),
        .O(\state[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000427330)) 
    \tx[0]_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[5]),
        .O(\tx[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000037112226)) 
    \tx[10]_i_1 
       (.I0(Q[3]),
        .I1(Q[4]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[5]),
        .O(\tx[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0011001150440440)) 
    \tx[11]_i_1 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(\tx[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0101010203020312)) 
    \tx[12]_i_1 
       (.I0(Q[2]),
        .I1(Q[5]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[4]),
        .O(\tx[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1410141010010004)) 
    \tx[13]_i_1 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\tx[13]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \tx[14]_i_1 
       (.I0(dac_start),
        .I1(busy_reg_n_0),
        .O(is_read4_out));
  LUT6 #(
    .INIT(64'h0100000000000010)) 
    \tx[14]_i_2 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\tx[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0002000200010000)) 
    \tx[1]_i_1 
       (.I0(Q[3]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\tx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0551000000000000)) 
    \tx[23]_i_1 
       (.I0(Q[5]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\tx[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000030008)) 
    \tx[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\tx[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000040)) 
    \tx[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[3]),
        .O(\tx[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0004000000060000)) 
    \tx[4]_i_1 
       (.I0(Q[3]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\tx[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000003000207)) 
    \tx[5]_i_1 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(\tx[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000101F8)) 
    \tx[6]_i_1 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\tx[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00110110)) 
    \tx[7]_i_1 
       (.I0(Q[3]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\tx[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0010010414041014)) 
    \tx[8]_i_1 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[1]),
        .O(\tx[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0014014400050544)) 
    \tx[9]_i_1 
       (.I0(Q[5]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(Q[1]),
        .O(\tx[9]_i_1_n_0 ));
  FDRE \tx_reg[0] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[0]_i_1_n_0 ),
        .Q(tx[0]),
        .R(rst_sys));
  FDRE \tx_reg[10] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[10]_i_1_n_0 ),
        .Q(tx[10]),
        .R(rst_sys));
  FDRE \tx_reg[11] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[11]_i_1_n_0 ),
        .Q(tx[11]),
        .R(rst_sys));
  FDRE \tx_reg[12] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[12]_i_1_n_0 ),
        .Q(tx[12]),
        .R(rst_sys));
  FDRE \tx_reg[13] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[13]_i_1_n_0 ),
        .Q(tx[13]),
        .R(rst_sys));
  FDRE \tx_reg[14] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[14]_i_2_n_0 ),
        .Q(tx[14]),
        .R(rst_sys));
  FDRE \tx_reg[1] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[1]_i_1_n_0 ),
        .Q(tx[1]),
        .R(rst_sys));
  FDRE \tx_reg[23] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[23]_i_1_n_0 ),
        .Q(tx[23]),
        .R(rst_sys));
  FDRE \tx_reg[2] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[2]_i_1_n_0 ),
        .Q(tx[2]),
        .R(rst_sys));
  FDRE \tx_reg[3] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[3]_i_1_n_0 ),
        .Q(tx[3]),
        .R(rst_sys));
  FDRE \tx_reg[4] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[4]_i_1_n_0 ),
        .Q(tx[4]),
        .R(rst_sys));
  FDRE \tx_reg[5] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[5]_i_1_n_0 ),
        .Q(tx[5]),
        .R(rst_sys));
  FDRE \tx_reg[6] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[6]_i_1_n_0 ),
        .Q(tx[6]),
        .R(rst_sys));
  FDRE \tx_reg[7] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[7]_i_1_n_0 ),
        .Q(tx[7]),
        .R(rst_sys));
  FDRE \tx_reg[8] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[8]_i_1_n_0 ),
        .Q(tx[8]),
        .R(rst_sys));
  FDRE \tx_reg[9] 
       (.C(clk_50m),
        .CE(is_read4_out),
        .D(\tx[9]_i_1_n_0 ),
        .Q(tx[9]),
        .R(rst_sys));
endmodule

(* ORIG_REF_NAME = "sync_pulse_engine" *) 
module system_frontend_0_0_sync_pulse_engine
   (source_frame_start,
    source_frame_last,
    tx_reset,
    running_reg_0,
    pulse_ready_dac__1,
    p_29_in,
    i_sample,
    launch_marker0,
    D,
    clk_dac,
    out,
    running15_out,
    \source_sample_reg[14]_0 ,
    \source_sample_reg[14]_1 ,
    \source_sample_reg[12]_0 ,
    \source_sample_reg[12]_1 ,
    repeat_enable);
  output source_frame_start;
  output source_frame_last;
  output tx_reset;
  output running_reg_0;
  output pulse_ready_dac__1;
  output p_29_in;
  output [1:0]i_sample;
  output launch_marker0;
  output [31:0]D;
  input clk_dac;
  input [9:0]out;
  input running15_out;
  input [0:0]\source_sample_reg[14]_0 ;
  input [0:0]\source_sample_reg[14]_1 ;
  input [0:0]\source_sample_reg[12]_0 ;
  input [0:0]\source_sample_reg[12]_1 ;
  input repeat_enable;

  wire [31:0]D;
  wire \_inferred__2/i__carry__0_n_0 ;
  wire \_inferred__2/i__carry__0_n_1 ;
  wire \_inferred__2/i__carry__0_n_2 ;
  wire \_inferred__2/i__carry__0_n_3 ;
  wire \_inferred__2/i__carry__1_n_1 ;
  wire \_inferred__2/i__carry__1_n_2 ;
  wire \_inferred__2/i__carry__1_n_3 ;
  wire \_inferred__2/i__carry_n_0 ;
  wire \_inferred__2/i__carry_n_1 ;
  wire \_inferred__2/i__carry_n_2 ;
  wire \_inferred__2/i__carry_n_3 ;
  wire clk_dac;
  wire [10:0]cycle_index;
  wire \cycle_index[10]_i_1_n_0 ;
  wire \cycle_index[10]_i_4_n_0 ;
  wire \cycle_index[10]_i_5_n_0 ;
  wire \cycle_index[5]_i_2_n_0 ;
  wire \cycle_index[9]_i_2_n_0 ;
  wire \cycle_index_reg_n_0_[0] ;
  wire \cycle_index_reg_n_0_[10] ;
  wire \cycle_index_reg_n_0_[1] ;
  wire \cycle_index_reg_n_0_[2] ;
  wire \cycle_index_reg_n_0_[3] ;
  wire \cycle_index_reg_n_0_[4] ;
  wire \cycle_index_reg_n_0_[5] ;
  wire \cycle_index_reg_n_0_[6] ;
  wire \cycle_index_reg_n_0_[7] ;
  wire \cycle_index_reg_n_0_[8] ;
  wire \cycle_index_reg_n_0_[9] ;
  wire \frame_id[0]_i_2_n_0 ;
  wire [15:0]frame_id_reg;
  wire \frame_id_reg[0]_i_1_n_0 ;
  wire \frame_id_reg[0]_i_1_n_1 ;
  wire \frame_id_reg[0]_i_1_n_2 ;
  wire \frame_id_reg[0]_i_1_n_3 ;
  wire \frame_id_reg[0]_i_1_n_4 ;
  wire \frame_id_reg[0]_i_1_n_5 ;
  wire \frame_id_reg[0]_i_1_n_6 ;
  wire \frame_id_reg[0]_i_1_n_7 ;
  wire \frame_id_reg[12]_i_1_n_1 ;
  wire \frame_id_reg[12]_i_1_n_2 ;
  wire \frame_id_reg[12]_i_1_n_3 ;
  wire \frame_id_reg[12]_i_1_n_4 ;
  wire \frame_id_reg[12]_i_1_n_5 ;
  wire \frame_id_reg[12]_i_1_n_6 ;
  wire \frame_id_reg[12]_i_1_n_7 ;
  wire \frame_id_reg[4]_i_1_n_0 ;
  wire \frame_id_reg[4]_i_1_n_1 ;
  wire \frame_id_reg[4]_i_1_n_2 ;
  wire \frame_id_reg[4]_i_1_n_3 ;
  wire \frame_id_reg[4]_i_1_n_4 ;
  wire \frame_id_reg[4]_i_1_n_5 ;
  wire \frame_id_reg[4]_i_1_n_6 ;
  wire \frame_id_reg[4]_i_1_n_7 ;
  wire \frame_id_reg[8]_i_1_n_0 ;
  wire \frame_id_reg[8]_i_1_n_1 ;
  wire \frame_id_reg[8]_i_1_n_2 ;
  wire \frame_id_reg[8]_i_1_n_3 ;
  wire \frame_id_reg[8]_i_1_n_4 ;
  wire \frame_id_reg[8]_i_1_n_5 ;
  wire \frame_id_reg[8]_i_1_n_6 ;
  wire \frame_id_reg[8]_i_1_n_7 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire [1:0]i_sample;
  wire in_frame;
  wire launch_marker0;
  wire \mode_latched[0]_i_1_n_0 ;
  wire \mode_latched[1]_i_1_n_0 ;
  wire \mode_latched[2]_i_1_n_0 ;
  wire \mode_latched_reg_n_0_[0] ;
  wire \mode_latched_reg_n_0_[1] ;
  wire \mode_latched_reg_n_0_[2] ;
  wire [9:0]out;
  wire [6:1]p_0_in;
  wire p_1_in;
  wire p_29_in;
  wire pn_hold1_out;
  wire pn_hold_i_1_n_0;
  wire pn_hold_i_3_n_0;
  wire pn_hold_reg_n_0;
  wire pn_latched;
  wire pn_latched8_out;
  wire \pn_state[0]_i_1_n_0 ;
  wire \pn_state[1]_i_1_n_0 ;
  wire \pn_state[2]_i_1_n_0 ;
  wire \pn_state[3]_i_1_n_0 ;
  wire \pn_state[4]_i_1_n_0 ;
  wire \pn_state[5]_i_1_n_0 ;
  wire \pn_state[6]_i_1_n_0 ;
  wire \pn_state[6]_i_2_n_0 ;
  wire \pn_state[6]_i_3_n_0 ;
  wire \pn_state[6]_i_4_n_0 ;
  wire \pn_state[6]_i_5_n_0 ;
  wire \pn_state[6]_i_6_n_0 ;
  wire pulse_on;
  wire pulse_ready_dac__1;
  wire repeat_enable;
  wire running0__11;
  wire running15_out;
  wire running16_in;
  wire running_i_1_n_0;
  wire running_reg_0;
  wire source_frame_active;
  wire \source_frame_id[15]_i_1_n_0 ;
  wire source_frame_last;
  wire source_frame_last0;
  wire source_frame_start;
  wire source_frame_start0;
  wire source_frame_start_i_2_n_0;
  wire source_frame_start_i_3_n_0;
  wire \source_index[8]_i_1_n_0 ;
  wire source_marker;
  wire source_marker_i_1_n_0;
  wire source_marker_i_2_n_0;
  wire source_marker_i_3_n_0;
  wire source_owned;
  wire source_owned_i_1_n_0;
  wire [14:12]source_sample;
  wire source_sample3;
  wire source_sample3_carry__0_i_1_n_0;
  wire source_sample3_carry__0_i_2_n_0;
  wire source_sample3_carry__0_i_3_n_0;
  wire source_sample3_carry__0_i_4_n_0;
  wire source_sample3_carry__0_i_5_n_0;
  wire source_sample3_carry__0_i_6_n_0;
  wire source_sample3_carry__0_i_7_n_0;
  wire source_sample3_carry__0_i_8_n_0;
  wire source_sample3_carry__0_n_0;
  wire source_sample3_carry__0_n_1;
  wire source_sample3_carry__0_n_2;
  wire source_sample3_carry__0_n_3;
  wire source_sample3_carry__1_i_1_n_0;
  wire source_sample3_carry__1_i_2_n_0;
  wire source_sample3_carry__1_i_3_n_0;
  wire source_sample3_carry__1_i_4_n_0;
  wire source_sample3_carry__1_i_5_n_0;
  wire source_sample3_carry__1_i_6_n_0;
  wire source_sample3_carry__1_i_7_n_0;
  wire source_sample3_carry__1_i_8_n_0;
  wire source_sample3_carry__1_n_0;
  wire source_sample3_carry__1_n_1;
  wire source_sample3_carry__1_n_2;
  wire source_sample3_carry__1_n_3;
  wire source_sample3_carry__2_i_2_n_0;
  wire source_sample3_carry__2_i_3_n_0;
  wire source_sample3_carry__2_i_4_n_0;
  wire source_sample3_carry__2_i_5_n_0;
  wire source_sample3_carry__2_i_6_n_0;
  wire source_sample3_carry__2_i_7_n_0;
  wire source_sample3_carry__2_i_8_n_0;
  wire source_sample3_carry__2_n_1;
  wire source_sample3_carry__2_n_2;
  wire source_sample3_carry__2_n_3;
  wire source_sample3_carry_i_1_n_0;
  wire source_sample3_carry_i_2_n_0;
  wire source_sample3_carry_i_3_n_0;
  wire source_sample3_carry_i_4_n_0;
  wire source_sample3_carry_i_5_n_0;
  wire source_sample3_carry_i_6_n_0;
  wire source_sample3_carry_i_7_n_0;
  wire source_sample3_carry_n_0;
  wire source_sample3_carry_n_1;
  wire source_sample3_carry_n_2;
  wire source_sample3_carry_n_3;
  wire [31:31]source_sample40_in;
  wire \source_sample[12]_i_1_n_0 ;
  wire \source_sample[14]_i_1_n_0 ;
  wire \source_sample[14]_i_2_n_0 ;
  wire [0:0]\source_sample_reg[12]_0 ;
  wire [0:0]\source_sample_reg[12]_1 ;
  wire [0:0]\source_sample_reg[14]_0 ;
  wire [0:0]\source_sample_reg[14]_1 ;
  wire source_tx_active;
  wire source_tx_active_i_1_n_0;
  wire tx_reset;
  wire [5:0]width_latched;
  wire \width_latched[5]_i_10_n_0 ;
  wire \width_latched[5]_i_11_n_0 ;
  wire \width_latched[5]_i_12_n_0 ;
  wire \width_latched[5]_i_13_n_0 ;
  wire \width_latched[5]_i_3_n_0 ;
  wire \width_latched[5]_i_4_n_0 ;
  wire \width_latched[5]_i_8_n_0 ;
  wire [3:0]\NLW__inferred__2/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__2/i__carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW__inferred__2/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__2/i__carry__1_O_UNCONNECTED ;
  wire [3:3]\NLW_frame_id_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_source_sample3_carry_O_UNCONNECTED;
  wire [3:0]NLW_source_sample3_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_source_sample3_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_source_sample3_carry__2_O_UNCONNECTED;

  CARRY4 \_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__2/i__carry_n_0 ,\_inferred__2/i__carry_n_1 ,\_inferred__2/i__carry_n_2 ,\_inferred__2/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({\cycle_index_reg_n_0_[3] ,\cycle_index_reg_n_0_[2] ,\cycle_index_reg_n_0_[1] ,\cycle_index_reg_n_0_[0] }),
        .O(\NLW__inferred__2/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \_inferred__2/i__carry__0 
       (.CI(\_inferred__2/i__carry_n_0 ),
        .CO({\_inferred__2/i__carry__0_n_0 ,\_inferred__2/i__carry__0_n_1 ,\_inferred__2/i__carry__0_n_2 ,\_inferred__2/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\cycle_index_reg_n_0_[7] ,\cycle_index_reg_n_0_[6] ,\cycle_index_reg_n_0_[5] ,\cycle_index_reg_n_0_[4] }),
        .O(\NLW__inferred__2/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  CARRY4 \_inferred__2/i__carry__1 
       (.CI(\_inferred__2/i__carry__0_n_0 ),
        .CO({\NLW__inferred__2/i__carry__1_CO_UNCONNECTED [3],\_inferred__2/i__carry__1_n_1 ,\_inferred__2/i__carry__1_n_2 ,\_inferred__2/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\cycle_index_reg_n_0_[10] ,\cycle_index_reg_n_0_[9] ,\cycle_index_reg_n_0_[8] }),
        .O(\NLW__inferred__2/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cycle_index[0]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[0] ),
        .O(cycle_index[0]));
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    \cycle_index[10]_i_1 
       (.I0(running16_in),
        .I1(\source_sample_reg[14]_0 ),
        .I2(\source_sample_reg[14]_1 ),
        .I3(\source_sample_reg[12]_1 ),
        .I4(\source_sample_reg[12]_0 ),
        .O(\cycle_index[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \cycle_index[10]_i_2 
       (.I0(\cycle_index_reg_n_0_[8] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index[10]_i_4_n_0 ),
        .I3(\cycle_index[10]_i_5_n_0 ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(cycle_index[10]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \cycle_index[10]_i_3 
       (.I0(running15_out),
        .I1(running_reg_0),
        .I2(running0__11),
        .O(running16_in));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \cycle_index[10]_i_4 
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index[9]_i_2_n_0 ),
        .O(\cycle_index[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFFFFFF)) 
    \cycle_index[10]_i_5 
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(\cycle_index_reg_n_0_[5] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .I5(\width_latched[5]_i_3_n_0 ),
        .O(\cycle_index[10]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \cycle_index[1]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[0] ),
        .I2(\cycle_index_reg_n_0_[1] ),
        .O(cycle_index[1]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \cycle_index[2]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[1] ),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(\cycle_index_reg_n_0_[2] ),
        .O(cycle_index[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \cycle_index[3]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[2] ),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(\cycle_index_reg_n_0_[1] ),
        .I4(\cycle_index_reg_n_0_[3] ),
        .O(cycle_index[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \cycle_index[4]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[3] ),
        .I2(\cycle_index_reg_n_0_[1] ),
        .I3(\cycle_index_reg_n_0_[0] ),
        .I4(\cycle_index_reg_n_0_[2] ),
        .I5(\cycle_index_reg_n_0_[4] ),
        .O(cycle_index[4]));
  LUT6 #(
    .INIT(64'hAA2AAAAA00800000)) 
    \cycle_index[5]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index_reg_n_0_[4] ),
        .I2(\cycle_index_reg_n_0_[2] ),
        .I3(\cycle_index[5]_i_2_n_0 ),
        .I4(\cycle_index_reg_n_0_[3] ),
        .I5(\cycle_index_reg_n_0_[5] ),
        .O(cycle_index[5]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \cycle_index[5]_i_2 
       (.I0(\cycle_index_reg_n_0_[0] ),
        .I1(\cycle_index_reg_n_0_[1] ),
        .O(\cycle_index[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \cycle_index[6]_i_1 
       (.I0(\cycle_index[9]_i_2_n_0 ),
        .I1(\cycle_index[10]_i_5_n_0 ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .O(cycle_index[6]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h8A20)) 
    \cycle_index[7]_i_1 
       (.I0(\cycle_index[10]_i_5_n_0 ),
        .I1(\cycle_index[9]_i_2_n_0 ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .I3(\cycle_index_reg_n_0_[7] ),
        .O(cycle_index[7]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'hF7000800)) 
    \cycle_index[8]_i_1 
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index[9]_i_2_n_0 ),
        .I3(\cycle_index[10]_i_5_n_0 ),
        .I4(\cycle_index_reg_n_0_[8] ),
        .O(cycle_index[8]));
  LUT6 #(
    .INIT(64'hBFFF000040000000)) 
    \cycle_index[9]_i_1 
       (.I0(\cycle_index[9]_i_2_n_0 ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[7] ),
        .I3(\cycle_index_reg_n_0_[8] ),
        .I4(\cycle_index[10]_i_5_n_0 ),
        .I5(\cycle_index_reg_n_0_[9] ),
        .O(cycle_index[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \cycle_index[9]_i_2 
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(\cycle_index_reg_n_0_[2] ),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(\cycle_index_reg_n_0_[1] ),
        .I4(\cycle_index_reg_n_0_[3] ),
        .I5(\cycle_index_reg_n_0_[5] ),
        .O(\cycle_index[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[0] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[0]),
        .Q(\cycle_index_reg_n_0_[0] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[10] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[10]),
        .Q(\cycle_index_reg_n_0_[10] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[1] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[1]),
        .Q(\cycle_index_reg_n_0_[1] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[2] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[2]),
        .Q(\cycle_index_reg_n_0_[2] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[3] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[3]),
        .Q(\cycle_index_reg_n_0_[3] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[4] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[4]),
        .Q(\cycle_index_reg_n_0_[4] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[5] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[5]),
        .Q(\cycle_index_reg_n_0_[5] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[6] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[6]),
        .Q(\cycle_index_reg_n_0_[6] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[7] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[7]),
        .Q(\cycle_index_reg_n_0_[7] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[8] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[8]),
        .Q(\cycle_index_reg_n_0_[8] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_index_reg[9] 
       (.C(clk_dac),
        .CE(running_reg_0),
        .D(cycle_index[9]),
        .Q(\cycle_index_reg_n_0_[9] ),
        .R(\cycle_index[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \data_bit[0].data_oddr_i_1 
       (.I0(\source_sample_reg[12]_0 ),
        .I1(\source_sample_reg[12]_1 ),
        .O(tx_reset));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hFD00)) 
    \data_bit[12].data_oddr_i_1 
       (.I0(out[7]),
        .I1(out[8]),
        .I2(out[6]),
        .I3(source_sample[12]),
        .O(i_sample[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hFD00)) 
    \data_bit[13].data_oddr_i_1 
       (.I0(out[7]),
        .I1(out[8]),
        .I2(out[6]),
        .I3(source_sample[14]),
        .O(i_sample[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \frame_id[0]_i_2 
       (.I0(frame_id_reg[0]),
        .O(\frame_id[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[0] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[0]_i_1_n_7 ),
        .Q(frame_id_reg[0]),
        .R(tx_reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \frame_id_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\frame_id_reg[0]_i_1_n_0 ,\frame_id_reg[0]_i_1_n_1 ,\frame_id_reg[0]_i_1_n_2 ,\frame_id_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\frame_id_reg[0]_i_1_n_4 ,\frame_id_reg[0]_i_1_n_5 ,\frame_id_reg[0]_i_1_n_6 ,\frame_id_reg[0]_i_1_n_7 }),
        .S({frame_id_reg[3:1],\frame_id[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[10] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[8]_i_1_n_5 ),
        .Q(frame_id_reg[10]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[11] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[8]_i_1_n_4 ),
        .Q(frame_id_reg[11]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[12] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[12]_i_1_n_7 ),
        .Q(frame_id_reg[12]),
        .R(tx_reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \frame_id_reg[12]_i_1 
       (.CI(\frame_id_reg[8]_i_1_n_0 ),
        .CO({\NLW_frame_id_reg[12]_i_1_CO_UNCONNECTED [3],\frame_id_reg[12]_i_1_n_1 ,\frame_id_reg[12]_i_1_n_2 ,\frame_id_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_id_reg[12]_i_1_n_4 ,\frame_id_reg[12]_i_1_n_5 ,\frame_id_reg[12]_i_1_n_6 ,\frame_id_reg[12]_i_1_n_7 }),
        .S(frame_id_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[13] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[12]_i_1_n_6 ),
        .Q(frame_id_reg[13]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[14] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[12]_i_1_n_5 ),
        .Q(frame_id_reg[14]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[15] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[12]_i_1_n_4 ),
        .Q(frame_id_reg[15]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[1] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[0]_i_1_n_6 ),
        .Q(frame_id_reg[1]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[2] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[0]_i_1_n_5 ),
        .Q(frame_id_reg[2]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[3] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[0]_i_1_n_4 ),
        .Q(frame_id_reg[3]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[4] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[4]_i_1_n_7 ),
        .Q(frame_id_reg[4]),
        .R(tx_reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \frame_id_reg[4]_i_1 
       (.CI(\frame_id_reg[0]_i_1_n_0 ),
        .CO({\frame_id_reg[4]_i_1_n_0 ,\frame_id_reg[4]_i_1_n_1 ,\frame_id_reg[4]_i_1_n_2 ,\frame_id_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_id_reg[4]_i_1_n_4 ,\frame_id_reg[4]_i_1_n_5 ,\frame_id_reg[4]_i_1_n_6 ,\frame_id_reg[4]_i_1_n_7 }),
        .S(frame_id_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[5] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[4]_i_1_n_6 ),
        .Q(frame_id_reg[5]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[6] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[4]_i_1_n_5 ),
        .Q(frame_id_reg[6]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[7] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[4]_i_1_n_4 ),
        .Q(frame_id_reg[7]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[8] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[8]_i_1_n_7 ),
        .Q(frame_id_reg[8]),
        .R(tx_reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \frame_id_reg[8]_i_1 
       (.CI(\frame_id_reg[4]_i_1_n_0 ),
        .CO({\frame_id_reg[8]_i_1_n_0 ,\frame_id_reg[8]_i_1_n_1 ,\frame_id_reg[8]_i_1_n_2 ,\frame_id_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_id_reg[8]_i_1_n_4 ,\frame_id_reg[8]_i_1_n_5 ,\frame_id_reg[8]_i_1_n_6 ,\frame_id_reg[8]_i_1_n_7 }),
        .S(frame_id_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \frame_id_reg[9] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\frame_id_reg[8]_i_1_n_6 ),
        .Q(frame_id_reg[9]),
        .R(tx_reset));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(\cycle_index_reg_n_0_[7] ),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2
       (.I0(\cycle_index_reg_n_0_[6] ),
        .I1(pn_latched),
        .O(i__carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    i__carry__0_i_3
       (.I0(\cycle_index_reg_n_0_[5] ),
        .I1(pn_latched),
        .I2(width_latched[5]),
        .O(i__carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    i__carry__0_i_4
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(pn_latched),
        .I2(width_latched[4]),
        .O(i__carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(\cycle_index_reg_n_0_[10] ),
        .O(i__carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_2
       (.I0(\cycle_index_reg_n_0_[9] ),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_3
       (.I0(\cycle_index_reg_n_0_[8] ),
        .I1(pn_latched),
        .O(i__carry__1_i_3_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    i__carry_i_1
       (.I0(\cycle_index_reg_n_0_[3] ),
        .I1(pn_latched),
        .I2(width_latched[3]),
        .O(i__carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    i__carry_i_2
       (.I0(\cycle_index_reg_n_0_[2] ),
        .I1(pn_latched),
        .I2(width_latched[2]),
        .O(i__carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hA9)) 
    i__carry_i_3
       (.I0(\cycle_index_reg_n_0_[1] ),
        .I1(pn_latched),
        .I2(width_latched[1]),
        .O(i__carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h59)) 
    i__carry_i_4
       (.I0(\cycle_index_reg_n_0_[0] ),
        .I1(width_latched[0]),
        .I2(pn_latched),
        .O(i__carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    launch_marker_i_1
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(source_owned),
        .I3(source_marker),
        .O(launch_marker0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \launch_meta[10]_i_1 
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(source_owned),
        .I3(source_frame_start),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \launch_meta[11]_i_1 
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(source_owned),
        .I3(source_frame_last),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \launch_meta[12]_i_1 
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(source_owned),
        .I3(source_tx_active),
        .O(D[12]));
  LUT4 #(
    .INIT(16'h8000)) 
    \launch_meta[9]_i_1 
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(source_owned),
        .I3(source_frame_active),
        .O(D[9]));
  LUT3 #(
    .INIT(8'hF4)) 
    \mode_latched[0]_i_1 
       (.I0(out[8]),
        .I1(out[7]),
        .I2(out[6]),
        .O(\mode_latched[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \mode_latched[1]_i_1 
       (.I0(out[6]),
        .I1(out[8]),
        .I2(out[7]),
        .O(\mode_latched[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \mode_latched[2]_i_1 
       (.I0(out[6]),
        .I1(out[7]),
        .I2(out[8]),
        .O(\mode_latched[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \mode_latched_reg[0] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\mode_latched[0]_i_1_n_0 ),
        .Q(\mode_latched_reg_n_0_[0] ),
        .S(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \mode_latched_reg[1] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\mode_latched[1]_i_1_n_0 ),
        .Q(\mode_latched_reg_n_0_[1] ),
        .R(tx_reset));
  FDSE #(
    .INIT(1'b1)) 
    \mode_latched_reg[2] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(\mode_latched[2]_i_1_n_0 ),
        .Q(\mode_latched_reg_n_0_[2] ),
        .S(tx_reset));
  LUT6 #(
    .INIT(64'hAAAABFFFAAAA8000)) 
    pn_hold_i_1
       (.I0(pn_hold1_out),
        .I1(pulse_on),
        .I2(\pn_state[6]_i_3_n_0 ),
        .I3(pulse_ready_dac__1),
        .I4(pn_hold_i_3_n_0),
        .I5(pn_hold_reg_n_0),
        .O(pn_hold_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010001000100000)) 
    pn_hold_i_2
       (.I0(\source_sample_reg[12]_0 ),
        .I1(\source_sample_reg[12]_1 ),
        .I2(running_reg_0),
        .I3(pn_hold_reg_n_0),
        .I4(running0__11),
        .I5(\cycle_index[10]_i_5_n_0 ),
        .O(pn_hold1_out));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAA0020)) 
    pn_hold_i_3
       (.I0(pulse_ready_dac__1),
        .I1(running0__11),
        .I2(running_reg_0),
        .I3(\cycle_index[10]_i_5_n_0 ),
        .I4(running15_out),
        .I5(tx_reset),
        .O(pn_hold_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pn_hold_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(pn_hold_i_1_n_0),
        .Q(pn_hold_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    pn_latched_reg
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[9]),
        .Q(pn_latched),
        .R(tx_reset));
  LUT6 #(
    .INIT(64'hBEAAFFFFBEAA0000)) 
    \pn_state[0]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[6]),
        .I2(p_1_in),
        .I3(running_reg_0),
        .I4(\pn_state[6]_i_1_n_0 ),
        .I5(p_0_in[1]),
        .O(\pn_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[1]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[1]),
        .I2(running_reg_0),
        .O(\pn_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[2]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[2]),
        .I2(running_reg_0),
        .O(\pn_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[3]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[3]),
        .I2(running_reg_0),
        .O(\pn_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[4]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[4]),
        .I2(running_reg_0),
        .O(\pn_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[5]_i_1 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[5]),
        .I2(running_reg_0),
        .O(\pn_state[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF80FF00FF00)) 
    \pn_state[6]_i_1 
       (.I0(pulse_on),
        .I1(pn_hold_reg_n_0),
        .I2(\pn_state[6]_i_3_n_0 ),
        .I3(tx_reset),
        .I4(\pn_state[6]_i_4_n_0 ),
        .I5(pulse_ready_dac__1),
        .O(\pn_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \pn_state[6]_i_2 
       (.I0(\pn_state[6]_i_5_n_0 ),
        .I1(p_0_in[6]),
        .I2(running_reg_0),
        .O(\pn_state[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pn_state[6]_i_3 
       (.I0(pn_latched),
        .I1(running_reg_0),
        .O(\pn_state[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h33000100FF000000)) 
    \pn_state[6]_i_4 
       (.I0(\width_latched[5]_i_8_n_0 ),
        .I1(\cycle_index[10]_i_5_n_0 ),
        .I2(\pn_state[6]_i_6_n_0 ),
        .I3(p_29_in),
        .I4(repeat_enable),
        .I5(running_reg_0),
        .O(\pn_state[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAABA)) 
    \pn_state[6]_i_5 
       (.I0(running15_out),
        .I1(\cycle_index[10]_i_5_n_0 ),
        .I2(running_reg_0),
        .I3(running0__11),
        .I4(\source_sample_reg[12]_1 ),
        .I5(\source_sample_reg[12]_0 ),
        .O(\pn_state[6]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \pn_state[6]_i_6 
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(\cycle_index_reg_n_0_[5] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\width_latched[5]_i_3_n_0 ),
        .O(\pn_state[6]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \pn_state_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\pn_state[0]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[1] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[1]_i_1_n_0 ),
        .Q(p_0_in[2]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[2] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[2]_i_1_n_0 ),
        .Q(p_0_in[3]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[3] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[3]_i_1_n_0 ),
        .Q(p_0_in[4]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[4] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[4]_i_1_n_0 ),
        .Q(p_0_in[5]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[5] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[5]_i_1_n_0 ),
        .Q(p_0_in[6]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \pn_state_reg[6] 
       (.C(clk_dac),
        .CE(\pn_state[6]_i_1_n_0 ),
        .D(\pn_state[6]_i_2_n_0 ),
        .Q(p_1_in),
        .S(1'b0));
  LUT6 #(
    .INIT(64'h00000000F4000000)) 
    running_i_1
       (.I0(running0__11),
        .I1(running_reg_0),
        .I2(running15_out),
        .I3(\source_sample_reg[14]_0 ),
        .I4(\source_sample_reg[14]_1 ),
        .I5(tx_reset),
        .O(running_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    running_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(running_i_1_n_0),
        .Q(running_reg_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    source_frame_active_i_1
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .O(in_frame));
  FDRE #(
    .INIT(1'b0)) 
    source_frame_active_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(in_frame),
        .Q(source_frame_active),
        .R(source_tx_active_i_1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    \source_frame_id[15]_i_1 
       (.I0(\source_sample_reg[14]_1 ),
        .I1(\source_sample_reg[14]_0 ),
        .I2(running_reg_0),
        .O(\source_frame_id[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[0] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[0]),
        .Q(D[16]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[10] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[10]),
        .Q(D[26]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[11] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[11]),
        .Q(D[27]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[12] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[12]),
        .Q(D[28]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[13] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[13]),
        .Q(D[29]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[14] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[14]),
        .Q(D[30]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[15] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[15]),
        .Q(D[31]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[1] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[1]),
        .Q(D[17]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[2] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[2]),
        .Q(D[18]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[3] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[3]),
        .Q(D[19]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[4] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[4]),
        .Q(D[20]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[5] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[5]),
        .Q(D[21]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[6] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[6]),
        .Q(D[22]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[7] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[7]),
        .Q(D[23]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[8] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[8]),
        .Q(D[24]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_frame_id_reg[9] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(frame_id_reg[9]),
        .Q(D[25]),
        .R(tx_reset));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    source_frame_last_i_1
       (.I0(\cycle_index_reg_n_0_[9] ),
        .I1(\cycle_index_reg_n_0_[10] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[5] ),
        .I4(\cycle_index_reg_n_0_[4] ),
        .I5(\width_latched[5]_i_3_n_0 ),
        .O(source_frame_last0));
  FDRE #(
    .INIT(1'b0)) 
    source_frame_last_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_last0),
        .Q(source_frame_last),
        .R(source_tx_active_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    source_frame_start_i_1
       (.I0(source_frame_start_i_2_n_0),
        .I1(\cycle_index_reg_n_0_[5] ),
        .I2(\cycle_index_reg_n_0_[4] ),
        .I3(\cycle_index_reg_n_0_[10] ),
        .I4(\cycle_index_reg_n_0_[9] ),
        .I5(source_frame_start_i_3_n_0),
        .O(source_frame_start0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    source_frame_start_i_2
       (.I0(\cycle_index_reg_n_0_[1] ),
        .I1(\cycle_index_reg_n_0_[0] ),
        .I2(\cycle_index_reg_n_0_[3] ),
        .I3(\cycle_index_reg_n_0_[2] ),
        .O(source_frame_start_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    source_frame_start_i_3
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .O(source_frame_start_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    source_frame_start_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_frame_start0),
        .Q(source_frame_start),
        .R(source_tx_active_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFDFFF)) 
    \source_index[8]_i_1 
       (.I0(running_reg_0),
        .I1(tx_reset),
        .I2(\source_sample_reg[14]_1 ),
        .I3(\source_sample_reg[14]_0 ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .I5(\cycle_index_reg_n_0_[9] ),
        .O(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[0] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[0] ),
        .Q(D[0]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[1] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[1] ),
        .Q(D[1]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[2] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[2] ),
        .Q(D[2]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[3] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[3] ),
        .Q(D[3]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[4] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[4] ),
        .Q(D[4]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[5] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[5] ),
        .Q(D[5]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[6] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[6] ),
        .Q(D[6]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[7] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[7] ),
        .Q(D[7]),
        .R(\source_index[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_index_reg[8] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\cycle_index_reg_n_0_[8] ),
        .Q(D[8]),
        .R(\source_index[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    source_marker_i_1
       (.I0(\cycle_index_reg_n_0_[2] ),
        .I1(\cycle_index_reg_n_0_[1] ),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(source_marker_i_2_n_0),
        .I4(pulse_on),
        .O(source_marker_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    source_marker_i_2
       (.I0(source_marker_i_3_n_0),
        .I1(\cycle_index_reg_n_0_[7] ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .I3(\width_latched[5]_i_8_n_0 ),
        .I4(\cycle_index_reg_n_0_[3] ),
        .I5(\cycle_index_reg_n_0_[8] ),
        .O(source_marker_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    source_marker_i_3
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(\cycle_index_reg_n_0_[5] ),
        .O(source_marker_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    source_marker_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_marker_i_1_n_0),
        .Q(source_marker),
        .R(source_tx_active_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \source_mode_reg[0] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(\mode_latched_reg_n_0_[0] ),
        .Q(D[13]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_mode_reg[1] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(\mode_latched_reg_n_0_[1] ),
        .Q(D[14]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \source_mode_reg[2] 
       (.C(clk_dac),
        .CE(\source_frame_id[15]_i_1_n_0 ),
        .D(\mode_latched_reg_n_0_[2] ),
        .Q(D[15]),
        .R(tx_reset));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    source_owned_i_1
       (.I0(running_reg_0),
        .I1(\source_sample_reg[12]_0 ),
        .I2(\source_sample_reg[12]_1 ),
        .I3(\source_sample_reg[14]_1 ),
        .I4(\source_sample_reg[14]_0 ),
        .O(source_owned_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    source_owned_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(source_owned_i_1_n_0),
        .Q(source_owned),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 source_sample3_carry
       (.CI(1'b0),
        .CO({source_sample3_carry_n_0,source_sample3_carry_n_1,source_sample3_carry_n_2,source_sample3_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b1,source_sample3_carry_i_1_n_0,source_sample3_carry_i_2_n_0,source_sample3_carry_i_3_n_0}),
        .O(NLW_source_sample3_carry_O_UNCONNECTED[3:0]),
        .S({source_sample3_carry_i_4_n_0,source_sample3_carry_i_5_n_0,source_sample3_carry_i_6_n_0,source_sample3_carry_i_7_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 source_sample3_carry__0
       (.CI(source_sample3_carry_n_0),
        .CO({source_sample3_carry__0_n_0,source_sample3_carry__0_n_1,source_sample3_carry__0_n_2,source_sample3_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({source_sample3_carry__0_i_1_n_0,source_sample3_carry__0_i_2_n_0,source_sample3_carry__0_i_3_n_0,source_sample3_carry__0_i_4_n_0}),
        .O(NLW_source_sample3_carry__0_O_UNCONNECTED[3:0]),
        .S({source_sample3_carry__0_i_5_n_0,source_sample3_carry__0_i_6_n_0,source_sample3_carry__0_i_7_n_0,source_sample3_carry__0_i_8_n_0}));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__0_i_1
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__0_i_2
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    source_sample3_carry__0_i_3
       (.I0(\cycle_index_reg_n_0_[9] ),
        .I1(\cycle_index_reg_n_0_[7] ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .I3(\cycle_index_reg_n_0_[8] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFA9)) 
    source_sample3_carry__0_i_4
       (.I0(\cycle_index_reg_n_0_[8] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[7] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .O(source_sample3_carry__0_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__0_i_5
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__0_i_5_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__0_i_6
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__0_i_6_n_0));
  LUT5 #(
    .INIT(32'h55555556)) 
    source_sample3_carry__0_i_7
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[8] ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .I3(\cycle_index_reg_n_0_[7] ),
        .I4(\cycle_index_reg_n_0_[9] ),
        .O(source_sample3_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h0154)) 
    source_sample3_carry__0_i_8
       (.I0(\cycle_index_reg_n_0_[9] ),
        .I1(\cycle_index_reg_n_0_[7] ),
        .I2(\cycle_index_reg_n_0_[6] ),
        .I3(\cycle_index_reg_n_0_[8] ),
        .O(source_sample3_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 source_sample3_carry__1
       (.CI(source_sample3_carry__0_n_0),
        .CO({source_sample3_carry__1_n_0,source_sample3_carry__1_n_1,source_sample3_carry__1_n_2,source_sample3_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({source_sample3_carry__1_i_1_n_0,source_sample3_carry__1_i_2_n_0,source_sample3_carry__1_i_3_n_0,source_sample3_carry__1_i_4_n_0}),
        .O(NLW_source_sample3_carry__1_O_UNCONNECTED[3:0]),
        .S({source_sample3_carry__1_i_5_n_0,source_sample3_carry__1_i_6_n_0,source_sample3_carry__1_i_7_n_0,source_sample3_carry__1_i_8_n_0}));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__1_i_1
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__1_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__1_i_2
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__1_i_3
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__1_i_4
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__1_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__1_i_5
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__1_i_5_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__1_i_6
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__1_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__1_i_7
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__1_i_7_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__1_i_8
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 source_sample3_carry__2
       (.CI(source_sample3_carry__1_n_0),
        .CO({source_sample3,source_sample3_carry__2_n_1,source_sample3_carry__2_n_2,source_sample3_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({source_sample40_in,source_sample3_carry__2_i_2_n_0,source_sample3_carry__2_i_3_n_0,source_sample3_carry__2_i_4_n_0}),
        .O(NLW_source_sample3_carry__2_O_UNCONNECTED[3:0]),
        .S({source_sample3_carry__2_i_5_n_0,source_sample3_carry__2_i_6_n_0,source_sample3_carry__2_i_7_n_0,source_sample3_carry__2_i_8_n_0}));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__2_i_1
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample40_in));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__2_i_2
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__2_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__2_i_3
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__2_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    source_sample3_carry__2_i_4
       (.I0(\cycle_index_reg_n_0_[7] ),
        .I1(\cycle_index_reg_n_0_[6] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[9] ),
        .I4(\cycle_index_reg_n_0_[10] ),
        .O(source_sample3_carry__2_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__2_i_5
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__2_i_5_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__2_i_6
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__2_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__2_i_7
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__2_i_7_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    source_sample3_carry__2_i_8
       (.I0(\cycle_index_reg_n_0_[10] ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[8] ),
        .I3(\cycle_index_reg_n_0_[6] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry__2_i_8_n_0));
  LUT3 #(
    .INIT(8'hF4)) 
    source_sample3_carry_i_1
       (.I0(width_latched[5]),
        .I1(\cycle_index_reg_n_0_[4] ),
        .I2(\cycle_index_reg_n_0_[5] ),
        .O(source_sample3_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    source_sample3_carry_i_2
       (.I0(\cycle_index_reg_n_0_[3] ),
        .I1(width_latched[4]),
        .I2(\cycle_index_reg_n_0_[2] ),
        .I3(width_latched[3]),
        .O(source_sample3_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    source_sample3_carry_i_3
       (.I0(width_latched[2]),
        .I1(width_latched[1]),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(\cycle_index_reg_n_0_[1] ),
        .O(source_sample3_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    source_sample3_carry_i_4
       (.I0(\cycle_index_reg_n_0_[6] ),
        .I1(\cycle_index_reg_n_0_[7] ),
        .O(source_sample3_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    source_sample3_carry_i_5
       (.I0(width_latched[5]),
        .I1(\cycle_index_reg_n_0_[4] ),
        .I2(\cycle_index_reg_n_0_[5] ),
        .O(source_sample3_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    source_sample3_carry_i_6
       (.I0(width_latched[4]),
        .I1(\cycle_index_reg_n_0_[3] ),
        .I2(width_latched[3]),
        .I3(\cycle_index_reg_n_0_[2] ),
        .O(source_sample3_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h8421)) 
    source_sample3_carry_i_7
       (.I0(\cycle_index_reg_n_0_[0] ),
        .I1(\cycle_index_reg_n_0_[1] ),
        .I2(width_latched[1]),
        .I3(width_latched[2]),
        .O(source_sample3_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \source_sample[12]_i_1 
       (.I0(pulse_on),
        .I1(\source_sample_reg[14]_0 ),
        .I2(\source_sample_reg[14]_1 ),
        .I3(\source_sample_reg[12]_1 ),
        .I4(\source_sample_reg[12]_0 ),
        .I5(running_reg_0),
        .O(\source_sample[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \source_sample[14]_i_1 
       (.I0(\source_sample[14]_i_2_n_0 ),
        .I1(pulse_on),
        .I2(\source_sample_reg[14]_0 ),
        .I3(\source_sample_reg[14]_1 ),
        .I4(tx_reset),
        .I5(running_reg_0),
        .O(\source_sample[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55555555CF000000)) 
    \source_sample[14]_i_2 
       (.I0(p_1_in),
        .I1(source_sample3),
        .I2(\mode_latched_reg_n_0_[0] ),
        .I3(\mode_latched_reg_n_0_[2] ),
        .I4(\mode_latched_reg_n_0_[1] ),
        .I5(pn_latched),
        .O(\source_sample[14]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \source_sample_reg[12] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\source_sample[12]_i_1_n_0 ),
        .Q(source_sample[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \source_sample_reg[14] 
       (.C(clk_dac),
        .CE(1'b1),
        .D(\source_sample[14]_i_1_n_0 ),
        .Q(source_sample[14]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFF7FFFF)) 
    source_tx_active_i_1
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(\source_sample_reg[12]_1 ),
        .I3(\source_sample_reg[12]_0 ),
        .I4(running_reg_0),
        .O(source_tx_active_i_1_n_0));
  LUT6 #(
    .INIT(64'h0101010101010100)) 
    source_tx_active_i_2
       (.I0(\_inferred__2/i__carry__1_n_1 ),
        .I1(\cycle_index_reg_n_0_[9] ),
        .I2(\cycle_index_reg_n_0_[10] ),
        .I3(\cycle_index_reg_n_0_[8] ),
        .I4(\cycle_index_reg_n_0_[6] ),
        .I5(\cycle_index_reg_n_0_[7] ),
        .O(pulse_on));
  FDRE #(
    .INIT(1'b0)) 
    source_tx_active_reg
       (.C(clk_dac),
        .CE(1'b1),
        .D(pulse_on),
        .Q(source_tx_active),
        .R(source_tx_active_i_1_n_0));
  LUT5 #(
    .INIT(32'hAABA0000)) 
    \width_latched[5]_i_1 
       (.I0(running15_out),
        .I1(\width_latched[5]_i_3_n_0 ),
        .I2(\width_latched[5]_i_4_n_0 ),
        .I3(running0__11),
        .I4(pulse_ready_dac__1),
        .O(pn_latched8_out));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \width_latched[5]_i_10 
       (.I0(\cycle_index_reg_n_0_[8] ),
        .I1(\cycle_index_reg_n_0_[5] ),
        .I2(\cycle_index_reg_n_0_[4] ),
        .O(\width_latched[5]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h4C70)) 
    \width_latched[5]_i_11 
       (.I0(out[9]),
        .I1(out[8]),
        .I2(out[7]),
        .I3(out[6]),
        .O(\width_latched[5]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \width_latched[5]_i_12 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .I3(out[4]),
        .I4(out[3]),
        .O(\width_latched[5]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \width_latched[5]_i_13 
       (.I0(out[0]),
        .I1(out[6]),
        .I2(out[7]),
        .I3(out[8]),
        .O(\width_latched[5]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \width_latched[5]_i_3 
       (.I0(\cycle_index_reg_n_0_[3] ),
        .I1(\cycle_index_reg_n_0_[1] ),
        .I2(\cycle_index_reg_n_0_[0] ),
        .I3(\cycle_index_reg_n_0_[2] ),
        .I4(\cycle_index_reg_n_0_[7] ),
        .I5(\cycle_index_reg_n_0_[6] ),
        .O(\width_latched[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    \width_latched[5]_i_4 
       (.I0(\cycle_index_reg_n_0_[4] ),
        .I1(\cycle_index_reg_n_0_[5] ),
        .I2(running_reg_0),
        .I3(\cycle_index_reg_n_0_[10] ),
        .I4(\cycle_index_reg_n_0_[9] ),
        .I5(\cycle_index_reg_n_0_[8] ),
        .O(\width_latched[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h03AB03AB03FF03AB)) 
    \width_latched[5]_i_5 
       (.I0(\width_latched[5]_i_8_n_0 ),
        .I1(\cycle_index[10]_i_5_n_0 ),
        .I2(p_29_in),
        .I3(repeat_enable),
        .I4(\width_latched[5]_i_10_n_0 ),
        .I5(\width_latched[5]_i_3_n_0 ),
        .O(running0__11));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \width_latched[5]_i_6 
       (.I0(\source_sample_reg[14]_0 ),
        .I1(\source_sample_reg[14]_1 ),
        .I2(\source_sample_reg[12]_1 ),
        .I3(\source_sample_reg[12]_0 ),
        .O(pulse_ready_dac__1));
  LUT4 #(
    .INIT(16'h0028)) 
    \width_latched[5]_i_7 
       (.I0(\width_latched[5]_i_11_n_0 ),
        .I1(\width_latched[5]_i_12_n_0 ),
        .I2(out[5]),
        .I3(\width_latched[5]_i_13_n_0 ),
        .O(p_29_in));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \width_latched[5]_i_8 
       (.I0(\cycle_index_reg_n_0_[9] ),
        .I1(\cycle_index_reg_n_0_[10] ),
        .O(\width_latched[5]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \width_latched_reg[0] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[0]),
        .Q(width_latched[0]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \width_latched_reg[1] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[1]),
        .Q(width_latched[1]),
        .R(tx_reset));
  FDSE #(
    .INIT(1'b1)) 
    \width_latched_reg[2] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[2]),
        .Q(width_latched[2]),
        .S(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \width_latched_reg[3] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[3]),
        .Q(width_latched[3]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \width_latched_reg[4] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[4]),
        .Q(width_latched[4]),
        .R(tx_reset));
  FDRE #(
    .INIT(1'b0)) 
    \width_latched_reg[5] 
       (.C(clk_dac),
        .CE(pn_latched8_out),
        .D(out[5]),
        .Q(width_latched[5]),
        .R(tx_reset));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
