-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
-- Date        : Wed Oct 28 18:53:14 2026
-- Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/vivado_project/pn17_hw/echo_ps_system.gen/sources_1/bd/system/ip/system_frontend_0_0/system_frontend_0_0_sim_netlist.vhdl
-- Design      : system_frontend_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_adc_loopback_rx is
  port (
    D : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \bits_rx[13].iddr_0\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    idelay_ready_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    adc_clip_sticky_reg : out STD_LOGIC;
    sample_valid : out STD_LOGIC;
    AS : out STD_LOGIC_VECTOR ( 0 to 0 );
    pulse_ready_q0 : out STD_LOGIC;
    \launch_meta_reg[9]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    adc_clip_sticky_1 : out STD_LOGIC;
    adc_data_p : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adc_data_n : in STD_LOGIC_VECTOR ( 13 downto 0 );
    CLK : in STD_LOGIC;
    ref_clk_200m : in STD_LOGIC;
    adc_clip_sticky_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \acq_reset_sync_reg[2]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_sys : in STD_LOGIC;
    ref_locked : in STD_LOGIC;
    \enable_sync_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_adc_loopback_rx : entity is "adc_loopback_rx";
end system_frontend_0_0_adc_loopback_rx;

architecture STRUCTURE of system_frontend_0_0_adc_loopback_rx is
  signal \^as\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^d\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal acq_reset_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg : string;
  attribute async_reg of acq_reset_sync : signal is "true";
  signal \^bits_rx[13].iddr_0\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal clip_now0 : STD_LOGIC;
  signal clip_now1 : STD_LOGIC;
  signal clip_now2 : STD_LOGIC;
  signal clip_now20_in : STD_LOGIC;
  signal clip_q_i_10_n_0 : STD_LOGIC;
  signal clip_q_i_11_n_0 : STD_LOGIC;
  signal clip_q_i_12_n_0 : STD_LOGIC;
  signal clip_q_i_13_n_0 : STD_LOGIC;
  signal clip_q_i_6_n_0 : STD_LOGIC;
  signal clip_q_i_7_n_0 : STD_LOGIC;
  signal clip_q_i_8_n_0 : STD_LOGIC;
  signal clip_q_i_9_n_0 : STD_LOGIC;
  signal ctrl_reset : STD_LOGIC;
  signal ctrl_reset_i_1_n_0 : STD_LOGIC;
  signal delayed_0 : STD_LOGIC;
  signal delayed_1 : STD_LOGIC;
  signal delayed_10 : STD_LOGIC;
  signal delayed_11 : STD_LOGIC;
  signal delayed_12 : STD_LOGIC;
  signal delayed_13 : STD_LOGIC;
  signal delayed_2 : STD_LOGIC;
  signal delayed_3 : STD_LOGIC;
  signal delayed_4 : STD_LOGIC;
  signal delayed_5 : STD_LOGIC;
  signal delayed_6 : STD_LOGIC;
  signal delayed_7 : STD_LOGIC;
  signal delayed_8 : STD_LOGIC;
  signal delayed_9 : STD_LOGIC;
  signal enable_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of enable_sync : signal is "true";
  signal idelay_ready_i_1_n_0 : STD_LOGIC;
  signal \^idelay_ready_reg_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in0_in : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal ready34 : STD_LOGIC;
  signal ready34_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of ready34_sync : signal is "true";
  signal ready35 : STD_LOGIC;
  signal ready35_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of ready35_sync : signal is "true";
  signal ref_reset_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of ref_reset_sync : signal is "true";
  signal \reset_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \reset_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \reset_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \reset_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \^sample_valid\ : STD_LOGIC;
  signal se_0 : STD_LOGIC;
  signal se_1 : STD_LOGIC;
  signal se_10 : STD_LOGIC;
  signal se_11 : STD_LOGIC;
  signal se_12 : STD_LOGIC;
  signal se_13 : STD_LOGIC;
  signal se_2 : STD_LOGIC;
  signal se_3 : STD_LOGIC;
  signal se_4 : STD_LOGIC;
  signal se_5 : STD_LOGIC;
  signal se_6 : STD_LOGIC;
  signal se_7 : STD_LOGIC;
  signal se_8 : STD_LOGIC;
  signal se_9 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal \warmup[2]_i_1_n_0\ : STD_LOGIC;
  signal \warmup_reg_n_0_[0]\ : STD_LOGIC;
  signal \warmup_reg_n_0_[1]\ : STD_LOGIC;
  signal \NLW_bits_rx[0].bank34.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[10].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[11].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[12].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[13].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[1].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[2].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[3].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[4].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[5].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[6].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[7].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[8].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_bits_rx[9].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \acq_reset_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \acq_reset_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \acq_reset_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \acq_reset_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \acq_reset_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \acq_reset_sync_reg[2]\ : label is "yes";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \bits_rx[0].bank34.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP : string;
  attribute IODELAY_GROUP of \bits_rx[0].bank34.delay_i\ : label is "ADC1_RX_B34";
  attribute SIM_DELAY_D : integer;
  attribute SIM_DELAY_D of \bits_rx[0].bank34.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[0].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \bits_rx[0].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of \bits_rx[0].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of \bits_rx[0].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[0].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \bits_rx[0].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[10].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[10].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[10].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[10].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[10].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[10].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[10].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[10].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[10].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[11].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[11].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[11].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[11].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[11].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[11].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[11].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[11].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[11].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[12].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[12].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[12].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[12].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[12].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[12].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[12].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[12].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[12].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[13].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[13].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[13].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[13].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[13].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[13].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[13].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[13].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[13].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[1].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[1].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[1].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[1].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[1].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[1].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[1].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[1].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[1].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[2].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[2].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[2].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[2].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[2].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[2].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[2].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[2].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[2].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[3].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[3].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[3].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[3].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[3].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[3].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[3].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[3].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[3].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[4].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[4].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[4].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[4].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[4].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[4].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[4].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[4].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[4].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[5].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[5].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[5].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[5].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[5].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[5].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[5].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[5].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[5].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[6].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[6].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[6].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[6].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[6].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[6].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[6].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[6].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[6].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[7].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[7].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[7].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[7].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[7].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[7].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[7].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[7].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[7].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[8].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[8].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[8].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[8].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[8].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[8].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[8].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[8].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[8].iddr\ : label is "TRUE";
  attribute BOX_TYPE of \bits_rx[9].bank35.delay_i\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \bits_rx[9].bank35.delay_i\ : label is "ADC1_RX_B35";
  attribute SIM_DELAY_D of \bits_rx[9].bank35.delay_i\ : label is 0;
  attribute BOX_TYPE of \bits_rx[9].ibuf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \bits_rx[9].ibuf\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \bits_rx[9].ibuf\ : label is "0";
  attribute IFD_DELAY_VALUE of \bits_rx[9].ibuf\ : label is "AUTO";
  attribute BOX_TYPE of \bits_rx[9].iddr\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \bits_rx[9].iddr\ : label is "TRUE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clip_q_i_11 : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of clip_q_i_13 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of clip_q_i_7 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of clip_q_i_9 : label is "soft_lutpair65";
  attribute BOX_TYPE of ctrl34 : label is "PRIMITIVE";
  attribute IODELAY_GROUP of ctrl34 : label is "ADC1_RX_B34";
  attribute BOX_TYPE of ctrl35 : label is "PRIMITIVE";
  attribute IODELAY_GROUP of ctrl35 : label is "ADC1_RX_B35";
  attribute ASYNC_REG_boolean of \enable_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \enable_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \enable_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \enable_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready34_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \ready34_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready34_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \ready34_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready34_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \ready34_sync_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready35_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \ready35_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready35_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \ready35_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ready35_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \ready35_sync_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ref_reset_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \ref_reset_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ref_reset_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \ref_reset_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \ref_reset_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \ref_reset_sync_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \reset_count[1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \reset_count[2]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \reset_count[3]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \reset_count[4]_i_1\ : label is "soft_lutpair64";
  attribute inverted : string;
  attribute inverted of \reset_count_reg[5]_inv\ : label is "yes";
begin
  AS(0) <= \^as\(0);
  D(13 downto 0) <= \^d\(13 downto 0);
  \bits_rx[13].iddr_0\(13 downto 0) <= \^bits_rx[13].iddr_0\(13 downto 0);
  idelay_ready_reg_0(0) <= \^idelay_ready_reg_0\(0);
  sample_valid <= \^sample_valid\;
\acq_reset_sync[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \acq_reset_sync_reg[2]_0\(0),
      I1 => rst_sys,
      I2 => ref_locked,
      O => \^as\(0)
    );
\acq_reset_sync_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => '0',
      PRE => \^as\(0),
      Q => acq_reset_sync(0)
    );
\acq_reset_sync_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => acq_reset_sync(0),
      PRE => \^as\(0),
      Q => acq_reset_sync(1)
    );
\acq_reset_sync_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => acq_reset_sync(1),
      PRE => \^as\(0),
      Q => acq_reset_sync(2)
    );
adc_clip_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
        port map (
      I0 => \^sample_valid\,
      I1 => clip_now1,
      I2 => clip_now20_in,
      I3 => clip_now2,
      I4 => clip_now0,
      I5 => adc_clip_sticky_reg_0(0),
      O => adc_clip_sticky_reg
    );
\bits_rx[0].bank34.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[0].bank34.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_0,
      IDATAIN => se_0,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[0].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(0),
      IB => adc_data_n(0),
      O => se_0
    );
\bits_rx[0].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_0,
      Q1 => \^d\(0),
      Q2 => \^bits_rx[13].iddr_0\(0),
      R => '0',
      S => '0'
    );
\bits_rx[10].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[10].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_10,
      IDATAIN => se_10,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[10].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(10),
      IB => adc_data_n(10),
      O => se_10
    );
\bits_rx[10].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_10,
      Q1 => \^d\(10),
      Q2 => \^bits_rx[13].iddr_0\(10),
      R => '0',
      S => '0'
    );
\bits_rx[11].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[11].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_11,
      IDATAIN => se_11,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[11].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(11),
      IB => adc_data_n(11),
      O => se_11
    );
\bits_rx[11].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_11,
      Q1 => \^d\(11),
      Q2 => \^bits_rx[13].iddr_0\(11),
      R => '0',
      S => '0'
    );
\bits_rx[12].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[12].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_12,
      IDATAIN => se_12,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[12].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(12),
      IB => adc_data_n(12),
      O => se_12
    );
\bits_rx[12].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_12,
      Q1 => \^d\(12),
      Q2 => \^bits_rx[13].iddr_0\(12),
      R => '0',
      S => '0'
    );
\bits_rx[13].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[13].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_13,
      IDATAIN => se_13,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[13].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(13),
      IB => adc_data_n(13),
      O => se_13
    );
\bits_rx[13].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_13,
      Q1 => \^d\(13),
      Q2 => \^bits_rx[13].iddr_0\(13),
      R => '0',
      S => '0'
    );
\bits_rx[1].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[1].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_1,
      IDATAIN => se_1,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[1].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(1),
      IB => adc_data_n(1),
      O => se_1
    );
\bits_rx[1].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_1,
      Q1 => \^d\(1),
      Q2 => \^bits_rx[13].iddr_0\(1),
      R => '0',
      S => '0'
    );
\bits_rx[2].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[2].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_2,
      IDATAIN => se_2,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[2].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(2),
      IB => adc_data_n(2),
      O => se_2
    );
\bits_rx[2].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_2,
      Q1 => \^d\(2),
      Q2 => \^bits_rx[13].iddr_0\(2),
      R => '0',
      S => '0'
    );
\bits_rx[3].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[3].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_3,
      IDATAIN => se_3,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[3].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(3),
      IB => adc_data_n(3),
      O => se_3
    );
\bits_rx[3].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_3,
      Q1 => \^d\(3),
      Q2 => \^bits_rx[13].iddr_0\(3),
      R => '0',
      S => '0'
    );
\bits_rx[4].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[4].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_4,
      IDATAIN => se_4,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[4].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(4),
      IB => adc_data_n(4),
      O => se_4
    );
\bits_rx[4].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_4,
      Q1 => \^d\(4),
      Q2 => \^bits_rx[13].iddr_0\(4),
      R => '0',
      S => '0'
    );
\bits_rx[5].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[5].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_5,
      IDATAIN => se_5,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[5].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(5),
      IB => adc_data_n(5),
      O => se_5
    );
\bits_rx[5].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_5,
      Q1 => \^d\(5),
      Q2 => \^bits_rx[13].iddr_0\(5),
      R => '0',
      S => '0'
    );
\bits_rx[6].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[6].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_6,
      IDATAIN => se_6,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[6].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(6),
      IB => adc_data_n(6),
      O => se_6
    );
\bits_rx[6].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_6,
      Q1 => \^d\(6),
      Q2 => \^bits_rx[13].iddr_0\(6),
      R => '0',
      S => '0'
    );
\bits_rx[7].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[7].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_7,
      IDATAIN => se_7,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[7].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(7),
      IB => adc_data_n(7),
      O => se_7
    );
\bits_rx[7].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_7,
      Q1 => \^d\(7),
      Q2 => \^bits_rx[13].iddr_0\(7),
      R => '0',
      S => '0'
    );
\bits_rx[8].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[8].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_8,
      IDATAIN => se_8,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[8].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(8),
      IB => adc_data_n(8),
      O => se_8
    );
\bits_rx[8].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_8,
      Q1 => \^d\(8),
      Q2 => \^bits_rx[13].iddr_0\(8),
      R => '0',
      S => '0'
    );
\bits_rx[9].bank35.delay_i\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "TRUE",
      IDELAY_TYPE => "FIXED",
      IDELAY_VALUE => 4,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => '0',
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => B"00000",
      CNTVALUEOUT(4 downto 0) => \NLW_bits_rx[9].bank35.delay_i_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '0',
      DATAOUT => delayed_9,
      IDATAIN => se_9,
      INC => '0',
      LD => '0',
      LDPIPEEN => '0',
      REGRST => '0'
    );
\bits_rx[9].ibuf\: unisim.vcomponents.IBUFDS
     port map (
      I => adc_data_p(9),
      IB => adc_data_n(9),
      O => se_9
    );
\bits_rx[9].iddr\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => CLK,
      CE => '1',
      D => delayed_9,
      Q1 => \^d\(9),
      Q2 => \^bits_rx[13].iddr_0\(9),
      R => '0',
      S => '0'
    );
clip_q_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => \^sample_valid\,
      I1 => clip_now1,
      I2 => clip_now20_in,
      I3 => clip_now2,
      I4 => clip_now0,
      O => adc_clip_sticky_1
    );
clip_q_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^d\(13),
      I1 => \^d\(12),
      I2 => \^d\(9),
      I3 => \^d\(8),
      I4 => \^d\(11),
      I5 => \^d\(10),
      O => clip_q_i_10_n_0
    );
clip_q_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^d\(2),
      I1 => \^d\(3),
      I2 => \^d\(0),
      I3 => \^d\(1),
      O => clip_q_i_11_n_0
    );
clip_q_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^bits_rx[13].iddr_0\(13),
      I1 => \^bits_rx[13].iddr_0\(12),
      I2 => \^bits_rx[13].iddr_0\(9),
      I3 => \^bits_rx[13].iddr_0\(8),
      I4 => \^bits_rx[13].iddr_0\(11),
      I5 => \^bits_rx[13].iddr_0\(10),
      O => clip_q_i_12_n_0
    );
clip_q_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^bits_rx[13].iddr_0\(2),
      I1 => \^bits_rx[13].iddr_0\(3),
      I2 => \^bits_rx[13].iddr_0\(0),
      I3 => \^bits_rx[13].iddr_0\(1),
      O => clip_q_i_13_n_0
    );
clip_q_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => clip_q_i_6_n_0,
      I1 => clip_q_i_7_n_0,
      I2 => \^bits_rx[13].iddr_0\(6),
      I3 => \^bits_rx[13].iddr_0\(7),
      I4 => \^bits_rx[13].iddr_0\(4),
      I5 => \^bits_rx[13].iddr_0\(5),
      O => clip_now1
    );
clip_q_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => clip_q_i_8_n_0,
      I1 => clip_q_i_9_n_0,
      I2 => \^d\(6),
      I3 => \^d\(7),
      I4 => \^d\(4),
      I5 => \^d\(5),
      O => clip_now20_in
    );
clip_q_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => clip_q_i_10_n_0,
      I1 => clip_q_i_11_n_0,
      I2 => \^d\(6),
      I3 => \^d\(7),
      I4 => \^d\(4),
      I5 => \^d\(5),
      O => clip_now2
    );
clip_q_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => clip_q_i_12_n_0,
      I1 => clip_q_i_13_n_0,
      I2 => \^bits_rx[13].iddr_0\(6),
      I3 => \^bits_rx[13].iddr_0\(7),
      I4 => \^bits_rx[13].iddr_0\(4),
      I5 => \^bits_rx[13].iddr_0\(5),
      O => clip_now0
    );
clip_q_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^bits_rx[13].iddr_0\(13),
      I1 => \^bits_rx[13].iddr_0\(12),
      I2 => \^bits_rx[13].iddr_0\(9),
      I3 => \^bits_rx[13].iddr_0\(8),
      I4 => \^bits_rx[13].iddr_0\(11),
      I5 => \^bits_rx[13].iddr_0\(10),
      O => clip_q_i_6_n_0
    );
clip_q_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^bits_rx[13].iddr_0\(2),
      I1 => \^bits_rx[13].iddr_0\(3),
      I2 => \^bits_rx[13].iddr_0\(0),
      I3 => \^bits_rx[13].iddr_0\(1),
      O => clip_q_i_7_n_0
    );
clip_q_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^d\(13),
      I1 => \^d\(12),
      I2 => \^d\(9),
      I3 => \^d\(8),
      I4 => \^d\(11),
      I5 => \^d\(10),
      O => clip_q_i_8_n_0
    );
clip_q_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^d\(2),
      I1 => \^d\(3),
      I2 => \^d\(0),
      I3 => \^d\(1),
      O => clip_q_i_9_n_0
    );
ctrl34: unisim.vcomponents.IDELAYCTRL
    generic map(
      SIM_DEVICE => "7SERIES"
    )
        port map (
      RDY => ready34,
      REFCLK => ref_clk_200m,
      RST => ctrl_reset
    );
ctrl35: unisim.vcomponents.IDELAYCTRL
    generic map(
      SIM_DEVICE => "7SERIES"
    )
        port map (
      RDY => ready35,
      REFCLK => ref_clk_200m,
      RST => ctrl_reset
    );
ctrl_reset_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sel,
      I1 => ref_reset_sync(2),
      O => ctrl_reset_i_1_n_0
    );
ctrl_reset_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ref_clk_200m,
      CE => '1',
      D => ctrl_reset_i_1_n_0,
      Q => ctrl_reset,
      R => '0'
    );
\enable_sync_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => \enable_sync_reg[0]_0\(0),
      Q => enable_sync(0)
    );
\enable_sync_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => enable_sync(0),
      Q => enable_sync(1)
    );
\frame_meta_q[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => Q(0),
      I1 => enable_sync(1),
      I2 => \^idelay_ready_reg_0\(0),
      I3 => p_0_in0_in,
      O => \launch_meta_reg[9]\(0)
    );
idelay_ready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => ready35_sync(2),
      I1 => ready34_sync(2),
      I2 => acq_reset_sync(2),
      O => idelay_ready_i_1_n_0
    );
idelay_ready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => idelay_ready_i_1_n_0,
      Q => \^idelay_ready_reg_0\(0),
      R => '0'
    );
pair_valid_q_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => \^idelay_ready_reg_0\(0),
      I2 => enable_sync(1),
      O => \^sample_valid\
    );
pulse_ready_q_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^idelay_ready_reg_0\(0),
      I1 => enable_sync(1),
      O => pulse_ready_q0
    );
\ready34_sync_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready34,
      Q => ready34_sync(0)
    );
\ready34_sync_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready34_sync(0),
      Q => ready34_sync(1)
    );
\ready34_sync_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready34_sync(1),
      Q => ready34_sync(2)
    );
\ready35_sync_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready35,
      Q => ready35_sync(0)
    );
\ready35_sync_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready35_sync(0),
      Q => ready35_sync(1)
    );
\ready35_sync_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \^as\(0),
      D => ready35_sync(1),
      Q => ready35_sync(2)
    );
\ref_reset_sync_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => ref_clk_200m,
      CE => '1',
      D => '0',
      PRE => \^as\(0),
      Q => ref_reset_sync(0)
    );
\ref_reset_sync_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => ref_clk_200m,
      CE => '1',
      D => ref_reset_sync(0),
      PRE => \^as\(0),
      Q => ref_reset_sync(1)
    );
\ref_reset_sync_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => ref_clk_200m,
      CE => '1',
      D => ref_reset_sync(1),
      PRE => \^as\(0),
      Q => ref_reset_sync(2)
    );
\reset_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \reset_count_reg_n_0_[0]\,
      O => \p_0_in__1\(0)
    );
\reset_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \reset_count_reg_n_0_[0]\,
      I1 => \reset_count_reg_n_0_[1]\,
      O => \p_0_in__1\(1)
    );
\reset_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \reset_count_reg_n_0_[0]\,
      I1 => \reset_count_reg_n_0_[1]\,
      I2 => \reset_count_reg_n_0_[2]\,
      O => \p_0_in__1\(2)
    );
\reset_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \reset_count_reg_n_0_[1]\,
      I1 => \reset_count_reg_n_0_[0]\,
      I2 => \reset_count_reg_n_0_[2]\,
      I3 => \reset_count_reg_n_0_[3]\,
      O => \p_0_in__1\(3)
    );
\reset_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \reset_count_reg_n_0_[2]\,
      I1 => \reset_count_reg_n_0_[0]\,
      I2 => \reset_count_reg_n_0_[1]\,
      I3 => \reset_count_reg_n_0_[3]\,
      I4 => \reset_count_reg_n_0_[4]\,
      O => \p_0_in__1\(4)
    );
\reset_count[5]_inv_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \reset_count_reg_n_0_[3]\,
      I1 => \reset_count_reg_n_0_[1]\,
      I2 => \reset_count_reg_n_0_[0]\,
      I3 => \reset_count_reg_n_0_[2]\,
      I4 => \reset_count_reg_n_0_[4]\,
      O => \p_0_in__1\(5)
    );
\reset_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(0),
      Q => \reset_count_reg_n_0_[0]\,
      R => ref_reset_sync(2)
    );
\reset_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(1),
      Q => \reset_count_reg_n_0_[1]\,
      R => ref_reset_sync(2)
    );
\reset_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(2),
      Q => \reset_count_reg_n_0_[2]\,
      R => ref_reset_sync(2)
    );
\reset_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(3),
      Q => \reset_count_reg_n_0_[3]\,
      R => ref_reset_sync(2)
    );
\reset_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(4),
      Q => \reset_count_reg_n_0_[4]\,
      R => ref_reset_sync(2)
    );
\reset_count_reg[5]_inv\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ref_clk_200m,
      CE => sel,
      D => \p_0_in__1\(5),
      Q => sel,
      S => ref_reset_sync(2)
    );
\warmup[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => acq_reset_sync(2),
      I1 => \^idelay_ready_reg_0\(0),
      I2 => enable_sync(1),
      O => \warmup[2]_i_1_n_0\
    );
\warmup_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => '1',
      Q => \warmup_reg_n_0_[0]\,
      R => \warmup[2]_i_1_n_0\
    );
\warmup_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \warmup_reg_n_0_[0]\,
      Q => \warmup_reg_n_0_[1]\,
      R => \warmup[2]_i_1_n_0\
    );
\warmup_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \warmup_reg_n_0_[1]\,
      Q => p_0_in0_in,
      R => \warmup[2]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_cdc_pulse_toggle is
  port (
    burst_start_dac : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_reset : in STD_LOGIC;
    clk_dac : in STD_LOGIC;
    echo_clk_acq : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \frames_sent_reg[5]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \frames_sent_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \frames_sent_reg[5]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \frames_sent_reg[5]_2\ : in STD_LOGIC;
    echo_pulse_start_acq : in STD_LOGIC;
    echo_rst_acq : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_cdc_pulse_toggle : entity is "cdc_pulse_toggle";
end system_frontend_0_0_cdc_pulse_toggle;

architecture STRUCTURE of system_frontend_0_0_cdc_pulse_toggle is
  signal \^burst_start_dac\ : STD_LOGIC;
  signal dst_pulse_i_1_n_0 : STD_LOGIC;
  signal dst_sync_1 : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of dst_sync_1 : signal is "true";
  signal dst_sync_2 : STD_LOGIC;
  attribute async_reg of dst_sync_2 : signal is "true";
  signal dst_sync_2_d : STD_LOGIC;
  signal src_toggle : STD_LOGIC;
  signal src_toggle_i_1_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of dst_sync_1_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of dst_sync_1_reg : label is "yes";
  attribute ASYNC_REG_boolean of dst_sync_2_reg : label is std.standard.true;
  attribute KEEP of dst_sync_2_reg : label is "yes";
begin
  burst_start_dac <= \^burst_start_dac\;
dst_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => dst_sync_2_d,
      I1 => dst_sync_2,
      O => dst_pulse_i_1_n_0
    );
dst_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_dac,
      CE => '1',
      D => dst_pulse_i_1_n_0,
      Q => \^burst_start_dac\,
      R => tx_reset
    );
dst_sync_1_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_dac,
      CE => '1',
      D => src_toggle,
      Q => dst_sync_1,
      R => tx_reset
    );
dst_sync_2_d_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_dac,
      CE => '1',
      D => dst_sync_2,
      Q => dst_sync_2_d,
      R => tx_reset
    );
dst_sync_2_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_dac,
      CE => '1',
      D => dst_sync_1,
      Q => dst_sync_2,
      R => tx_reset
    );
\frames_sent[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFF7FFFFFFF7"
    )
        port map (
      I0 => \out\(0),
      I1 => \frames_sent_reg[5]\(0),
      I2 => \frames_sent_reg[5]_0\(0),
      I3 => \frames_sent_reg[5]_1\(0),
      I4 => \^burst_start_dac\,
      I5 => \frames_sent_reg[5]_2\,
      O => SR(0)
    );
src_toggle_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => src_toggle,
      I1 => echo_pulse_start_acq,
      I2 => echo_rst_acq,
      O => src_toggle_i_1_n_0
    );
src_toggle_reg: unisim.vcomponents.FDRE
     port map (
      C => echo_clk_acq,
      CE => '1',
      D => src_toggle_i_1_n_0,
      Q => src_toggle,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_dac_lvds_tx is
  port (
    dac_data_p : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_data_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_dci_p : out STD_LOGIC;
    dac_dci_n : out STD_LOGIC;
    clk_dac : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    i_sample : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_dac_lvds_tx : entity is "dac_lvds_tx";
end system_frontend_0_0_dac_lvds_tx;

architecture STRUCTURE of system_frontend_0_0_dac_lvds_tx is
  signal data_se : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal dci_se : STD_LOGIC;
  signal \NLW_data_bit[0].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[10].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[11].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[12].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[13].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[14].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[15].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[1].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[2].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[3].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[4].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[5].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[6].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[7].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[8].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_data_bit[9].data_oddr_S_UNCONNECTED\ : STD_LOGIC;
  signal NLW_dci_oddr_S_UNCONNECTED : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \data_bit[0].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \data_bit[0].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[0].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \data_bit[0].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \data_bit[0].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[10].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[10].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[10].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[10].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[10].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[11].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[11].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[11].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[11].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[11].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[12].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[12].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[12].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[12].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[12].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[13].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[13].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[13].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[13].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[13].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[14].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[14].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[14].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[14].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[14].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[15].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[15].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[15].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[15].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[15].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[1].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[1].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[1].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[1].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[1].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[2].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[2].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[2].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[2].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[2].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[3].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[3].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[3].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[3].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[3].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[4].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[4].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[4].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[4].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[4].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[5].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[5].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[5].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[5].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[5].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[6].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[6].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[6].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[6].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[6].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[7].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[7].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[7].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[7].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[7].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[8].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[8].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[8].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[8].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[8].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of \data_bit[9].data_buf\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \data_bit[9].data_buf\ : label is "DONT_CARE";
  attribute BOX_TYPE of \data_bit[9].data_oddr\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \data_bit[9].data_oddr\ : label is "MLO";
  attribute \__SRVAL\ of \data_bit[9].data_oddr\ : label is "FALSE";
  attribute BOX_TYPE of dci_buf : label is "PRIMITIVE";
  attribute CAPACITANCE of dci_buf : label is "DONT_CARE";
  attribute BOX_TYPE of dci_oddr : label is "PRIMITIVE";
  attribute OPT_MODIFIED of dci_oddr : label is "MLO";
  attribute \__SRVAL\ of dci_oddr : label is "FALSE";
begin
\data_bit[0].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(0),
      O => dac_data_p(0),
      OB => dac_data_n(0)
    );
\data_bit[0].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(0),
      R => SR(0),
      S => \NLW_data_bit[0].data_oddr_S_UNCONNECTED\
    );
\data_bit[10].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(10),
      O => dac_data_p(10),
      OB => dac_data_n(10)
    );
\data_bit[10].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(10),
      R => SR(0),
      S => \NLW_data_bit[10].data_oddr_S_UNCONNECTED\
    );
\data_bit[11].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(11),
      O => dac_data_p(11),
      OB => dac_data_n(11)
    );
\data_bit[11].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(11),
      R => SR(0),
      S => \NLW_data_bit[11].data_oddr_S_UNCONNECTED\
    );
\data_bit[12].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(12),
      O => dac_data_p(12),
      OB => dac_data_n(12)
    );
\data_bit[12].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => i_sample(0),
      D2 => '0',
      Q => data_se(12),
      R => SR(0),
      S => \NLW_data_bit[12].data_oddr_S_UNCONNECTED\
    );
\data_bit[13].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(13),
      O => dac_data_p(13),
      OB => dac_data_n(13)
    );
\data_bit[13].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => i_sample(1),
      D2 => '0',
      Q => data_se(13),
      R => SR(0),
      S => \NLW_data_bit[13].data_oddr_S_UNCONNECTED\
    );
\data_bit[14].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(14),
      O => dac_data_p(14),
      OB => dac_data_n(14)
    );
\data_bit[14].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => i_sample(1),
      D2 => '0',
      Q => data_se(14),
      R => SR(0),
      S => \NLW_data_bit[14].data_oddr_S_UNCONNECTED\
    );
\data_bit[15].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(15),
      O => dac_data_p(15),
      OB => dac_data_n(15)
    );
