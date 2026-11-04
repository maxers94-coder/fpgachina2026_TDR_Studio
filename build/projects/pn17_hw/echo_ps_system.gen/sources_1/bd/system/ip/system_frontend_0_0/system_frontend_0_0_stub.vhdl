-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
-- Date        : Wed Oct 28 18:53:14 2026
-- Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/vivado_project/pn17_hw/echo_ps_system.gen/sources_1/bd/system/ip/system_frontend_0_0/system_frontend_0_0_stub.vhdl
-- Design      : system_frontend_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_frontend_0_0 is
  Port ( 
    clk_50m : in STD_LOGIC;
    adc_dco_p : in STD_LOGIC;
    adc_dco_n : in STD_LOGIC;
    adc_data_p : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adc_data_n : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adk_spi_sda : out STD_LOGIC;
    adk_spi_sclk : out STD_LOGIC;
    adk_spi_csb : out STD_LOGIC;
    dac_spi_sdio : inout STD_LOGIC;
    dac_spi_sclk : out STD_LOGIC;
    dac_spi_csb : out STD_LOGIC;
    dac_dci_p : out STD_LOGIC;
    dac_dci_n : out STD_LOGIC;
    dac_data_p : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_data_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    pll_done_led : out STD_LOGIC;
    dac_done_led : out STD_LOGIC;
    adc_ready_led : out STD_LOGIC;
    adc_clip_led : out STD_LOGIC;
    echo_clk_acq : out STD_LOGIC;
    echo_rst_acq : out STD_LOGIC;
    echo_adc_ready : out STD_LOGIC;
    echo_pair_valid : out STD_LOGIC;
    echo_sample_rise_u14 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    echo_sample_fall_u14 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    echo_sample_clip : out STD_LOGIC;
    echo_pulse_start_acq : in STD_LOGIC;
    echo_pulse_mode : in STD_LOGIC_VECTOR ( 2 downto 0 );
    echo_pulse_width : in STD_LOGIC_VECTOR ( 5 downto 0 );
    echo_pn_enable : in STD_LOGIC;
    echo_pulse_ready : out STD_LOGIC;
    echo_tx_marker : out STD_LOGIC;
    echo_frame_meta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    echo_pulse_frames_sent : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_frontend_0_0 : entity is "system_frontend_0_0,ac820_adc_dac_frontend_ps,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_frontend_0_0 : entity is "system_frontend_0_0,ac820_adc_dac_frontend_ps,{x_ipProduct=Vivado 2026.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ac820_adc_dac_frontend_ps,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,PHASE_STEP=0x1999999A,Q_MODE=1,ADC_IDELAY_TAP=4,POWERUP_CYCLES=50000,SPI_HALF_PERIOD=25,CLOCK_SETTLE_CYCLES=5000000,PLL_WAIT_CYCLES=500000,POLL_LIMIT=4096,CLOCK_WAIT_CYCLES=5000000,MONITOR_WINDOW=50000}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_frontend_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_frontend_0_0 : entity is "module_ref";
end system_frontend_0_0;

architecture stub of system_frontend_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk_50m,adc_dco_p,adc_dco_n,adc_data_p[13:0],adc_data_n[13:0],adk_spi_sda,adk_spi_sclk,adk_spi_csb,dac_spi_sdio,dac_spi_sclk,dac_spi_csb,dac_dci_p,dac_dci_n,dac_data_p[15:0],dac_data_n[15:0],pll_done_led,dac_done_led,adc_ready_led,adc_clip_led,echo_clk_acq,echo_rst_acq,echo_adc_ready,echo_pair_valid,echo_sample_rise_u14[13:0],echo_sample_fall_u14[13:0],echo_sample_clip,echo_pulse_start_acq,echo_pulse_mode[2:0],echo_pulse_width[5:0],echo_pn_enable,echo_pulse_ready,echo_tx_marker,echo_frame_meta[31:0],echo_pulse_frames_sent[5:0]";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "ac820_adc_dac_frontend_ps,Vivado 2026.1";
begin
end;