\data_bit[15].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => i_sample(1),
      D2 => '0',
      Q => data_se(15),
      R => SR(0),
      S => \NLW_data_bit[15].data_oddr_S_UNCONNECTED\
    );
\data_bit[1].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(1),
      O => dac_data_p(1),
      OB => dac_data_n(1)
    );
\data_bit[1].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(1),
      R => SR(0),
      S => \NLW_data_bit[1].data_oddr_S_UNCONNECTED\
    );
\data_bit[2].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(2),
      O => dac_data_p(2),
      OB => dac_data_n(2)
    );
\data_bit[2].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(2),
      R => SR(0),
      S => \NLW_data_bit[2].data_oddr_S_UNCONNECTED\
    );
\data_bit[3].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(3),
      O => dac_data_p(3),
      OB => dac_data_n(3)
    );
\data_bit[3].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(3),
      R => SR(0),
      S => \NLW_data_bit[3].data_oddr_S_UNCONNECTED\
    );
\data_bit[4].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(4),
      O => dac_data_p(4),
      OB => dac_data_n(4)
    );
\data_bit[4].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(4),
      R => SR(0),
      S => \NLW_data_bit[4].data_oddr_S_UNCONNECTED\
    );
\data_bit[5].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(5),
      O => dac_data_p(5),
      OB => dac_data_n(5)
    );
\data_bit[5].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(5),
      R => SR(0),
      S => \NLW_data_bit[5].data_oddr_S_UNCONNECTED\
    );
\data_bit[6].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(6),
      O => dac_data_p(6),
      OB => dac_data_n(6)
    );
\data_bit[6].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(6),
      R => SR(0),
      S => \NLW_data_bit[6].data_oddr_S_UNCONNECTED\
    );
\data_bit[7].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(7),
      O => dac_data_p(7),
      OB => dac_data_n(7)
    );
\data_bit[7].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(7),
      R => SR(0),
      S => \NLW_data_bit[7].data_oddr_S_UNCONNECTED\
    );
\data_bit[8].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(8),
      O => dac_data_p(8),
      OB => dac_data_n(8)
    );
\data_bit[8].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(8),
      R => SR(0),
      S => \NLW_data_bit[8].data_oddr_S_UNCONNECTED\
    );
\data_bit[9].data_buf\: unisim.vcomponents.OBUFDS
     port map (
      I => data_se(9),
      O => dac_data_p(9),
      OB => dac_data_n(9)
    );
\data_bit[9].data_oddr\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '0',
      D2 => '0',
      Q => data_se(9),
      R => SR(0),
      S => \NLW_data_bit[9].data_oddr_S_UNCONNECTED\
    );
dci_buf: unisim.vcomponents.OBUFDS
     port map (
      I => dci_se,
      O => dac_dci_p,
      OB => dac_dci_n
    );
dci_oddr: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_dac,
      CE => '1',
      D1 => '1',
      D2 => '0',
      Q => dci_se,
      R => SR(0),
      S => NLW_dci_oddr_S_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_pulse_burst_32 is
  port (
    active_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    running15_out : out STD_LOGIC;
    repeat_enable : out STD_LOGIC;
    clk_dac : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    active_reg_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    active_reg_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    active_reg_3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    burst_start_dac : in STD_LOGIC;
    \pulse_ready_dac__1\ : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    running_reg : in STD_LOGIC;
    p_29_in : in STD_LOGIC;
    source_frame_last : in STD_LOGIC;
    source_frame_start : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_pulse_burst_32 : entity is "pulse_burst_32";
end system_frontend_0_0_pulse_burst_32;

architecture STRUCTURE of system_frontend_0_0_pulse_burst_32 is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal active14_out : STD_LOGIC;
  signal active_i_1_n_0 : STD_LOGIC;
  signal active_i_2_n_0 : STD_LOGIC;
  signal \^active_reg_0\ : STD_LOGIC;
  signal \frames_sent[5]_i_2_n_0\ : STD_LOGIC;
  signal \frames_sent[5]_i_4_n_0\ : STD_LOGIC;
  signal last_frame_started : STD_LOGIC;
  signal last_frame_started_i_1_n_0 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \frames_sent[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \frames_sent[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \frames_sent[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \frames_sent[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \frames_sent[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \frames_sent[5]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of last_frame_started_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \width_latched[5]_i_9\ : label is "soft_lutpair2";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
  active_reg_0 <= \^active_reg_0\;
active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => active_i_2_n_0,
      I1 => \out\(0),
      I2 => active_reg_1(0),
      I3 => active_reg_2(0),
      I4 => active_reg_3(0),
      O => active_i_1_n_0
    );
active_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFFFFFF0000"
    )
        port map (
      I0 => \^q\(5),
      I1 => source_frame_start,
      I2 => \frames_sent[5]_i_4_n_0\,
      I3 => source_frame_last,
      I4 => burst_start_dac,
      I5 => \^active_reg_0\,
      O => active_i_2_n_0
    );
active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => active_i_1_n_0,
      Q => \^active_reg_0\,
      R => '0'
    );
\frames_sent[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__0\(0)
    );
\frames_sent[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \p_0_in__0\(1)
    );
\frames_sent[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \p_0_in__0\(2)
    );
\frames_sent[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      O => \p_0_in__0\(3)
    );
\frames_sent[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \p_0_in__0\(4)
    );
\frames_sent[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888088"
    )
        port map (
      I0 => \^active_reg_0\,
      I1 => source_frame_last,
      I2 => \frames_sent[5]_i_4_n_0\,
      I3 => source_frame_start,
      I4 => \^q\(5),
      O => \frames_sent[5]_i_2_n_0\
    );
\frames_sent[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \p_0_in__0\(5)
    );
\frames_sent[5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => \frames_sent[5]_i_4_n_0\
    );
\frames_sent_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(0),
      Q => \^q\(0),
      R => SR(0)
    );
\frames_sent_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(1),
      Q => \^q\(1),
      R => SR(0)
    );
\frames_sent_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(2),
      Q => \^q\(2),
      R => SR(0)
    );
\frames_sent_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(3),
      Q => \^q\(3),
      R => SR(0)
    );
\frames_sent_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(4),
      Q => \^q\(4),
      R => SR(0)
    );
\frames_sent_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \frames_sent[5]_i_2_n_0\,
      D => \p_0_in__0\(5),
      Q => \^q\(5),
      R => SR(0)
    );
last_frame_started_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E0EE0000"
    )
        port map (
      I0 => active14_out,
      I1 => last_frame_started,
      I2 => \^active_reg_0\,
      I3 => burst_start_dac,
      I4 => \pulse_ready_dac__1\,
      I5 => tx_reset,
      O => last_frame_started_i_1_n_0
    );
last_frame_started_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(5),
      I1 => source_frame_start,
      I2 => \frames_sent[5]_i_4_n_0\,
      O => active14_out
    );
last_frame_started_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => last_frame_started_i_1_n_0,
      Q => last_frame_started,
      R => '0'
    );
\width_latched[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0455000000000000"
    )
        port map (
      I0 => running_reg,
      I1 => \frames_sent[5]_i_4_n_0\,
      I2 => \^q\(5),
      I3 => last_frame_started,
      I4 => \^active_reg_0\,
      I5 => p_29_in,
      O => running15_out
    );
\width_latched[5]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F00"
    )
        port map (
      I0 => \frames_sent[5]_i_4_n_0\,
      I1 => \^q\(5),
      I2 => last_frame_started,
      I3 => \^active_reg_0\,
      O => repeat_enable
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_spi24_master is
  port (
    sclk_reg_0 : out STD_LOGIC;
    adk_spi_csb : out STD_LOGIC;
    adk_spi_sda : out STD_LOGIC;
    adk_done : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \clock_index_reg[4]\ : out STD_LOGIC;
    busy_reg_0 : out STD_LOGIC;
    busy_reg_1 : out STD_LOGIC;
    \state_reg[2]\ : out STD_LOGIC;
    rst_sys : in STD_LOGIC;
    clk_50m : in STD_LOGIC;
    adk_start : in STD_LOGIC;
    \wait_count_reg[0]\ : in STD_LOGIC;
    \wait_count_reg[0]_0\ : in STD_LOGIC;
    \wait_count_reg[0]_1\ : in STD_LOGIC;
    \wait_count_reg[0]_2\ : in STD_LOGIC;
    dco_alive : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    data6 : in STD_LOGIC;
    wait_count : in STD_LOGIC_VECTOR ( 0 to 0 );
    clock_index : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \clock_index_reg[6]\ : in STD_LOGIC;
    clock_config_done_reg : in STD_LOGIC;
    clock_config_done : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_spi24_master : entity is "spi24_master";
end system_frontend_0_0_spi24_master;

architecture STRUCTURE of system_frontend_0_0_spi24_master is
  signal \^adk_done\ : STD_LOGIC;
  signal \^adk_spi_csb\ : STD_LOGIC;
  signal \^adk_spi_sda\ : STD_LOGIC;
  signal bit_index : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \bit_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[3]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[3]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_1_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_2_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_3_n_0\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[4]\ : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_reg_n_0 : STD_LOGIC;
  signal \clock_index[3]_i_3_n_0\ : STD_LOGIC;
  signal cs_n_i_1_n_0 : STD_LOGIC;
  signal cs_n_i_2_n_0 : STD_LOGIC;
  signal divider0_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \divider[4]_i_1_n_0\ : STD_LOGIC;
  signal \divider__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal done_i_1_n_0 : STD_LOGIC;
  signal is_read4_out : STD_LOGIC;
  signal sclk_i_1_n_0 : STD_LOGIC;
  signal sclk_i_2_n_0 : STD_LOGIC;
  signal \^sclk_reg_0\ : STD_LOGIC;
  signal sdio_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sdio_meta : signal is "true";
  signal sdio_out_i_10_n_0 : STD_LOGIC;
  signal sdio_out_i_11_n_0 : STD_LOGIC;
  signal sdio_out_i_12_n_0 : STD_LOGIC;
  signal sdio_out_i_1_n_0 : STD_LOGIC;
  signal sdio_out_i_2_n_0 : STD_LOGIC;
  signal sdio_out_i_3_n_0 : STD_LOGIC;
  signal sdio_out_i_4_n_0 : STD_LOGIC;
  signal sdio_out_i_5_n_0 : STD_LOGIC;
  signal sdio_out_i_6_n_0 : STD_LOGIC;
  signal sdio_out_i_7_n_0 : STD_LOGIC;
  signal sdio_out_i_8_n_0 : STD_LOGIC;
  signal sdio_out_i_9_n_0 : STD_LOGIC;
  signal sdio_sync : STD_LOGIC;
  attribute async_reg of sdio_sync : signal is "true";
  signal tx : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \wait_count[31]_i_3_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_5_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_index[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bit_index[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bit_index[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bit_index[3]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \bit_index[3]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bit_index[4]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of busy_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of cs_n_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \divider[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \divider[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \divider[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \divider[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \divider[4]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of sclk_i_2 : label is "soft_lutpair8";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sdio_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sdio_meta_reg : label is "yes";
  attribute SOFT_HLUTNM of sdio_out_i_4 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of sdio_out_i_7 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of sdio_out_i_8 : label is "soft_lutpair10";
  attribute ASYNC_REG_boolean of sdio_sync_reg : label is std.standard.true;
  attribute KEEP of sdio_sync_reg : label is "yes";
begin
  adk_done <= \^adk_done\;
  adk_spi_csb <= \^adk_spi_csb\;
  adk_spi_sda <= \^adk_spi_sda\;
  sclk_reg_0 <= \^sclk_reg_0\;
adk_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => Q(3),
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(0),
      O => busy_reg_1
    );
\bit_index[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => adk_start,
      I2 => busy_reg_n_0,
      O => \bit_index[0]_i_1_n_0\
    );
\bit_index[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"99F9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => adk_start,
      I3 => busy_reg_n_0,
      O => \bit_index[1]_i_1_n_0\
    );
\bit_index[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9A9FFA9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[2]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => \bit_index_reg_n_0_[1]\,
      I3 => adk_start,
      I4 => busy_reg_n_0,
      O => \bit_index[2]_i_1_n_0\
    );
\bit_index[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4540454000004540"
    )
        port map (
      I0 => rst_sys,
      I1 => \bit_index[3]_i_2_n_0\,
      I2 => bit_index(0),
      I3 => \bit_index_reg_n_0_[3]\,
      I4 => adk_start,
      I5 => busy_reg_n_0,
      O => \bit_index[3]_i_1_n_0\
    );
\bit_index[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      O => \bit_index[3]_i_2_n_0\
    );
\bit_index[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => sclk_i_2_n_0,
      I2 => \^sclk_reg_0\,
      I3 => cs_n_i_2_n_0,
      O => bit_index(0)
    );
\bit_index[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8080FF00"
    )
        port map (
      I0 => cs_n_i_2_n_0,
      I1 => \^sclk_reg_0\,
      I2 => sclk_i_2_n_0,
      I3 => adk_start,
      I4 => busy_reg_n_0,
      O => \bit_index[4]_i_1_n_0\
    );
\bit_index[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE0001FFFFFFFF"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \bit_index_reg_n_0_[4]\,
      I5 => \bit_index[4]_i_3_n_0\,
      O => \bit_index[4]_i_2_n_0\
    );
\bit_index[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => adk_start,
      O => \bit_index[4]_i_3_n_0\
    );
\bit_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1_n_0\,
      D => \bit_index[0]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[0]\,
      R => rst_sys
    );
\bit_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1_n_0\,
      D => \bit_index[1]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[1]\,
      R => rst_sys
    );
\bit_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1_n_0\,
      D => \bit_index[2]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[2]\,
      R => rst_sys
    );
\bit_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \bit_index[3]_i_1_n_0\,
      Q => \bit_index_reg_n_0_[3]\,
      R => '0'
    );
\bit_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1_n_0\,
      D => \bit_index[4]_i_2_n_0\,
      Q => \bit_index_reg_n_0_[4]\,
      R => rst_sys
    );
busy_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7F7FF00"
    )
        port map (
      I0 => sclk_i_2_n_0,
      I1 => \^sclk_reg_0\,
      I2 => cs_n_i_2_n_0,
      I3 => adk_start,
      I4 => busy_reg_n_0,
      O => busy_i_1_n_0
    );
busy_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => busy_i_1_n_0,
      Q => busy_reg_n_0,
      R => rst_sys
    );
clock_config_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF10000000"
    )
        port map (
      I0 => clock_config_done_reg,
      I1 => Q(2),
      I2 => Q(0),
      I3 => \^adk_done\,
      I4 => wait_count(0),
      I5 => clock_config_done,
      O => \state_reg[2]\
    );
\clock_index[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA8AAAAAAAAA"
    )
        port map (
      I0 => \clock_index[3]_i_3_n_0\,
      I1 => clock_index(1),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => \clock_index_reg[6]\,
      I5 => clock_index(0),
      O => \clock_index_reg[4]\
    );
\clock_index[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \^adk_done\,
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      I4 => Q(3),
      O => \clock_index[3]_i_3_n_0\
    );
cs_n_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF555530005555"
    )
        port map (
      I0 => adk_start,
      I1 => cs_n_i_2_n_0,
      I2 => sclk_i_2_n_0,
      I3 => \^sclk_reg_0\,
      I4 => busy_reg_n_0,
      I5 => \^adk_spi_csb\,
      O => cs_n_i_1_n_0
    );
cs_n_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \bit_index_reg_n_0_[4]\,
      O => cs_n_i_2_n_0
    );
cs_n_reg: unisim.vcomponents.FDSE
     port map (
      C => clk_50m,
      CE => '1',
      D => cs_n_i_1_n_0,
      Q => \^adk_spi_csb\,
      S => rst_sys
    );
\divider[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EFFF"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(2),
      I2 => \divider__0\(3),
      I3 => \divider__0\(4),
      I4 => \divider__0\(0),
      O => divider0_out(0)
    );
\divider[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(0),
      O => divider0_out(1)
    );
\divider[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \divider__0\(2),
      I1 => \divider__0\(1),
      I2 => \divider__0\(0),
      O => divider0_out(2)
    );
\divider[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3CCCCCC4"
    )
        port map (
      I0 => \divider__0\(4),
      I1 => \divider__0\(3),
      I2 => \divider__0\(2),
      I3 => \divider__0\(1),
      I4 => \divider__0\(0),
      O => divider0_out(3)
    );
\divider[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => rst_sys,
      I1 => adk_start,
      I2 => busy_reg_n_0,
      O => \divider[4]_i_1_n_0\
    );
\divider[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA2"
    )
        port map (
      I0 => \divider__0\(4),
      I1 => \divider__0\(3),
      I2 => \divider__0\(2),
      I3 => \divider__0\(1),
      I4 => \divider__0\(0),
      O => divider0_out(4)
    );
\divider_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(0),
      Q => \divider__0\(0),
      R => \divider[4]_i_1_n_0\
    );
\divider_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(1),
      Q => \divider__0\(1),
      R => \divider[4]_i_1_n_0\
    );
\divider_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(2),
      Q => \divider__0\(2),
      R => \divider[4]_i_1_n_0\
    );
\divider_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(3),
      Q => \divider__0\(3),
      R => \divider[4]_i_1_n_0\
    );
\divider_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(4),
      Q => \divider__0\(4),
      R => \divider[4]_i_1_n_0\
    );
done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => cs_n_i_2_n_0,
      I1 => busy_reg_n_0,
      I2 => rst_sys,
      I3 => sclk_i_2_n_0,
      I4 => \^sclk_reg_0\,
      O => done_i_1_n_0
    );
done_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => done_i_1_n_0,
      Q => \^adk_done\,
      R => '0'
    );
sclk_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => rst_sys,
      I1 => busy_reg_n_0,
      I2 => \^sclk_reg_0\,
      I3 => sclk_i_2_n_0,
      O => sclk_i_1_n_0
    );
sclk_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \divider__0\(4),
      I1 => \divider__0\(3),
      I2 => \divider__0\(2),
      I3 => \divider__0\(1),
      I4 => \divider__0\(0),
      O => sclk_i_2_n_0
    );
sclk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => sclk_i_1_n_0,
      Q => \^sclk_reg_0\,
      R => '0'
    );
sdio_meta_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => '0',
      Q => sdio_meta,
      R => rst_sys
    );
sdio_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAC0FFFFAAC00000"
    )
        port map (
      I0 => sdio_out_i_2_n_0,
      I1 => sdio_out_i_3_n_0,
      I2 => busy_reg_n_0,
      I3 => sdio_out_i_4_n_0,
      I4 => \bit_index[4]_i_1_n_0\,
      I5 => \^adk_spi_sda\,
      O => sdio_out_i_1_n_0
    );
sdio_out_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C0A00"
    )
        port map (
      I0 => tx(0),
      I1 => tx(1),
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[1]\,
      I5 => \bit_index_reg_n_0_[3]\,
      O => sdio_out_i_10_n_0
    );
sdio_out_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => tx(12),
      I1 => tx(13),
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => tx(14),
      I5 => tx(15),
      O => sdio_out_i_11_n_0
    );
sdio_out_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACCFFF0AACC00F0"
    )
        port map (
      I0 => tx(6),
      I1 => tx(4),
      I2 => tx(7),
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => \bit_index_reg_n_0_[0]\,
      I5 => tx(5),
      O => sdio_out_i_12_n_0
    );
sdio_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000A08800"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => tx(16),
      I2 => tx(17),
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[1]\,
      I5 => \bit_index_reg_n_0_[2]\,
      O => sdio_out_i_2_n_0
    );
sdio_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEFEEEEEE"
    )
        port map (
      I0 => sdio_out_i_5_n_0,
      I1 => sdio_out_i_6_n_0,
      I2 => sdio_out_i_7_n_0,
      I3 => sdio_out_i_8_n_0,
      I4 => sdio_out_i_9_n_0,
      I5 => sdio_out_i_10_n_0,
      O => sdio_out_i_3_n_0
    );
sdio_out_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[4]\,
      I1 => \bit_index_reg_n_0_[2]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => \bit_index_reg_n_0_[3]\,
      O => sdio_out_i_4_n_0
    );
sdio_out_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000C0A0000000000"
    )
        port map (
      I0 => tx(8),
      I1 => tx(9),
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[1]\,
      I5 => \bit_index_reg_n_0_[3]\,
      O => sdio_out_i_5_n_0
    );
sdio_out_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB0000E88800002"
    )
        port map (
      I0 => sdio_out_i_11_n_0,
      I1 => \bit_index_reg_n_0_[3]\,
      I2 => \bit_index_reg_n_0_[1]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[2]\,
      I5 => sdio_out_i_12_n_0,
      O => sdio_out_i_6_n_0
    );
sdio_out_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \bit_index_reg_n_0_[1]\,
      O => sdio_out_i_7_n_0
    );
sdio_out_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => \bit_index_reg_n_0_[2]\,
      O => sdio_out_i_8_n_0
    );
sdio_out_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx(10),
      I1 => tx(11),
      I2 => \bit_index[3]_i_2_n_0\,
      I3 => tx(2),
      I4 => \bit_index_reg_n_0_[0]\,
      I5 => tx(3),
      O => sdio_out_i_9_n_0
    );
sdio_out_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => sdio_out_i_1_n_0,
      Q => \^adk_spi_sda\,
      R => rst_sys
    );
sdio_sync_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => sdio_meta,
      Q => sdio_sync,
      R => rst_sys
    );
\state[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCFCCCCCC1CCC1"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => Q(3),
      I2 => Q(2),
      I3 => Q(0),
      I4 => dco_alive,
      I5 => Q(1),
      O => busy_reg_0
    );
\tx[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => adk_start,
      I1 => busy_reg_n_0,
      O => is_read4_out
    );
\tx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(0),
      Q => tx(0),
      R => rst_sys
    );
\tx_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(10),
      Q => tx(10),
      R => rst_sys
    );
\tx_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(11),
      Q => tx(11),
      R => rst_sys
    );
\tx_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(12),
      Q => tx(12),
      R => rst_sys
    );
\tx_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(13),
      Q => tx(13),
      R => rst_sys
    );
\tx_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(14),
      Q => tx(14),
      R => rst_sys
    );
\tx_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(15),
      Q => tx(15),
      R => rst_sys
    );
\tx_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(16),
      Q => tx(16),
      R => rst_sys
    );
\tx_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(17),
      Q => tx(17),
      R => rst_sys
    );
\tx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(1),
      Q => tx(1),
      R => rst_sys
    );
\tx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(2),
      Q => tx(2),
      R => rst_sys
    );
\tx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(3),
      Q => tx(3),
      R => rst_sys
    );
\tx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(4),
      Q => tx(4),
      R => rst_sys
    );
\tx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(5),
      Q => tx(5),
      R => rst_sys
    );
\tx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(6),
      Q => tx(6),
      R => rst_sys
    );
\tx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(7),
      Q => tx(7),
      R => rst_sys
    );
\tx_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(8),
      Q => tx(8),
      R => rst_sys
    );
\tx_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => D(9),
      Q => tx(9),
      R => rst_sys
    );
\wait_count[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAFFEAEAEAFFEA"
    )
        port map (
      I0 => \wait_count[31]_i_3_n_0\,
      I1 => \wait_count_reg[0]\,
      I2 => \wait_count_reg[0]_0\,
      I3 => \wait_count_reg[0]_1\,
      I4 => \wait_count_reg[0]_2\,
      I5 => dco_alive,
      O => E(0)
    );
\wait_count[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABFAAAA"
    )
        port map (
      I0 => \wait_count[31]_i_5_n_0\,
      I1 => Q(2),
      I2 => data6,
      I3 => Q(3),
      I4 => Q(1),
      I5 => Q(0),
      O => \wait_count[31]_i_3_n_0\
    );
\wait_count[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => \^adk_done\,
      I5 => wait_count(0),
      O => \wait_count[31]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_spi24_master_0 is
  port (
    sclk_reg_0 : out STD_LOGIC;
    dac_spi_csb : out STD_LOGIC;
    dac_sdio_o : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[1]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \read_data_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \state_reg[2]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    done_reg_0 : out STD_LOGIC;
    \read_data_reg[1]_1\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    busy_reg_0 : out STD_LOGIC;
    \state_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    dac_sdio_t : out STD_LOGIC;
    dac_config_done_reg : out STD_LOGIC;
    rst_sys : in STD_LOGIC;
    clk_50m : in STD_LOGIC;
    dac_sdio_i : in STD_LOGIC;
    dac_start : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \error_code_reg[0]\ : in STD_LOGIC;
    \error_code_reg[0]_0\ : in STD_LOGIC;
    \error_code_reg[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \error_code_reg[1]_0\ : in STD_LOGIC;
    \error_code_reg[0]_1\ : in STD_LOGIC;
    dco_alive : in STD_LOGIC;
    \error_code_reg[0]_2\ : in STD_LOGIC;
    \error_code_reg[0]_3\ : in STD_LOGIC;
    \poll_count_reg[0]\ : in STD_LOGIC;
    dac_config_done_reg_0 : in STD_LOGIC;
    \state_reg[1]_0\ : in STD_LOGIC;
    \state_reg[1]_1\ : in STD_LOGIC;
    \dac_index_reg[0]\ : in STD_LOGIC;
    \state[3]_i_6_0\ : in STD_LOGIC;
    \poll_count_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    poll_count0 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    \poll_count_reg[11]\ : in STD_LOGIC;
    data6 : in STD_LOGIC;
    adk_done : in STD_LOGIC;
    \state[3]_i_3_0\ : in STD_LOGIC;
    dac_config_done_reg_1 : in STD_LOGIC;
    dac_config_done_reg_2 : in STD_LOGIC;
    dac_config_done_reg_3 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_spi24_master_0 : entity is "spi24_master";
end system_frontend_0_0_spi24_master_0;

architecture STRUCTURE of system_frontend_0_0_spi24_master_0 is
  signal bit_index : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \bit_index[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_index[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_index[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_index[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_index[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_4_n_0\ : STD_LOGIC;
  signal \bit_index[4]_i_5_n_0\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \bit_index_reg_n_0_[4]\ : STD_LOGIC;
  signal \busy_i_1__0_n_0\ : STD_LOGIC;
  signal busy_reg_n_0 : STD_LOGIC;
  signal \cs_n_i_1__0_n_0\ : STD_LOGIC;
  signal \cs_n_i_2__0_n_0\ : STD_LOGIC;
  signal dac_config_done_i_2_n_0 : STD_LOGIC;
  signal dac_done : STD_LOGIC;
  signal \dac_index[5]_i_8_n_0\ : STD_LOGIC;
  signal dac_rdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^dac_sdio_o\ : STD_LOGIC;
  signal \^dac_spi_csb\ : STD_LOGIC;
  signal divider0_out : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \divider[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \divider__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \done_i_1__0_n_0\ : STD_LOGIC;
  signal \^done_reg_0\ : STD_LOGIC;
  signal \error_code[3]_i_3_n_0\ : STD_LOGIC;
  signal is_read4_out : STD_LOGIC;
  signal \poll_count[11]_i_13_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_6_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_7_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_9_n_0\ : STD_LOGIC;
  signal \read_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \sclk_i_1__0_n_0\ : STD_LOGIC;
  signal \sclk_i_2__0_n_0\ : STD_LOGIC;
  signal \^sclk_reg_0\ : STD_LOGIC;
  signal sdio_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sdio_meta : signal is "true";
  signal sdio_oe_i_1_n_0 : STD_LOGIC;
  signal sdio_oe_i_2_n_0 : STD_LOGIC;
  signal sdio_oe_i_3_n_0 : STD_LOGIC;
  signal sdio_oe_reg_n_0 : STD_LOGIC;
  signal \sdio_out_i_10__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_11__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_12__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_1__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_2__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_3__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_4__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_5__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_6__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_7__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_8__0_n_0\ : STD_LOGIC;
  signal \sdio_out_i_9__0_n_0\ : STD_LOGIC;
  signal sdio_sync : STD_LOGIC;
  attribute async_reg of sdio_sync : signal is "true";
  signal state14_out : STD_LOGIC;
  signal \state1__11\ : STD_LOGIC;
  signal state4 : STD_LOGIC;
  signal \state[3]_i_3_n_0\ : STD_LOGIC;
  signal \state[3]_i_6_n_0\ : STD_LOGIC;
  signal \state[3]_i_7_n_0\ : STD_LOGIC;
  signal tx : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \tx[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx[10]_i_1_n_0\ : STD_LOGIC;
  signal \tx[11]_i_1_n_0\ : STD_LOGIC;
  signal \tx[12]_i_1_n_0\ : STD_LOGIC;
  signal \tx[13]_i_1_n_0\ : STD_LOGIC;
  signal \tx[14]_i_2_n_0\ : STD_LOGIC;
  signal \tx[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx[23]_i_1_n_0\ : STD_LOGIC;
  signal \tx[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx[4]_i_1_n_0\ : STD_LOGIC;
  signal \tx[5]_i_1_n_0\ : STD_LOGIC;
  signal \tx[6]_i_1_n_0\ : STD_LOGIC;
  signal \tx[7]_i_1_n_0\ : STD_LOGIC;
  signal \tx[8]_i_1_n_0\ : STD_LOGIC;
  signal \tx[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bit_index[1]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bit_index[2]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bit_index[4]_i_4\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \bit_index[4]_i_5\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \busy_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \cs_n_i_2__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \dac_index[5]_i_8\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \divider[0]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \divider[2]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \divider[3]_i_1__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \divider[4]_i_2__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \done_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \error_code[3]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \poll_count[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \poll_count[10]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \poll_count[11]_i_13\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \poll_count[11]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \poll_count[11]_i_6\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \poll_count[11]_i_7\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \poll_count[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \poll_count[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \poll_count[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \poll_count[4]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \poll_count[5]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \poll_count[6]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \poll_count[7]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \poll_count[8]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \poll_count[9]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \sclk_i_2__0\ : label is "soft_lutpair18";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sdio_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sdio_meta_reg : label is "yes";
  attribute SOFT_HLUTNM of sdio_oe_i_3 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \sdio_out_i_10__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \sdio_out_i_5__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \sdio_out_i_7__0\ : label is "soft_lutpair15";
  attribute ASYNC_REG_boolean of sdio_sync_reg : label is std.standard.true;
  attribute KEEP of sdio_sync_reg : label is "yes";
  attribute SOFT_HLUTNM of \state[3]_i_6\ : label is "soft_lutpair21";
begin
  dac_sdio_o <= \^dac_sdio_o\;
  dac_spi_csb <= \^dac_spi_csb\;
  done_reg_0 <= \^done_reg_0\;
  sclk_reg_0 <= \^sclk_reg_0\;
\bit_index[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => dac_start,
      I2 => busy_reg_n_0,
      O => \bit_index[0]_i_1__0_n_0\
    );
\bit_index[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"99F9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[0]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => dac_start,
      I3 => busy_reg_n_0,
      O => \bit_index[1]_i_1__0_n_0\
    );
\bit_index[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E1E1FFE1"
    )
        port map (
      I0 => \bit_index_reg_n_0_[1]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => \bit_index_reg_n_0_[2]\,
      I3 => dac_start,
      I4 => busy_reg_n_0,
      O => \bit_index[2]_i_1__0_n_0\
    );
\bit_index[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4540454000004540"
    )
        port map (
      I0 => rst_sys,
      I1 => \bit_index[3]_i_2__0_n_0\,
      I2 => bit_index(0),
      I3 => \bit_index_reg_n_0_[3]\,
      I4 => dac_start,
      I5 => busy_reg_n_0,
      O => \bit_index[3]_i_1__0_n_0\
    );
\bit_index[3]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      O => \bit_index[3]_i_2__0_n_0\
    );
\bit_index[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => bit_index(0),
      I1 => dac_start,
      I2 => busy_reg_n_0,
      O => \bit_index[4]_i_1__0_n_0\
    );
\bit_index[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE0001FFFFFFFF"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \bit_index_reg_n_0_[4]\,
      I5 => \bit_index[4]_i_4_n_0\,
      O => \bit_index[4]_i_2__0_n_0\
    );
\bit_index[4]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => \bit_index[4]_i_5_n_0\,
      I2 => \cs_n_i_2__0_n_0\,
      I3 => \divider__0\(3),
      I4 => \divider__0\(4),
      I5 => \^sclk_reg_0\,
      O => bit_index(0)
    );
\bit_index[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => dac_start,
      O => \bit_index[4]_i_4_n_0\
    );
\bit_index[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \divider__0\(0),
      I1 => \divider__0\(2),
      I2 => \divider__0\(1),
      O => \bit_index[4]_i_5_n_0\
    );
\bit_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1__0_n_0\,
      D => \bit_index[0]_i_1__0_n_0\,
      Q => \bit_index_reg_n_0_[0]\,
      R => rst_sys
    );
\bit_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1__0_n_0\,
      D => \bit_index[1]_i_1__0_n_0\,
      Q => \bit_index_reg_n_0_[1]\,
      R => rst_sys
    );
\bit_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1__0_n_0\,
      D => \bit_index[2]_i_1__0_n_0\,
      Q => \bit_index_reg_n_0_[2]\,
      R => rst_sys
    );
\bit_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \bit_index[3]_i_1__0_n_0\,
      Q => \bit_index_reg_n_0_[3]\,
      R => '0'
    );
\bit_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \bit_index[4]_i_1__0_n_0\,
      D => \bit_index[4]_i_2__0_n_0\,
      Q => \bit_index_reg_n_0_[4]\,
      R => rst_sys
    );
\busy_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F7FFF00"
    )
        port map (
      I0 => \cs_n_i_2__0_n_0\,
      I1 => \^sclk_reg_0\,
      I2 => \sclk_i_2__0_n_0\,
      I3 => dac_start,
      I4 => busy_reg_n_0,
      O => \busy_i_1__0_n_0\
    );
busy_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \busy_i_1__0_n_0\,
      Q => busy_reg_n_0,
      R => rst_sys
    );
\cs_n_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5555C0005555"
    )
        port map (
      I0 => dac_start,
      I1 => \cs_n_i_2__0_n_0\,
      I2 => \sclk_i_2__0_n_0\,
      I3 => \^sclk_reg_0\,
      I4 => busy_reg_n_0,
      I5 => \^dac_spi_csb\,
      O => \cs_n_i_1__0_n_0\
    );
\cs_n_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \bit_index_reg_n_0_[3]\,
      I1 => \bit_index_reg_n_0_[1]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \bit_index_reg_n_0_[4]\,
      O => \cs_n_i_2__0_n_0\
    );
cs_n_reg: unisim.vcomponents.FDSE
     port map (
      C => clk_50m,
      CE => '1',
      D => \cs_n_i_1__0_n_0\,
      Q => \^dac_spi_csb\,
      S => rst_sys
    );
dac_config_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => dac_config_done_i_2_n_0,
      I1 => \^done_reg_0\,
      I2 => dac_config_done_reg_0,
      I3 => dac_config_done_reg_1,
      I4 => dac_config_done_reg_2,
      I5 => dac_config_done_reg_3(0),
      O => dac_config_done_reg
    );
dac_config_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88C0"
    )
        port map (
      I0 => dco_alive,
      I1 => \error_code_reg[1]\(0),
      I2 => dac_done,
      I3 => \error_code_reg[1]\(1),
      O => dac_config_done_i_2_n_0
    );
\dac_index[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88F8888888888888"
    )
        port map (
      I0 => dac_config_done_reg_0,
      I1 => \^done_reg_0\,
      I2 => \dac_index_reg[0]\,
      I3 => \error_code_reg[1]\(2),
      I4 => \error_code_reg[1]\(0),
      I5 => dco_alive,
      O => \state_reg[2]\(0)
    );
\dac_index[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => \error_code_reg[0]\,
      I1 => \state1__11\,
      I2 => state14_out,
      I3 => dac_done,
      I4 => \error_code_reg[1]\(0),
      I5 => \error_code_reg[1]\(2),
      O => \^done_reg_0\
    );
\dac_index[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD55555515"
    )
        port map (
      I0 => dac_config_done_reg_0,
      I1 => dac_rdata(0),
      I2 => dac_rdata(1),
      I3 => \dac_index[5]_i_8_n_0\,
      I4 => dac_rdata(6),
      I5 => \state[3]_i_6_0\,
      O => \state1__11\
    );
\dac_index[5]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => dac_rdata(5),
      I1 => dac_rdata(7),
      I2 => dac_rdata(3),
      I3 => dac_rdata(2),
      I4 => dac_rdata(4),
      O => \dac_index[5]_i_8_n_0\
    );
dac_sdio_iobuf_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sdio_oe_reg_n_0,
      O => dac_sdio_t
    );
dac_start_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => \error_code_reg[1]\(3),
      I2 => \error_code_reg[1]\(1),
      I3 => \error_code_reg[1]\(0),
      I4 => \error_code_reg[1]\(2),
      O => busy_reg_0
    );
\divider[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFF7"
    )
        port map (
      I0 => \divider__0\(4),
      I1 => \divider__0\(3),
      I2 => \divider__0\(2),
      I3 => \divider__0\(1),
      I4 => \divider__0\(0),
      O => divider0_out(0)
    );
\divider[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(0),
      O => divider0_out(1)
    );
\divider[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6C"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(2),
      I2 => \divider__0\(0),
      O => divider0_out(2)
    );
\divider[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7E807F80"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(2),
      I2 => \divider__0\(0),
      I3 => \divider__0\(3),
      I4 => \divider__0\(4),
      O => divider0_out(3)
    );
\divider[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => rst_sys,
      I1 => dac_start,
      I2 => busy_reg_n_0,
      O => \divider[4]_i_1__0_n_0\
    );
\divider[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7EFF8000"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(2),
      I2 => \divider__0\(0),
      I3 => \divider__0\(3),
      I4 => \divider__0\(4),
      O => divider0_out(4)
    );
\divider_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(0),
      Q => \divider__0\(0),
      R => \divider[4]_i_1__0_n_0\
    );
\divider_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(1),
      Q => \divider__0\(1),
      R => \divider[4]_i_1__0_n_0\
    );
\divider_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(2),
      Q => \divider__0\(2),
      R => \divider[4]_i_1__0_n_0\
    );
\divider_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(3),
      Q => \divider__0\(3),
      R => \divider[4]_i_1__0_n_0\
    );
\divider_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => busy_reg_n_0,
      D => divider0_out(4),
      Q => \divider__0\(4),
      R => \divider[4]_i_1__0_n_0\
    );
\done_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \cs_n_i_2__0_n_0\,
      I1 => busy_reg_n_0,
      I2 => rst_sys,
      I3 => \sclk_i_2__0_n_0\,
      I4 => \^sclk_reg_0\,
      O => \done_i_1__0_n_0\
    );
done_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \done_i_1__0_n_0\,
      Q => dac_done,
      R => '0'
    );
\error_code[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDFDDDDDDDDDDD"
    )
        port map (
      I0 => state14_out,
      I1 => \error_code_reg[0]\,
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(0),
      I5 => \error_code_reg[0]_0\,
      O => D(0)
    );
\error_code[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000004"
    )
        port map (
      I0 => \error_code_reg[1]\(1),
      I1 => state14_out,
      I2 => Q(5),
      I3 => Q(4),
      I4 => \error_code_reg[1]_0\,
      I5 => \error_code_reg[1]\(3),
      O => D(1)
    );
\error_code[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55555551"
    )
        port map (
      I0 => \error_code_reg[1]\(1),
      I1 => state14_out,
      I2 => Q(5),
      I3 => Q(4),
      I4 => \error_code_reg[1]_0\,
      I5 => \error_code_reg[1]\(3),
      O => D(2)
    );
\error_code[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAFFEAEAEAEAEAEA"
    )
        port map (
      I0 => \error_code_reg[0]_1\,
      I1 => \error_code[3]_i_3_n_0\,
      I2 => \state[3]_i_6_n_0\,
      I3 => dco_alive,
      I4 => \error_code_reg[0]_2\,
      I5 => \error_code_reg[0]_3\,
      O => E(0)
    );
\error_code[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => dac_done,
      I1 => \error_code_reg[1]\(0),
      I2 => \error_code_reg[1]\(2),
      I3 => \error_code_reg[1]\(1),
      O => \error_code[3]_i_3_n_0\
    );
\poll_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state14_out,
      I1 => \poll_count_reg[0]_0\(0),
      O => \read_data_reg[1]_1\(0)
    );
\poll_count[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(9),
      O => \read_data_reg[1]_1\(10)
    );
\poll_count[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF02020200000000"
    )
        port map (
      I0 => state14_out,
      I1 => \error_code_reg[0]\,
      I2 => \poll_count_reg[0]\,
      I3 => dac_config_done_reg_0,
      I4 => \poll_count[11]_i_6_n_0\,
      I5 => \poll_count[11]_i_7_n_0\,
      O => \read_data_reg[1]_0\(0)
    );
\poll_count[11]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000808000FF0000"
    )
        port map (
      I0 => dac_rdata(2),
      I1 => dac_rdata(0),
      I2 => \poll_count[11]_i_13_n_0\,
      I3 => \dac_index[5]_i_8_n_0\,
      I4 => dac_rdata(6),
      I5 => dac_rdata(1),
      O => state4
    );
\poll_count[11]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => dac_rdata(5),
      I1 => dac_rdata(4),
      I2 => dac_rdata(3),
      I3 => dac_rdata(7),
      O => \poll_count[11]_i_13_n_0\
    );
\poll_count[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(10),
      O => \read_data_reg[1]_1\(11)
    );
\poll_count[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000F00BBAA"
    )
        port map (
      I0 => \poll_count[11]_i_9_n_0\,
      I1 => dac_rdata(1),
      I2 => state4,
      I3 => \error_code_reg[0]_0\,
      I4 => Q(0),
      I5 => \poll_count_reg[11]\,
      O => state14_out
    );
\poll_count[11]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => state14_out,
      I1 => \state1__11\,
      I2 => \error_code_reg[1]\(1),
      I3 => \error_code_reg[1]\(3),
      O => \poll_count[11]_i_6_n_0\
    );
\poll_count[11]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \error_code_reg[1]\(2),
      I1 => \error_code_reg[1]\(0),
      I2 => dac_done,
      O => \poll_count[11]_i_7_n_0\
    );
\poll_count[11]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => Q(4),
      I1 => Q(5),
      I2 => Q(3),
      I3 => dac_rdata(7),
      O => \poll_count[11]_i_9_n_0\
    );
\poll_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(0),
      O => \read_data_reg[1]_1\(1)
    );
\poll_count[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(1),
      O => \read_data_reg[1]_1\(2)
    );
\poll_count[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(2),
      O => \read_data_reg[1]_1\(3)
    );
\poll_count[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(3),
      O => \read_data_reg[1]_1\(4)
    );
\poll_count[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(4),
      O => \read_data_reg[1]_1\(5)
    );
\poll_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(5),
      O => \read_data_reg[1]_1\(6)
    );
\poll_count[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(6),
      O => \read_data_reg[1]_1\(7)
    );
\poll_count[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(7),
      O => \read_data_reg[1]_1\(8)
    );
\poll_count[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state14_out,
      I1 => poll_count0(8),
      O => \read_data_reg[1]_1\(9)
    );
\read_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => \^sclk_reg_0\,
      I2 => \bit_index_reg_n_0_[4]\,
      I3 => \bit_index_reg_n_0_[3]\,
      I4 => tx(23),
      I5 => \sclk_i_2__0_n_0\,
      O => \read_data[7]_i_1_n_0\
    );
\read_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => sdio_sync,
      Q => dac_rdata(0),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(0),
      Q => dac_rdata(1),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(1),
      Q => dac_rdata(2),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(2),
      Q => dac_rdata(3),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(3),
      Q => dac_rdata(4),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(4),
      Q => dac_rdata(5),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(5),
      Q => dac_rdata(6),
      R => \divider[4]_i_1__0_n_0\
    );
\read_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => \read_data[7]_i_1_n_0\,
      D => dac_rdata(6),
      Q => dac_rdata(7),
      R => \divider[4]_i_1__0_n_0\
    );
\sclk_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => rst_sys,
      I1 => busy_reg_n_0,
      I2 => \^sclk_reg_0\,
      I3 => \sclk_i_2__0_n_0\,
      O => \sclk_i_1__0_n_0\
    );
\sclk_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \divider__0\(1),
      I1 => \divider__0\(2),
      I2 => \divider__0\(0),
      I3 => \divider__0\(3),
      I4 => \divider__0\(4),
      O => \sclk_i_2__0_n_0\
    );
sclk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \sclk_i_1__0_n_0\,
      Q => \^sclk_reg_0\,
      R => '0'
    );
sdio_meta_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => dac_sdio_i,
      Q => sdio_meta,
      R => rst_sys
    );
sdio_oe_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22222FFF22222000"
    )
        port map (
      I0 => dac_start,
      I1 => busy_reg_n_0,
      I2 => \sclk_i_2__0_n_0\,
      I3 => sdio_oe_i_2_n_0,
      I4 => sdio_oe_i_3_n_0,
      I5 => sdio_oe_reg_n_0,
      O => sdio_oe_i_1_n_0
    );
sdio_oe_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => tx(23),
      I1 => \^sclk_reg_0\,
      I2 => \bit_index_reg_n_0_[4]\,
      I3 => \bit_index_reg_n_0_[2]\,
      I4 => \bit_index_reg_n_0_[0]\,
      I5 => \bit_index_reg_n_0_[1]\,
      O => sdio_oe_i_2_n_0
    );
sdio_oe_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => \cs_n_i_2__0_n_0\,
      I1 => \sclk_i_2__0_n_0\,
      I2 => \^sclk_reg_0\,
      I3 => busy_reg_n_0,
      O => sdio_oe_i_3_n_0
    );
sdio_oe_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => sdio_oe_i_1_n_0,
      Q => sdio_oe_reg_n_0,
      R => rst_sys
    );
\sdio_out_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[2]\,
      I1 => \bit_index_reg_n_0_[0]\,
      I2 => \bit_index_reg_n_0_[1]\,
      O => \sdio_out_i_10__0_n_0\
    );
\sdio_out_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFCA0FCAF0CA00C"
    )
        port map (
      I0 => tx(2),
      I1 => tx(3),
      I2 => \bit_index_reg_n_0_[1]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => tx(0),
      I5 => tx(1),
      O => \sdio_out_i_11__0_n_0\
    );
\sdio_out_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFCA0FCAF0CA00C"
    )
        port map (
      I0 => tx(10),
      I1 => tx(11),
      I2 => \bit_index_reg_n_0_[1]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => tx(8),
      I5 => tx(9),
      O => \sdio_out_i_12__0_n_0\
    );
\sdio_out_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBAB88A8"
    )
        port map (
      I0 => \sdio_out_i_2__0_n_0\,
      I1 => \sdio_out_i_3__0_n_0\,
      I2 => dac_start,
      I3 => busy_reg_n_0,
      I4 => \^dac_sdio_o\,
      O => \sdio_out_i_1__0_n_0\
    );
\sdio_out_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F1F1FF001111"
    )
        port map (
      I0 => Q(5),
      I1 => \sdio_out_i_4__0_n_0\,
      I2 => \sdio_out_i_5__0_n_0\,
      I3 => \sdio_out_i_6__0_n_0\,
      I4 => busy_reg_n_0,
      I5 => \sdio_out_i_7__0_n_0\,
      O => \sdio_out_i_2__0_n_0\
    );
\sdio_out_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => \bit_index[4]_i_5_n_0\,
      I1 => \divider__0\(3),
      I2 => busy_reg_n_0,
      I3 => \cs_n_i_2__0_n_0\,
      I4 => \divider__0\(4),
      I5 => \^sclk_reg_0\,
      O => \sdio_out_i_3__0_n_0\
    );
\sdio_out_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F77FF777"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(3),
      I3 => Q(4),
      I4 => Q(0),
      O => \sdio_out_i_4__0_n_0\
    );
\sdio_out_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => tx(23),
      I1 => busy_reg_n_0,
      I2 => \bit_index_reg_n_0_[1]\,
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[2]\,
      O => \sdio_out_i_5__0_n_0\
    );
\sdio_out_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCFAFA0CCCCAFA0"
    )
        port map (
      I0 => \sdio_out_i_8__0_n_0\,
      I1 => \sdio_out_i_9__0_n_0\,
      I2 => \sdio_out_i_10__0_n_0\,
      I3 => \sdio_out_i_11__0_n_0\,
      I4 => \bit_index[3]_i_2__0_n_0\,
      I5 => \sdio_out_i_12__0_n_0\,
      O => \sdio_out_i_6__0_n_0\
    );
\sdio_out_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \bit_index_reg_n_0_[4]\,
      I1 => \bit_index_reg_n_0_[2]\,
      I2 => \bit_index_reg_n_0_[0]\,
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => \bit_index_reg_n_0_[3]\,
      O => \sdio_out_i_7__0_n_0\
    );
\sdio_out_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCF0AAFFCCF0AA00"
    )
        port map (
      I0 => tx(4),
      I1 => tx(6),
      I2 => tx(5),
      I3 => \bit_index_reg_n_0_[0]\,
      I4 => \bit_index_reg_n_0_[1]\,
      I5 => tx(7),
      O => \sdio_out_i_8__0_n_0\
    );
\sdio_out_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0CCAA0000000000"
    )
        port map (
      I0 => tx(13),
      I1 => tx(12),
      I2 => tx(14),
      I3 => \bit_index_reg_n_0_[1]\,
      I4 => \bit_index_reg_n_0_[0]\,
      I5 => \bit_index_reg_n_0_[2]\,
      O => \sdio_out_i_9__0_n_0\
    );
sdio_out_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => \sdio_out_i_1__0_n_0\,
      Q => \^dac_sdio_o\,
      R => rst_sys
    );
sdio_sync_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => sdio_meta,
      Q => sdio_sync,
      R => rst_sys
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01011111FF011111"
    )
        port map (
      I0 => \error_code_reg[1]\(0),
      I1 => \error_code_reg[1]\(3),
      I2 => \error_code_reg[1]\(1),
      I3 => \poll_count[11]_i_6_n_0\,
      I4 => \error_code_reg[1]\(2),
      I5 => dac_config_done_reg_0,
      O => \state_reg[1]\(0)
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEAEAAAAAAAAAAAA"
    )
        port map (
      I0 => \state_reg[1]_0\,
      I1 => \poll_count[11]_i_6_n_0\,
      I2 => dac_config_done_reg_0,
      I3 => \state_reg[1]_1\,
      I4 => \error_code_reg[1]\(2),
      I5 => \error_code_reg[1]\(0),
      O => \state_reg[1]\(1)
    );
\state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055885F00"
    )
        port map (
      I0 => \error_code_reg[1]\(0),
      I1 => dco_alive,
      I2 => \state[3]_i_6_n_0\,
      I3 => \error_code_reg[1]\(2),
      I4 => \error_code_reg[1]\(1),
      I5 => \error_code_reg[1]\(3),
      O => \state_reg[1]\(2)
    );
\state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAFAEABAAABAAA"
    )
        port map (
      I0 => \state[3]_i_3_n_0\,
      I1 => \error_code_reg[1]\(2),
      I2 => \error_code_reg[1]\(1),
      I3 => \error_code_reg[0]_2\,
      I4 => \error_code_reg[1]\(0),
      I5 => data6,
      O => \state_reg[2]_0\(0)
    );
\state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0F2F0FAF0F2F0"
    )
        port map (
      I0 => \error_code_reg[1]\(1),
      I1 => dco_alive,
      I2 => \error_code_reg[1]\(3),
      I3 => \error_code_reg[1]\(0),
      I4 => \error_code_reg[1]\(2),
      I5 => \state[3]_i_6_n_0\,
      O => \state_reg[1]\(3)
    );
\state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFAEAAAAAAAEA"
    )
        port map (
      I0 => \state[3]_i_7_n_0\,
      I1 => adk_done,
      I2 => \error_code_reg[1]\(0),
      I3 => \error_code_reg[1]\(2),
      I4 => \error_code_reg[1]\(1),
      I5 => dac_done,
      O => \state[3]_i_3_n_0\
    );
\state[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \poll_count_reg[0]\,
      I1 => state14_out,
      I2 => \state1__11\,
      O => \state[3]_i_6_n_0\
    );
\state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF01C00100"
    )
        port map (
      I0 => busy_reg_n_0,
      I1 => \error_code_reg[1]\(1),
      I2 => \error_code_reg[1]\(0),
      I3 => \error_code_reg[1]\(2),
      I4 => dco_alive,
      I5 => \state[3]_i_3_0\,
      O => \state[3]_i_7_n_0\
    );
\tx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000427330"
    )
        port map (
      I0 => Q(4),
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(5),
      O => \tx[0]_i_1_n_0\
    );
\tx[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000037112226"
    )
        port map (
      I0 => Q(3),
      I1 => Q(4),
      I2 => Q(0),
      I3 => Q(2),
      I4 => Q(1),
      I5 => Q(5),
      O => \tx[10]_i_1_n_0\
    );
\tx[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0011001150440440"
    )
        port map (
      I0 => Q(5),
      I1 => Q(4),
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(3),
      O => \tx[11]_i_1_n_0\
    );
\tx[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010203020312"
    )
        port map (
      I0 => Q(2),
      I1 => Q(5),
      I2 => Q(3),
      I3 => Q(1),
      I4 => Q(0),
      I5 => Q(4),
      O => \tx[12]_i_1_n_0\
    );
\tx[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1410141010010004"
    )
        port map (
      I0 => Q(5),
      I1 => Q(4),
      I2 => Q(3),
      I3 => Q(1),
      I4 => Q(0),
      I5 => Q(2),
      O => \tx[13]_i_1_n_0\
    );
\tx[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => dac_start,
      I1 => busy_reg_n_0,
      O => is_read4_out
    );
\tx[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000010"
    )
        port map (
      I0 => Q(5),
      I1 => Q(4),
      I2 => Q(3),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(0),
      O => \tx[14]_i_2_n_0\
    );
\tx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000200010000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(5),
      I2 => Q(4),
      I3 => Q(2),
      I4 => Q(1),
      I5 => Q(0),
      O => \tx[1]_i_1_n_0\
    );
\tx[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0551000000000000"
    )
        port map (
      I0 => Q(5),
      I1 => Q(0),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(1),
      I5 => Q(2),
      O => \tx[23]_i_1_n_0\
    );
\tx[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000030008"
    )
        port map (
      I0 => Q(0),
      I1 => Q(3),
      I2 => Q(5),
      I3 => Q(4),
      I4 => Q(1),
      I5 => Q(2),
      O => \tx[2]_i_1_n_0\
    );
\tx[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(4),
      I3 => Q(5),
      I4 => Q(3),
      O => \tx[3]_i_1_n_0\
    );
\tx[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000060000"
    )
        port map (
      I0 => Q(3),
      I1 => Q(4),
      I2 => Q(5),
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => \tx[4]_i_1_n_0\
    );
\tx[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000003000207"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(5),
      I3 => Q(4),
      I4 => Q(0),
      I5 => Q(2),
      O => \tx[5]_i_1_n_0\
    );
\tx[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000101F8"
    )
        port map (
      I0 => Q(4),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      I4 => Q(3),
      I5 => Q(5),
      O => \tx[6]_i_1_n_0\
    );
\tx[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00110110"
    )
        port map (
      I0 => Q(3),
      I1 => Q(5),
      I2 => Q(4),
      I3 => Q(2),
      I4 => Q(1),
      O => \tx[7]_i_1_n_0\
    );
\tx[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010010414041014"
    )
        port map (
      I0 => Q(5),
      I1 => Q(4),
      I2 => Q(3),
      I3 => Q(0),
      I4 => Q(2),
      I5 => Q(1),
      O => \tx[8]_i_1_n_0\
    );
\tx[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0014014400050544"
    )
        port map (
      I0 => Q(5),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(3),
      I4 => Q(4),
      I5 => Q(1),
      O => \tx[9]_i_1_n_0\
    );
\tx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[0]_i_1_n_0\,
      Q => tx(0),
      R => rst_sys
    );
\tx_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[10]_i_1_n_0\,
      Q => tx(10),
      R => rst_sys
    );
\tx_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[11]_i_1_n_0\,
      Q => tx(11),
      R => rst_sys
    );
\tx_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[12]_i_1_n_0\,
      Q => tx(12),
      R => rst_sys
    );
\tx_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[13]_i_1_n_0\,
      Q => tx(13),
      R => rst_sys
    );
\tx_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[14]_i_2_n_0\,
      Q => tx(14),
      R => rst_sys
    );
\tx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[1]_i_1_n_0\,
      Q => tx(1),
      R => rst_sys
    );
\tx_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[23]_i_1_n_0\,
      Q => tx(23),
      R => rst_sys
    );
\tx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[2]_i_1_n_0\,
      Q => tx(2),
      R => rst_sys
    );
\tx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[3]_i_1_n_0\,
      Q => tx(3),
      R => rst_sys
    );
\tx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[4]_i_1_n_0\,
      Q => tx(4),
      R => rst_sys
    );
\tx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[5]_i_1_n_0\,
      Q => tx(5),
      R => rst_sys
    );
\tx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[6]_i_1_n_0\,
      Q => tx(6),
      R => rst_sys
    );
\tx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[7]_i_1_n_0\,
      Q => tx(7),
      R => rst_sys
    );
\tx_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[8]_i_1_n_0\,
      Q => tx(8),
      R => rst_sys
    );
\tx_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => is_read4_out,
      D => \tx[9]_i_1_n_0\,
      Q => tx(9),
      R => rst_sys
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_sync_pulse_engine is
  port (
    source_frame_start : out STD_LOGIC;
    source_frame_last : out STD_LOGIC;
    tx_reset : out STD_LOGIC;
    running_reg_0 : out STD_LOGIC;
    \pulse_ready_dac__1\ : out STD_LOGIC;
    p_29_in : out STD_LOGIC;
    i_sample : out STD_LOGIC_VECTOR ( 1 downto 0 );
    launch_marker0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk_dac : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    running15_out : in STD_LOGIC;
    \source_sample_reg[14]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \source_sample_reg[14]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \source_sample_reg[12]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \source_sample_reg[12]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    repeat_enable : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_sync_pulse_engine : entity is "sync_pulse_engine";
end system_frontend_0_0_sync_pulse_engine;

architecture STRUCTURE of system_frontend_0_0_sync_pulse_engine is
  signal \_inferred__2/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_3\ : STD_LOGIC;
  signal cycle_index : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \cycle_index[10]_i_1_n_0\ : STD_LOGIC;
  signal \cycle_index[10]_i_4_n_0\ : STD_LOGIC;
  signal \cycle_index[10]_i_5_n_0\ : STD_LOGIC;
  signal \cycle_index[5]_i_2_n_0\ : STD_LOGIC;
  signal \cycle_index[9]_i_2_n_0\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[10]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[4]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[5]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[6]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[7]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[8]\ : STD_LOGIC;
  signal \cycle_index_reg_n_0_[9]\ : STD_LOGIC;
  signal \frame_id[0]_i_2_n_0\ : STD_LOGIC;
  signal frame_id_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \frame_id_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \frame_id_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \frame_id_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \frame_id_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \frame_id_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal in_frame : STD_LOGIC;
  signal \mode_latched[0]_i_1_n_0\ : STD_LOGIC;
  signal \mode_latched[1]_i_1_n_0\ : STD_LOGIC;
  signal \mode_latched[2]_i_1_n_0\ : STD_LOGIC;
  signal \mode_latched_reg_n_0_[0]\ : STD_LOGIC;
  signal \mode_latched_reg_n_0_[1]\ : STD_LOGIC;
  signal \mode_latched_reg_n_0_[2]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal p_1_in : STD_LOGIC;
  signal \^p_29_in\ : STD_LOGIC;
  signal pn_hold1_out : STD_LOGIC;
  signal pn_hold_i_1_n_0 : STD_LOGIC;
  signal pn_hold_i_3_n_0 : STD_LOGIC;
  signal pn_hold_reg_n_0 : STD_LOGIC;
  signal pn_latched : STD_LOGIC;
  signal pn_latched8_out : STD_LOGIC;
  signal \pn_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_2_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_3_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_4_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_5_n_0\ : STD_LOGIC;
  signal \pn_state[6]_i_6_n_0\ : STD_LOGIC;
  signal pulse_on : STD_LOGIC;
  signal \^pulse_ready_dac__1\ : STD_LOGIC;
  signal \running0__11\ : STD_LOGIC;
  signal running16_in : STD_LOGIC;
  signal running_i_1_n_0 : STD_LOGIC;
  signal \^running_reg_0\ : STD_LOGIC;
  signal source_frame_active : STD_LOGIC;
  signal \source_frame_id[15]_i_1_n_0\ : STD_LOGIC;
  signal \^source_frame_last\ : STD_LOGIC;
  signal source_frame_last0 : STD_LOGIC;
  signal \^source_frame_start\ : STD_LOGIC;
  signal source_frame_start0 : STD_LOGIC;
  signal source_frame_start_i_2_n_0 : STD_LOGIC;
  signal source_frame_start_i_3_n_0 : STD_LOGIC;
  signal \source_index[8]_i_1_n_0\ : STD_LOGIC;
  signal source_marker : STD_LOGIC;
  signal source_marker_i_1_n_0 : STD_LOGIC;
  signal source_marker_i_2_n_0 : STD_LOGIC;
  signal source_marker_i_3_n_0 : STD_LOGIC;
  signal source_owned : STD_LOGIC;
  signal source_owned_i_1_n_0 : STD_LOGIC;
  signal source_sample : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal source_sample3 : STD_LOGIC;
  signal \source_sample3_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__0_n_1\ : STD_LOGIC;
  signal \source_sample3_carry__0_n_2\ : STD_LOGIC;
  signal \source_sample3_carry__0_n_3\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__1_n_1\ : STD_LOGIC;
  signal \source_sample3_carry__1_n_2\ : STD_LOGIC;
  signal \source_sample3_carry__1_n_3\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \source_sample3_carry__2_n_1\ : STD_LOGIC;
  signal \source_sample3_carry__2_n_2\ : STD_LOGIC;
  signal \source_sample3_carry__2_n_3\ : STD_LOGIC;
  signal source_sample3_carry_i_1_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_2_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_3_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_4_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_5_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_6_n_0 : STD_LOGIC;
  signal source_sample3_carry_i_7_n_0 : STD_LOGIC;
  signal source_sample3_carry_n_0 : STD_LOGIC;
  signal source_sample3_carry_n_1 : STD_LOGIC;
  signal source_sample3_carry_n_2 : STD_LOGIC;
  signal source_sample3_carry_n_3 : STD_LOGIC;
  signal source_sample40_in : STD_LOGIC_VECTOR ( 31 to 31 );
  signal \source_sample[12]_i_1_n_0\ : STD_LOGIC;
  signal \source_sample[14]_i_1_n_0\ : STD_LOGIC;
  signal \source_sample[14]_i_2_n_0\ : STD_LOGIC;
  signal source_tx_active : STD_LOGIC;
  signal source_tx_active_i_1_n_0 : STD_LOGIC;
  signal \^tx_reset\ : STD_LOGIC;
  signal width_latched : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \width_latched[5]_i_10_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_11_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_12_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_13_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_3_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_4_n_0\ : STD_LOGIC;
  signal \width_latched[5]_i_8_n_0\ : STD_LOGIC;
  signal \NLW__inferred__2/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__2/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__2/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW__inferred__2/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_frame_id_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_source_sample3_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_source_sample3_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_source_sample3_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_source_sample3_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cycle_index[0]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \cycle_index[10]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \cycle_index[10]_i_3\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \cycle_index[10]_i_4\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \cycle_index[1]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \cycle_index[2]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \cycle_index[3]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \cycle_index[5]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \cycle_index[6]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \cycle_index[7]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \cycle_index[8]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \data_bit[12].data_oddr_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \data_bit[13].data_oddr_i_1\ : label is "soft_lutpair54";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \frame_id_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \frame_id_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \frame_id_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \frame_id_reg[8]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of launch_marker_i_1 : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \launch_meta[10]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \launch_meta[11]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \launch_meta[12]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \mode_latched[1]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \mode_latched[2]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \pn_state[1]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \pn_state[2]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \pn_state[3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \pn_state[4]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \pn_state[5]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \pn_state[6]_i_2\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \pn_state[6]_i_3\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \pn_state[6]_i_6\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of source_frame_start_i_2 : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of source_frame_start_i_3 : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of source_marker_i_1 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of source_owned_i_1 : label is "soft_lutpair46";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of source_sample3_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \source_sample3_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \source_sample3_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \source_sample3_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of \width_latched[5]_i_10\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \width_latched[5]_i_11\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \width_latched[5]_i_13\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \width_latched[5]_i_6\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \width_latched[5]_i_8\ : label is "soft_lutpair48";
begin
  p_29_in <= \^p_29_in\;
  \pulse_ready_dac__1\ <= \^pulse_ready_dac__1\;
  running_reg_0 <= \^running_reg_0\;
  source_frame_last <= \^source_frame_last\;
  source_frame_start <= \^source_frame_start\;
  tx_reset <= \^tx_reset\;
\_inferred__2/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__2/i__carry_n_0\,
      CO(2) => \_inferred__2/i__carry_n_1\,
      CO(1) => \_inferred__2/i__carry_n_2\,
      CO(0) => \_inferred__2/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \cycle_index_reg_n_0_[3]\,
      DI(2) => \cycle_index_reg_n_0_[2]\,
      DI(1) => \cycle_index_reg_n_0_[1]\,
      DI(0) => \cycle_index_reg_n_0_[0]\,
      O(3 downto 0) => \NLW__inferred__2/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\_inferred__2/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry_n_0\,
      CO(3) => \_inferred__2/i__carry__0_n_0\,
      CO(2) => \_inferred__2/i__carry__0_n_1\,
      CO(1) => \_inferred__2/i__carry__0_n_2\,
      CO(0) => \_inferred__2/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \cycle_index_reg_n_0_[7]\,
      DI(2) => \cycle_index_reg_n_0_[6]\,
      DI(1) => \cycle_index_reg_n_0_[5]\,
      DI(0) => \cycle_index_reg_n_0_[4]\,
      O(3 downto 0) => \NLW__inferred__2/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__0_i_1_n_0\,
      S(2) => \i__carry__0_i_2_n_0\,
      S(1) => \i__carry__0_i_3_n_0\,
      S(0) => \i__carry__0_i_4_n_0\
    );
\_inferred__2/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry__0_n_0\,
      CO(3) => \NLW__inferred__2/i__carry__1_CO_UNCONNECTED\(3),
      CO(2) => \_inferred__2/i__carry__1_n_1\,
      CO(1) => \_inferred__2/i__carry__1_n_2\,
      CO(0) => \_inferred__2/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \cycle_index_reg_n_0_[10]\,
      DI(1) => \cycle_index_reg_n_0_[9]\,
      DI(0) => \cycle_index_reg_n_0_[8]\,
      O(3 downto 0) => \NLW__inferred__2/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \i__carry__1_i_1_n_0\,
      S(1) => \i__carry__1_i_2_n_0\,
      S(0) => \i__carry__1_i_3_n_0\
    );
\cycle_index[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[0]\,
      O => cycle_index(0)
    );
\cycle_index[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
        port map (
      I0 => running16_in,
      I1 => \source_sample_reg[14]_0\(0),
      I2 => \source_sample_reg[14]_1\(0),
      I3 => \source_sample_reg[12]_1\(0),
      I4 => \source_sample_reg[12]_0\(0),
      O => \cycle_index[10]_i_1_n_0\
    );
\cycle_index[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[8]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index[10]_i_4_n_0\,
      I3 => \cycle_index[10]_i_5_n_0\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => cycle_index(10)
    );
\cycle_index[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => running15_out,
      I1 => \^running_reg_0\,
      I2 => \running0__11\,
      O => running16_in
    );
\cycle_index[10]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index[9]_i_2_n_0\,
      O => \cycle_index[10]_i_4_n_0\
    );
\cycle_index[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEFFFFFFF"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => \cycle_index_reg_n_0_[5]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      I5 => \width_latched[5]_i_3_n_0\,
      O => \cycle_index[10]_i_5_n_0\
    );
\cycle_index[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[0]\,
      I2 => \cycle_index_reg_n_0_[1]\,
      O => cycle_index(1)
    );
\cycle_index[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[1]\,
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => \cycle_index_reg_n_0_[2]\,
      O => cycle_index(2)
    );
\cycle_index[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[2]\,
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => \cycle_index_reg_n_0_[1]\,
      I4 => \cycle_index_reg_n_0_[3]\,
      O => cycle_index(3)
    );
\cycle_index[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[3]\,
      I2 => \cycle_index_reg_n_0_[1]\,
      I3 => \cycle_index_reg_n_0_[0]\,
      I4 => \cycle_index_reg_n_0_[2]\,
      I5 => \cycle_index_reg_n_0_[4]\,
      O => cycle_index(4)
    );
\cycle_index[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA2AAAAA00800000"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index_reg_n_0_[4]\,
      I2 => \cycle_index_reg_n_0_[2]\,
      I3 => \cycle_index[5]_i_2_n_0\,
      I4 => \cycle_index_reg_n_0_[3]\,
      I5 => \cycle_index_reg_n_0_[5]\,
      O => cycle_index(5)
    );
\cycle_index[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[0]\,
      I1 => \cycle_index_reg_n_0_[1]\,
      O => \cycle_index[5]_i_2_n_0\
    );
\cycle_index[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \cycle_index[9]_i_2_n_0\,
      I1 => \cycle_index[10]_i_5_n_0\,
      I2 => \cycle_index_reg_n_0_[6]\,
      O => cycle_index(6)
    );
\cycle_index[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A20"
    )
        port map (
      I0 => \cycle_index[10]_i_5_n_0\,
      I1 => \cycle_index[9]_i_2_n_0\,
      I2 => \cycle_index_reg_n_0_[6]\,
      I3 => \cycle_index_reg_n_0_[7]\,
      O => cycle_index(7)
    );
\cycle_index[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7000800"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index[9]_i_2_n_0\,
      I3 => \cycle_index[10]_i_5_n_0\,
      I4 => \cycle_index_reg_n_0_[8]\,
      O => cycle_index(8)
    );
\cycle_index[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF000040000000"
    )
        port map (
      I0 => \cycle_index[9]_i_2_n_0\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[7]\,
      I3 => \cycle_index_reg_n_0_[8]\,
      I4 => \cycle_index[10]_i_5_n_0\,
      I5 => \cycle_index_reg_n_0_[9]\,
      O => cycle_index(9)
    );
\cycle_index[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => \cycle_index_reg_n_0_[2]\,
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => \cycle_index_reg_n_0_[1]\,
      I4 => \cycle_index_reg_n_0_[3]\,
      I5 => \cycle_index_reg_n_0_[5]\,
      O => \cycle_index[9]_i_2_n_0\
    );
\cycle_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(0),
      Q => \cycle_index_reg_n_0_[0]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(10),
      Q => \cycle_index_reg_n_0_[10]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(1),
      Q => \cycle_index_reg_n_0_[1]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(2),
      Q => \cycle_index_reg_n_0_[2]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(3),
      Q => \cycle_index_reg_n_0_[3]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(4),
      Q => \cycle_index_reg_n_0_[4]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(5),
      Q => \cycle_index_reg_n_0_[5]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(6),
      Q => \cycle_index_reg_n_0_[6]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(7),
      Q => \cycle_index_reg_n_0_[7]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(8),
      Q => \cycle_index_reg_n_0_[8]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\cycle_index_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \^running_reg_0\,
      D => cycle_index(9),
      Q => \cycle_index_reg_n_0_[9]\,
      R => \cycle_index[10]_i_1_n_0\
    );
\data_bit[0].data_oddr_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \source_sample_reg[12]_0\(0),
      I1 => \source_sample_reg[12]_1\(0),
      O => \^tx_reset\
    );
\data_bit[12].data_oddr_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => \out\(7),
      I1 => \out\(8),
      I2 => \out\(6),
      I3 => source_sample(12),
      O => i_sample(0)
    );
\data_bit[13].data_oddr_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => \out\(7),
      I1 => \out\(8),
      I2 => \out\(6),
      I3 => source_sample(14),
      O => i_sample(1)
    );
\frame_id[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => frame_id_reg(0),
      O => \frame_id[0]_i_2_n_0\
    );
\frame_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[0]_i_1_n_7\,
      Q => frame_id_reg(0),
      R => \^tx_reset\
    );
\frame_id_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \frame_id_reg[0]_i_1_n_0\,
      CO(2) => \frame_id_reg[0]_i_1_n_1\,
      CO(1) => \frame_id_reg[0]_i_1_n_2\,
      CO(0) => \frame_id_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \frame_id_reg[0]_i_1_n_4\,
      O(2) => \frame_id_reg[0]_i_1_n_5\,
      O(1) => \frame_id_reg[0]_i_1_n_6\,
      O(0) => \frame_id_reg[0]_i_1_n_7\,
      S(3 downto 1) => frame_id_reg(3 downto 1),
      S(0) => \frame_id[0]_i_2_n_0\
    );
\frame_id_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[8]_i_1_n_5\,
      Q => frame_id_reg(10),
      R => \^tx_reset\
    );
\frame_id_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[8]_i_1_n_4\,
      Q => frame_id_reg(11),
      R => \^tx_reset\
    );
\frame_id_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[12]_i_1_n_7\,
      Q => frame_id_reg(12),
      R => \^tx_reset\
    );
\frame_id_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_id_reg[8]_i_1_n_0\,
      CO(3) => \NLW_frame_id_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \frame_id_reg[12]_i_1_n_1\,
      CO(1) => \frame_id_reg[12]_i_1_n_2\,
      CO(0) => \frame_id_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_id_reg[12]_i_1_n_4\,
      O(2) => \frame_id_reg[12]_i_1_n_5\,
      O(1) => \frame_id_reg[12]_i_1_n_6\,
      O(0) => \frame_id_reg[12]_i_1_n_7\,
      S(3 downto 0) => frame_id_reg(15 downto 12)
    );
\frame_id_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[12]_i_1_n_6\,
      Q => frame_id_reg(13),
      R => \^tx_reset\
    );
\frame_id_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[12]_i_1_n_5\,
      Q => frame_id_reg(14),
      R => \^tx_reset\
    );
\frame_id_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[12]_i_1_n_4\,
      Q => frame_id_reg(15),
      R => \^tx_reset\
    );
\frame_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[0]_i_1_n_6\,
      Q => frame_id_reg(1),
      R => \^tx_reset\
    );
\frame_id_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[0]_i_1_n_5\,
      Q => frame_id_reg(2),
      R => \^tx_reset\
    );
\frame_id_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[0]_i_1_n_4\,
      Q => frame_id_reg(3),
      R => \^tx_reset\
    );
\frame_id_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[4]_i_1_n_7\,
      Q => frame_id_reg(4),
      R => \^tx_reset\
    );
\frame_id_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_id_reg[0]_i_1_n_0\,
      CO(3) => \frame_id_reg[4]_i_1_n_0\,
      CO(2) => \frame_id_reg[4]_i_1_n_1\,
      CO(1) => \frame_id_reg[4]_i_1_n_2\,
      CO(0) => \frame_id_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_id_reg[4]_i_1_n_4\,
      O(2) => \frame_id_reg[4]_i_1_n_5\,
      O(1) => \frame_id_reg[4]_i_1_n_6\,
      O(0) => \frame_id_reg[4]_i_1_n_7\,
      S(3 downto 0) => frame_id_reg(7 downto 4)
    );
\frame_id_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[4]_i_1_n_6\,
      Q => frame_id_reg(5),
      R => \^tx_reset\
    );
\frame_id_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[4]_i_1_n_5\,
      Q => frame_id_reg(6),
      R => \^tx_reset\
    );
\frame_id_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[4]_i_1_n_4\,
      Q => frame_id_reg(7),
      R => \^tx_reset\
    );
\frame_id_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[8]_i_1_n_7\,
      Q => frame_id_reg(8),
      R => \^tx_reset\
    );
\frame_id_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_id_reg[4]_i_1_n_0\,
      CO(3) => \frame_id_reg[8]_i_1_n_0\,
      CO(2) => \frame_id_reg[8]_i_1_n_1\,
      CO(1) => \frame_id_reg[8]_i_1_n_2\,
      CO(0) => \frame_id_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_id_reg[8]_i_1_n_4\,
      O(2) => \frame_id_reg[8]_i_1_n_5\,
      O(1) => \frame_id_reg[8]_i_1_n_6\,
      O(0) => \frame_id_reg[8]_i_1_n_7\,
      S(3 downto 0) => frame_id_reg(11 downto 8)
    );
\frame_id_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \frame_id_reg[8]_i_1_n_6\,
      Q => frame_id_reg(9),
      R => \^tx_reset\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[6]\,
      I1 => pn_latched,
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[5]\,
      I1 => pn_latched,
      I2 => width_latched(5),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => pn_latched,
      I2 => width_latched(4),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[9]\,
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[8]\,
      I1 => pn_latched,
      O => \i__carry__1_i_3_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[3]\,
      I1 => pn_latched,
      I2 => width_latched(3),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[2]\,
      I1 => pn_latched,
      I2 => width_latched(2),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[1]\,
      I1 => pn_latched,
      I2 => width_latched(1),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"59"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[0]\,
      I1 => width_latched(0),
      I2 => pn_latched,
      O => \i__carry_i_4_n_0\
    );
launch_marker_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => source_owned,
      I3 => source_marker,
      O => launch_marker0
    );
\launch_meta[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => source_owned,
      I3 => \^source_frame_start\,
      O => D(10)
    );
\launch_meta[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => source_owned,
      I3 => \^source_frame_last\,
      O => D(11)
    );
\launch_meta[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => source_owned,
      I3 => source_tx_active,
      O => D(12)
    );
\launch_meta[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => source_owned,
      I3 => source_frame_active,
      O => D(9)
    );
\mode_latched[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \out\(8),
      I1 => \out\(7),
      I2 => \out\(6),
      O => \mode_latched[0]_i_1_n_0\
    );
\mode_latched[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \out\(6),
      I1 => \out\(8),
      I2 => \out\(7),
      O => \mode_latched[1]_i_1_n_0\
    );
\mode_latched[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \out\(6),
      I1 => \out\(7),
      I2 => \out\(8),
      O => \mode_latched[2]_i_1_n_0\
    );
\mode_latched_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \mode_latched[0]_i_1_n_0\,
      Q => \mode_latched_reg_n_0_[0]\,
      S => \^tx_reset\
    );
\mode_latched_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \mode_latched[1]_i_1_n_0\,
      Q => \mode_latched_reg_n_0_[1]\,
      R => \^tx_reset\
    );
\mode_latched_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \mode_latched[2]_i_1_n_0\,
      Q => \mode_latched_reg_n_0_[2]\,
      S => \^tx_reset\
    );
pn_hold_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABFFFAAAA8000"
    )
        port map (
      I0 => pn_hold1_out,
      I1 => pulse_on,
      I2 => \pn_state[6]_i_3_n_0\,
      I3 => \^pulse_ready_dac__1\,
      I4 => pn_hold_i_3_n_0,
      I5 => pn_hold_reg_n_0,
      O => pn_hold_i_1_n_0
    );
pn_hold_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010001000100000"
    )
        port map (
      I0 => \source_sample_reg[12]_0\(0),
      I1 => \source_sample_reg[12]_1\(0),
      I2 => \^running_reg_0\,
      I3 => pn_hold_reg_n_0,
      I4 => \running0__11\,
      I5 => \cycle_index[10]_i_5_n_0\,
      O => pn_hold1_out
    );
pn_hold_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAA0020"
    )
        port map (
      I0 => \^pulse_ready_dac__1\,
      I1 => \running0__11\,
      I2 => \^running_reg_0\,
      I3 => \cycle_index[10]_i_5_n_0\,
      I4 => running15_out,
      I5 => \^tx_reset\,
      O => pn_hold_i_3_n_0
    );
pn_hold_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pn_hold_i_1_n_0,
      Q => pn_hold_reg_n_0,
      R => '0'
    );
pn_latched_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(9),
      Q => pn_latched,
      R => \^tx_reset\
    );
\pn_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEAAFFFFBEAA0000"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(6),
      I2 => p_1_in,
      I3 => \^running_reg_0\,
      I4 => \pn_state[6]_i_1_n_0\,
      I5 => p_0_in(1),
      O => \pn_state[0]_i_1_n_0\
    );
\pn_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(1),
      I2 => \^running_reg_0\,
      O => \pn_state[1]_i_1_n_0\
    );
\pn_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(2),
      I2 => \^running_reg_0\,
      O => \pn_state[2]_i_1_n_0\
    );
\pn_state[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(3),
      I2 => \^running_reg_0\,
      O => \pn_state[3]_i_1_n_0\
    );
\pn_state[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(4),
      I2 => \^running_reg_0\,
      O => \pn_state[4]_i_1_n_0\
    );
\pn_state[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(5),
      I2 => \^running_reg_0\,
      O => \pn_state[5]_i_1_n_0\
    );
\pn_state[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF80FF00FF00"
    )
        port map (
      I0 => pulse_on,
      I1 => pn_hold_reg_n_0,
      I2 => \pn_state[6]_i_3_n_0\,
      I3 => \^tx_reset\,
      I4 => \pn_state[6]_i_4_n_0\,
      I5 => \^pulse_ready_dac__1\,
      O => \pn_state[6]_i_1_n_0\
    );
\pn_state[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \pn_state[6]_i_5_n_0\,
      I1 => p_0_in(6),
      I2 => \^running_reg_0\,
      O => \pn_state[6]_i_2_n_0\
    );
\pn_state[6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pn_latched,
      I1 => \^running_reg_0\,
      O => \pn_state[6]_i_3_n_0\
    );
\pn_state[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33000100FF000000"
    )
        port map (
      I0 => \width_latched[5]_i_8_n_0\,
      I1 => \cycle_index[10]_i_5_n_0\,
      I2 => \pn_state[6]_i_6_n_0\,
      I3 => \^p_29_in\,
      I4 => repeat_enable,
      I5 => \^running_reg_0\,
      O => \pn_state[6]_i_4_n_0\
    );
\pn_state[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAABA"
    )
        port map (
      I0 => running15_out,
      I1 => \cycle_index[10]_i_5_n_0\,
      I2 => \^running_reg_0\,
      I3 => \running0__11\,
      I4 => \source_sample_reg[12]_1\(0),
      I5 => \source_sample_reg[12]_0\(0),
      O => \pn_state[6]_i_5_n_0\
    );
\pn_state[6]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => \cycle_index_reg_n_0_[5]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \width_latched[5]_i_3_n_0\,
      O => \pn_state[6]_i_6_n_0\
    );
\pn_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \pn_state[0]_i_1_n_0\,
      Q => p_0_in(1),
      R => '0'
    );
\pn_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[1]_i_1_n_0\,
      Q => p_0_in(2),
      S => '0'
    );
\pn_state_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[2]_i_1_n_0\,
      Q => p_0_in(3),
      S => '0'
    );
\pn_state_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[3]_i_1_n_0\,
      Q => p_0_in(4),
      S => '0'
    );
\pn_state_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[4]_i_1_n_0\,
      Q => p_0_in(5),
      S => '0'
    );
\pn_state_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[5]_i_1_n_0\,
      Q => p_0_in(6),
      S => '0'
    );
\pn_state_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => \pn_state[6]_i_1_n_0\,
      D => \pn_state[6]_i_2_n_0\,
      Q => p_1_in,
      S => '0'
    );
running_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F4000000"
    )
        port map (
      I0 => \running0__11\,
      I1 => \^running_reg_0\,
      I2 => running15_out,
      I3 => \source_sample_reg[14]_0\(0),
      I4 => \source_sample_reg[14]_1\(0),
      I5 => \^tx_reset\,
      O => running_i_1_n_0
    );
running_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => running_i_1_n_0,
      Q => \^running_reg_0\,
      R => '0'
    );
source_frame_active_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      O => in_frame
    );
source_frame_active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => in_frame,
      Q => source_frame_active,
      R => source_tx_active_i_1_n_0
    );
\source_frame_id[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \source_sample_reg[14]_1\(0),
      I1 => \source_sample_reg[14]_0\(0),
      I2 => \^running_reg_0\,
      O => \source_frame_id[15]_i_1_n_0\
    );
\source_frame_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(0),
      Q => D(16),
      R => \^tx_reset\
    );
\source_frame_id_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(10),
      Q => D(26),
      R => \^tx_reset\
    );
\source_frame_id_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(11),
      Q => D(27),
      R => \^tx_reset\
    );
\source_frame_id_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(12),
      Q => D(28),
      R => \^tx_reset\
    );
\source_frame_id_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(13),
      Q => D(29),
      R => \^tx_reset\
    );
\source_frame_id_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(14),
      Q => D(30),
      R => \^tx_reset\
    );
\source_frame_id_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(15),
      Q => D(31),
      R => \^tx_reset\
    );
\source_frame_id_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(1),
      Q => D(17),
      R => \^tx_reset\
    );
\source_frame_id_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(2),
      Q => D(18),
      R => \^tx_reset\
    );
\source_frame_id_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(3),
      Q => D(19),
      R => \^tx_reset\
    );
\source_frame_id_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(4),
      Q => D(20),
      R => \^tx_reset\
    );
\source_frame_id_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(5),
      Q => D(21),
      R => \^tx_reset\
    );
\source_frame_id_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(6),
      Q => D(22),
      R => \^tx_reset\
    );
\source_frame_id_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(7),
      Q => D(23),
      R => \^tx_reset\
    );
\source_frame_id_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(8),
      Q => D(24),
      R => \^tx_reset\
    );
\source_frame_id_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => frame_id_reg(9),
      Q => D(25),
      R => \^tx_reset\
    );
source_frame_last_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[9]\,
      I1 => \cycle_index_reg_n_0_[10]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[5]\,
      I4 => \cycle_index_reg_n_0_[4]\,
      I5 => \width_latched[5]_i_3_n_0\,
      O => source_frame_last0
    );
source_frame_last_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_last0,
      Q => \^source_frame_last\,
      R => source_tx_active_i_1_n_0
    );
source_frame_start_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => source_frame_start_i_2_n_0,
      I1 => \cycle_index_reg_n_0_[5]\,
      I2 => \cycle_index_reg_n_0_[4]\,
      I3 => \cycle_index_reg_n_0_[10]\,
      I4 => \cycle_index_reg_n_0_[9]\,
      I5 => source_frame_start_i_3_n_0,
      O => source_frame_start0
    );
source_frame_start_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[1]\,
      I1 => \cycle_index_reg_n_0_[0]\,
      I2 => \cycle_index_reg_n_0_[3]\,
      I3 => \cycle_index_reg_n_0_[2]\,
      O => source_frame_start_i_2_n_0
    );
source_frame_start_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      O => source_frame_start_i_3_n_0
    );
source_frame_start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_start0,
      Q => \^source_frame_start\,
      R => source_tx_active_i_1_n_0
    );
\source_index[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFDFFF"
    )
        port map (
      I0 => \^running_reg_0\,
      I1 => \^tx_reset\,
      I2 => \source_sample_reg[14]_1\(0),
      I3 => \source_sample_reg[14]_0\(0),
      I4 => \cycle_index_reg_n_0_[10]\,
      I5 => \cycle_index_reg_n_0_[9]\,
      O => \source_index[8]_i_1_n_0\
    );
\source_index_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[0]\,
      Q => D(0),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[1]\,
      Q => D(1),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[2]\,
      Q => D(2),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[3]\,
      Q => D(3),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[4]\,
      Q => D(4),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[5]\,
      Q => D(5),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[6]\,
      Q => D(6),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[7]\,
      Q => D(7),
      R => \source_index[8]_i_1_n_0\
    );
\source_index_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \cycle_index_reg_n_0_[8]\,
      Q => D(8),
      R => \source_index[8]_i_1_n_0\
    );
source_marker_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[2]\,
      I1 => \cycle_index_reg_n_0_[1]\,
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => source_marker_i_2_n_0,
      I4 => pulse_on,
      O => source_marker_i_1_n_0
    );
source_marker_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => source_marker_i_3_n_0,
      I1 => \cycle_index_reg_n_0_[7]\,
      I2 => \cycle_index_reg_n_0_[6]\,
      I3 => \width_latched[5]_i_8_n_0\,
      I4 => \cycle_index_reg_n_0_[3]\,
      I5 => \cycle_index_reg_n_0_[8]\,
      O => source_marker_i_2_n_0
    );
source_marker_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => \cycle_index_reg_n_0_[5]\,
      O => source_marker_i_3_n_0
    );
source_marker_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_marker_i_1_n_0,
      Q => source_marker,
      R => source_tx_active_i_1_n_0
    );
\source_mode_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => \mode_latched_reg_n_0_[0]\,
      Q => D(13),
      R => \^tx_reset\
    );
\source_mode_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => \mode_latched_reg_n_0_[1]\,
      Q => D(14),
      R => \^tx_reset\
    );
\source_mode_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => \source_frame_id[15]_i_1_n_0\,
      D => \mode_latched_reg_n_0_[2]\,
      Q => D(15),
      R => \^tx_reset\
    );
source_owned_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \^running_reg_0\,
      I1 => \source_sample_reg[12]_0\(0),
      I2 => \source_sample_reg[12]_1\(0),
      I3 => \source_sample_reg[14]_1\(0),
      I4 => \source_sample_reg[14]_0\(0),
      O => source_owned_i_1_n_0
    );
source_owned_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_owned_i_1_n_0,
      Q => source_owned,
      R => '0'
    );
source_sample3_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => source_sample3_carry_n_0,
      CO(2) => source_sample3_carry_n_1,
      CO(1) => source_sample3_carry_n_2,
      CO(0) => source_sample3_carry_n_3,
      CYINIT => '1',
      DI(3) => '1',
      DI(2) => source_sample3_carry_i_1_n_0,
      DI(1) => source_sample3_carry_i_2_n_0,
      DI(0) => source_sample3_carry_i_3_n_0,
      O(3 downto 0) => NLW_source_sample3_carry_O_UNCONNECTED(3 downto 0),
      S(3) => source_sample3_carry_i_4_n_0,
      S(2) => source_sample3_carry_i_5_n_0,
      S(1) => source_sample3_carry_i_6_n_0,
      S(0) => source_sample3_carry_i_7_n_0
    );
\source_sample3_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => source_sample3_carry_n_0,
      CO(3) => \source_sample3_carry__0_n_0\,
      CO(2) => \source_sample3_carry__0_n_1\,
      CO(1) => \source_sample3_carry__0_n_2\,
      CO(0) => \source_sample3_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \source_sample3_carry__0_i_1_n_0\,
      DI(2) => \source_sample3_carry__0_i_2_n_0\,
      DI(1) => \source_sample3_carry__0_i_3_n_0\,
      DI(0) => \source_sample3_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_source_sample3_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \source_sample3_carry__0_i_5_n_0\,
      S(2) => \source_sample3_carry__0_i_6_n_0\,
      S(1) => \source_sample3_carry__0_i_7_n_0\,
      S(0) => \source_sample3_carry__0_i_8_n_0\
    );
\source_sample3_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__0_i_1_n_0\
    );
\source_sample3_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__0_i_2_n_0\
    );
\source_sample3_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[9]\,
      I1 => \cycle_index_reg_n_0_[7]\,
      I2 => \cycle_index_reg_n_0_[6]\,
      I3 => \cycle_index_reg_n_0_[8]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__0_i_3_n_0\
    );
\source_sample3_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA9"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[8]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[7]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      O => \source_sample3_carry__0_i_4_n_0\
    );
\source_sample3_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__0_i_5_n_0\
    );
\source_sample3_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__0_i_6_n_0\
    );
\source_sample3_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555556"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[8]\,
      I2 => \cycle_index_reg_n_0_[6]\,
      I3 => \cycle_index_reg_n_0_[7]\,
      I4 => \cycle_index_reg_n_0_[9]\,
      O => \source_sample3_carry__0_i_7_n_0\
    );
\source_sample3_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0154"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[9]\,
      I1 => \cycle_index_reg_n_0_[7]\,
      I2 => \cycle_index_reg_n_0_[6]\,
      I3 => \cycle_index_reg_n_0_[8]\,
      O => \source_sample3_carry__0_i_8_n_0\
    );
\source_sample3_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \source_sample3_carry__0_n_0\,
      CO(3) => \source_sample3_carry__1_n_0\,
      CO(2) => \source_sample3_carry__1_n_1\,
      CO(1) => \source_sample3_carry__1_n_2\,
      CO(0) => \source_sample3_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \source_sample3_carry__1_i_1_n_0\,
      DI(2) => \source_sample3_carry__1_i_2_n_0\,
      DI(1) => \source_sample3_carry__1_i_3_n_0\,
      DI(0) => \source_sample3_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_source_sample3_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \source_sample3_carry__1_i_5_n_0\,
      S(2) => \source_sample3_carry__1_i_6_n_0\,
      S(1) => \source_sample3_carry__1_i_7_n_0\,
      S(0) => \source_sample3_carry__1_i_8_n_0\
    );
\source_sample3_carry__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__1_i_1_n_0\
    );
\source_sample3_carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__1_i_2_n_0\
    );
\source_sample3_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__1_i_3_n_0\
    );
\source_sample3_carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__1_i_4_n_0\
    );
\source_sample3_carry__1_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__1_i_5_n_0\
    );
\source_sample3_carry__1_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__1_i_6_n_0\
    );
\source_sample3_carry__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__1_i_7_n_0\
    );
\source_sample3_carry__1_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__1_i_8_n_0\
    );
\source_sample3_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \source_sample3_carry__1_n_0\,
      CO(3) => source_sample3,
      CO(2) => \source_sample3_carry__2_n_1\,
      CO(1) => \source_sample3_carry__2_n_2\,
      CO(0) => \source_sample3_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => source_sample40_in(31),
      DI(2) => \source_sample3_carry__2_i_2_n_0\,
      DI(1) => \source_sample3_carry__2_i_3_n_0\,
      DI(0) => \source_sample3_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_source_sample3_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \source_sample3_carry__2_i_5_n_0\,
      S(2) => \source_sample3_carry__2_i_6_n_0\,
      S(1) => \source_sample3_carry__2_i_7_n_0\,
      S(0) => \source_sample3_carry__2_i_8_n_0\
    );
\source_sample3_carry__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => source_sample40_in(31)
    );
\source_sample3_carry__2_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__2_i_2_n_0\
    );
\source_sample3_carry__2_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__2_i_3_n_0\
    );
\source_sample3_carry__2_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[7]\,
      I1 => \cycle_index_reg_n_0_[6]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[9]\,
      I4 => \cycle_index_reg_n_0_[10]\,
      O => \source_sample3_carry__2_i_4_n_0\
    );
\source_sample3_carry__2_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__2_i_5_n_0\
    );
\source_sample3_carry__2_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__2_i_6_n_0\
    );
\source_sample3_carry__2_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__2_i_7_n_0\
    );
\source_sample3_carry__2_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[10]\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[8]\,
      I3 => \cycle_index_reg_n_0_[6]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      O => \source_sample3_carry__2_i_8_n_0\
    );
source_sample3_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => width_latched(5),
      I1 => \cycle_index_reg_n_0_[4]\,
      I2 => \cycle_index_reg_n_0_[5]\,
      O => source_sample3_carry_i_1_n_0
    );
source_sample3_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[3]\,
      I1 => width_latched(4),
      I2 => \cycle_index_reg_n_0_[2]\,
      I3 => width_latched(3),
      O => source_sample3_carry_i_2_n_0
    );
source_sample3_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7510"
    )
        port map (
      I0 => width_latched(2),
      I1 => width_latched(1),
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => \cycle_index_reg_n_0_[1]\,
      O => source_sample3_carry_i_3_n_0
    );
source_sample3_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[6]\,
      I1 => \cycle_index_reg_n_0_[7]\,
      O => source_sample3_carry_i_4_n_0
    );
source_sample3_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => width_latched(5),
      I1 => \cycle_index_reg_n_0_[4]\,
      I2 => \cycle_index_reg_n_0_[5]\,
      O => source_sample3_carry_i_5_n_0
    );
source_sample3_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => width_latched(4),
      I1 => \cycle_index_reg_n_0_[3]\,
      I2 => width_latched(3),
      I3 => \cycle_index_reg_n_0_[2]\,
      O => source_sample3_carry_i_6_n_0
    );
source_sample3_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8421"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[0]\,
      I1 => \cycle_index_reg_n_0_[1]\,
      I2 => width_latched(1),
      I3 => width_latched(2),
      O => source_sample3_carry_i_7_n_0
    );
\source_sample[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => pulse_on,
      I1 => \source_sample_reg[14]_0\(0),
      I2 => \source_sample_reg[14]_1\(0),
      I3 => \source_sample_reg[12]_1\(0),
      I4 => \source_sample_reg[12]_0\(0),
      I5 => \^running_reg_0\,
      O => \source_sample[12]_i_1_n_0\
    );
\source_sample[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \source_sample[14]_i_2_n_0\,
      I1 => pulse_on,
      I2 => \source_sample_reg[14]_0\(0),
      I3 => \source_sample_reg[14]_1\(0),
      I4 => \^tx_reset\,
      I5 => \^running_reg_0\,
      O => \source_sample[14]_i_1_n_0\
    );
\source_sample[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555CF000000"
    )
        port map (
      I0 => p_1_in,
      I1 => source_sample3,
      I2 => \mode_latched_reg_n_0_[0]\,
      I3 => \mode_latched_reg_n_0_[2]\,
      I4 => \mode_latched_reg_n_0_[1]\,
      I5 => pn_latched,
      O => \source_sample[14]_i_2_n_0\
    );
\source_sample_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \source_sample[12]_i_1_n_0\,
      Q => source_sample(12),
      R => '0'
    );
\source_sample_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \source_sample[14]_i_1_n_0\,
      Q => source_sample(14),
      R => '0'
    );
source_tx_active_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF7FFFF"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => \source_sample_reg[12]_1\(0),
      I3 => \source_sample_reg[12]_0\(0),
      I4 => \^running_reg_0\,
      O => source_tx_active_i_1_n_0
    );
source_tx_active_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010101010100"
    )
        port map (
      I0 => \_inferred__2/i__carry__1_n_1\,
      I1 => \cycle_index_reg_n_0_[9]\,
      I2 => \cycle_index_reg_n_0_[10]\,
      I3 => \cycle_index_reg_n_0_[8]\,
      I4 => \cycle_index_reg_n_0_[6]\,
      I5 => \cycle_index_reg_n_0_[7]\,
      O => pulse_on
    );
source_tx_active_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_on,
      Q => source_tx_active,
      R => source_tx_active_i_1_n_0
    );
\width_latched[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AABA0000"
    )
        port map (
      I0 => running15_out,
      I1 => \width_latched[5]_i_3_n_0\,
      I2 => \width_latched[5]_i_4_n_0\,
      I3 => \running0__11\,
      I4 => \^pulse_ready_dac__1\,
      O => pn_latched8_out
    );
\width_latched[5]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[8]\,
      I1 => \cycle_index_reg_n_0_[5]\,
      I2 => \cycle_index_reg_n_0_[4]\,
      O => \width_latched[5]_i_10_n_0\
    );
\width_latched[5]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C70"
    )
        port map (
      I0 => \out\(9),
      I1 => \out\(8),
      I2 => \out\(7),
      I3 => \out\(6),
      O => \width_latched[5]_i_11_n_0\
    );
\width_latched[5]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(1),
      I2 => \out\(2),
      I3 => \out\(4),
      I4 => \out\(3),
      O => \width_latched[5]_i_12_n_0\
    );
\width_latched[5]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \out\(0),
      I1 => \out\(6),
      I2 => \out\(7),
      I3 => \out\(8),
      O => \width_latched[5]_i_13_n_0\
    );
\width_latched[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[3]\,
      I1 => \cycle_index_reg_n_0_[1]\,
      I2 => \cycle_index_reg_n_0_[0]\,
      I3 => \cycle_index_reg_n_0_[2]\,
      I4 => \cycle_index_reg_n_0_[7]\,
      I5 => \cycle_index_reg_n_0_[6]\,
      O => \width_latched[5]_i_3_n_0\
    );
\width_latched[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[4]\,
      I1 => \cycle_index_reg_n_0_[5]\,
      I2 => \^running_reg_0\,
      I3 => \cycle_index_reg_n_0_[10]\,
      I4 => \cycle_index_reg_n_0_[9]\,
      I5 => \cycle_index_reg_n_0_[8]\,
      O => \width_latched[5]_i_4_n_0\
    );
\width_latched[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03AB03AB03FF03AB"
    )
        port map (
      I0 => \width_latched[5]_i_8_n_0\,
      I1 => \cycle_index[10]_i_5_n_0\,
      I2 => \^p_29_in\,
      I3 => repeat_enable,
      I4 => \width_latched[5]_i_10_n_0\,
      I5 => \width_latched[5]_i_3_n_0\,
      O => \running0__11\
    );
\width_latched[5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \source_sample_reg[14]_0\(0),
      I1 => \source_sample_reg[14]_1\(0),
      I2 => \source_sample_reg[12]_1\(0),
      I3 => \source_sample_reg[12]_0\(0),
      O => \^pulse_ready_dac__1\
    );
\width_latched[5]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0028"
    )
        port map (
      I0 => \width_latched[5]_i_11_n_0\,
      I1 => \width_latched[5]_i_12_n_0\,
      I2 => \out\(5),
      I3 => \width_latched[5]_i_13_n_0\,
      O => \^p_29_in\
    );
\width_latched[5]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \cycle_index_reg_n_0_[9]\,
      I1 => \cycle_index_reg_n_0_[10]\,
      O => \width_latched[5]_i_8_n_0\
    );
\width_latched_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(0),
      Q => width_latched(0),
      R => \^tx_reset\
    );
\width_latched_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(1),
      Q => width_latched(1),
      R => \^tx_reset\
    );
\width_latched_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(2),
      Q => width_latched(2),
      S => \^tx_reset\
    );
\width_latched_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(3),
      Q => width_latched(3),
      R => \^tx_reset\
    );
\width_latched_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(4),
      Q => width_latched(4),
      R => \^tx_reset\
    );
\width_latched_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => pn_latched8_out,
      D => \out\(5),
      Q => width_latched(5),
      R => \^tx_reset\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_dac_init is
  port (
    sclk_reg : out STD_LOGIC;
    adk_spi_csb : out STD_LOGIC;
    adk_spi_sda : out STD_LOGIC;
    sclk_reg_0 : out STD_LOGIC;
    dac_spi_csb : out STD_LOGIC;
    dac_sdio_o : out STD_LOGIC;
    clock_config_done : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    dac_done_led0 : out STD_LOGIC;
    dac_sdio_t : out STD_LOGIC;
    rst_sys : in STD_LOGIC;
    clk_50m : in STD_LOGIC;
    dac_sdio_i : in STD_LOGIC;
    dco_alive : in STD_LOGIC;
    blink_count_reg : in STD_LOGIC_VECTOR ( 2 downto 0 );
    dac_done_led_reg : in STD_LOGIC;
    dac_done_led_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_dac_init : entity is "dac_init";
end system_frontend_0_0_dac_init;

architecture STRUCTURE of system_frontend_0_0_dac_init is
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal adk_done : STD_LOGIC;
  signal adk_start : STD_LOGIC;
  signal \^clock_config_done\ : STD_LOGIC;
  signal clock_index : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \clock_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[3]_i_2_n_0\ : STD_LOGIC;
  signal \clock_index[3]_i_4_n_0\ : STD_LOGIC;
  signal \clock_index[4]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[5]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[6]_i_1_n_0\ : STD_LOGIC;
  signal \clock_index[6]_i_2_n_0\ : STD_LOGIC;
  signal clock_spi_n_4 : STD_LOGIC;
  signal clock_spi_n_5 : STD_LOGIC;
  signal clock_spi_n_6 : STD_LOGIC;
  signal clock_spi_n_7 : STD_LOGIC;
  signal clock_spi_n_8 : STD_LOGIC;
  signal dac_config_done_i_3_n_0 : STD_LOGIC;
  signal dac_config_done_i_4_n_0 : STD_LOGIC;
  signal dac_done_led_i_4_n_0 : STD_LOGIC;
  signal \dac_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \dac_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \dac_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \dac_index[3]_i_1_n_0\ : STD_LOGIC;
  signal \dac_index[4]_i_1_n_0\ : STD_LOGIC;
  signal \dac_index[5]_i_2_n_0\ : STD_LOGIC;
  signal \dac_index[5]_i_3_n_0\ : STD_LOGIC;
  signal \dac_index[5]_i_5_n_0\ : STD_LOGIC;
  signal \dac_index[5]_i_6_n_0\ : STD_LOGIC;
  signal \dac_index[5]_i_9_n_0\ : STD_LOGIC;
  signal dac_spi_n_10 : STD_LOGIC;
  signal dac_spi_n_11 : STD_LOGIC;
  signal dac_spi_n_12 : STD_LOGIC;
  signal dac_spi_n_13 : STD_LOGIC;
  signal dac_spi_n_14 : STD_LOGIC;
  signal dac_spi_n_15 : STD_LOGIC;
  signal dac_spi_n_16 : STD_LOGIC;
  signal dac_spi_n_17 : STD_LOGIC;
  signal dac_spi_n_18 : STD_LOGIC;
  signal dac_spi_n_19 : STD_LOGIC;
  signal dac_spi_n_20 : STD_LOGIC;
  signal dac_spi_n_21 : STD_LOGIC;
  signal dac_spi_n_22 : STD_LOGIC;
  signal dac_spi_n_23 : STD_LOGIC;
  signal dac_spi_n_24 : STD_LOGIC;
  signal dac_spi_n_25 : STD_LOGIC;
  signal dac_spi_n_26 : STD_LOGIC;
  signal dac_spi_n_27 : STD_LOGIC;
  signal dac_spi_n_29 : STD_LOGIC;
  signal dac_spi_n_3 : STD_LOGIC;
  signal dac_spi_n_4 : STD_LOGIC;
  signal dac_spi_n_5 : STD_LOGIC;
  signal dac_spi_n_6 : STD_LOGIC;
  signal dac_spi_n_7 : STD_LOGIC;
  signal dac_spi_n_8 : STD_LOGIC;
  signal dac_spi_n_9 : STD_LOGIC;
  signal dac_start : STD_LOGIC;
  signal data2 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal data6 : STD_LOGIC;
  signal error_code : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \error_code[0]_i_2_n_0\ : STD_LOGIC;
  signal \error_code[2]_i_2_n_0\ : STD_LOGIC;
  signal \error_code[3]_i_2_n_0\ : STD_LOGIC;
  signal \error_code[3]_i_4_n_0\ : STD_LOGIC;
  signal \i_/tx[0]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[0]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[10]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[10]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[11]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[11]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[12]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[12]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[13]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[13]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[14]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[14]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[15]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[15]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[16]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[16]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[17]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[1]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[1]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[2]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[2]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[3]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[3]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[4]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[4]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[5]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[5]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[6]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[6]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[7]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[7]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[8]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[8]_i_2_n_0\ : STD_LOGIC;
  signal \i_/tx[9]_i_1_n_0\ : STD_LOGIC;
  signal \i_/tx[9]_i_2_n_0\ : STD_LOGIC;
  signal index : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal poll_count0 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal \poll_count[11]_i_11_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_12_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_4_n_0\ : STD_LOGIC;
  signal \poll_count[11]_i_5_n_0\ : STD_LOGIC;
  signal \poll_count__0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \poll_count_reg[11]_i_8_n_2\ : STD_LOGIC;
  signal \poll_count_reg[11]_i_8_n_3\ : STD_LOGIC;
  signal \poll_count_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \poll_count_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \poll_count_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \poll_count_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \poll_count_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \poll_count_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \poll_count_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \poll_count_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  signal \state[3]_i_10_n_0\ : STD_LOGIC;
  signal \state[3]_i_11_n_0\ : STD_LOGIC;
  signal \state[3]_i_12_n_0\ : STD_LOGIC;
  signal \state[3]_i_13_n_0\ : STD_LOGIC;
  signal \state[3]_i_15_n_0\ : STD_LOGIC;
  signal \state[3]_i_16_n_0\ : STD_LOGIC;
  signal \state[3]_i_17_n_0\ : STD_LOGIC;
  signal \state[3]_i_18_n_0\ : STD_LOGIC;
  signal \state[3]_i_19_n_0\ : STD_LOGIC;
  signal \state[3]_i_20_n_0\ : STD_LOGIC;
  signal \state[3]_i_21_n_0\ : STD_LOGIC;
  signal \state[3]_i_22_n_0\ : STD_LOGIC;
  signal \state[3]_i_4_n_0\ : STD_LOGIC;
  signal \state[3]_i_8_n_0\ : STD_LOGIC;
  signal \state[3]_i_9_n_0\ : STD_LOGIC;
  signal \state_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_reg_n_0_[1]\ : STD_LOGIC;
  signal \state_reg_n_0_[2]\ : STD_LOGIC;
  signal \state_reg_n_0_[3]\ : STD_LOGIC;
  signal wait_count : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \wait_count0_carry__0_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__0_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__0_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__0_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__1_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__1_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__1_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__1_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__2_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__2_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__2_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__2_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__3_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__3_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__3_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__3_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__4_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__4_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__4_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__4_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__5_n_0\ : STD_LOGIC;
  signal \wait_count0_carry__5_n_1\ : STD_LOGIC;
  signal \wait_count0_carry__5_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__5_n_3\ : STD_LOGIC;
  signal \wait_count0_carry__6_n_2\ : STD_LOGIC;
  signal \wait_count0_carry__6_n_3\ : STD_LOGIC;
  signal wait_count0_carry_n_0 : STD_LOGIC;
  signal wait_count0_carry_n_1 : STD_LOGIC;
  signal wait_count0_carry_n_2 : STD_LOGIC;
  signal wait_count0_carry_n_3 : STD_LOGIC;
  signal \wait_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[10]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[11]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[12]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[13]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[14]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[15]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[16]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[17]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[18]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[19]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[1]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[20]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[21]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[22]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[23]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[24]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[25]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[26]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[27]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[28]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[29]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[2]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[30]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_2_n_0\ : STD_LOGIC;
  signal \wait_count[31]_i_4_n_0\ : STD_LOGIC;
  signal \wait_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[5]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[7]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count[9]_i_1_n_0\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[10]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[11]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[12]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[13]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[14]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[15]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[16]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[17]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[18]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[19]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[20]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[21]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[22]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[23]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[24]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[25]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[26]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[27]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[28]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[29]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[30]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[31]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[6]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[7]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[8]\ : STD_LOGIC;
  signal \wait_count_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_poll_count_reg[11]_i_8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_poll_count_reg[11]_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_count0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_wait_count0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \clock_index[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \clock_index[2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \clock_index[3]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \clock_index[3]_i_4\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \clock_index[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \clock_index[6]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of dac_config_done_i_3 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of dac_config_done_i_4 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \dac_index[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \dac_index[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \dac_index[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \dac_index[3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \dac_index[5]_i_5\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \dac_index[5]_i_6\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \error_code[2]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \error_code[3]_i_2\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \error_code[3]_i_4\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \i_/tx[10]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \i_/tx[13]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \i_/tx[17]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \i_/tx[3]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \i_/tx[4]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \i_/tx[5]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \i_/tx[6]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \i_/tx[7]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \poll_count[11]_i_4\ : label is "soft_lutpair40";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \poll_count_reg[11]_i_8\ : label is 35;
  attribute ADDER_THRESHOLD of \poll_count_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \poll_count_reg[8]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \state[3]_i_10\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \state[3]_i_11\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \state[3]_i_16\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \state[3]_i_19\ : label is "soft_lutpair37";
  attribute ADDER_THRESHOLD of wait_count0_carry : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \wait_count0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM of \wait_count[31]_i_4\ : label is "soft_lutpair40";
begin
  D(0) <= \^d\(0);
  clock_config_done <= \^clock_config_done\;
adk_start_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => clock_spi_n_7,
      Q => adk_start,
      R => rst_sys
    );
clock_config_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(6),
      I2 => clock_index(3),
      I3 => clock_index(4),
      I4 => clock_index(2),
      I5 => \clock_index[6]_i_2_n_0\,
      O => wait_count(0)
    );
clock_config_done_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => clock_spi_n_8,
      Q => \^clock_config_done\,
      R => rst_sys
    );
\clock_index[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clock_index(0),
      O => \clock_index[0]_i_1_n_0\
    );
\clock_index[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clock_index(0),
      I1 => clock_index(1),
      O => \clock_index[1]_i_1_n_0\
    );
\clock_index[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => clock_index(2),
      I1 => clock_index(1),
      I2 => clock_index(0),
      O => \clock_index[2]_i_1_n_0\
    );
\clock_index[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => clock_index(0),
      I1 => clock_index(1),
      I2 => clock_index(2),
      I3 => clock_index(3),
      O => \clock_index[3]_i_2_n_0\
    );
\clock_index[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => clock_index(0),
      I1 => clock_index(1),
      I2 => clock_index(2),
      O => \clock_index[3]_i_4_n_0\
    );
\clock_index[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => clock_index(2),
      I1 => clock_index(1),
      I2 => clock_index(0),
      I3 => clock_index(3),
      I4 => clock_index(4),
      O => \clock_index[4]_i_1_n_0\
    );
\clock_index[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => clock_index(4),
      I1 => clock_index(3),
      I2 => clock_index(0),
      I3 => clock_index(1),
      I4 => clock_index(2),
      I5 => clock_index(5),
      O => \clock_index[5]_i_1_n_0\
    );
\clock_index[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CC6CCCCCCCCCCCCC"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(6),
      I2 => clock_index(2),
      I3 => \clock_index[6]_i_2_n_0\,
      I4 => clock_index(3),
      I5 => clock_index(4),
      O => \clock_index[6]_i_1_n_0\
    );
\clock_index[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => clock_index(1),
      I1 => clock_index(0),
      O => \clock_index[6]_i_2_n_0\
    );
\clock_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[0]_i_1_n_0\,
      Q => clock_index(0),
      R => rst_sys
    );
\clock_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[1]_i_1_n_0\,
      Q => clock_index(1),
      R => rst_sys
    );
\clock_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[2]_i_1_n_0\,
      Q => clock_index(2),
      R => rst_sys
    );
\clock_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[3]_i_2_n_0\,
      Q => clock_index(3),
      R => rst_sys
    );
\clock_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[4]_i_1_n_0\,
      Q => clock_index(4),
      R => rst_sys
    );
\clock_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[5]_i_1_n_0\,
      Q => clock_index(5),
      R => rst_sys
    );
\clock_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_5,
      D => \clock_index[6]_i_1_n_0\,
      Q => clock_index(6),
      R => rst_sys
    );
clock_spi: entity work.system_frontend_0_0_spi24_master
     port map (
      D(17) => \i_/tx[17]_i_2_n_0\,
      D(16) => \i_/tx[16]_i_1_n_0\,
      D(15) => \i_/tx[15]_i_1_n_0\,
      D(14) => \i_/tx[14]_i_1_n_0\,
      D(13) => \i_/tx[13]_i_1_n_0\,
      D(12) => \i_/tx[12]_i_1_n_0\,
      D(11) => \i_/tx[11]_i_1_n_0\,
      D(10) => \i_/tx[10]_i_1_n_0\,
      D(9) => \i_/tx[9]_i_1_n_0\,
      D(8) => \i_/tx[8]_i_1_n_0\,
      D(7) => \i_/tx[7]_i_1_n_0\,
      D(6) => \i_/tx[6]_i_1_n_0\,
      D(5) => \i_/tx[5]_i_1_n_0\,
      D(4) => \i_/tx[4]_i_1_n_0\,
      D(3) => \i_/tx[3]_i_1_n_0\,
      D(2) => \i_/tx[2]_i_1_n_0\,
      D(1) => \i_/tx[1]_i_1_n_0\,
      D(0) => \i_/tx[0]_i_1_n_0\,
      E(0) => clock_spi_n_4,
      Q(3) => \state_reg_n_0_[3]\,
      Q(2) => \state_reg_n_0_[2]\,
      Q(1) => \state_reg_n_0_[1]\,
      Q(0) => \state_reg_n_0_[0]\,
      adk_done => adk_done,
      adk_spi_csb => adk_spi_csb,
      adk_spi_sda => adk_spi_sda,
      adk_start => adk_start,
      busy_reg_0 => clock_spi_n_6,
      busy_reg_1 => clock_spi_n_7,
      clk_50m => clk_50m,
      clock_config_done => \^clock_config_done\,
      clock_config_done_reg => \poll_count[11]_i_4_n_0\,
      clock_index(3 downto 0) => clock_index(6 downto 3),
      \clock_index_reg[4]\ => clock_spi_n_5,
      \clock_index_reg[6]\ => \clock_index[3]_i_4_n_0\,
      data6 => data6,
      dco_alive => dco_alive,
      rst_sys => rst_sys,
      sclk_reg_0 => sclk_reg,
      \state_reg[2]\ => clock_spi_n_8,
      wait_count(0) => wait_count(0),
      \wait_count_reg[0]\ => \state[1]_i_3_n_0\,
      \wait_count_reg[0]_0\ => dac_spi_n_13,
      \wait_count_reg[0]_1\ => \wait_count[31]_i_4_n_0\,
      \wait_count_reg[0]_2\ => \state[3]_i_4_n_0\
    );
dac_config_done_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => dco_alive,
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[3]\,
      I3 => \state_reg_n_0_[2]\,
      I4 => \state_reg_n_0_[0]\,
      O => dac_config_done_i_3_n_0
    );
dac_config_done_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[3]\,
      I2 => \state_reg_n_0_[2]\,
      I3 => \state_reg_n_0_[0]\,
      O => dac_config_done_i_4_n_0
    );
dac_config_done_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => dac_spi_n_29,
      Q => \^d\(0),
      R => rst_sys
    );
dac_done_led_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF54FF0000"
    )
        port map (
      I0 => blink_count_reg(0),
      I1 => dac_done_led_reg,
      I2 => dac_done_led_reg_0,
      I3 => blink_count_reg(1),
      I4 => dac_done_led_i_4_n_0,
      I5 => \^d\(0),
      O => dac_done_led0
    );
dac_done_led_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => error_code(2),
      I1 => error_code(3),
      I2 => error_code(1),
      I3 => error_code(0),
      I4 => blink_count_reg(2),
      O => dac_done_led_i_4_n_0
    );
\dac_index[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state_reg_n_0_[2]\,
      I1 => index(0),
      O => \dac_index[0]_i_1_n_0\
    );
\dac_index[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => index(0),
      I1 => \state_reg_n_0_[2]\,
      I2 => index(1),
      O => \dac_index[1]_i_1_n_0\
    );
\dac_index[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"60C0"
    )
        port map (
      I0 => index(0),
      I1 => index(2),
      I2 => \state_reg_n_0_[2]\,
      I3 => index(1),
      O => \dac_index[2]_i_1_n_0\
    );
\dac_index[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => index(1),
      I1 => index(2),
      I2 => index(0),
      I3 => \state_reg_n_0_[2]\,
      I4 => index(3),
      O => \dac_index[3]_i_1_n_0\
    );
\dac_index[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => index(0),
      I1 => index(2),
      I2 => index(1),
      I3 => index(3),
      I4 => \state_reg_n_0_[2]\,
      I5 => index(4),
      O => \dac_index[4]_i_1_n_0\
    );
\dac_index[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFF000020000000"
    )
        port map (
      I0 => index(3),
      I1 => \dac_index[5]_i_6_n_0\,
      I2 => index(0),
      I3 => index(4),
      I4 => \state_reg_n_0_[2]\,
      I5 => index(5),
      O => \dac_index[5]_i_2_n_0\
    );
\dac_index[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => index(0),
      I1 => index(2),
      I2 => index(1),
      I3 => index(4),
      I4 => index(5),
      I5 => index(3),
      O => \dac_index[5]_i_3_n_0\
    );
\dac_index[5]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[3]\,
      O => \dac_index[5]_i_5_n_0\
    );
\dac_index[5]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => index(2),
      I1 => index(1),
      O => \dac_index[5]_i_6_n_0\
    );
\dac_index[5]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => index(0),
      I1 => index(2),
      I2 => index(1),
      I3 => index(4),
      I4 => index(5),
      I5 => index(3),
      O => \dac_index[5]_i_9_n_0\
    );
\dac_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[0]_i_1_n_0\,
      Q => index(0),
      R => rst_sys
    );
\dac_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[1]_i_1_n_0\,
      Q => index(1),
      R => rst_sys
    );
\dac_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[2]_i_1_n_0\,
      Q => index(2),
      R => rst_sys
    );
\dac_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[3]_i_1_n_0\,
      Q => index(3),
      R => rst_sys
    );
\dac_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[4]_i_1_n_0\,
      Q => index(4),
      R => rst_sys
    );
\dac_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_12,
      D => \dac_index[5]_i_2_n_0\,
      Q => index(5),
      R => rst_sys
    );
dac_spi: entity work.system_frontend_0_0_spi24_master_0
     port map (
      D(2) => dac_spi_n_3,
      D(1) => dac_spi_n_4,
      D(0) => dac_spi_n_5,
      E(0) => dac_spi_n_6,
      Q(5 downto 0) => index(5 downto 0),
      adk_done => adk_done,
      busy_reg_0 => dac_spi_n_26,
      clk_50m => clk_50m,
      dac_config_done_reg => dac_spi_n_29,
      dac_config_done_reg_0 => \dac_index[5]_i_3_n_0\,
      dac_config_done_reg_1 => dac_config_done_i_3_n_0,
      dac_config_done_reg_2 => dac_config_done_i_4_n_0,
      dac_config_done_reg_3(0) => \^d\(0),
      \dac_index_reg[0]\ => \dac_index[5]_i_5_n_0\,
      dac_sdio_i => dac_sdio_i,
      dac_sdio_o => dac_sdio_o,
      dac_sdio_t => dac_sdio_t,
      dac_spi_csb => dac_spi_csb,
      dac_start => dac_start,
      data6 => data6,
      dco_alive => dco_alive,
      done_reg_0 => dac_spi_n_13,
      \error_code_reg[0]\ => \poll_count[11]_i_4_n_0\,
      \error_code_reg[0]_0\ => \error_code[0]_i_2_n_0\,
      \error_code_reg[0]_1\ => \error_code[3]_i_2_n_0\,
      \error_code_reg[0]_2\ => \state[3]_i_4_n_0\,
      \error_code_reg[0]_3\ => \error_code[3]_i_4_n_0\,
      \error_code_reg[1]\(3) => \state_reg_n_0_[3]\,
      \error_code_reg[1]\(2) => \state_reg_n_0_[2]\,
      \error_code_reg[1]\(1) => \state_reg_n_0_[1]\,
      \error_code_reg[1]\(0) => \state_reg_n_0_[0]\,
      \error_code_reg[1]_0\ => \error_code[2]_i_2_n_0\,
      poll_count0(10 downto 0) => poll_count0(11 downto 1),
      \poll_count_reg[0]\ => \poll_count[11]_i_5_n_0\,
      \poll_count_reg[0]_0\(0) => \poll_count__0\(0),
      \poll_count_reg[11]\ => \dac_index[5]_i_6_n_0\,
      \read_data_reg[1]_0\(0) => dac_spi_n_11,
      \read_data_reg[1]_1\(11) => dac_spi_n_14,
      \read_data_reg[1]_1\(10) => dac_spi_n_15,
      \read_data_reg[1]_1\(9) => dac_spi_n_16,
      \read_data_reg[1]_1\(8) => dac_spi_n_17,
      \read_data_reg[1]_1\(7) => dac_spi_n_18,
      \read_data_reg[1]_1\(6) => dac_spi_n_19,
      \read_data_reg[1]_1\(5) => dac_spi_n_20,
      \read_data_reg[1]_1\(4) => dac_spi_n_21,
      \read_data_reg[1]_1\(3) => dac_spi_n_22,
      \read_data_reg[1]_1\(2) => dac_spi_n_23,
      \read_data_reg[1]_1\(1) => dac_spi_n_24,
      \read_data_reg[1]_1\(0) => dac_spi_n_25,
      rst_sys => rst_sys,
      sclk_reg_0 => sclk_reg_0,
      \state[3]_i_3_0\ => clock_spi_n_6,
      \state[3]_i_6_0\ => \dac_index[5]_i_9_n_0\,
      \state_reg[1]\(3) => dac_spi_n_7,
      \state_reg[1]\(2) => dac_spi_n_8,
      \state_reg[1]\(1) => dac_spi_n_9,
      \state_reg[1]\(0) => dac_spi_n_10,
      \state_reg[1]_0\ => \state[1]_i_2_n_0\,
      \state_reg[1]_1\ => \state[1]_i_3_n_0\,
      \state_reg[2]\(0) => dac_spi_n_12,
      \state_reg[2]_0\(0) => dac_spi_n_27
    );
dac_start_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => dac_spi_n_26,
      Q => dac_start,
      R => rst_sys
    );
\error_code[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => index(3),
      I1 => index(4),
      I2 => index(5),
      O => \error_code[0]_i_2_n_0\
    );
\error_code[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => index(1),
      I1 => index(2),
      I2 => index(0),
      O => \error_code[2]_i_2_n_0\
    );
\error_code[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA2000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => dco_alive,
      I2 => \state_reg_n_0_[0]\,
      I3 => \state_reg_n_0_[2]\,
      I4 => \state_reg_n_0_[3]\,
      O => \error_code[3]_i_2_n_0\
    );
\error_code[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state_reg_n_0_[0]\,
      O => \error_code[3]_i_4_n_0\
    );
\error_code_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_6,
      D => dac_spi_n_5,
      Q => error_code(0),
      R => rst_sys
    );
\error_code_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_6,
      D => dac_spi_n_4,
      Q => error_code(1),
      R => rst_sys
    );
\error_code_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_6,
      D => dac_spi_n_3,
      Q => error_code(2),
      R => rst_sys
    );
\error_code_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_6,
      D => \state_reg_n_0_[3]\,
      Q => error_code(3),
      R => rst_sys
    );
\i_/tx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FACAFACA3A0ACACA"
    )
        port map (
      I0 => \i_/tx[0]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[0]_i_1_n_0\
    );
\i_/tx[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9251490014000044"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(0),
      I5 => clock_index(1),
      O => \i_/tx[0]_i_2_n_0\
    );
\i_/tx[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[10]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[10]_i_1_n_0\
    );
\i_/tx[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"285402DC02DC5588"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(0),
      I5 => clock_index(1),
      O => \i_/tx[10]_i_2_n_0\
    );
\i_/tx[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0A3A0A"
    )
        port map (
      I0 => \i_/tx[11]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(0),
      O => \i_/tx[11]_i_1_n_0\
    );
\i_/tx[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5858580C0C848486"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(0),
      I4 => clock_index(1),
      I5 => clock_index(2),
      O => \i_/tx[11]_i_2_n_0\
    );
\i_/tx[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAFAFAFAFACA"
    )
        port map (
      I0 => \i_/tx[12]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[12]_i_1_n_0\
    );
\i_/tx[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"393B3B3E3E9E9E9C"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(0),
      I4 => clock_index(1),
      I5 => clock_index(2),
      O => \i_/tx[12]_i_2_n_0\
    );
\i_/tx[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FACAFAFA"
    )
        port map (
      I0 => \i_/tx[13]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(0),
      I4 => clock_index(2),
      O => \i_/tx[13]_i_1_n_0\
    );
\i_/tx[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC4C4C442626222"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(2),
      I3 => clock_index(1),
      I4 => clock_index(0),
      I5 => clock_index(3),
      O => \i_/tx[13]_i_2_n_0\
    );
\i_/tx[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A0A0A0A0A0A3A"
    )
        port map (
      I0 => \i_/tx[14]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(0),
      I4 => clock_index(1),
      I5 => clock_index(2),
      O => \i_/tx[14]_i_1_n_0\
    );
\i_/tx[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80000000002AAAA8"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(0),
      I2 => clock_index(1),
      I3 => clock_index(2),
      I4 => clock_index(3),
      I5 => clock_index(4),
      O => \i_/tx[14]_i_2_n_0\
    );
\i_/tx[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A0A0A0A0A0A3A"
    )
        port map (
      I0 => \i_/tx[15]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(0),
      I4 => clock_index(1),
      I5 => clock_index(2),
      O => \i_/tx[15]_i_1_n_0\
    );
\i_/tx[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEECECECCAEAEAAA"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(2),
      I3 => clock_index(1),
      I4 => clock_index(0),
      I5 => clock_index(3),
      O => \i_/tx[15]_i_2_n_0\
    );
\i_/tx[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A0A0A0A0A0A3A"
    )
        port map (
      I0 => \i_/tx[16]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(0),
      I4 => clock_index(1),
      I5 => clock_index(2),
      O => \i_/tx[16]_i_1_n_0\
    );
\i_/tx[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA8888888"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(3),
      I2 => clock_index(0),
      I3 => clock_index(1),
      I4 => clock_index(2),
      I5 => clock_index(4),
      O => \i_/tx[16]_i_2_n_0\
    );
\i_/tx[17]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC8CCC88"
    )
        port map (
      I0 => clock_index(3),
      I1 => clock_index(6),
      I2 => clock_index(2),
      I3 => clock_index(0),
      I4 => clock_index(1),
      O => \i_/tx[17]_i_2_n_0\
    );
\i_/tx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0A0A0A3A0A3A3A"
    )
        port map (
      I0 => \i_/tx[1]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[1]_i_1_n_0\
    );
\i_/tx[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"821202060B262620"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(1),
      I4 => clock_index(0),
      I5 => clock_index(2),
      O => \i_/tx[1]_i_2_n_0\
    );
\i_/tx[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0A3A0A"
    )
        port map (
      I0 => \i_/tx[2]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(0),
      O => \i_/tx[2]_i_1_n_0\
    );
\i_/tx[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010113000201424"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[2]_i_2_n_0\
    );
\i_/tx[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[3]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[3]_i_1_n_0\
    );
\i_/tx[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002031202060615"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[3]_i_2_n_0\
    );
\i_/tx[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[4]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[4]_i_1_n_0\
    );
\i_/tx[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000100141"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(0),
      I2 => clock_index(2),
      I3 => clock_index(1),
      I4 => clock_index(3),
      I5 => clock_index(4),
      O => \i_/tx[4]_i_2_n_0\
    );
\i_/tx[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[5]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[5]_i_1_n_0\
    );
\i_/tx[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800010000009004"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(1),
      I5 => clock_index(0),
      O => \i_/tx[5]_i_2_n_0\
    );
\i_/tx[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[6]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[6]_i_1_n_0\
    );
\i_/tx[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1001002001200024"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(2),
      I4 => clock_index(0),
      I5 => clock_index(1),
      O => \i_/tx[6]_i_2_n_0\
    );
\i_/tx[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_/tx[7]_i_2_n_0\,
      I1 => clock_index(6),
      O => \i_/tx[7]_i_1_n_0\
    );
\i_/tx[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000003000000804"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(1),
      I4 => clock_index(0),
      I5 => clock_index(2),
      O => \i_/tx[7]_i_2_n_0\
    );
\i_/tx[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0A0A3A"
    )
        port map (
      I0 => \i_/tx[8]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(0),
      O => \i_/tx[8]_i_1_n_0\
    );
\i_/tx[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000101FFFEFEFE"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(1),
      I4 => clock_index(2),
      I5 => clock_index(0),
      O => \i_/tx[8]_i_2_n_0\
    );
\i_/tx[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFA0A0AFACA0A0A"
    )
        port map (
      I0 => \i_/tx[9]_i_2_n_0\,
      I1 => clock_index(3),
      I2 => clock_index(6),
      I3 => clock_index(2),
      I4 => clock_index(0),
      I5 => clock_index(1),
      O => \i_/tx[9]_i_1_n_0\
    );
\i_/tx[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55A857A9A856A856"
    )
        port map (
      I0 => clock_index(5),
      I1 => clock_index(4),
      I2 => clock_index(3),
      I3 => clock_index(0),
      I4 => clock_index(2),
      I5 => clock_index(1),
      O => \i_/tx[9]_i_2_n_0\
    );
\poll_count[11]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \poll_count__0\(7),
      I1 => \poll_count__0\(6),
      I2 => \poll_count__0\(5),
      I3 => \poll_count__0\(4),
      O => \poll_count[11]_i_11_n_0\
    );
\poll_count[11]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \poll_count__0\(1),
      I1 => \poll_count__0\(0),
      I2 => \poll_count__0\(3),
      I3 => \poll_count__0\(2),
      O => \poll_count[11]_i_12_n_0\
    );
\poll_count[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \state_reg_n_0_[3]\,
      I1 => \state_reg_n_0_[1]\,
      O => \poll_count[11]_i_4_n_0\
    );
\poll_count[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \poll_count[11]_i_11_n_0\,
      I1 => \poll_count__0\(11),
      I2 => \poll_count__0\(10),
      I3 => \poll_count__0\(9),
      I4 => \poll_count__0\(8),
      I5 => \poll_count[11]_i_12_n_0\,
      O => \poll_count[11]_i_5_n_0\
    );
\poll_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_25,
      Q => \poll_count__0\(0),
      R => rst_sys
    );
\poll_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_15,
      Q => \poll_count__0\(10),
      R => rst_sys
    );
\poll_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_14,
      Q => \poll_count__0\(11),
      R => rst_sys
    );
\poll_count_reg[11]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => \poll_count_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_poll_count_reg[11]_i_8_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \poll_count_reg[11]_i_8_n_2\,
      CO(0) => \poll_count_reg[11]_i_8_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_poll_count_reg[11]_i_8_O_UNCONNECTED\(3),
      O(2 downto 0) => poll_count0(11 downto 9),
      S(3) => '0',
      S(2 downto 0) => \poll_count__0\(11 downto 9)
    );
\poll_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_24,
      Q => \poll_count__0\(1),
      R => rst_sys
    );
\poll_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_23,
      Q => \poll_count__0\(2),
      R => rst_sys
    );
\poll_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_22,
      Q => \poll_count__0\(3),
      R => rst_sys
    );
\poll_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_21,
      Q => \poll_count__0\(4),
      R => rst_sys
    );
\poll_count_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \poll_count_reg[4]_i_2_n_0\,
      CO(2) => \poll_count_reg[4]_i_2_n_1\,
      CO(1) => \poll_count_reg[4]_i_2_n_2\,
      CO(0) => \poll_count_reg[4]_i_2_n_3\,
      CYINIT => \poll_count__0\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => poll_count0(4 downto 1),
      S(3 downto 0) => \poll_count__0\(4 downto 1)
    );
\poll_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_20,
      Q => \poll_count__0\(5),
      R => rst_sys
    );
\poll_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_19,
      Q => \poll_count__0\(6),
      R => rst_sys
    );
\poll_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_18,
      Q => \poll_count__0\(7),
      R => rst_sys
    );
\poll_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_17,
      Q => \poll_count__0\(8),
      R => rst_sys
    );
\poll_count_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \poll_count_reg[4]_i_2_n_0\,
      CO(3) => \poll_count_reg[8]_i_2_n_0\,
      CO(2) => \poll_count_reg[8]_i_2_n_1\,
      CO(1) => \poll_count_reg[8]_i_2_n_2\,
      CO(0) => \poll_count_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => poll_count0(8 downto 5),
      S(3 downto 0) => \poll_count__0\(8 downto 5)
    );
\poll_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_11,
      D => dac_spi_n_16,
      Q => \poll_count__0\(9),
      R => rst_sys
    );
\state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000308"
    )
        port map (
      I0 => wait_count(0),
      I1 => \state_reg_n_0_[0]\,
      I2 => \state_reg_n_0_[2]\,
      I3 => \state_reg_n_0_[1]\,
      I4 => \state_reg_n_0_[3]\,
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => index(0),
      I1 => index(2),
      I2 => index(1),
      I3 => index(4),
      I4 => index(5),
      I5 => index(3),
      O => \state[1]_i_3_n_0\
    );
\state[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wait_count_reg_n_0_[29]\,
      I1 => \wait_count_reg_n_0_[30]\,
      O => \state[3]_i_10_n_0\
    );
\state[3]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state[3]_i_19_n_0\,
      I1 => \state[3]_i_15_n_0\,
      I2 => \wait_count_reg_n_0_[19]\,
      I3 => \wait_count_reg_n_0_[21]\,
      I4 => \wait_count_reg_n_0_[20]\,
      O => \state[3]_i_11_n_0\
    );
\state[3]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \wait_count_reg_n_0_[16]\,
      I1 => \wait_count_reg_n_0_[15]\,
      I2 => \wait_count_reg_n_0_[18]\,
      I3 => \wait_count_reg_n_0_[17]\,
      O => \state[3]_i_12_n_0\
    );
\state[3]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
        port map (
      I0 => \wait_count_reg_n_0_[13]\,
      I1 => \state[3]_i_20_n_0\,
      I2 => \state[3]_i_21_n_0\,
      I3 => \wait_count_reg_n_0_[10]\,
      I4 => \wait_count_reg_n_0_[11]\,
      I5 => \wait_count_reg_n_0_[14]\,
      O => \state[3]_i_13_n_0\
    );
\state[3]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_count_reg_n_0_[28]\,
      I1 => \wait_count_reg_n_0_[27]\,
      I2 => \wait_count_reg_n_0_[26]\,
      I3 => \wait_count_reg_n_0_[25]\,
      O => \state[3]_i_15_n_0\
    );
\state[3]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \wait_count_reg_n_0_[20]\,
      I1 => \wait_count_reg_n_0_[21]\,
      O => \state[3]_i_16_n_0\
    );
\state[3]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFE000000"
    )
        port map (
      I0 => \state[3]_i_22_n_0\,
      I1 => \wait_count_reg_n_0_[7]\,
      I2 => \wait_count_reg_n_0_[6]\,
      I3 => \wait_count_reg_n_0_[8]\,
      I4 => \wait_count_reg_n_0_[9]\,
      I5 => \wait_count_reg_n_0_[10]\,
      O => \state[3]_i_17_n_0\
    );
\state[3]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \wait_count_reg_n_0_[16]\,
      I1 => \wait_count_reg_n_0_[15]\,
      I2 => \wait_count_reg_n_0_[12]\,
      I3 => \wait_count_reg_n_0_[14]\,
      O => \state[3]_i_18_n_0\
    );
\state[3]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_count_reg_n_0_[30]\,
      I1 => \wait_count_reg_n_0_[29]\,
      I2 => \wait_count_reg_n_0_[23]\,
      I3 => \wait_count_reg_n_0_[31]\,
      O => \state[3]_i_19_n_0\
    );
\state[3]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF0E0"
    )
        port map (
      I0 => \wait_count_reg_n_0_[7]\,
      I1 => \wait_count_reg_n_0_[6]\,
      I2 => \wait_count_reg_n_0_[8]\,
      I3 => \wait_count_reg_n_0_[5]\,
      I4 => \wait_count_reg_n_0_[12]\,
      I5 => \wait_count_reg_n_0_[9]\,
      O => \state[3]_i_20_n_0\
    );
\state[3]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \wait_count_reg_n_0_[1]\,
      I1 => \wait_count_reg_n_0_[2]\,
      I2 => \wait_count_reg_n_0_[8]\,
      I3 => \wait_count_reg_n_0_[0]\,
      I4 => \wait_count_reg_n_0_[4]\,
      I5 => \wait_count_reg_n_0_[3]\,
      O => \state[3]_i_21_n_0\
    );
\state[3]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \wait_count_reg_n_0_[2]\,
      I1 => \wait_count_reg_n_0_[3]\,
      I2 => \wait_count_reg_n_0_[0]\,
      I3 => \wait_count_reg_n_0_[1]\,
      I4 => \wait_count_reg_n_0_[5]\,
      I5 => \wait_count_reg_n_0_[4]\,
      O => \state[3]_i_22_n_0\
    );
\state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAAAAAAA"
    )
        port map (
      I0 => \state[3]_i_8_n_0\,
      I1 => \wait_count_reg_n_0_[22]\,
      I2 => \wait_count_reg_n_0_[18]\,
      I3 => \wait_count_reg_n_0_[19]\,
      I4 => \state[3]_i_9_n_0\,
      I5 => \state[3]_i_10_n_0\,
      O => \state[3]_i_4_n_0\
    );
\state[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEA"
    )
        port map (
      I0 => \state[3]_i_11_n_0\,
      I1 => \state[3]_i_12_n_0\,
      I2 => \state[3]_i_13_n_0\,
      I3 => \wait_count_reg_n_0_[24]\,
      I4 => \wait_count_reg_n_0_[22]\,
      O => data6
    );
\state[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \state[3]_i_15_n_0\,
      I1 => \state[3]_i_16_n_0\,
      I2 => \wait_count_reg_n_0_[22]\,
      I3 => \wait_count_reg_n_0_[31]\,
      I4 => \wait_count_reg_n_0_[23]\,
      I5 => \wait_count_reg_n_0_[24]\,
      O => \state[3]_i_8_n_0\
    );
\state[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFCC80"
    )
        port map (
      I0 => \wait_count_reg_n_0_[11]\,
      I1 => \wait_count_reg_n_0_[14]\,
      I2 => \state[3]_i_17_n_0\,
      I3 => \wait_count_reg_n_0_[13]\,
      I4 => \wait_count_reg_n_0_[17]\,
      I5 => \state[3]_i_18_n_0\,
      O => \state[3]_i_9_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_27,
      D => dac_spi_n_10,
      Q => \state_reg_n_0_[0]\,
      R => rst_sys
    );
\state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_27,
      D => dac_spi_n_9,
      Q => \state_reg_n_0_[1]\,
      R => rst_sys
    );
\state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_27,
      D => dac_spi_n_8,
      Q => \state_reg_n_0_[2]\,
      R => rst_sys
    );
\state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => dac_spi_n_27,
      D => dac_spi_n_7,
      Q => \state_reg_n_0_[3]\,
      R => rst_sys
    );
wait_count0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => wait_count0_carry_n_0,
      CO(2) => wait_count0_carry_n_1,
      CO(1) => wait_count0_carry_n_2,
      CO(0) => wait_count0_carry_n_3,
      CYINIT => \wait_count_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(4 downto 1),
      S(3) => \wait_count_reg_n_0_[4]\,
      S(2) => \wait_count_reg_n_0_[3]\,
      S(1) => \wait_count_reg_n_0_[2]\,
      S(0) => \wait_count_reg_n_0_[1]\
    );
\wait_count0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => wait_count0_carry_n_0,
      CO(3) => \wait_count0_carry__0_n_0\,
      CO(2) => \wait_count0_carry__0_n_1\,
      CO(1) => \wait_count0_carry__0_n_2\,
      CO(0) => \wait_count0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(8 downto 5),
      S(3) => \wait_count_reg_n_0_[8]\,
      S(2) => \wait_count_reg_n_0_[7]\,
      S(1) => \wait_count_reg_n_0_[6]\,
      S(0) => \wait_count_reg_n_0_[5]\
    );
\wait_count0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__0_n_0\,
      CO(3) => \wait_count0_carry__1_n_0\,
      CO(2) => \wait_count0_carry__1_n_1\,
      CO(1) => \wait_count0_carry__1_n_2\,
      CO(0) => \wait_count0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(12 downto 9),
      S(3) => \wait_count_reg_n_0_[12]\,
      S(2) => \wait_count_reg_n_0_[11]\,
      S(1) => \wait_count_reg_n_0_[10]\,
      S(0) => \wait_count_reg_n_0_[9]\
    );
\wait_count0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__1_n_0\,
      CO(3) => \wait_count0_carry__2_n_0\,
      CO(2) => \wait_count0_carry__2_n_1\,
      CO(1) => \wait_count0_carry__2_n_2\,
      CO(0) => \wait_count0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(16 downto 13),
      S(3) => \wait_count_reg_n_0_[16]\,
      S(2) => \wait_count_reg_n_0_[15]\,
      S(1) => \wait_count_reg_n_0_[14]\,
      S(0) => \wait_count_reg_n_0_[13]\
    );
\wait_count0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__2_n_0\,
      CO(3) => \wait_count0_carry__3_n_0\,
      CO(2) => \wait_count0_carry__3_n_1\,
      CO(1) => \wait_count0_carry__3_n_2\,
      CO(0) => \wait_count0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(20 downto 17),
      S(3) => \wait_count_reg_n_0_[20]\,
      S(2) => \wait_count_reg_n_0_[19]\,
      S(1) => \wait_count_reg_n_0_[18]\,
      S(0) => \wait_count_reg_n_0_[17]\
    );
\wait_count0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__3_n_0\,
      CO(3) => \wait_count0_carry__4_n_0\,
      CO(2) => \wait_count0_carry__4_n_1\,
      CO(1) => \wait_count0_carry__4_n_2\,
      CO(0) => \wait_count0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(24 downto 21),
      S(3) => \wait_count_reg_n_0_[24]\,
      S(2) => \wait_count_reg_n_0_[23]\,
      S(1) => \wait_count_reg_n_0_[22]\,
      S(0) => \wait_count_reg_n_0_[21]\
    );
\wait_count0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__4_n_0\,
      CO(3) => \wait_count0_carry__5_n_0\,
      CO(2) => \wait_count0_carry__5_n_1\,
      CO(1) => \wait_count0_carry__5_n_2\,
      CO(0) => \wait_count0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data2(28 downto 25),
      S(3) => \wait_count_reg_n_0_[28]\,
      S(2) => \wait_count_reg_n_0_[27]\,
      S(1) => \wait_count_reg_n_0_[26]\,
      S(0) => \wait_count_reg_n_0_[25]\
    );
\wait_count0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_count0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_wait_count0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \wait_count0_carry__6_n_2\,
      CO(0) => \wait_count0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_wait_count0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data2(31 downto 29),
      S(3) => '0',
      S(2) => \wait_count_reg_n_0_[31]\,
      S(1) => \wait_count_reg_n_0_[30]\,
      S(0) => \wait_count_reg_n_0_[29]\
    );
\wait_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAA02A2"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => \wait_count_reg_n_0_[0]\,
      O => \wait_count[0]_i_1_n_0\
    );
\wait_count[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(10),
      O => \wait_count[10]_i_1_n_0\
    );
\wait_count[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(11),
      O => \wait_count[11]_i_1_n_0\
    );
\wait_count[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(12),
      O => \wait_count[12]_i_1_n_0\
    );
\wait_count[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(13),
      O => \wait_count[13]_i_1_n_0\
    );
\wait_count[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(14),
      O => \wait_count[14]_i_1_n_0\
    );
\wait_count[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(15),
      O => \wait_count[15]_i_1_n_0\
    );
\wait_count[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(16),
      O => \wait_count[16]_i_1_n_0\
    );
\wait_count[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(17),
      O => \wait_count[17]_i_1_n_0\
    );
\wait_count[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(18),
      O => \wait_count[18]_i_1_n_0\
    );
\wait_count[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(19),
      O => \wait_count[19]_i_1_n_0\
    );
\wait_count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(1),
      O => \wait_count[1]_i_1_n_0\
    );
\wait_count[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(20),
      O => \wait_count[20]_i_1_n_0\
    );
\wait_count[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(21),
      O => \wait_count[21]_i_1_n_0\
    );
\wait_count[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(22),
      O => \wait_count[22]_i_1_n_0\
    );
\wait_count[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(23),
      O => \wait_count[23]_i_1_n_0\
    );
\wait_count[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(24),
      O => \wait_count[24]_i_1_n_0\
    );
\wait_count[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(25),
      O => \wait_count[25]_i_1_n_0\
    );
\wait_count[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(26),
      O => \wait_count[26]_i_1_n_0\
    );
\wait_count[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(27),
      O => \wait_count[27]_i_1_n_0\
    );
\wait_count[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(28),
      O => \wait_count[28]_i_1_n_0\
    );
\wait_count[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(29),
      O => \wait_count[29]_i_1_n_0\
    );
\wait_count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(2),
      O => \wait_count[2]_i_1_n_0\
    );
\wait_count[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(30),
      O => \wait_count[30]_i_1_n_0\
    );
\wait_count[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(31),
      O => \wait_count[31]_i_2_n_0\
    );
\wait_count[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \state_reg_n_0_[3]\,
      I1 => \state_reg_n_0_[1]\,
      I2 => \state_reg_n_0_[2]\,
      O => \wait_count[31]_i_4_n_0\
    );
\wait_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(3),
      O => \wait_count[3]_i_1_n_0\
    );
\wait_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(4),
      O => \wait_count[4]_i_1_n_0\
    );
\wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(5),
      O => \wait_count[5]_i_1_n_0\
    );
\wait_count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(6),
      O => \wait_count[6]_i_1_n_0\
    );
\wait_count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(7),
      O => \wait_count[7]_i_1_n_0\
    );
\wait_count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(8),
      O => \wait_count[8]_i_1_n_0\
    );
\wait_count[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA02A200000000"
    )
        port map (
      I0 => \state_reg_n_0_[1]\,
      I1 => \state[3]_i_4_n_0\,
      I2 => \state_reg_n_0_[0]\,
      I3 => dco_alive,
      I4 => \state_reg_n_0_[2]\,
      I5 => data2(9),
      O => \wait_count[9]_i_1_n_0\
    );
\wait_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[0]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[0]\,
      R => rst_sys
    );
\wait_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[10]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[10]\,
      R => rst_sys
    );
\wait_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[11]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[11]\,
      R => rst_sys
    );
\wait_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[12]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[12]\,
      R => rst_sys
    );
\wait_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[13]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[13]\,
      R => rst_sys
    );
\wait_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[14]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[14]\,
      R => rst_sys
    );
\wait_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[15]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[15]\,
      R => rst_sys
    );
\wait_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[16]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[16]\,
      R => rst_sys
    );
\wait_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[17]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[17]\,
      R => rst_sys
    );
\wait_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[18]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[18]\,
      R => rst_sys
    );
\wait_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[19]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[19]\,
      R => rst_sys
    );
\wait_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[1]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[1]\,
      R => rst_sys
    );
\wait_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[20]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[20]\,
      R => rst_sys
    );
\wait_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[21]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[21]\,
      R => rst_sys
    );
\wait_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[22]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[22]\,
      R => rst_sys
    );
\wait_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[23]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[23]\,
      R => rst_sys
    );
\wait_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[24]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[24]\,
      R => rst_sys
    );
\wait_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[25]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[25]\,
      R => rst_sys
    );
\wait_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[26]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[26]\,
      R => rst_sys
    );
\wait_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[27]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[27]\,
      R => rst_sys
    );
\wait_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[28]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[28]\,
      R => rst_sys
    );
\wait_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[29]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[29]\,
      R => rst_sys
    );
\wait_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[2]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[2]\,
      R => rst_sys
    );
\wait_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[30]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[30]\,
      R => rst_sys
    );
\wait_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[31]_i_2_n_0\,
      Q => \wait_count_reg_n_0_[31]\,
      R => rst_sys
    );
\wait_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[3]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[3]\,
      R => rst_sys
    );
\wait_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[4]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[4]\,
      R => rst_sys
    );
\wait_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[5]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[5]\,
      R => rst_sys
    );
\wait_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[6]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[6]\,
      R => rst_sys
    );
\wait_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[7]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[7]\,
      R => rst_sys
    );
\wait_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[8]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[8]\,
      R => rst_sys
    );
\wait_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => clock_spi_n_4,
      D => \wait_count[9]_i_1_n_0\,
      Q => \wait_count_reg_n_0_[9]\,
      R => rst_sys
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0_ac820_adc_dac_frontend_ps is
  port (
    sclk_reg : out STD_LOGIC;
    idelay_ready_reg : out STD_LOGIC;
    dac_data_p : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_data_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dac_dci_p : out STD_LOGIC;
    dac_dci_n : out STD_LOGIC;
    echo_clk_acq : out STD_LOGIC;
    echo_rst_acq : out STD_LOGIC;
    pll_done_led : out STD_LOGIC;
    dac_done_led : out STD_LOGIC;
    adc_ready_led : out STD_LOGIC;
    adc_clip_led : out STD_LOGIC;
    echo_pair_valid : out STD_LOGIC;
    echo_sample_rise_u14 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    echo_sample_fall_u14 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    echo_sample_clip : out STD_LOGIC;
    echo_pulse_ready : out STD_LOGIC;
    echo_tx_marker : out STD_LOGIC;
    echo_frame_meta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sclk_reg_0 : out STD_LOGIC;
    echo_pulse_frames_sent : out STD_LOGIC_VECTOR ( 5 downto 0 );
    adk_spi_csb : out STD_LOGIC;
    adk_spi_sda : out STD_LOGIC;
    dac_spi_csb : out STD_LOGIC;
    dac_spi_sdio : inout STD_LOGIC;
    clk_50m : in STD_LOGIC;
    adc_data_p : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adc_data_n : in STD_LOGIC_VECTOR ( 13 downto 0 );
    adc_dco_p : in STD_LOGIC;
    adc_dco_n : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 9 downto 0 );
    echo_pulse_start_acq : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_frontend_0_0_ac820_adc_dac_frontend_ps : entity is "ac820_adc_dac_frontend_ps";
end system_frontend_0_0_ac820_adc_dac_frontend_ps;

architecture STRUCTURE of system_frontend_0_0_ac820_adc_dac_frontend_ps is
  signal adc_clip_sticky : STD_LOGIC;
  signal adc_clip_sticky_1 : STD_LOGIC;
  signal adc_clip_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of adc_clip_sync : signal is "true";
  signal adc_clock_unbuffered : STD_LOGIC;
  signal adc_ready_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of adc_ready_sync : signal is "true";
  signal adc_reset_source : STD_LOGIC;
  signal \blink_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \blink_count[0]_i_8_n_0\ : STD_LOGIC;
  signal blink_count_reg : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \blink_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \blink_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \blink_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \blink_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \blink_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \blink_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \blink_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \blink_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal burst_i_n_0 : STD_LOGIC;
  signal burst_start_cdc_n_1 : STD_LOGIC;
  signal burst_start_dac : STD_LOGIC;
  signal clk_dac : STD_LOGIC;
  signal clk_dco : STD_LOGIC;
  signal clock_config_done : STD_LOGIC;
  signal dac_clock_unbuffered : STD_LOGIC;
  signal dac_config_done : STD_LOGIC;
  signal dac_done_led0 : STD_LOGIC;
  signal dac_done_led_i_2_n_0 : STD_LOGIC;
  signal dac_done_led_i_3_n_0 : STD_LOGIC;
  signal dac_done_led_i_5_n_0 : STD_LOGIC;
  signal dac_done_led_i_6_n_0 : STD_LOGIC;
  signal dac_done_led_i_7_n_0 : STD_LOGIC;
  signal dac_sdio_i : STD_LOGIC;
  signal dac_sdio_o : STD_LOGIC;
  signal dac_sdio_t : STD_LOGIC;
  signal dco_alive : STD_LOGIC;
  signal dco_alive_i_1_n_0 : STD_LOGIC;
  signal dco_se : STD_LOGIC;
  signal \^echo_clk_acq\ : STD_LOGIC;
  signal \^echo_rst_acq\ : STD_LOGIC;
  signal edge_seen : STD_LOGIC;
  signal edge_seen_i_1_n_0 : STD_LOGIC;
  signal enable_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of enable_sync : signal is "true";
  signal frame_meta_q0 : STD_LOGIC;
  signal \heartbeat_div[9]_i_2_n_0\ : STD_LOGIC;
  signal heartbeat_div_reg : STD_LOGIC_VECTOR ( 9 to 9 );
  signal \heartbeat_div_reg_n_0_[0]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[1]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[2]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[3]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[4]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[5]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[6]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[7]\ : STD_LOGIC;
  signal \heartbeat_div_reg_n_0_[8]\ : STD_LOGIC;
  signal heartbeat_previous : STD_LOGIC;
  signal heartbeat_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of heartbeat_sync : signal is "true";
  signal idelay_ready_dac : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of idelay_ready_dac : signal is "true";
  signal \^idelay_ready_reg\ : STD_LOGIC;
  signal launch_marker : STD_LOGIC;
  signal launch_marker0 : STD_LOGIC;
  signal launch_meta : STD_LOGIC_VECTOR ( 9 to 9 );
  signal \launch_meta_reg_n_0_[0]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[10]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[11]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[12]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[13]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[14]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[15]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[16]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[17]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[18]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[19]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[1]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[20]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[21]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[22]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[23]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[24]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[25]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[26]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[27]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[28]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[29]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[2]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[30]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[31]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[3]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[4]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[5]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[6]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[7]\ : STD_LOGIC;
  signal \launch_meta_reg_n_0_[8]\ : STD_LOGIC;
  signal locked_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of locked_sync : signal is "true";
  signal mmcm_feedback : STD_LOGIC;
  signal mmcm_feedback_buf : STD_LOGIC;
  signal mmcm_locked : STD_LOGIC;
  signal \monitor_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \monitor_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \monitor_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \monitor_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \monitor_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \monitor_count[0]_i_7_n_0\ : STD_LOGIC;
  signal monitor_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \monitor_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \monitor_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \monitor_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \monitor_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \monitor_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_out : STD_LOGIC_VECTOR ( 12 downto 9 );
  signal p_29_in : STD_LOGIC;
  signal \power_count[0]_i_2_n_0\ : STD_LOGIC;
  signal power_count_reg : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal \power_count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \power_count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \power_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \power_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \power_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \power_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \power_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \power_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \power_count_reg_n_0_[3]\ : STD_LOGIC;
  signal pulse_cfg_sync1 : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute async_reg of pulse_cfg_sync1 : signal is "true";
  signal pulse_cfg_sync2 : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute async_reg of pulse_cfg_sync2 : signal is "true";
  signal pulse_i_n_3 : STD_LOGIC;
  signal pulse_i_n_6 : STD_LOGIC;
  signal pulse_i_n_7 : STD_LOGIC;
  signal \pulse_ready_dac__1\ : STD_LOGIC;
  signal pulse_ready_q0 : STD_LOGIC;
  signal raw_fall : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal raw_rise : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal ref_clk_200m : STD_LOGIC;
  signal ref_feedback : STD_LOGIC;
  signal ref_feedback_buf : STD_LOGIC;
  signal ref_locked : STD_LOGIC;
  signal ref_unbuffered : STD_LOGIC;
  signal repeat_enable : STD_LOGIC;
  signal reset_source : STD_LOGIC;
  signal rst_dac_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of rst_dac_sync : signal is "true";
  signal rst_sys : STD_LOGIC;
  signal rst_sys_i_1_n_0 : STD_LOGIC;
  signal rst_sys_i_2_n_0 : STD_LOGIC;
  signal rst_sys_i_3_n_0 : STD_LOGIC;
  signal running15_out : STD_LOGIC;
  signal rx_i_n_29 : STD_LOGIC;
  signal rx_reset_sync : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of rx_reset_sync : signal is "true";
  signal sample_valid : STD_LOGIC;
  signal source_frame_id : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal source_frame_last : STD_LOGIC;
  signal source_frame_start : STD_LOGIC;
  signal source_index : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal source_mode : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal tx_reset : STD_LOGIC;
  signal tx_reset_sync : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute async_reg of tx_reset_sync : signal is "true";
  signal \tx_reset_sync[2]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_blink_count_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_blink_count_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_dac_clock_mmcm_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_dac_clock_mmcm_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_monitor_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_power_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_ref_mmcm_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_ref_mmcm_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \adc_clip_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \adc_clip_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \adc_clip_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \adc_clip_sync_reg[1]\ : label is "yes";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of adc_clock_bufg : label is "PRIMITIVE";
  attribute ASYNC_REG_boolean of \adc_ready_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \adc_ready_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \adc_ready_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \adc_ready_sync_reg[1]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \blink_count[0]_i_7\ : label is "soft_lutpair70";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \blink_count_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \blink_count_reg[8]_i_1\ : label is 35;
  attribute BOX_TYPE of dac_clock_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of dac_clock_mmcm : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of dac_clock_mmcm : label is "MMCME2_BASE";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of dac_clock_mmcm : label is "VCC:CLKINSEL GND:PSINCDEC,PSEN,PSCLK,DWE,DEN,DCLK,DI[15],DI[14],DI[13],DI[12],DI[11],DI[10],DI[9],DI[8],DI[7],DI[6],DI[5],DI[4],DI[3],DI[2],DI[1],DI[0],DADDR[6],DADDR[5],DADDR[4],DADDR[3],DADDR[2],DADDR[1],DADDR[0],CLKIN2";
  attribute SOFT_HLUTNM of dac_done_led_i_7 : label is "soft_lutpair70";
  attribute BOX_TYPE of dac_sdio_iobuf : label is "PRIMITIVE";
  attribute BOX_TYPE of dco_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of dco_ibuf : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of dco_ibuf : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of dco_ibuf : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of dco_ibuf : label is "AUTO";
  attribute ASYNC_REG_boolean of \enable_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \enable_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \enable_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \enable_sync_reg[1]\ : label is "yes";
  attribute BOX_TYPE of feedback_bufg : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \heartbeat_div[1]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \heartbeat_div[2]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \heartbeat_div[3]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \heartbeat_div[4]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \heartbeat_div[6]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \heartbeat_div[7]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \heartbeat_div[8]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \heartbeat_div[9]_i_1\ : label is "soft_lutpair68";
  attribute ASYNC_REG_boolean of \heartbeat_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \heartbeat_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \heartbeat_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \heartbeat_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \heartbeat_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \heartbeat_sync_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \idelay_ready_dac_reg[0]\ : label is std.standard.true;
  attribute KEEP of \idelay_ready_dac_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \idelay_ready_dac_reg[1]\ : label is std.standard.true;
  attribute KEEP of \idelay_ready_dac_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \locked_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \locked_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \locked_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \locked_sync_reg[1]\ : label is "yes";
  attribute ADDER_THRESHOLD of \monitor_count_reg[0]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \monitor_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \monitor_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \monitor_count_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \power_count_reg[0]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \power_count_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \power_count_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \power_count_reg[8]_i_1\ : label is 35;
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[0]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[1]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[2]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[3]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[3]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[4]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[4]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[5]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[5]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[6]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[6]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[7]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[7]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[8]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[8]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync1_reg[9]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync1_reg[9]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[0]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[1]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[2]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[3]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[3]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[4]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[4]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[5]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[5]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[6]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[6]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[7]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[7]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[8]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[8]\ : label is "yes";
  attribute ASYNC_REG_boolean of \pulse_cfg_sync2_reg[9]\ : label is std.standard.true;
  attribute KEEP of \pulse_cfg_sync2_reg[9]\ : label is "yes";
  attribute BOX_TYPE of ref_clk_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of ref_fb_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of ref_mmcm : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ref_mmcm : label is "MMCME2_BASE";
  attribute XILINX_TRANSFORM_PINMAP of ref_mmcm : label is "VCC:CLKINSEL GND:PSINCDEC,PSEN,PSCLK,DWE,DEN,DCLK,DI[15],DI[14],DI[13],DI[12],DI[11],DI[10],DI[9],DI[8],DI[7],DI[6],DI[5],DI[4],DI[3],DI[2],DI[1],DI[0],DADDR[6],DADDR[5],DADDR[4],DADDR[3],DADDR[2],DADDR[1],DADDR[0],CLKIN2";
  attribute ASYNC_REG_boolean of \rst_dac_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \rst_dac_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \rst_dac_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \rst_dac_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \rst_dac_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \rst_dac_sync_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \rx_reset_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \rx_reset_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \rx_reset_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \rx_reset_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \tx_reset_sync_reg[0]\ : label is std.standard.true;
  attribute KEEP of \tx_reset_sync_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \tx_reset_sync_reg[1]\ : label is std.standard.true;
  attribute KEEP of \tx_reset_sync_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \tx_reset_sync_reg[2]\ : label is std.standard.true;
  attribute KEEP of \tx_reset_sync_reg[2]\ : label is "yes";
begin
  echo_clk_acq <= \^echo_clk_acq\;
  echo_rst_acq <= \^echo_rst_acq\;
  idelay_ready_reg <= \^idelay_ready_reg\;
adc_clip_led_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => adc_clip_sync(1),
      Q => adc_clip_led,
      R => rst_sys
    );
adc_clip_sticky_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => rx_i_n_29,
      Q => adc_clip_sticky,
      R => rx_reset_sync(1)
    );
\adc_clip_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => adc_clip_sticky,
      Q => adc_clip_sync(0),
      R => rst_sys
    );
\adc_clip_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => adc_clip_sync(0),
      Q => adc_clip_sync(1),
      R => rst_sys
    );
adc_clock_bufg: unisim.vcomponents.BUFG
     port map (
      I => adc_clock_unbuffered,
      O => \^echo_clk_acq\
    );
\adc_fall_u14_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(0),
      Q => echo_sample_fall_u14(0),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(10),
      Q => echo_sample_fall_u14(10),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(11),
      Q => echo_sample_fall_u14(11),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(12),
      Q => echo_sample_fall_u14(12),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(13),
      Q => echo_sample_fall_u14(13),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(1),
      Q => echo_sample_fall_u14(1),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(2),
      Q => echo_sample_fall_u14(2),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(3),
      Q => echo_sample_fall_u14(3),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(4),
      Q => echo_sample_fall_u14(4),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(5),
      Q => echo_sample_fall_u14(5),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(6),
      Q => echo_sample_fall_u14(6),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(7),
      Q => echo_sample_fall_u14(7),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(8),
      Q => echo_sample_fall_u14(8),
      R => rx_reset_sync(1)
    );
\adc_fall_u14_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_fall(9),
      Q => echo_sample_fall_u14(9),
      R => rx_reset_sync(1)
    );
adc_ready_led_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => adc_ready_sync(1),
      Q => adc_ready_led,
      R => rst_sys
    );
\adc_ready_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \^idelay_ready_reg\,
      Q => adc_ready_sync(0),
      R => rst_sys
    );
\adc_ready_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => adc_ready_sync(0),
      Q => adc_ready_sync(1),
      R => rst_sys
    );
\adc_rise_u14_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(0),
      Q => echo_sample_rise_u14(0),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(10),
      Q => echo_sample_rise_u14(10),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(11),
      Q => echo_sample_rise_u14(11),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(12),
      Q => echo_sample_rise_u14(12),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(13),
      Q => echo_sample_rise_u14(13),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(1),
      Q => echo_sample_rise_u14(1),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(2),
      Q => echo_sample_rise_u14(2),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(3),
      Q => echo_sample_rise_u14(3),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(4),
      Q => echo_sample_rise_u14(4),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(5),
      Q => echo_sample_rise_u14(5),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(6),
      Q => echo_sample_rise_u14(6),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(7),
      Q => echo_sample_rise_u14(7),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(8),
      Q => echo_sample_rise_u14(8),
      R => rx_reset_sync(1)
    );
\adc_rise_u14_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => raw_rise(9),
      Q => echo_sample_rise_u14(9),
      R => rx_reset_sync(1)
    );
\blink_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \blink_count[0]_i_3_n_0\,
      I1 => \blink_count[0]_i_4_n_0\,
      I2 => rst_sys,
      O => \blink_count[0]_i_1_n_0\
    );
\blink_count[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \blink_count[0]_i_6_n_0\,
      I1 => blink_count_reg(7),
      I2 => blink_count_reg(8),
      I3 => blink_count_reg(9),
      I4 => blink_count_reg(10),
      O => \blink_count[0]_i_3_n_0\
    );
\blink_count[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => dac_done_led_i_6_n_0,
      I1 => blink_count_reg(0),
      I2 => blink_count_reg(1),
      I3 => blink_count_reg(2),
      I4 => \blink_count[0]_i_7_n_0\,
      I5 => \blink_count[0]_i_8_n_0\,
      O => \blink_count[0]_i_4_n_0\
    );
\blink_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => blink_count_reg(0),
      O => \blink_count[0]_i_5_n_0\
    );
\blink_count[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => blink_count_reg(23),
      I1 => blink_count_reg(15),
      I2 => blink_count_reg(6),
      I3 => blink_count_reg(24),
      I4 => blink_count_reg(17),
      O => \blink_count[0]_i_6_n_0\
    );
\blink_count[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => blink_count_reg(14),
      I1 => blink_count_reg(5),
      I2 => blink_count_reg(4),
      I3 => blink_count_reg(3),
      O => \blink_count[0]_i_7_n_0\
    );
\blink_count[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => blink_count_reg(16),
      I1 => blink_count_reg(18),
      I2 => blink_count_reg(19),
      I3 => blink_count_reg(20),
      I4 => blink_count_reg(22),
      I5 => blink_count_reg(21),
      O => \blink_count[0]_i_8_n_0\
    );
\blink_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[0]_i_2_n_7\,
      Q => blink_count_reg(0),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \blink_count_reg[0]_i_2_n_0\,
      CO(2) => \blink_count_reg[0]_i_2_n_1\,
      CO(1) => \blink_count_reg[0]_i_2_n_2\,
      CO(0) => \blink_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \blink_count_reg[0]_i_2_n_4\,
      O(2) => \blink_count_reg[0]_i_2_n_5\,
      O(1) => \blink_count_reg[0]_i_2_n_6\,
      O(0) => \blink_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => blink_count_reg(3 downto 1),
      S(0) => \blink_count[0]_i_5_n_0\
    );
\blink_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[8]_i_1_n_5\,
      Q => blink_count_reg(10),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[8]_i_1_n_4\,
      Q => blink_count_reg(11),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[12]_i_1_n_7\,
      Q => blink_count_reg(12),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[8]_i_1_n_0\,
      CO(3) => \blink_count_reg[12]_i_1_n_0\,
      CO(2) => \blink_count_reg[12]_i_1_n_1\,
      CO(1) => \blink_count_reg[12]_i_1_n_2\,
      CO(0) => \blink_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \blink_count_reg[12]_i_1_n_4\,
      O(2) => \blink_count_reg[12]_i_1_n_5\,
      O(1) => \blink_count_reg[12]_i_1_n_6\,
      O(0) => \blink_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => blink_count_reg(15 downto 12)
    );
\blink_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[12]_i_1_n_6\,
      Q => blink_count_reg(13),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[12]_i_1_n_5\,
      Q => blink_count_reg(14),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[12]_i_1_n_4\,
      Q => blink_count_reg(15),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[16]_i_1_n_7\,
      Q => blink_count_reg(16),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[12]_i_1_n_0\,
      CO(3) => \blink_count_reg[16]_i_1_n_0\,
      CO(2) => \blink_count_reg[16]_i_1_n_1\,
      CO(1) => \blink_count_reg[16]_i_1_n_2\,
      CO(0) => \blink_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \blink_count_reg[16]_i_1_n_4\,
      O(2) => \blink_count_reg[16]_i_1_n_5\,
      O(1) => \blink_count_reg[16]_i_1_n_6\,
      O(0) => \blink_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => blink_count_reg(19 downto 16)
    );
\blink_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[16]_i_1_n_6\,
      Q => blink_count_reg(17),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[16]_i_1_n_5\,
      Q => blink_count_reg(18),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[16]_i_1_n_4\,
      Q => blink_count_reg(19),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[0]_i_2_n_6\,
      Q => blink_count_reg(1),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[20]_i_1_n_7\,
      Q => blink_count_reg(20),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[16]_i_1_n_0\,
      CO(3) => \blink_count_reg[20]_i_1_n_0\,
      CO(2) => \blink_count_reg[20]_i_1_n_1\,
      CO(1) => \blink_count_reg[20]_i_1_n_2\,
      CO(0) => \blink_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \blink_count_reg[20]_i_1_n_4\,
      O(2) => \blink_count_reg[20]_i_1_n_5\,
      O(1) => \blink_count_reg[20]_i_1_n_6\,
      O(0) => \blink_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => blink_count_reg(23 downto 20)
    );
\blink_count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[20]_i_1_n_6\,
      Q => blink_count_reg(21),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[20]_i_1_n_5\,
      Q => blink_count_reg(22),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[20]_i_1_n_4\,
      Q => blink_count_reg(23),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[24]_i_1_n_7\,
      Q => blink_count_reg(24),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[20]_i_1_n_0\,
      CO(3 downto 0) => \NLW_blink_count_reg[24]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_blink_count_reg[24]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \blink_count_reg[24]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => blink_count_reg(24)
    );
\blink_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[0]_i_2_n_5\,
      Q => blink_count_reg(2),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[0]_i_2_n_4\,
      Q => blink_count_reg(3),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[4]_i_1_n_7\,
      Q => blink_count_reg(4),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[0]_i_2_n_0\,
      CO(3) => \blink_count_reg[4]_i_1_n_0\,
      CO(2) => \blink_count_reg[4]_i_1_n_1\,
      CO(1) => \blink_count_reg[4]_i_1_n_2\,
      CO(0) => \blink_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \blink_count_reg[4]_i_1_n_4\,
      O(2) => \blink_count_reg[4]_i_1_n_5\,
      O(1) => \blink_count_reg[4]_i_1_n_6\,
      O(0) => \blink_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => blink_count_reg(7 downto 4)
    );
\blink_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[4]_i_1_n_6\,
      Q => blink_count_reg(5),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[4]_i_1_n_5\,
      Q => blink_count_reg(6),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[4]_i_1_n_4\,
      Q => blink_count_reg(7),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[8]_i_1_n_7\,
      Q => blink_count_reg(8),
      R => \blink_count[0]_i_1_n_0\
    );
\blink_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \blink_count_reg[4]_i_1_n_0\,
      CO(3) => \blink_count_reg[8]_i_1_n_0\,
      CO(2) => \blink_count_reg[8]_i_1_n_1\,
      CO(1) => \blink_count_reg[8]_i_1_n_2\,
      CO(0) => \blink_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \blink_count_reg[8]_i_1_n_4\,
      O(2) => \blink_count_reg[8]_i_1_n_5\,
      O(1) => \blink_count_reg[8]_i_1_n_6\,
      O(0) => \blink_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => blink_count_reg(11 downto 8)
    );
\blink_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \blink_count_reg[8]_i_1_n_6\,
      Q => blink_count_reg(9),
      R => \blink_count[0]_i_1_n_0\
    );
burst_i: entity work.system_frontend_0_0_pulse_burst_32
     port map (
      Q(5 downto 0) => echo_pulse_frames_sent(5 downto 0),
      SR(0) => burst_start_cdc_n_1,
      active_reg_0 => burst_i_n_0,
      active_reg_1(0) => idelay_ready_dac(1),
      active_reg_2(0) => rst_dac_sync(2),
      active_reg_3(0) => tx_reset_sync(2),
      burst_start_dac => burst_start_dac,
      clk_dac => clk_dac,
      \out\(0) => enable_sync(1),
      p_29_in => p_29_in,
      \pulse_ready_dac__1\ => \pulse_ready_dac__1\,
      repeat_enable => repeat_enable,
      running15_out => running15_out,
      running_reg => pulse_i_n_3,
      source_frame_last => source_frame_last,
      source_frame_start => source_frame_start,
      tx_reset => tx_reset
    );
burst_start_cdc: entity work.system_frontend_0_0_cdc_pulse_toggle
     port map (
      SR(0) => burst_start_cdc_n_1,
      burst_start_dac => burst_start_dac,
      clk_dac => clk_dac,
      echo_clk_acq => \^echo_clk_acq\,
      echo_pulse_start_acq => echo_pulse_start_acq,
      echo_rst_acq => \^echo_rst_acq\,
      \frames_sent_reg[5]\(0) => idelay_ready_dac(1),
      \frames_sent_reg[5]_0\(0) => rst_dac_sync(2),
      \frames_sent_reg[5]_1\(0) => tx_reset_sync(2),
      \frames_sent_reg[5]_2\ => burst_i_n_0,
      \out\(0) => enable_sync(1),
      tx_reset => tx_reset
    );
clip_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => adc_clip_sticky_1,
      Q => echo_sample_clip,
      R => rx_reset_sync(1)
    );
dac_clock_bufg: unisim.vcomponents.BUFG
     port map (
      I => dac_clock_unbuffered,
      O => clk_dac
    );
dac_clock_mmcm: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 10.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 10.000000,
      CLKOUT0_DIVIDE_F => 10.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 10,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 175.500000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      REF_JITTER1 => 0.010000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => mmcm_feedback_buf,
      CLKFBOUT => mmcm_feedback,
      CLKFBOUTB => NLW_dac_clock_mmcm_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_dac_clock_mmcm_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => dco_se,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_dac_clock_mmcm_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => dac_clock_unbuffered,
      CLKOUT0B => NLW_dac_clock_mmcm_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => adc_clock_unbuffered,
      CLKOUT1B => NLW_dac_clock_mmcm_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_dac_clock_mmcm_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_dac_clock_mmcm_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_dac_clock_mmcm_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_dac_clock_mmcm_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_dac_clock_mmcm_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_dac_clock_mmcm_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_dac_clock_mmcm_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_dac_clock_mmcm_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_dac_clock_mmcm_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => mmcm_locked,
      PSCLK => '0',
      PSDONE => NLW_dac_clock_mmcm_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => rst_sys
    );
dac_done_led_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFBFBFFFFFBFBF"
    )
        port map (
      I0 => dac_done_led_i_5_n_0,
      I1 => blink_count_reg(18),
      I2 => blink_count_reg(19),
      I3 => dac_done_led_i_6_n_0,
      I4 => dac_done_led_i_7_n_0,
      I5 => blink_count_reg(10),
      O => dac_done_led_i_2_n_0
    );
dac_done_led_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"57FFFFFF"
    )
        port map (
      I0 => blink_count_reg(17),
      I1 => blink_count_reg(16),
      I2 => blink_count_reg(15),
      I3 => blink_count_reg(21),
      I4 => blink_count_reg(20),
      O => dac_done_led_i_3_n_0
    );
dac_done_led_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => blink_count_reg(8),
      I1 => blink_count_reg(9),
      I2 => dac_done_led_i_7_n_0,
      I3 => blink_count_reg(5),
      I4 => blink_count_reg(6),
      I5 => blink_count_reg(7),
      O => dac_done_led_i_5_n_0
    );
dac_done_led_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => blink_count_reg(12),
      I1 => blink_count_reg(13),
      I2 => blink_count_reg(11),
      O => dac_done_led_i_6_n_0
    );
dac_done_led_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => blink_count_reg(16),
      I1 => blink_count_reg(14),
      O => dac_done_led_i_7_n_0
    );
dac_done_led_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => dac_done_led0,
      Q => dac_done_led,
      R => rst_sys
    );
dac_sdio_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => dac_sdio_o,
      IO => dac_spi_sdio,
      O => dac_sdio_i,
      T => dac_sdio_t
    );
dco_alive_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888B8B8B8B8B888"
    )
        port map (
      I0 => dco_alive,
      I1 => \monitor_count[0]_i_3_n_0\,
      I2 => locked_sync(1),
      I3 => edge_seen,
      I4 => heartbeat_sync(2),
      I5 => heartbeat_previous,
      O => dco_alive_i_1_n_0
    );
dco_alive_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => dco_alive_i_1_n_0,
      Q => dco_alive,
      R => rst_sys
    );
dco_bufg: unisim.vcomponents.BUFG
     port map (
      I => dco_se,
      O => clk_dco
    );
dco_ibuf: unisim.vcomponents.IBUFDS
     port map (
      I => adc_dco_p,
      IB => adc_dco_n,
      O => dco_se
    );
echo_rst_acq_sync_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => rx_reset_sync(1),
      Q => \^echo_rst_acq\,
      R => '0'
    );
edge_seen_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55140000"
    )
        port map (
      I0 => rst_sys,
      I1 => heartbeat_previous,
      I2 => heartbeat_sync(2),
      I3 => edge_seen,
      I4 => \monitor_count[0]_i_3_n_0\,
      O => edge_seen_i_1_n_0
    );
edge_seen_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => edge_seen_i_1_n_0,
      Q => edge_seen,
      R => '0'
    );
\enable_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => dac_config_done,
      Q => enable_sync(0),
      R => rst_dac_sync(2)
    );
\enable_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => enable_sync(0),
      Q => enable_sync(1),
      R => rst_dac_sync(2)
    );
feedback_bufg: unisim.vcomponents.BUFG
     port map (
      I => mmcm_feedback,
      O => mmcm_feedback_buf
    );
\frame_meta_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[0]\,
      Q => echo_frame_meta(0),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[10]\,
      Q => echo_frame_meta(10),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[11]\,
      Q => echo_frame_meta(11),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[12]\,
      Q => echo_frame_meta(12),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[13]\,
      Q => echo_frame_meta(13),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[14]\,
      Q => echo_frame_meta(14),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[15]\,
      Q => echo_frame_meta(15),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[16]\,
      Q => echo_frame_meta(16),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[17]\,
      Q => echo_frame_meta(17),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[18]\,
      Q => echo_frame_meta(18),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[19]\,
      Q => echo_frame_meta(19),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[1]\,
      Q => echo_frame_meta(1),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[20]\,
      Q => echo_frame_meta(20),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[21]\,
      Q => echo_frame_meta(21),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[22]\,
      Q => echo_frame_meta(22),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[23]\,
      Q => echo_frame_meta(23),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[24]\,
      Q => echo_frame_meta(24),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[25]\,
      Q => echo_frame_meta(25),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[26]\,
      Q => echo_frame_meta(26),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[27]\,
      Q => echo_frame_meta(27),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[28]\,
      Q => echo_frame_meta(28),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[29]\,
      Q => echo_frame_meta(29),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[2]\,
      Q => echo_frame_meta(2),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[30]\,
      Q => echo_frame_meta(30),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[31]\,
      Q => echo_frame_meta(31),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[3]\,
      Q => echo_frame_meta(3),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[4]\,
      Q => echo_frame_meta(4),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[5]\,
      Q => echo_frame_meta(5),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[6]\,
      Q => echo_frame_meta(6),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[7]\,
      Q => echo_frame_meta(7),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => \launch_meta_reg_n_0_[8]\,
      Q => echo_frame_meta(8),
      R => rx_reset_sync(1)
    );
\frame_meta_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => frame_meta_q0,
      Q => echo_frame_meta(9),
      R => rx_reset_sync(1)
    );
\heartbeat_div[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\heartbeat_div[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[0]\,
      I1 => \heartbeat_div_reg_n_0_[1]\,
      O => p_0_in(1)
    );
\heartbeat_div[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[0]\,
      I1 => \heartbeat_div_reg_n_0_[1]\,
      I2 => \heartbeat_div_reg_n_0_[2]\,
      O => p_0_in(2)
    );
\heartbeat_div[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[1]\,
      I1 => \heartbeat_div_reg_n_0_[0]\,
      I2 => \heartbeat_div_reg_n_0_[2]\,
      I3 => \heartbeat_div_reg_n_0_[3]\,
      O => p_0_in(3)
    );
\heartbeat_div[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[2]\,
      I1 => \heartbeat_div_reg_n_0_[0]\,
      I2 => \heartbeat_div_reg_n_0_[1]\,
      I3 => \heartbeat_div_reg_n_0_[3]\,
      I4 => \heartbeat_div_reg_n_0_[4]\,
      O => p_0_in(4)
    );
\heartbeat_div[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[3]\,
      I1 => \heartbeat_div_reg_n_0_[1]\,
      I2 => \heartbeat_div_reg_n_0_[0]\,
      I3 => \heartbeat_div_reg_n_0_[2]\,
      I4 => \heartbeat_div_reg_n_0_[4]\,
      I5 => \heartbeat_div_reg_n_0_[5]\,
      O => p_0_in(5)
    );
\heartbeat_div[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \heartbeat_div[9]_i_2_n_0\,
      I1 => \heartbeat_div_reg_n_0_[6]\,
      O => p_0_in(6)
    );
\heartbeat_div[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \heartbeat_div[9]_i_2_n_0\,
      I1 => \heartbeat_div_reg_n_0_[6]\,
      I2 => \heartbeat_div_reg_n_0_[7]\,
      O => p_0_in(7)
    );
\heartbeat_div[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[6]\,
      I1 => \heartbeat_div[9]_i_2_n_0\,
      I2 => \heartbeat_div_reg_n_0_[7]\,
      I3 => \heartbeat_div_reg_n_0_[8]\,
      O => p_0_in(8)
    );
\heartbeat_div[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[7]\,
      I1 => \heartbeat_div[9]_i_2_n_0\,
      I2 => \heartbeat_div_reg_n_0_[6]\,
      I3 => \heartbeat_div_reg_n_0_[8]\,
      I4 => heartbeat_div_reg(9),
      O => p_0_in(9)
    );
\heartbeat_div[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \heartbeat_div_reg_n_0_[5]\,
      I1 => \heartbeat_div_reg_n_0_[3]\,
      I2 => \heartbeat_div_reg_n_0_[1]\,
      I3 => \heartbeat_div_reg_n_0_[0]\,
      I4 => \heartbeat_div_reg_n_0_[2]\,
      I5 => \heartbeat_div_reg_n_0_[4]\,
      O => \heartbeat_div[9]_i_2_n_0\
    );
\heartbeat_div_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(0),
      Q => \heartbeat_div_reg_n_0_[0]\,
      R => '0'
    );
\heartbeat_div_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(1),
      Q => \heartbeat_div_reg_n_0_[1]\,
      R => '0'
    );
\heartbeat_div_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(2),
      Q => \heartbeat_div_reg_n_0_[2]\,
      R => '0'
    );
\heartbeat_div_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(3),
      Q => \heartbeat_div_reg_n_0_[3]\,
      R => '0'
    );
\heartbeat_div_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(4),
      Q => \heartbeat_div_reg_n_0_[4]\,
      R => '0'
    );
\heartbeat_div_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(5),
      Q => \heartbeat_div_reg_n_0_[5]\,
      R => '0'
    );
\heartbeat_div_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(6),
      Q => \heartbeat_div_reg_n_0_[6]\,
      R => '0'
    );
\heartbeat_div_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(7),
      Q => \heartbeat_div_reg_n_0_[7]\,
      R => '0'
    );
\heartbeat_div_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(8),
      Q => \heartbeat_div_reg_n_0_[8]\,
      R => '0'
    );
\heartbeat_div_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dco,
      CE => '1',
      D => p_0_in(9),
      Q => heartbeat_div_reg(9),
      R => '0'
    );
heartbeat_previous_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => heartbeat_sync(2),
      Q => heartbeat_previous,
      R => rst_sys
    );
\heartbeat_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => heartbeat_div_reg(9),
      Q => heartbeat_sync(0),
      R => rst_sys
    );
\heartbeat_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => heartbeat_sync(0),
      Q => heartbeat_sync(1),
      R => rst_sys
    );
\heartbeat_sync_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => heartbeat_sync(1),
      Q => heartbeat_sync(2),
      R => rst_sys
    );
\idelay_ready_dac_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => \^idelay_ready_reg\,
      Q => idelay_ready_dac(0),
      R => '0'
    );
\idelay_ready_dac_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => idelay_ready_dac(0),
      Q => idelay_ready_dac(1),
      R => '0'
    );
init_i: entity work.system_frontend_0_0_dac_init
     port map (
      D(0) => dac_config_done,
      adk_spi_csb => adk_spi_csb,
      adk_spi_sda => adk_spi_sda,
      blink_count_reg(2 downto 0) => blink_count_reg(24 downto 22),
      clk_50m => clk_50m,
      clock_config_done => clock_config_done,
      dac_done_led0 => dac_done_led0,
      dac_done_led_reg => dac_done_led_i_2_n_0,
      dac_done_led_reg_0 => dac_done_led_i_3_n_0,
      dac_sdio_i => dac_sdio_i,
      dac_sdio_o => dac_sdio_o,
      dac_sdio_t => dac_sdio_t,
      dac_spi_csb => dac_spi_csb,
      dco_alive => dco_alive,
      rst_sys => rst_sys,
      sclk_reg => sclk_reg,
      sclk_reg_0 => sclk_reg_0
    );
launch_marker_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => launch_marker0,
      Q => launch_marker,
      R => tx_reset
    );
\launch_meta_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(0),
      Q => \launch_meta_reg_n_0_[0]\,
      R => tx_reset
    );
\launch_meta_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => p_0_out(10),
      Q => \launch_meta_reg_n_0_[10]\,
      R => tx_reset
    );
\launch_meta_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => p_0_out(11),
      Q => \launch_meta_reg_n_0_[11]\,
      R => tx_reset
    );
\launch_meta_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => p_0_out(12),
      Q => \launch_meta_reg_n_0_[12]\,
      R => tx_reset
    );
\launch_meta_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_mode(0),
      Q => \launch_meta_reg_n_0_[13]\,
      R => tx_reset
    );
\launch_meta_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_mode(1),
      Q => \launch_meta_reg_n_0_[14]\,
      R => tx_reset
    );
\launch_meta_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_mode(2),
      Q => \launch_meta_reg_n_0_[15]\,
      R => tx_reset
    );
\launch_meta_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(0),
      Q => \launch_meta_reg_n_0_[16]\,
      R => tx_reset
    );
\launch_meta_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(1),
      Q => \launch_meta_reg_n_0_[17]\,
      R => tx_reset
    );
\launch_meta_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(2),
      Q => \launch_meta_reg_n_0_[18]\,
      R => tx_reset
    );
\launch_meta_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(3),
      Q => \launch_meta_reg_n_0_[19]\,
      R => tx_reset
    );
\launch_meta_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(1),
      Q => \launch_meta_reg_n_0_[1]\,
      R => tx_reset
    );
\launch_meta_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(4),
      Q => \launch_meta_reg_n_0_[20]\,
      R => tx_reset
    );
\launch_meta_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(5),
      Q => \launch_meta_reg_n_0_[21]\,
      R => tx_reset
    );
\launch_meta_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(6),
      Q => \launch_meta_reg_n_0_[22]\,
      R => tx_reset
    );
\launch_meta_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(7),
      Q => \launch_meta_reg_n_0_[23]\,
      R => tx_reset
    );
\launch_meta_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(8),
      Q => \launch_meta_reg_n_0_[24]\,
      R => tx_reset
    );
\launch_meta_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(9),
      Q => \launch_meta_reg_n_0_[25]\,
      R => tx_reset
    );
\launch_meta_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(10),
      Q => \launch_meta_reg_n_0_[26]\,
      R => tx_reset
    );
\launch_meta_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(11),
      Q => \launch_meta_reg_n_0_[27]\,
      R => tx_reset
    );
\launch_meta_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(12),
      Q => \launch_meta_reg_n_0_[28]\,
      R => tx_reset
    );
\launch_meta_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(13),
      Q => \launch_meta_reg_n_0_[29]\,
      R => tx_reset
    );
\launch_meta_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(2),
      Q => \launch_meta_reg_n_0_[2]\,
      R => tx_reset
    );
\launch_meta_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(14),
      Q => \launch_meta_reg_n_0_[30]\,
      R => tx_reset
    );
\launch_meta_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_frame_id(15),
      Q => \launch_meta_reg_n_0_[31]\,
      R => tx_reset
    );
\launch_meta_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(3),
      Q => \launch_meta_reg_n_0_[3]\,
      R => tx_reset
    );
\launch_meta_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(4),
      Q => \launch_meta_reg_n_0_[4]\,
      R => tx_reset
    );
\launch_meta_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(5),
      Q => \launch_meta_reg_n_0_[5]\,
      R => tx_reset
    );
\launch_meta_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(6),
      Q => \launch_meta_reg_n_0_[6]\,
      R => tx_reset
    );
\launch_meta_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(7),
      Q => \launch_meta_reg_n_0_[7]\,
      R => tx_reset
    );
\launch_meta_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => source_index(8),
      Q => \launch_meta_reg_n_0_[8]\,
      R => tx_reset
    );
\launch_meta_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => p_0_out(9),
      Q => launch_meta(9),
      R => tx_reset
    );
\locked_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => mmcm_locked,
      Q => locked_sync(0),
      R => rst_sys
    );
\locked_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => locked_sync(0),
      Q => locked_sync(1),
      R => rst_sys
    );
\monitor_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rst_sys,
      I1 => \monitor_count[0]_i_3_n_0\,
      O => \monitor_count[0]_i_1_n_0\
    );
\monitor_count[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FFFFFF"
    )
        port map (
      I0 => \monitor_count[0]_i_5_n_0\,
      I1 => monitor_count_reg(13),
      I2 => monitor_count_reg(10),
      I3 => monitor_count_reg(15),
      I4 => monitor_count_reg(14),
      O => \monitor_count[0]_i_3_n_0\
    );
\monitor_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => monitor_count_reg(0),
      O => \monitor_count[0]_i_4_n_0\
    );
\monitor_count[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEEEEEEEEE"
    )
        port map (
      I0 => monitor_count_reg(12),
      I1 => monitor_count_reg(11),
      I2 => monitor_count_reg(6),
      I3 => \monitor_count[0]_i_6_n_0\,
      I4 => monitor_count_reg(7),
      I5 => \monitor_count[0]_i_7_n_0\,
      O => \monitor_count[0]_i_5_n_0\
    );
\monitor_count[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF8000"
    )
        port map (
      I0 => monitor_count_reg(2),
      I1 => monitor_count_reg(3),
      I2 => monitor_count_reg(0),
      I3 => monitor_count_reg(1),
      I4 => monitor_count_reg(5),
      I5 => monitor_count_reg(4),
      O => \monitor_count[0]_i_6_n_0\
    );
\monitor_count[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => monitor_count_reg(8),
      I1 => monitor_count_reg(9),
      O => \monitor_count[0]_i_7_n_0\
    );
\monitor_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[0]_i_2_n_7\,
      Q => monitor_count_reg(0),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \monitor_count_reg[0]_i_2_n_0\,
      CO(2) => \monitor_count_reg[0]_i_2_n_1\,
      CO(1) => \monitor_count_reg[0]_i_2_n_2\,
      CO(0) => \monitor_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \monitor_count_reg[0]_i_2_n_4\,
      O(2) => \monitor_count_reg[0]_i_2_n_5\,
      O(1) => \monitor_count_reg[0]_i_2_n_6\,
      O(0) => \monitor_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => monitor_count_reg(3 downto 1),
      S(0) => \monitor_count[0]_i_4_n_0\
    );
\monitor_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[8]_i_1_n_5\,
      Q => monitor_count_reg(10),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[8]_i_1_n_4\,
      Q => monitor_count_reg(11),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[12]_i_1_n_7\,
      Q => monitor_count_reg(12),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \monitor_count_reg[8]_i_1_n_0\,
      CO(3) => \NLW_monitor_count_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \monitor_count_reg[12]_i_1_n_1\,
      CO(1) => \monitor_count_reg[12]_i_1_n_2\,
      CO(0) => \monitor_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \monitor_count_reg[12]_i_1_n_4\,
      O(2) => \monitor_count_reg[12]_i_1_n_5\,
      O(1) => \monitor_count_reg[12]_i_1_n_6\,
      O(0) => \monitor_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => monitor_count_reg(15 downto 12)
    );
\monitor_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[12]_i_1_n_6\,
      Q => monitor_count_reg(13),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[12]_i_1_n_5\,
      Q => monitor_count_reg(14),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[12]_i_1_n_4\,
      Q => monitor_count_reg(15),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[0]_i_2_n_6\,
      Q => monitor_count_reg(1),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[0]_i_2_n_5\,
      Q => monitor_count_reg(2),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[0]_i_2_n_4\,
      Q => monitor_count_reg(3),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[4]_i_1_n_7\,
      Q => monitor_count_reg(4),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \monitor_count_reg[0]_i_2_n_0\,
      CO(3) => \monitor_count_reg[4]_i_1_n_0\,
      CO(2) => \monitor_count_reg[4]_i_1_n_1\,
      CO(1) => \monitor_count_reg[4]_i_1_n_2\,
      CO(0) => \monitor_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \monitor_count_reg[4]_i_1_n_4\,
      O(2) => \monitor_count_reg[4]_i_1_n_5\,
      O(1) => \monitor_count_reg[4]_i_1_n_6\,
      O(0) => \monitor_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => monitor_count_reg(7 downto 4)
    );
\monitor_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[4]_i_1_n_6\,
      Q => monitor_count_reg(5),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[4]_i_1_n_5\,
      Q => monitor_count_reg(6),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[4]_i_1_n_4\,
      Q => monitor_count_reg(7),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[8]_i_1_n_7\,
      Q => monitor_count_reg(8),
      R => \monitor_count[0]_i_1_n_0\
    );
\monitor_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \monitor_count_reg[4]_i_1_n_0\,
      CO(3) => \monitor_count_reg[8]_i_1_n_0\,
      CO(2) => \monitor_count_reg[8]_i_1_n_1\,
      CO(1) => \monitor_count_reg[8]_i_1_n_2\,
      CO(0) => \monitor_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \monitor_count_reg[8]_i_1_n_4\,
      O(2) => \monitor_count_reg[8]_i_1_n_5\,
      O(1) => \monitor_count_reg[8]_i_1_n_6\,
      O(0) => \monitor_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => monitor_count_reg(11 downto 8)
    );
\monitor_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => \monitor_count_reg[8]_i_1_n_6\,
      Q => monitor_count_reg(9),
      R => \monitor_count[0]_i_1_n_0\
    );
pair_valid_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => sample_valid,
      Q => echo_pair_valid,
      R => rx_reset_sync(1)
    );
pll_done_led_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_50m,
      CE => '1',
      D => clock_config_done,
      Q => pll_done_led,
      R => rst_sys
    );
\power_count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \power_count_reg_n_0_[0]\,
      O => \power_count[0]_i_2_n_0\
    );
\power_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[0]_i_1_n_7\,
      Q => \power_count_reg_n_0_[0]\,
      R => '0'
    );
\power_count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \power_count_reg[0]_i_1_n_0\,
      CO(2) => \power_count_reg[0]_i_1_n_1\,
      CO(1) => \power_count_reg[0]_i_1_n_2\,
      CO(0) => \power_count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \power_count_reg[0]_i_1_n_4\,
      O(2) => \power_count_reg[0]_i_1_n_5\,
      O(1) => \power_count_reg[0]_i_1_n_6\,
      O(0) => \power_count_reg[0]_i_1_n_7\,
      S(3) => \power_count_reg_n_0_[3]\,
      S(2) => \power_count_reg_n_0_[2]\,
      S(1) => \power_count_reg_n_0_[1]\,
      S(0) => \power_count[0]_i_2_n_0\
    );
\power_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[8]_i_1_n_5\,
      Q => power_count_reg(10),
      R => '0'
    );
\power_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[8]_i_1_n_4\,
      Q => power_count_reg(11),
      R => '0'
    );
\power_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[12]_i_1_n_7\,
      Q => power_count_reg(12),
      R => '0'
    );
\power_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \power_count_reg[8]_i_1_n_0\,
      CO(3) => \NLW_power_count_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \power_count_reg[12]_i_1_n_1\,
      CO(1) => \power_count_reg[12]_i_1_n_2\,
      CO(0) => \power_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \power_count_reg[12]_i_1_n_4\,
      O(2) => \power_count_reg[12]_i_1_n_5\,
      O(1) => \power_count_reg[12]_i_1_n_6\,
      O(0) => \power_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => power_count_reg(15 downto 12)
    );
\power_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[12]_i_1_n_6\,
      Q => power_count_reg(13),
      R => '0'
    );
\power_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[12]_i_1_n_5\,
      Q => power_count_reg(14),
      R => '0'
    );
\power_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[12]_i_1_n_4\,
      Q => power_count_reg(15),
      R => '0'
    );
\power_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[0]_i_1_n_6\,
      Q => \power_count_reg_n_0_[1]\,
      R => '0'
    );
\power_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[0]_i_1_n_5\,
      Q => \power_count_reg_n_0_[2]\,
      R => '0'
    );
\power_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[0]_i_1_n_4\,
      Q => \power_count_reg_n_0_[3]\,
      R => '0'
    );
\power_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[4]_i_1_n_7\,
      Q => power_count_reg(4),
      R => '0'
    );
\power_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \power_count_reg[0]_i_1_n_0\,
      CO(3) => \power_count_reg[4]_i_1_n_0\,
      CO(2) => \power_count_reg[4]_i_1_n_1\,
      CO(1) => \power_count_reg[4]_i_1_n_2\,
      CO(0) => \power_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \power_count_reg[4]_i_1_n_4\,
      O(2) => \power_count_reg[4]_i_1_n_5\,
      O(1) => \power_count_reg[4]_i_1_n_6\,
      O(0) => \power_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => power_count_reg(7 downto 4)
    );
\power_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[4]_i_1_n_6\,
      Q => power_count_reg(5),
      R => '0'
    );
\power_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[4]_i_1_n_5\,
      Q => power_count_reg(6),
      R => '0'
    );
\power_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[4]_i_1_n_4\,
      Q => power_count_reg(7),
      R => '0'
    );
\power_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[8]_i_1_n_7\,
      Q => power_count_reg(8),
      R => '0'
    );
\power_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \power_count_reg[4]_i_1_n_0\,
      CO(3) => \power_count_reg[8]_i_1_n_0\,
      CO(2) => \power_count_reg[8]_i_1_n_1\,
      CO(1) => \power_count_reg[8]_i_1_n_2\,
      CO(0) => \power_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \power_count_reg[8]_i_1_n_4\,
      O(2) => \power_count_reg[8]_i_1_n_5\,
      O(1) => \power_count_reg[8]_i_1_n_6\,
      O(0) => \power_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => power_count_reg(11 downto 8)
    );
\power_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_50m,
      CE => rst_sys_i_1_n_0,
      D => \power_count_reg[8]_i_1_n_6\,
      Q => power_count_reg(9),
      R => '0'
    );
\pulse_cfg_sync1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(0),
      Q => pulse_cfg_sync1(0),
      R => '0'
    );
\pulse_cfg_sync1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(1),
      Q => pulse_cfg_sync1(1),
      R => '0'
    );
\pulse_cfg_sync1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(2),
      Q => pulse_cfg_sync1(2),
      R => '0'
    );
\pulse_cfg_sync1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(3),
      Q => pulse_cfg_sync1(3),
      R => '0'
    );
\pulse_cfg_sync1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(4),
      Q => pulse_cfg_sync1(4),
      R => '0'
    );
\pulse_cfg_sync1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(5),
      Q => pulse_cfg_sync1(5),
      R => '0'
    );
\pulse_cfg_sync1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(6),
      Q => pulse_cfg_sync1(6),
      R => '0'
    );
\pulse_cfg_sync1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(7),
      Q => pulse_cfg_sync1(7),
      R => '0'
    );
\pulse_cfg_sync1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(8),
      Q => pulse_cfg_sync1(8),
      R => '0'
    );
\pulse_cfg_sync1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => D(9),
      Q => pulse_cfg_sync1(9),
      R => '0'
    );
\pulse_cfg_sync2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(0),
      Q => pulse_cfg_sync2(0),
      R => '0'
    );
\pulse_cfg_sync2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(1),
      Q => pulse_cfg_sync2(1),
      R => '0'
    );
\pulse_cfg_sync2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(2),
      Q => pulse_cfg_sync2(2),
      R => '0'
    );
\pulse_cfg_sync2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(3),
      Q => pulse_cfg_sync2(3),
      R => '0'
    );
\pulse_cfg_sync2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(4),
      Q => pulse_cfg_sync2(4),
      R => '0'
    );
\pulse_cfg_sync2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(5),
      Q => pulse_cfg_sync2(5),
      R => '0'
    );
\pulse_cfg_sync2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(6),
      Q => pulse_cfg_sync2(6),
      R => '0'
    );
\pulse_cfg_sync2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(7),
      Q => pulse_cfg_sync2(7),
      R => '0'
    );
\pulse_cfg_sync2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(8),
      Q => pulse_cfg_sync2(8),
      R => '0'
    );
\pulse_cfg_sync2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => pulse_cfg_sync1(9),
      Q => pulse_cfg_sync2(9),
      R => '0'
    );
pulse_i: entity work.system_frontend_0_0_sync_pulse_engine
     port map (
      D(31 downto 16) => source_frame_id(15 downto 0),
      D(15 downto 13) => source_mode(2 downto 0),
      D(12 downto 9) => p_0_out(12 downto 9),
      D(8 downto 0) => source_index(8 downto 0),
      clk_dac => clk_dac,
      i_sample(1) => pulse_i_n_6,
      i_sample(0) => pulse_i_n_7,
      launch_marker0 => launch_marker0,
      \out\(9 downto 0) => pulse_cfg_sync2(9 downto 0),
      p_29_in => p_29_in,
      \pulse_ready_dac__1\ => \pulse_ready_dac__1\,
      repeat_enable => repeat_enable,
      running15_out => running15_out,
      running_reg_0 => pulse_i_n_3,
      source_frame_last => source_frame_last,
      source_frame_start => source_frame_start,
      \source_sample_reg[12]_0\(0) => tx_reset_sync(2),
      \source_sample_reg[12]_1\(0) => rst_dac_sync(2),
      \source_sample_reg[14]_0\(0) => enable_sync(1),
      \source_sample_reg[14]_1\(0) => idelay_ready_dac(1),
      tx_reset => tx_reset
    );
pulse_ready_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => pulse_ready_q0,
      Q => echo_pulse_ready,
      R => rx_reset_sync(1)
    );
ref_clk_bufg: unisim.vcomponents.BUFG
     port map (
      I => ref_unbuffered,
      O => ref_clk_200m
    );
ref_fb_bufg: unisim.vcomponents.BUFG
     port map (
      I => ref_feedback,
      O => ref_feedback_buf
    );
ref_mmcm: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 20.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 20.000000,
      CLKOUT0_DIVIDE_F => 5.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      REF_JITTER1 => 0.010000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => ref_feedback_buf,
      CLKFBOUT => ref_feedback,
      CLKFBOUTB => NLW_ref_mmcm_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_ref_mmcm_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_50m,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_ref_mmcm_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => ref_unbuffered,
      CLKOUT0B => NLW_ref_mmcm_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_ref_mmcm_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_ref_mmcm_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_ref_mmcm_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_ref_mmcm_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_ref_mmcm_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_ref_mmcm_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_ref_mmcm_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_ref_mmcm_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_ref_mmcm_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_ref_mmcm_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_ref_mmcm_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => ref_locked,
      PSCLK => '0',
      PSDONE => NLW_ref_mmcm_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => rst_sys
    );
\rst_dac_sync[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rst_sys,
      I1 => mmcm_locked,
      O => reset_source
    );
\rst_dac_sync_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => '0',
      PRE => reset_source,
      Q => rst_dac_sync(0)
    );
\rst_dac_sync_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => rst_dac_sync(0),
      PRE => reset_source,
      Q => rst_dac_sync(1)
    );
\rst_dac_sync_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => rst_dac_sync(1),
      PRE => reset_source,
      Q => rst_dac_sync(2)
    );
rst_sys_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F777"
    )
        port map (
      I0 => power_count_reg(15),
      I1 => power_count_reg(14),
      I2 => rst_sys_i_2_n_0,
      I3 => rst_sys_i_3_n_0,
      O => rst_sys_i_1_n_0
    );
rst_sys_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0155FFFFFFFFFFFF"
    )
        port map (
      I0 => power_count_reg(7),
      I1 => power_count_reg(4),
      I2 => power_count_reg(5),
      I3 => power_count_reg(6),
      I4 => power_count_reg(9),
      I5 => power_count_reg(8),
      O => rst_sys_i_2_n_0
    );
rst_sys_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => power_count_reg(11),
      I1 => power_count_reg(10),
      I2 => power_count_reg(13),
      I3 => power_count_reg(12),
      O => rst_sys_i_3_n_0
    );
rst_sys_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_50m,
      CE => '1',
      D => rst_sys_i_1_n_0,
      Q => rst_sys,
      R => '0'
    );
rx_i: entity work.system_frontend_0_0_adc_loopback_rx
     port map (
      AS(0) => adc_reset_source,
      CLK => \^echo_clk_acq\,
      D(13 downto 0) => raw_rise(13 downto 0),
      Q(0) => launch_meta(9),
      \acq_reset_sync_reg[2]_0\(0) => mmcm_locked,
      adc_clip_sticky_1 => adc_clip_sticky_1,
      adc_clip_sticky_reg => rx_i_n_29,
      adc_clip_sticky_reg_0(0) => adc_clip_sticky,
      adc_data_n(13 downto 0) => adc_data_n(13 downto 0),
      adc_data_p(13 downto 0) => adc_data_p(13 downto 0),
      \bits_rx[13].iddr_0\(13 downto 0) => raw_fall(13 downto 0),
      \enable_sync_reg[0]_0\(0) => dac_config_done,
      idelay_ready_reg_0(0) => \^idelay_ready_reg\,
      \launch_meta_reg[9]\(0) => frame_meta_q0,
      pulse_ready_q0 => pulse_ready_q0,
      ref_clk_200m => ref_clk_200m,
      ref_locked => ref_locked,
      rst_sys => rst_sys,
      sample_valid => sample_valid
    );
\rx_reset_sync_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => '0',
      PRE => adc_reset_source,
      Q => rx_reset_sync(0)
    );
\rx_reset_sync_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => rx_reset_sync(0),
      PRE => adc_reset_source,
      Q => rx_reset_sync(1)
    );
tx_i: entity work.system_frontend_0_0_dac_lvds_tx
     port map (
      SR(0) => tx_reset,
      clk_dac => clk_dac,
      dac_data_n(15 downto 0) => dac_data_n(15 downto 0),
      dac_data_p(15 downto 0) => dac_data_p(15 downto 0),
      dac_dci_n => dac_dci_n,
      dac_dci_p => dac_dci_p,
      i_sample(1) => pulse_i_n_6,
      i_sample(0) => pulse_i_n_7
    );
tx_marker_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^echo_clk_acq\,
      CE => '1',
      D => launch_marker,
      Q => echo_tx_marker,
      R => rx_reset_sync(1)
    );
\tx_reset_sync[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => dco_alive,
      O => \tx_reset_sync[2]_i_1_n_0\
    );
\tx_reset_sync_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => '0',
      PRE => \tx_reset_sync[2]_i_1_n_0\,
      Q => tx_reset_sync(0)
    );
\tx_reset_sync_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => tx_reset_sync(0),
      PRE => \tx_reset_sync[2]_i_1_n_0\,
      Q => tx_reset_sync(1)
    );
\tx_reset_sync_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_dac,
      CE => '1',
      D => tx_reset_sync(1),
      PRE => \tx_reset_sync[2]_i_1_n_0\,
      Q => tx_reset_sync(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_frontend_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_frontend_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_frontend_0_0 : entity is "system_frontend_0_0,ac820_adc_dac_frontend_ps,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_frontend_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_frontend_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_frontend_0_0 : entity is "ac820_adc_dac_frontend_ps,Vivado 2026.1";
end system_frontend_0_0;

architecture STRUCTURE of system_frontend_0_0 is
begin
inst: entity work.system_frontend_0_0_ac820_adc_dac_frontend_ps
     port map (
      D(9) => echo_pn_enable,
      D(8 downto 6) => echo_pulse_mode(2 downto 0),
      D(5 downto 0) => echo_pulse_width(5 downto 0),
      adc_clip_led => adc_clip_led,
      adc_data_n(13 downto 0) => adc_data_n(13 downto 0),
      adc_data_p(13 downto 0) => adc_data_p(13 downto 0),
      adc_dco_n => adc_dco_n,
      adc_dco_p => adc_dco_p,
      adc_ready_led => adc_ready_led,
      adk_spi_csb => adk_spi_csb,
      adk_spi_sda => adk_spi_sda,
      clk_50m => clk_50m,
      dac_data_n(15 downto 0) => dac_data_n(15 downto 0),
      dac_data_p(15 downto 0) => dac_data_p(15 downto 0),
      dac_dci_n => dac_dci_n,
      dac_dci_p => dac_dci_p,
      dac_done_led => dac_done_led,
      dac_spi_csb => dac_spi_csb,
      dac_spi_sdio => dac_spi_sdio,
      echo_clk_acq => echo_clk_acq,
      echo_frame_meta(31 downto 0) => echo_frame_meta(31 downto 0),
      echo_pair_valid => echo_pair_valid,
      echo_pulse_frames_sent(5 downto 0) => echo_pulse_frames_sent(5 downto 0),
      echo_pulse_ready => echo_pulse_ready,
      echo_pulse_start_acq => echo_pulse_start_acq,
      echo_rst_acq => echo_rst_acq,
      echo_sample_clip => echo_sample_clip,
      echo_sample_fall_u14(13 downto 0) => echo_sample_fall_u14(13 downto 0),
      echo_sample_rise_u14(13 downto 0) => echo_sample_rise_u14(13 downto 0),
      echo_tx_marker => echo_tx_marker,
      idelay_ready_reg => echo_adc_ready,
      pll_done_led => pll_done_led,
      sclk_reg => adk_spi_sclk,
      sclk_reg_0 => dac_spi_sclk
    );
end STRUCTURE;
