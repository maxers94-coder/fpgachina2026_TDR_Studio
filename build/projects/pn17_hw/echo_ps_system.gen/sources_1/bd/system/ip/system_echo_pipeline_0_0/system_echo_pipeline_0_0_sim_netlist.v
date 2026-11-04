// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Wed Oct 28 18:54:19 2026
// Host        : LAPTOP-MUM2STS9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vivado_project/pn17_hw/echo_ps_system.gen/sources_1/bd/system/ip/system_echo_pipeline_0_0/system_echo_pipeline_0_0_sim_netlist.v
// Design      : system_echo_pipeline_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_echo_pipeline_0_0,echo_pipeline_axi_control_phase2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "echo_pipeline_axi_control_phase2,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module system_echo_pipeline_0_0
   (clk_acq,
    rst_acq,
    adc_ready_acq,
    pair_valid,
    sample_rise_u14,
    sample_fall_u14,
    sample_clip,
    pulse_ready_acq,
    tx_marker,
    frame_meta,
    pulse_start_acq,
    pulse_mode,
    pulse_width,
    pn_enable,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    irq_f2p);
  input clk_acq;
  input rst_acq;
  input adc_ready_acq;
  input pair_valid;
  input [13:0]sample_rise_u14;
  input [13:0]sample_fall_u14;
  input sample_clip;
  input pulse_ready_acq;
  input tx_marker;
  input [31:0]frame_meta;
  output pulse_start_acq;
  output [2:0]pulse_mode;
  output [5:0]pulse_width;
  output pn_enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, PROTOCOL AXI4LITE, DATA_WIDTH 32, ADDR_WIDTH 8, FREQ_HZ 100000000, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [7:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [7:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 irq_f2p INTERRUPT" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME irq_f2p, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output irq_f2p;

  wire \<const0> ;
  wire adc_ready_acq;
  wire clk_acq;
  wire [31:0]frame_meta;
  wire irq_f2p;
  wire pair_valid;
  wire pn_enable;
  wire [2:0]pulse_mode;
  wire pulse_ready_acq;
  wire pulse_start_acq;
  wire [5:0]pulse_width;
  wire rst_acq;
  wire s_axi_aclk;
  wire [7:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [7:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire sample_clip;
  wire [13:0]sample_fall_u14;
  wire [13:0]sample_rise_u14;
  wire tx_marker;
  wire [0:0]NLW_inst_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rresp_UNCONNECTED;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_S_AXI_ADDR_WIDTH = "8" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* K = "256" *) 
  (* K_ADDR_W = "8" *) 
  (* L = "640" *) 
  (* LAG_MIN = "0" *) 
  (* L_ADDR_W = "10" *) 
  (* M = "32" *) 
  (* N = "1024" *) 
  (* N_ADDR_W = "10" *) 
  (* SAMPLE_RATE_HZ = "200000000" *) 
  system_echo_pipeline_0_0_echo_pipeline_axi_control_phase2 inst
       (.adc_ready_acq(adc_ready_acq),
        .clk_acq(clk_acq),
        .frame_meta(frame_meta),
        .irq_f2p(irq_f2p),
        .pair_valid(pair_valid),
        .pn_enable(pn_enable),
        .pulse_mode(pulse_mode),
        .pulse_ready_acq(pulse_ready_acq),
        .pulse_start_acq(pulse_start_acq),
        .pulse_width(pulse_width),
        .rst_acq(rst_acq),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp({\^s_axi_bresp ,NLW_inst_s_axi_bresp_UNCONNECTED[0]}),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp({\^s_axi_rresp ,NLW_inst_s_axi_rresp_UNCONNECTED[0]}),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .sample_clip(sample_clip),
        .sample_fall_u14(sample_fall_u14),
        .sample_rise_u14(sample_rise_u14),
        .tx_marker(tx_marker));
endmodule

(* ORIG_REF_NAME = "accum_tdp_bram" *) 
module system_echo_pipeline_0_0_accum_tdp_bram
   (mem_reg_0,
    acc_rd_en,
    S,
    mem_reg_1,
    mem_reg_2,
    clk_acq,
    E,
    Q,
    mem_reg_3,
    mem_reg_4,
    WEBWE,
    mem_reg_5,
    frame_meta,
    mem_reg_6,
    mem_reg_7,
    mem_reg_8,
    mem_reg_9,
    mem_reg_10,
    mem_reg_11,
    start_pulse,
    rst_acq,
    mem_reg_12,
    \raw_sum_ext_reg[15] );
  output [20:0]mem_reg_0;
  output acc_rd_en;
  output [1:0]S;
  output [3:0]mem_reg_1;
  output [1:0]mem_reg_2;
  input clk_acq;
  input [0:0]E;
  input [8:0]Q;
  input [8:0]mem_reg_3;
  input [21:0]mem_reg_4;
  input [0:0]WEBWE;
  input mem_reg_5;
  input [0:0]frame_meta;
  input mem_reg_6;
  input mem_reg_7;
  input mem_reg_8;
  input mem_reg_9;
  input mem_reg_10;
  input mem_reg_11;
  input start_pulse;
  input rst_acq;
  input [4:0]mem_reg_12;
  input [0:0]\raw_sum_ext_reg[15] ;

  wire [0:0]E;
  wire [8:0]Q;
  wire [1:0]S;
  wire [0:0]WEBWE;
  wire acc_rd_en;
  wire clk_acq;
  wire [0:0]frame_meta;
  wire [20:0]mem_reg_0;
  wire [3:0]mem_reg_1;
  wire mem_reg_10;
  wire mem_reg_11;
  wire [4:0]mem_reg_12;
  wire [1:0]mem_reg_2;
  wire [8:0]mem_reg_3;
  wire [21:0]mem_reg_4;
  wire mem_reg_5;
  wire mem_reg_6;
  wire mem_reg_7;
  wire mem_reg_8;
  wire mem_reg_9;
  wire mem_reg_i_2__0_n_0;
  wire mem_reg_i_7_n_0;
  wire mem_reg_i_8_n_0;
  wire [0:0]\raw_sum_ext_reg[15] ;
  wire [21:21]read_accum_s22;
  wire rst_acq;
  wire start_pulse;
  wire [15:6]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d22" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d22" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "11264" *) 
  (* RTL_RAM_NAME = "frame_average_pair_bram/rise_average_i/accum_ram/mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "21" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    mem_reg
       (.ADDRARDADDR({Q,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({mem_reg_3,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_acq),
        .CLKBWRCLK(clk_acq),
        .DIADI(mem_reg_4[15:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,mem_reg_4[21:16]}),
        .DIPADIP({1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO(mem_reg_0[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:6],read_accum_s22,mem_reg_0[20:16]}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(acc_rd_en),
        .ENBWREN(1'b1),
        .REGCEAREGCE(E),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(mem_reg_i_2__0_n_0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE}));
  LUT6 #(
    .INIT(64'h0000000009090009)) 
    mem_reg_i_1
       (.I0(mem_reg_5),
        .I1(frame_meta),
        .I2(mem_reg_6),
        .I3(mem_reg_7),
        .I4(mem_reg_8),
        .I5(mem_reg_i_7_n_0),
        .O(acc_rd_en));
  LUT4 #(
    .INIT(16'hFFAE)) 
    mem_reg_i_2__0
       (.I0(mem_reg_i_8_n_0),
        .I1(mem_reg_11),
        .I2(start_pulse),
        .I3(rst_acq),
        .O(mem_reg_i_2__0_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    mem_reg_i_7
       (.I0(mem_reg_9),
        .I1(mem_reg_10),
        .O(mem_reg_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    mem_reg_i_8
       (.I0(mem_reg_12[2]),
        .I1(mem_reg_12[1]),
        .I2(mem_reg_12[0]),
        .I3(mem_reg_12[3]),
        .I4(mem_reg_12[4]),
        .I5(E),
        .O(mem_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[15]_i_3 
       (.I0(mem_reg_0[14]),
        .I1(mem_reg_0[15]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_4 
       (.I0(\raw_sum_ext_reg[15] ),
        .I1(mem_reg_0[14]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_2 
       (.I0(mem_reg_0[18]),
        .I1(mem_reg_0[19]),
        .O(mem_reg_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_3 
       (.I0(mem_reg_0[17]),
        .I1(mem_reg_0[18]),
        .O(mem_reg_1[2]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_4 
       (.I0(mem_reg_0[16]),
        .I1(mem_reg_0[17]),
        .O(mem_reg_1[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_5 
       (.I0(mem_reg_0[15]),
        .I1(mem_reg_0[16]),
        .O(mem_reg_1[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[22]_i_2 
       (.I0(mem_reg_0[20]),
        .I1(read_accum_s22),
        .O(mem_reg_2[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[22]_i_3 
       (.I0(mem_reg_0[19]),
        .I1(mem_reg_0[20]),
        .O(mem_reg_2[0]));
endmodule

(* ORIG_REF_NAME = "accum_tdp_bram" *) 
module system_echo_pipeline_0_0_accum_tdp_bram_4
   (mem_reg_0,
    acc_rd_en,
    frame_meta_8_sp_1,
    \frames_seen_reg[5] ,
    frame_open_reg,
    frame_open_reg_0,
    frame_meta_1_sp_1,
    \frames_seen_reg[4] ,
    frame_meta_2_sp_1,
    frame_meta_6_sp_1,
    \frame_meta[1]_0 ,
    S,
    mem_reg_1,
    mem_reg_2,
    clk_acq,
    E,
    Q,
    mem_reg_3,
    mem_reg_4,
    WEBWE,
    frame_meta,
    \first_mode_reg[0] ,
    tx_marker,
    pair_valid,
    mem_reg_i_4_0,
    mem_reg_5,
    mem_reg_6,
    mem_reg_i_6_0,
    mem_reg_i_6_1,
    mem_reg_i_6_2,
    start_pulse,
    rst_acq,
    mem_reg_7,
    mem_reg_8,
    mem_reg_9,
    mem_reg_i_24_0,
    mem_reg_i_14_0,
    \raw_sum_ext_reg[15] );
  output [20:0]mem_reg_0;
  output acc_rd_en;
  output frame_meta_8_sp_1;
  output \frames_seen_reg[5] ;
  output frame_open_reg;
  output frame_open_reg_0;
  output frame_meta_1_sp_1;
  output \frames_seen_reg[4] ;
  output frame_meta_2_sp_1;
  output frame_meta_6_sp_1;
  output \frame_meta[1]_0 ;
  output [1:0]S;
  output [3:0]mem_reg_1;
  output [1:0]mem_reg_2;
  input clk_acq;
  input [0:0]E;
  input [8:0]Q;
  input [8:0]mem_reg_3;
  input [21:0]mem_reg_4;
  input [0:0]WEBWE;
  input [30:0]frame_meta;
  input [5:0]\first_mode_reg[0] ;
  input tx_marker;
  input pair_valid;
  input mem_reg_i_4_0;
  input mem_reg_5;
  input mem_reg_6;
  input mem_reg_i_6_0;
  input mem_reg_i_6_1;
  input mem_reg_i_6_2;
  input start_pulse;
  input rst_acq;
  input mem_reg_7;
  input mem_reg_8;
  input [4:0]mem_reg_9;
  input [15:0]mem_reg_i_24_0;
  input [8:0]mem_reg_i_14_0;
  input [0:0]\raw_sum_ext_reg[15] ;

  wire [0:0]E;
  wire [8:0]Q;
  wire [1:0]S;
  wire [0:0]WEBWE;
  wire [21:21]acc_rd_data;
  wire acc_rd_en;
  wire clk_acq;
  wire [5:0]\first_mode_reg[0] ;
  wire frame_good5;
  wire frame_good613_in;
  wire [15:1]frame_good7;
  wire [30:0]frame_meta;
  wire \frame_meta[1]_0 ;
  wire frame_meta_1_sn_1;
  wire frame_meta_2_sn_1;
  wire frame_meta_6_sn_1;
  wire frame_meta_8_sn_1;
  wire frame_open_reg;
  wire frame_open_reg_0;
  wire \frames_seen_reg[4] ;
  wire \frames_seen_reg[5] ;
  wire [20:0]mem_reg_0;
  wire [3:0]mem_reg_1;
  wire [1:0]mem_reg_2;
  wire [8:0]mem_reg_3;
  wire [21:0]mem_reg_4;
  wire mem_reg_5;
  wire mem_reg_6;
  wire mem_reg_7;
  wire mem_reg_8;
  wire [4:0]mem_reg_9;
  wire mem_reg_i_11_n_0;
  wire mem_reg_i_12_n_0;
  wire mem_reg_i_13_n_3;
  wire [8:0]mem_reg_i_14_0;
  wire mem_reg_i_14_n_2;
  wire mem_reg_i_14_n_3;
  wire mem_reg_i_15_n_2;
  wire mem_reg_i_15_n_3;
  wire mem_reg_i_16_n_0;
  wire mem_reg_i_16_n_1;
  wire mem_reg_i_16_n_2;
  wire mem_reg_i_16_n_3;
  wire mem_reg_i_17_n_0;
  wire mem_reg_i_18_n_0;
  wire mem_reg_i_19_n_0;
  wire mem_reg_i_20_n_0;
  wire mem_reg_i_21_n_0;
  wire mem_reg_i_22_n_0;
  wire mem_reg_i_22_n_1;
  wire mem_reg_i_22_n_2;
  wire mem_reg_i_22_n_3;
  wire mem_reg_i_23_n_0;
  wire [15:0]mem_reg_i_24_0;
  wire mem_reg_i_24_n_0;
  wire mem_reg_i_25_n_0;
  wire mem_reg_i_26_n_0;
  wire mem_reg_i_27_n_0;
  wire mem_reg_i_28_n_0;
  wire mem_reg_i_29_n_0;
  wire mem_reg_i_2_n_0;
  wire mem_reg_i_30_n_0;
  wire mem_reg_i_31_n_0;
  wire mem_reg_i_32_n_0;
  wire mem_reg_i_33_n_2;
  wire mem_reg_i_33_n_3;
  wire mem_reg_i_34_n_0;
  wire mem_reg_i_34_n_1;
  wire mem_reg_i_34_n_2;
  wire mem_reg_i_34_n_3;
  wire mem_reg_i_35_n_0;
  wire mem_reg_i_35_n_1;
  wire mem_reg_i_35_n_2;
  wire mem_reg_i_35_n_3;
  wire mem_reg_i_36_n_0;
  wire mem_reg_i_36_n_1;
  wire mem_reg_i_36_n_2;
  wire mem_reg_i_36_n_3;
  wire mem_reg_i_3__0_n_0;
  wire mem_reg_i_4_0;
  wire mem_reg_i_4__0_n_0;
  wire mem_reg_i_6_0;
  wire mem_reg_i_6_1;
  wire mem_reg_i_6_2;
  wire mem_reg_i_9_n_0;
  wire pair_valid;
  wire [0:0]\raw_sum_ext_reg[15] ;
  wire rst_acq;
  wire start_pulse;
  wire tx_marker;
  wire [15:6]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [3:2]NLW_mem_reg_i_13_CO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_i_13_O_UNCONNECTED;
  wire [3:3]NLW_mem_reg_i_14_CO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_i_14_O_UNCONNECTED;
  wire [3:2]NLW_mem_reg_i_15_CO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_i_15_O_UNCONNECTED;
  wire [3:0]NLW_mem_reg_i_16_O_UNCONNECTED;
  wire [3:0]NLW_mem_reg_i_22_O_UNCONNECTED;
  wire [3:2]NLW_mem_reg_i_33_CO_UNCONNECTED;
  wire [3:3]NLW_mem_reg_i_33_O_UNCONNECTED;

  assign frame_meta_1_sp_1 = frame_meta_1_sn_1;
  assign frame_meta_2_sp_1 = frame_meta_2_sn_1;
  assign frame_meta_6_sp_1 = frame_meta_6_sn_1;
  assign frame_meta_8_sp_1 = frame_meta_8_sn_1;
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \expected_index[7]_i_2 
       (.I0(frame_meta[1]),
        .I1(frame_meta[0]),
        .I2(frame_meta[2]),
        .O(\frame_meta[1]_0 ));
  LUT6 #(
    .INIT(64'hFF7FFFFFFFFFFFFF)) 
    \expected_index[8]_i_3 
       (.I0(frame_meta[6]),
        .I1(frame_meta[3]),
        .I2(frame_meta[4]),
        .I3(\frame_meta[1]_0 ),
        .I4(frame_meta[5]),
        .I5(frame_meta[7]),
        .O(frame_meta_6_sn_1));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \first_mode[2]_i_3 
       (.I0(\first_mode_reg[0] [4]),
        .I1(\first_mode_reg[0] [2]),
        .I2(\first_mode_reg[0] [3]),
        .I3(\first_mode_reg[0] [0]),
        .I4(\first_mode_reg[0] [1]),
        .I5(\first_mode_reg[0] [5]),
        .O(\frames_seen_reg[4] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \last_frame_id[15]_i_2 
       (.I0(frame_meta[2]),
        .I1(frame_meta[3]),
        .I2(frame_meta[0]),
        .I3(frame_meta[1]),
        .I4(mem_reg_i_11_n_0),
        .I5(frame_meta[6]),
        .O(frame_meta_2_sn_1));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d22" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d22" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "11264" *) 
  (* RTL_RAM_NAME = "frame_average_pair_bram/fall_average_i/accum_ram/mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "21" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    mem_reg
       (.ADDRARDADDR({Q,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({mem_reg_3,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_acq),
        .CLKBWRCLK(clk_acq),
        .DIADI(mem_reg_4[15:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,mem_reg_4[21:16]}),
        .DIPADIP({1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO(mem_reg_0[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:6],acc_rd_data,mem_reg_0[20:16]}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(acc_rd_en),
        .ENBWREN(1'b1),
        .REGCEAREGCE(E),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(mem_reg_i_2_n_0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    mem_reg_i_10
       (.I0(frame_meta[1]),
        .I1(frame_meta[0]),
        .I2(frame_meta[3]),
        .I3(frame_meta[2]),
        .O(frame_meta_1_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    mem_reg_i_11
       (.I0(frame_meta[5]),
        .I1(frame_meta[4]),
        .I2(frame_meta[8]),
        .I3(frame_meta[7]),
        .O(mem_reg_i_11_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    mem_reg_i_12
       (.I0(mem_reg_i_6_0),
        .I1(frame_meta[14]),
        .I2(frame_meta[12]),
        .I3(mem_reg_i_6_1),
        .I4(frame_meta[13]),
        .I5(mem_reg_i_6_2),
        .O(mem_reg_i_12_n_0));
  CARRY4 mem_reg_i_13
       (.CI(mem_reg_i_16_n_0),
        .CO({NLW_mem_reg_i_13_CO_UNCONNECTED[3:2],frame_good5,mem_reg_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mem_reg_i_13_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,mem_reg_i_17_n_0,mem_reg_i_18_n_0}));
  CARRY4 mem_reg_i_14
       (.CI(1'b0),
        .CO({NLW_mem_reg_i_14_CO_UNCONNECTED[3],frame_good613_in,mem_reg_i_14_n_2,mem_reg_i_14_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mem_reg_i_14_O_UNCONNECTED[3:0]),
        .S({1'b0,mem_reg_i_19_n_0,mem_reg_i_20_n_0,mem_reg_i_21_n_0}));
  CARRY4 mem_reg_i_15
       (.CI(mem_reg_i_22_n_0),
        .CO({NLW_mem_reg_i_15_CO_UNCONNECTED[3:2],mem_reg_i_15_n_2,mem_reg_i_15_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mem_reg_i_15_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,mem_reg_i_23_n_0,mem_reg_i_24_n_0}));
  CARRY4 mem_reg_i_16
       (.CI(1'b0),
        .CO({mem_reg_i_16_n_0,mem_reg_i_16_n_1,mem_reg_i_16_n_2,mem_reg_i_16_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mem_reg_i_16_O_UNCONNECTED[3:0]),
        .S({mem_reg_i_25_n_0,mem_reg_i_26_n_0,mem_reg_i_27_n_0,mem_reg_i_28_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    mem_reg_i_17
       (.I0(mem_reg_i_24_0[15]),
        .I1(frame_meta[30]),
        .O(mem_reg_i_17_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_18
       (.I0(mem_reg_i_24_0[14]),
        .I1(frame_meta[29]),
        .I2(frame_meta[28]),
        .I3(mem_reg_i_24_0[13]),
        .I4(frame_meta[27]),
        .I5(mem_reg_i_24_0[12]),
        .O(mem_reg_i_18_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_19
       (.I0(mem_reg_i_14_0[8]),
        .I1(frame_meta[8]),
        .I2(frame_meta[6]),
        .I3(mem_reg_i_14_0[6]),
        .I4(frame_meta[7]),
        .I5(mem_reg_i_14_0[7]),
        .O(mem_reg_i_19_n_0));
  LUT6 #(
    .INIT(64'h0000000009090009)) 
    mem_reg_i_1__0
       (.I0(frame_meta_8_sn_1),
        .I1(frame_meta[11]),
        .I2(\frames_seen_reg[5] ),
        .I3(frame_open_reg),
        .I4(frame_open_reg_0),
        .I5(mem_reg_i_3__0_n_0),
        .O(acc_rd_en));
  LUT4 #(
    .INIT(16'hFFAE)) 
    mem_reg_i_2
       (.I0(mem_reg_i_4__0_n_0),
        .I1(mem_reg_5),
        .I2(start_pulse),
        .I3(rst_acq),
        .O(mem_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_20
       (.I0(mem_reg_i_14_0[5]),
        .I1(frame_meta[5]),
        .I2(frame_meta[3]),
        .I3(mem_reg_i_14_0[3]),
        .I4(frame_meta[4]),
        .I5(mem_reg_i_14_0[4]),
        .O(mem_reg_i_20_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_21
       (.I0(mem_reg_i_14_0[2]),
        .I1(frame_meta[2]),
        .I2(frame_meta[0]),
        .I3(mem_reg_i_14_0[0]),
        .I4(frame_meta[1]),
        .I5(mem_reg_i_14_0[1]),
        .O(mem_reg_i_21_n_0));
  CARRY4 mem_reg_i_22
       (.CI(1'b0),
        .CO({mem_reg_i_22_n_0,mem_reg_i_22_n_1,mem_reg_i_22_n_2,mem_reg_i_22_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_mem_reg_i_22_O_UNCONNECTED[3:0]),
        .S({mem_reg_i_29_n_0,mem_reg_i_30_n_0,mem_reg_i_31_n_0,mem_reg_i_32_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    mem_reg_i_23
       (.I0(frame_good7[15]),
        .I1(frame_meta[30]),
        .O(mem_reg_i_23_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_24
       (.I0(frame_good7[14]),
        .I1(frame_meta[29]),
        .I2(frame_meta[27]),
        .I3(frame_good7[12]),
        .I4(frame_meta[28]),
        .I5(frame_good7[13]),
        .O(mem_reg_i_24_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_25
       (.I0(mem_reg_i_24_0[11]),
        .I1(frame_meta[26]),
        .I2(frame_meta[24]),
        .I3(mem_reg_i_24_0[9]),
        .I4(frame_meta[25]),
        .I5(mem_reg_i_24_0[10]),
        .O(mem_reg_i_25_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_26
       (.I0(frame_meta[23]),
        .I1(mem_reg_i_24_0[8]),
        .I2(frame_meta[21]),
        .I3(mem_reg_i_24_0[6]),
        .I4(mem_reg_i_24_0[7]),
        .I5(frame_meta[22]),
        .O(mem_reg_i_26_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_27
       (.I0(frame_meta[20]),
        .I1(mem_reg_i_24_0[5]),
        .I2(frame_meta[18]),
        .I3(mem_reg_i_24_0[3]),
        .I4(mem_reg_i_24_0[4]),
        .I5(frame_meta[19]),
        .O(mem_reg_i_27_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_28
       (.I0(frame_meta[16]),
        .I1(mem_reg_i_24_0[1]),
        .I2(frame_meta[17]),
        .I3(mem_reg_i_24_0[2]),
        .I4(mem_reg_i_24_0[0]),
        .I5(frame_meta[15]),
        .O(mem_reg_i_28_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_29
       (.I0(frame_good7[11]),
        .I1(frame_meta[26]),
        .I2(frame_meta[24]),
        .I3(frame_good7[9]),
        .I4(frame_meta[25]),
        .I5(frame_good7[10]),
        .O(mem_reg_i_29_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_i_3
       (.I0(frame_meta[8]),
        .I1(frame_meta_6_sn_1),
        .O(frame_meta_8_sn_1));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_30
       (.I0(frame_meta[22]),
        .I1(frame_good7[7]),
        .I2(frame_meta[21]),
        .I3(frame_good7[6]),
        .I4(frame_good7[8]),
        .I5(frame_meta[23]),
        .O(mem_reg_i_30_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    mem_reg_i_31
       (.I0(frame_meta[19]),
        .I1(frame_good7[4]),
        .I2(frame_meta[18]),
        .I3(frame_good7[3]),
        .I4(frame_good7[5]),
        .I5(frame_meta[20]),
        .O(mem_reg_i_31_n_0));
  LUT6 #(
    .INIT(64'h6006000000006006)) 
    mem_reg_i_32
       (.I0(mem_reg_i_24_0[0]),
        .I1(frame_meta[15]),
        .I2(frame_meta[17]),
        .I3(frame_good7[2]),
        .I4(frame_meta[16]),
        .I5(frame_good7[1]),
        .O(mem_reg_i_32_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 mem_reg_i_33
       (.CI(mem_reg_i_34_n_0),
        .CO({NLW_mem_reg_i_33_CO_UNCONNECTED[3:2],mem_reg_i_33_n_2,mem_reg_i_33_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_mem_reg_i_33_O_UNCONNECTED[3],frame_good7[15:13]}),
        .S({1'b0,mem_reg_i_24_0[15:13]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 mem_reg_i_34
       (.CI(mem_reg_i_35_n_0),
        .CO({mem_reg_i_34_n_0,mem_reg_i_34_n_1,mem_reg_i_34_n_2,mem_reg_i_34_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(frame_good7[12:9]),
        .S(mem_reg_i_24_0[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 mem_reg_i_35
       (.CI(mem_reg_i_36_n_0),
        .CO({mem_reg_i_35_n_0,mem_reg_i_35_n_1,mem_reg_i_35_n_2,mem_reg_i_35_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(frame_good7[8:5]),
        .S(mem_reg_i_24_0[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 mem_reg_i_36
       (.CI(1'b0),
        .CO({mem_reg_i_36_n_0,mem_reg_i_36_n_1,mem_reg_i_36_n_2,mem_reg_i_36_n_3}),
        .CYINIT(mem_reg_i_24_0[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(frame_good7[4:1]),
        .S(mem_reg_i_24_0[4:1]));
  LUT2 #(
    .INIT(4'hB)) 
    mem_reg_i_3__0
       (.I0(mem_reg_7),
        .I1(mem_reg_8),
        .O(mem_reg_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hFEEFFEFEFEFEFEFE)) 
    mem_reg_i_4
       (.I0(\first_mode_reg[0] [5]),
        .I1(mem_reg_i_9_n_0),
        .I2(tx_marker),
        .I3(frame_meta_1_sn_1),
        .I4(frame_meta[6]),
        .I5(mem_reg_i_11_n_0),
        .O(\frames_seen_reg[5] ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    mem_reg_i_4__0
       (.I0(mem_reg_9[2]),
        .I1(mem_reg_9[1]),
        .I2(mem_reg_9[0]),
        .I3(mem_reg_9[3]),
        .I4(mem_reg_9[4]),
        .I5(E),
        .O(mem_reg_i_4__0_n_0));
  LUT5 #(
    .INIT(32'hFFBFFFFF)) 
    mem_reg_i_5
       (.I0(mem_reg_i_12_n_0),
        .I1(mem_reg_6),
        .I2(frame_good5),
        .I3(frame_meta[10]),
        .I4(frame_good613_in),
        .O(frame_open_reg));
  LUT6 #(
    .INIT(64'h0000000000F20000)) 
    mem_reg_i_6
       (.I0(mem_reg_i_15_n_2),
        .I1(mem_reg_i_12_n_0),
        .I2(\frames_seen_reg[4] ),
        .I3(mem_reg_6),
        .I4(frame_meta[10]),
        .I5(frame_meta_2_sn_1),
        .O(frame_open_reg_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    mem_reg_i_9
       (.I0(pair_valid),
        .I1(mem_reg_i_4_0),
        .I2(frame_meta[9]),
        .I3(mem_reg_5),
        .O(mem_reg_i_9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[15]_i_3__0 
       (.I0(mem_reg_0[14]),
        .I1(mem_reg_0[15]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_4__0 
       (.I0(\raw_sum_ext_reg[15] ),
        .I1(mem_reg_0[14]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_2__0 
       (.I0(mem_reg_0[18]),
        .I1(mem_reg_0[19]),
        .O(mem_reg_1[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_3__0 
       (.I0(mem_reg_0[17]),
        .I1(mem_reg_0[18]),
        .O(mem_reg_1[2]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_4__0 
       (.I0(mem_reg_0[16]),
        .I1(mem_reg_0[17]),
        .O(mem_reg_1[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[19]_i_5__0 
       (.I0(mem_reg_0[15]),
        .I1(mem_reg_0[16]),
        .O(mem_reg_1[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[22]_i_2__0 
       (.I0(mem_reg_0[20]),
        .I1(acc_rd_data),
        .O(mem_reg_2[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \raw_sum_ext[22]_i_3__0 
       (.I0(mem_reg_0[19]),
        .I1(mem_reg_0[20]),
        .O(mem_reg_2[0]));
endmodule

(* ORIG_REF_NAME = "avg_frame_dc_bram" *) 
module system_echo_pipeline_0_0_avg_frame_dc_bram
   (rd_data_q2,
    wr_clk,
    rd_clk,
    fall_wr_en,
    rd_en,
    fall_wr_addr,
    rd_addr,
    fall_wr_data_q2,
    DOBDO,
    lane_d);
  output [15:0]rd_data_q2;
  input wr_clk;
  input rd_clk;
  input fall_wr_en;
  input rd_en;
  input [8:0]fall_wr_addr;
  input [8:0]rd_addr;
  input [15:0]fall_wr_data_q2;
  input [15:0]DOBDO;
  input lane_d;

  wire [15:0]DOBDO;
  wire [15:0]fall_data;
  wire [8:0]fall_wr_addr;
  wire [15:0]fall_wr_data_q2;
  wire fall_wr_en;
  wire lane_d;
  wire [8:0]rd_addr;
  wire rd_clk;
  wire [15:0]rd_data_q2;
  wire rd_en;
  wire wr_clk;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "avg_frame_pair_dc_bram/fall_ram_i/mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "512" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,fall_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,rd_addr,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DIADI(fall_wr_data_q2),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(fall_data),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(fall_wr_en),
        .ENBWREN(rd_en),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[0]_INST_0 
       (.I0(fall_data[0]),
        .I1(DOBDO[0]),
        .I2(lane_d),
        .O(rd_data_q2[0]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[10]_INST_0 
       (.I0(fall_data[10]),
        .I1(DOBDO[10]),
        .I2(lane_d),
        .O(rd_data_q2[10]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[11]_INST_0 
       (.I0(fall_data[11]),
        .I1(DOBDO[11]),
        .I2(lane_d),
        .O(rd_data_q2[11]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[12]_INST_0 
       (.I0(fall_data[12]),
        .I1(DOBDO[12]),
        .I2(lane_d),
        .O(rd_data_q2[12]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[13]_INST_0 
       (.I0(fall_data[13]),
        .I1(DOBDO[13]),
        .I2(lane_d),
        .O(rd_data_q2[13]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[14]_INST_0 
       (.I0(fall_data[14]),
        .I1(DOBDO[14]),
        .I2(lane_d),
        .O(rd_data_q2[14]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[15]_INST_0 
       (.I0(fall_data[15]),
        .I1(DOBDO[15]),
        .I2(lane_d),
        .O(rd_data_q2[15]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[1]_INST_0 
       (.I0(fall_data[1]),
        .I1(DOBDO[1]),
        .I2(lane_d),
        .O(rd_data_q2[1]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[2]_INST_0 
       (.I0(fall_data[2]),
        .I1(DOBDO[2]),
        .I2(lane_d),
        .O(rd_data_q2[2]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[3]_INST_0 
       (.I0(fall_data[3]),
        .I1(DOBDO[3]),
        .I2(lane_d),
        .O(rd_data_q2[3]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[4]_INST_0 
       (.I0(fall_data[4]),
        .I1(DOBDO[4]),
        .I2(lane_d),
        .O(rd_data_q2[4]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[5]_INST_0 
       (.I0(fall_data[5]),
        .I1(DOBDO[5]),
        .I2(lane_d),
        .O(rd_data_q2[5]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[6]_INST_0 
       (.I0(fall_data[6]),
        .I1(DOBDO[6]),
        .I2(lane_d),
        .O(rd_data_q2[6]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[7]_INST_0 
       (.I0(fall_data[7]),
        .I1(DOBDO[7]),
        .I2(lane_d),
        .O(rd_data_q2[7]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[8]_INST_0 
       (.I0(fall_data[8]),
        .I1(DOBDO[8]),
        .I2(lane_d),
        .O(rd_data_q2[8]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rd_data_q2[9]_INST_0 
       (.I0(fall_data[9]),
        .I1(DOBDO[9]),
        .I2(lane_d),
        .O(rd_data_q2[9]));
endmodule

(* ORIG_REF_NAME = "avg_frame_dc_bram" *) 
module system_echo_pipeline_0_0_avg_frame_dc_bram_2
   (DOBDO,
    wr_clk,
    rd_clk,
    rise_wr_en,
    rd_en,
    rise_wr_addr,
    rd_addr,
    rise_wr_data_q2);
  output [15:0]DOBDO;
  input wr_clk;
  input rd_clk;
  input rise_wr_en;
  input rd_en;
  input [8:0]rise_wr_addr;
  input [8:0]rd_addr;
  input [15:0]rise_wr_data_q2;

  wire [15:0]DOBDO;
  wire [8:0]rd_addr;
  wire rd_clk;
  wire rd_en;
  wire [8:0]rise_wr_addr;
  wire [15:0]rise_wr_data_q2;
  wire rise_wr_en;
  wire wr_clk;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "avg_frame_pair_dc_bram/rise_ram_i/mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "512" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,rise_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,rd_addr,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(wr_clk),
        .CLKBWRCLK(rd_clk),
        .DIADI(rise_wr_data_q2),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(DOBDO),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(rise_wr_en),
        .ENBWREN(rd_en),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "avg_frame_pair_dc_bram" *) (* PAIRS = "512" *) (* PAIR_ADDR_W = "9" *) 
module system_echo_pipeline_0_0_avg_frame_pair_dc_bram
   (wr_clk,
    rise_wr_en,
    rise_wr_addr,
    rise_wr_data_q2,
    fall_wr_en,
    fall_wr_addr,
    fall_wr_data_q2,
    rd_clk,
    rd_en,
    rd_addr,
    rd_data_q2);
  input wr_clk;
  input rise_wr_en;
  input [8:0]rise_wr_addr;
  input [15:0]rise_wr_data_q2;
  input fall_wr_en;
  input [8:0]fall_wr_addr;
  input [15:0]fall_wr_data_q2;
  input rd_clk;
  input rd_en;
  input [9:0]rd_addr;
  output [15:0]rd_data_q2;

  wire [8:0]fall_wr_addr;
  wire [15:0]fall_wr_data_q2;
  wire fall_wr_en;
  wire lane_d;
  wire lane_d_i_1_n_0;
  wire [9:0]rd_addr;
  wire rd_clk;
  wire [15:0]rd_data_q2;
  wire rd_en;
  wire [15:0]rise_data;
  wire [8:0]rise_wr_addr;
  wire [15:0]rise_wr_data_q2;
  wire rise_wr_en;
  wire wr_clk;

  system_echo_pipeline_0_0_avg_frame_dc_bram fall_ram_i
       (.DOBDO(rise_data),
        .fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data_q2),
        .fall_wr_en(fall_wr_en),
        .lane_d(lane_d),
        .rd_addr(rd_addr[9:1]),
        .rd_clk(rd_clk),
        .rd_data_q2(rd_data_q2),
        .rd_en(rd_en),
        .wr_clk(wr_clk));
  LUT3 #(
    .INIT(8'hB8)) 
    lane_d_i_1
       (.I0(rd_addr[0]),
        .I1(rd_en),
        .I2(lane_d),
        .O(lane_d_i_1_n_0));
  FDRE lane_d_reg
       (.C(rd_clk),
        .CE(1'b1),
        .D(lane_d_i_1_n_0),
        .Q(lane_d),
        .R(1'b0));
  system_echo_pipeline_0_0_avg_frame_dc_bram_2 rise_ram_i
       (.DOBDO(rise_data),
        .rd_addr(rd_addr[9:1]),
        .rd_clk(rd_clk),
        .rd_en(rd_en),
        .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data_q2),
        .rise_wr_en(rise_wr_en),
        .wr_clk(wr_clk));
endmodule

(* ORIG_REF_NAME = "baseline_sub" *) 
module system_echo_pipeline_0_0_baseline_sub
   (diff_valid,
    \FSM_sequential_state_reg[1] ,
    Q,
    \FSM_sequential_state_reg[0] ,
    \FSM_sequential_state_reg[0]_0 ,
    \FSM_sequential_state_reg[1]_0 ,
    \difference_q2_reg[16]_0 ,
    rst_proc,
    E,
    clk_proc,
    average_debug_rd_data_q2,
    S,
    \difference_q2_reg[7]_0 ,
    \difference_q2_reg[11]_0 ,
    \difference_q2_reg[15]_0 ,
    \template_req_addr_reg[0] ,
    \FSM_sequential_state_reg[0]_1 ,
    \FSM_sequential_state_reg[0]_2 ,
    \FSM_sequential_state_reg[0]_3 ,
    \FSM_sequential_state_reg[0]_4 ,
    state,
    \out_addr_reg[9]_0 );
  output diff_valid;
  output [0:0]\FSM_sequential_state_reg[1] ;
  output [9:0]Q;
  output \FSM_sequential_state_reg[0] ;
  output \FSM_sequential_state_reg[0]_0 ;
  output \FSM_sequential_state_reg[1]_0 ;
  output [16:0]\difference_q2_reg[16]_0 ;
  input rst_proc;
  input [0:0]E;
  input clk_proc;
  input [15:0]average_debug_rd_data_q2;
  input [3:0]S;
  input [3:0]\difference_q2_reg[7]_0 ;
  input [3:0]\difference_q2_reg[11]_0 ;
  input [3:0]\difference_q2_reg[15]_0 ;
  input \template_req_addr_reg[0] ;
  input \FSM_sequential_state_reg[0]_1 ;
  input \FSM_sequential_state_reg[0]_2 ;
  input \FSM_sequential_state_reg[0]_3 ;
  input \FSM_sequential_state_reg[0]_4 ;
  input [2:0]state;
  input [9:0]\out_addr_reg[9]_0 ;

  wire [0:0]E;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[0]_1 ;
  wire \FSM_sequential_state_reg[0]_2 ;
  wire \FSM_sequential_state_reg[0]_3 ;
  wire \FSM_sequential_state_reg[0]_4 ;
  wire [0:0]\FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire [9:0]Q;
  wire [3:0]S;
  wire [15:0]average_debug_rd_data_q2;
  wire clk_proc;
  wire diff_valid;
  wire [16:0]difference_q20;
  wire difference_q20_carry__0_n_0;
  wire difference_q20_carry__0_n_1;
  wire difference_q20_carry__0_n_2;
  wire difference_q20_carry__0_n_3;
  wire difference_q20_carry__1_n_0;
  wire difference_q20_carry__1_n_1;
  wire difference_q20_carry__1_n_2;
  wire difference_q20_carry__1_n_3;
  wire difference_q20_carry__2_i_1_n_0;
  wire difference_q20_carry__2_n_0;
  wire difference_q20_carry__2_n_1;
  wire difference_q20_carry__2_n_2;
  wire difference_q20_carry__2_n_3;
  wire difference_q20_carry_n_0;
  wire difference_q20_carry_n_1;
  wire difference_q20_carry_n_2;
  wire difference_q20_carry_n_3;
  wire [3:0]\difference_q2_reg[11]_0 ;
  wire [3:0]\difference_q2_reg[15]_0 ;
  wire [16:0]\difference_q2_reg[16]_0 ;
  wire [3:0]\difference_q2_reg[7]_0 ;
  wire [9:0]\out_addr_reg[9]_0 ;
  wire rst_proc;
  wire [2:0]state;
  wire \template_req_addr[9]_i_4_n_0 ;
  wire \template_req_addr[9]_i_6_n_0 ;
  wire \template_req_addr[9]_i_7_n_0 ;
  wire \template_req_addr_reg[0] ;
  wire [3:0]NLW_difference_q20_carry__3_CO_UNCONNECTED;
  wire [3:1]NLW_difference_q20_carry__3_O_UNCONNECTED;

  LUT4 #(
    .INIT(16'h0FE0)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\FSM_sequential_state[2]_i_2_n_0 ),
        .I3(state[0]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h2F50)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(\FSM_sequential_state[2]_i_2_n_0 ),
        .I3(state[1]),
        .O(\FSM_sequential_state_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h6F10)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(\FSM_sequential_state[2]_i_2_n_0 ),
        .I3(state[2]),
        .O(\FSM_sequential_state_reg[0] ));
  LUT6 #(
    .INIT(64'hAFA0AFAFCFC0CFC0)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\template_req_addr_reg[0] ),
        .I1(\template_req_addr[9]_i_4_n_0 ),
        .I2(\FSM_sequential_state_reg[0]_1 ),
        .I3(\FSM_sequential_state_reg[0]_2 ),
        .I4(\FSM_sequential_state_reg[0]_3 ),
        .I5(\FSM_sequential_state_reg[0]_4 ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  CARRY4 difference_q20_carry
       (.CI(1'b0),
        .CO({difference_q20_carry_n_0,difference_q20_carry_n_1,difference_q20_carry_n_2,difference_q20_carry_n_3}),
        .CYINIT(1'b1),
        .DI(average_debug_rd_data_q2[3:0]),
        .O(difference_q20[3:0]),
        .S(S));
  CARRY4 difference_q20_carry__0
       (.CI(difference_q20_carry_n_0),
        .CO({difference_q20_carry__0_n_0,difference_q20_carry__0_n_1,difference_q20_carry__0_n_2,difference_q20_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(average_debug_rd_data_q2[7:4]),
        .O(difference_q20[7:4]),
        .S(\difference_q2_reg[7]_0 ));
  CARRY4 difference_q20_carry__1
       (.CI(difference_q20_carry__0_n_0),
        .CO({difference_q20_carry__1_n_0,difference_q20_carry__1_n_1,difference_q20_carry__1_n_2,difference_q20_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(average_debug_rd_data_q2[11:8]),
        .O(difference_q20[11:8]),
        .S(\difference_q2_reg[11]_0 ));
  CARRY4 difference_q20_carry__2
       (.CI(difference_q20_carry__1_n_0),
        .CO({difference_q20_carry__2_n_0,difference_q20_carry__2_n_1,difference_q20_carry__2_n_2,difference_q20_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({difference_q20_carry__2_i_1_n_0,average_debug_rd_data_q2[14:12]}),
        .O(difference_q20[15:12]),
        .S(\difference_q2_reg[15]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    difference_q20_carry__2_i_1
       (.I0(average_debug_rd_data_q2[15]),
        .O(difference_q20_carry__2_i_1_n_0));
  CARRY4 difference_q20_carry__3
       (.CI(difference_q20_carry__2_n_0),
        .CO(NLW_difference_q20_carry__3_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_difference_q20_carry__3_O_UNCONNECTED[3:1],difference_q20[16]}),
        .S({1'b0,1'b0,1'b0,1'b1}));
  FDRE \difference_q2_reg[0] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[0]),
        .Q(\difference_q2_reg[16]_0 [0]),
        .R(rst_proc));
  FDRE \difference_q2_reg[10] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[10]),
        .Q(\difference_q2_reg[16]_0 [10]),
        .R(rst_proc));
  FDRE \difference_q2_reg[11] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[11]),
        .Q(\difference_q2_reg[16]_0 [11]),
        .R(rst_proc));
  FDRE \difference_q2_reg[12] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[12]),
        .Q(\difference_q2_reg[16]_0 [12]),
        .R(rst_proc));
  FDRE \difference_q2_reg[13] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[13]),
        .Q(\difference_q2_reg[16]_0 [13]),
        .R(rst_proc));
  FDRE \difference_q2_reg[14] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[14]),
        .Q(\difference_q2_reg[16]_0 [14]),
        .R(rst_proc));
  FDRE \difference_q2_reg[15] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[15]),
        .Q(\difference_q2_reg[16]_0 [15]),
        .R(rst_proc));
  FDRE \difference_q2_reg[16] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[16]),
        .Q(\difference_q2_reg[16]_0 [16]),
        .R(rst_proc));
  FDRE \difference_q2_reg[1] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[1]),
        .Q(\difference_q2_reg[16]_0 [1]),
        .R(rst_proc));
  FDRE \difference_q2_reg[2] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[2]),
        .Q(\difference_q2_reg[16]_0 [2]),
        .R(rst_proc));
  FDRE \difference_q2_reg[3] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[3]),
        .Q(\difference_q2_reg[16]_0 [3]),
        .R(rst_proc));
  FDRE \difference_q2_reg[4] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[4]),
        .Q(\difference_q2_reg[16]_0 [4]),
        .R(rst_proc));
  FDRE \difference_q2_reg[5] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[5]),
        .Q(\difference_q2_reg[16]_0 [5]),
        .R(rst_proc));
  FDRE \difference_q2_reg[6] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[6]),
        .Q(\difference_q2_reg[16]_0 [6]),
        .R(rst_proc));
  FDRE \difference_q2_reg[7] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[7]),
        .Q(\difference_q2_reg[16]_0 [7]),
        .R(rst_proc));
  FDRE \difference_q2_reg[8] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[8]),
        .Q(\difference_q2_reg[16]_0 [8]),
        .R(rst_proc));
  FDRE \difference_q2_reg[9] 
       (.C(clk_proc),
        .CE(E),
        .D(difference_q20[9]),
        .Q(\difference_q2_reg[16]_0 [9]),
        .R(rst_proc));
  FDRE \out_addr_reg[0] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [0]),
        .Q(Q[0]),
        .R(rst_proc));
  FDRE \out_addr_reg[1] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [1]),
        .Q(Q[1]),
        .R(rst_proc));
  FDRE \out_addr_reg[2] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [2]),
        .Q(Q[2]),
        .R(rst_proc));
  FDRE \out_addr_reg[3] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [3]),
        .Q(Q[3]),
        .R(rst_proc));
  FDRE \out_addr_reg[4] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [4]),
        .Q(Q[4]),
        .R(rst_proc));
  FDRE \out_addr_reg[5] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [5]),
        .Q(Q[5]),
        .R(rst_proc));
  FDRE \out_addr_reg[6] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [6]),
        .Q(Q[6]),
        .R(rst_proc));
  FDRE \out_addr_reg[7] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [7]),
        .Q(Q[7]),
        .R(rst_proc));
  FDRE \out_addr_reg[8] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [8]),
        .Q(Q[8]),
        .R(rst_proc));
  FDRE \out_addr_reg[9] 
       (.C(clk_proc),
        .CE(E),
        .D(\out_addr_reg[9]_0 [9]),
        .Q(Q[9]),
        .R(rst_proc));
  FDRE out_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(E),
        .Q(diff_valid),
        .R(rst_proc));
  LUT5 #(
    .INIT(32'h44040004)) 
    \template_req_addr[9]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\template_req_addr_reg[0] ),
        .I3(state[0]),
        .I4(\template_req_addr[9]_i_4_n_0 ),
        .O(\FSM_sequential_state_reg[1] ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \template_req_addr[9]_i_4 
       (.I0(diff_valid),
        .I1(\template_req_addr[9]_i_6_n_0 ),
        .I2(\template_req_addr[9]_i_7_n_0 ),
        .I3(Q[9]),
        .I4(Q[8]),
        .O(\template_req_addr[9]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \template_req_addr[9]_i_6 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .O(\template_req_addr[9]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \template_req_addr[9]_i_7 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[7]),
        .I3(Q[6]),
        .O(\template_req_addr[9]_i_7_n_0 ));
endmodule

(* ORIG_REF_NAME = "cdc_pulse_toggle" *) 
module system_echo_pipeline_0_0_cdc_pulse_toggle
   (acq_done_proc_pulse,
    average_frame_available_proc_reg,
    E,
    rst_proc,
    clk_proc,
    rst_acq,
    clk_acq,
    average_frame_available_proc,
    busy4_out,
    average_frame_available_proc_reg_0,
    acq_error_proc_pulse,
    group_done_pulse);
  output acq_done_proc_pulse;
  output average_frame_available_proc_reg;
  output [0:0]E;
  input rst_proc;
  input clk_proc;
  input rst_acq;
  input clk_acq;
  input average_frame_available_proc;
  input busy4_out;
  input average_frame_available_proc_reg_0;
  input acq_error_proc_pulse;
  input group_done_pulse;

  wire [0:0]E;
  wire acq_done_proc_pulse;
  wire acq_error_proc_pulse;
  wire average_frame_available_proc;
  wire average_frame_available_proc_reg;
  wire average_frame_available_proc_reg_0;
  wire busy4_out;
  wire clk_acq;
  wire clk_proc;
  wire dst_pulse_i_1__0_n_0;
  (* async_reg = "true" *) wire dst_sync_1;
  (* async_reg = "true" *) wire dst_sync_2;
  wire dst_sync_2_d;
  wire group_done_pulse;
  wire rst_acq;
  wire rst_proc;
  wire src_toggle_i_1__1_n_0;
  wire src_toggle_reg_n_0;

  LUT6 #(
    .INIT(64'h00000000000AFE0A)) 
    average_frame_available_proc_i_1
       (.I0(average_frame_available_proc),
        .I1(acq_done_proc_pulse),
        .I2(busy4_out),
        .I3(average_frame_available_proc_reg_0),
        .I4(acq_error_proc_pulse),
        .I5(rst_proc),
        .O(average_frame_available_proc_reg));
  LUT2 #(
    .INIT(4'h8)) 
    clip_flag_snapshot_i_1
       (.I0(acq_done_proc_pulse),
        .I1(average_frame_available_proc_reg_0),
        .O(E));
  LUT2 #(
    .INIT(4'h6)) 
    dst_pulse_i_1__0
       (.I0(dst_sync_2_d),
        .I1(dst_sync_2),
        .O(dst_pulse_i_1__0_n_0));
  FDRE dst_pulse_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_pulse_i_1__0_n_0),
        .Q(acq_done_proc_pulse),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_1_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(src_toggle_reg_n_0),
        .Q(dst_sync_1),
        .R(rst_proc));
  FDRE dst_sync_2_d_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_sync_2),
        .Q(dst_sync_2_d),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_2_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_sync_1),
        .Q(dst_sync_2),
        .R(rst_proc));
  LUT2 #(
    .INIT(4'h6)) 
    src_toggle_i_1__1
       (.I0(group_done_pulse),
        .I1(src_toggle_reg_n_0),
        .O(src_toggle_i_1__1_n_0));
  FDRE src_toggle_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(src_toggle_i_1__1_n_0),
        .Q(src_toggle_reg_n_0),
        .R(rst_acq));
endmodule

(* ORIG_REF_NAME = "cdc_pulse_toggle" *) 
module system_echo_pipeline_0_0_cdc_pulse_toggle_0
   (acq_error_proc_pulse,
    dst_pulse_reg_0,
    busy4_out,
    E,
    D,
    busy_reg,
    rst_proc,
    clk_proc,
    rst_acq,
    clk_acq,
    start_pulse,
    busy_reg_0,
    processing_done,
    acq_done_proc_pulse,
    out,
    \frames_seen_proc_reg[0] ,
    \frames_seen_proc_reg[5] ,
    clear_error_proc,
    frame_error_sticky_proc,
    frame_error_pulse);
  output acq_error_proc_pulse;
  output dst_pulse_reg_0;
  output busy4_out;
  output [0:0]E;
  output [5:0]D;
  output busy_reg;
  input rst_proc;
  input clk_proc;
  input rst_acq;
  input clk_acq;
  input start_pulse;
  input busy_reg_0;
  input processing_done;
  input acq_done_proc_pulse;
  input [0:0]out;
  input [0:0]\frames_seen_proc_reg[0] ;
  input [5:0]\frames_seen_proc_reg[5] ;
  input clear_error_proc;
  input frame_error_sticky_proc;
  input frame_error_pulse;

  wire [5:0]D;
  wire [0:0]E;
  wire acq_done_proc_pulse;
  wire acq_error_proc_pulse;
  wire busy4_out;
  wire busy_reg;
  wire busy_reg_0;
  wire clear_error_proc;
  wire clk_acq;
  wire clk_proc;
  wire dst_pulse_i_1__1_n_0;
  wire dst_pulse_reg_0;
  (* async_reg = "true" *) wire dst_sync_1;
  (* async_reg = "true" *) wire dst_sync_2;
  wire dst_sync_2_d;
  wire frame_error_pulse;
  wire frame_error_sticky_proc;
  wire [0:0]\frames_seen_proc_reg[0] ;
  wire [5:0]\frames_seen_proc_reg[5] ;
  wire [0:0]out;
  wire processing_done;
  wire rst_acq;
  wire rst_proc;
  wire src_toggle_i_1__0_n_0;
  wire src_toggle_reg_n_0;
  wire start_pulse;

  LUT6 #(
    .INIT(64'h0000300010113000)) 
    busy_i_1
       (.I0(acq_error_proc_pulse),
        .I1(rst_proc),
        .I2(start_pulse),
        .I3(busy4_out),
        .I4(busy_reg_0),
        .I5(processing_done),
        .O(dst_pulse_reg_0));
  LUT2 #(
    .INIT(4'h6)) 
    dst_pulse_i_1__1
       (.I0(dst_sync_2_d),
        .I1(dst_sync_2),
        .O(dst_pulse_i_1__1_n_0));
  FDRE dst_pulse_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_pulse_i_1__1_n_0),
        .Q(acq_error_proc_pulse),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_1_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(src_toggle_reg_n_0),
        .Q(dst_sync_1),
        .R(rst_proc));
  FDRE dst_sync_2_d_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_sync_2),
        .Q(dst_sync_2_d),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_2_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(dst_sync_1),
        .Q(dst_sync_2),
        .R(rst_proc));
  LUT5 #(
    .INIT(32'hC0DDC0C8)) 
    frame_error_sticky_proc_i_1
       (.I0(busy4_out),
        .I1(busy_reg_0),
        .I2(acq_error_proc_pulse),
        .I3(clear_error_proc),
        .I4(frame_error_sticky_proc),
        .O(busy_reg));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[0]_i_1 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[1]_i_1 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[2]_i_1 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[3]_i_1 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[4]_i_1 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFBC8C8C8C8C8C8C8)) 
    \frames_seen_proc[5]_i_1 
       (.I0(acq_error_proc_pulse),
        .I1(busy_reg_0),
        .I2(acq_done_proc_pulse),
        .I3(out),
        .I4(\frames_seen_proc_reg[0] ),
        .I5(start_pulse),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hAA02)) 
    \frames_seen_proc[5]_i_2 
       (.I0(busy_reg_0),
        .I1(acq_error_proc_pulse),
        .I2(acq_done_proc_pulse),
        .I3(\frames_seen_proc_reg[5] [5]),
        .O(D[5]));
  LUT2 #(
    .INIT(4'h6)) 
    src_toggle_i_1__0
       (.I0(frame_error_pulse),
        .I1(src_toggle_reg_n_0),
        .O(src_toggle_i_1__0_n_0));
  FDRE src_toggle_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(src_toggle_i_1__0_n_0),
        .Q(src_toggle_reg_n_0),
        .R(rst_acq));
  LUT4 #(
    .INIT(16'h0080)) 
    start_accepted_i_1
       (.I0(out),
        .I1(\frames_seen_proc_reg[0] ),
        .I2(start_pulse),
        .I3(busy_reg_0),
        .O(busy4_out));
endmodule

(* ORIG_REF_NAME = "cdc_pulse_toggle" *) 
module system_echo_pipeline_0_0_cdc_pulse_toggle_1
   (start_acq_pulse,
    \launch_delay_reg[0] ,
    \launch_delay_reg[0]_0 ,
    \launch_delay_reg[0]_1 ,
    \launch_delay_reg[1] ,
    rst_acq,
    clk_acq,
    rst_proc,
    clk_proc,
    launch_delay,
    start_accepted);
  output start_acq_pulse;
  output \launch_delay_reg[0] ;
  output \launch_delay_reg[0]_0 ;
  output \launch_delay_reg[0]_1 ;
  output \launch_delay_reg[1] ;
  input rst_acq;
  input clk_acq;
  input rst_proc;
  input clk_proc;
  input [2:0]launch_delay;
  input start_accepted;

  wire clk_acq;
  wire clk_proc;
  wire dst_pulse_i_1_n_0;
  (* async_reg = "true" *) wire dst_sync_1;
  (* async_reg = "true" *) wire dst_sync_2;
  wire dst_sync_2_d;
  wire [2:0]launch_delay;
  wire \launch_delay_reg[0] ;
  wire \launch_delay_reg[0]_0 ;
  wire \launch_delay_reg[0]_1 ;
  wire \launch_delay_reg[1] ;
  wire rst_acq;
  wire rst_proc;
  wire src_toggle;
  wire src_toggle_i_1_n_0;
  wire start_accepted;
  wire start_acq_pulse;

  LUT2 #(
    .INIT(4'h6)) 
    dst_pulse_i_1
       (.I0(dst_sync_2_d),
        .I1(dst_sync_2),
        .O(dst_pulse_i_1_n_0));
  FDRE dst_pulse_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(dst_pulse_i_1_n_0),
        .Q(start_acq_pulse),
        .R(rst_acq));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_1_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(src_toggle),
        .Q(dst_sync_1),
        .R(rst_acq));
  FDRE dst_sync_2_d_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(dst_sync_2),
        .Q(dst_sync_2_d),
        .R(rst_acq));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE dst_sync_2_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(dst_sync_1),
        .Q(dst_sync_2),
        .R(rst_acq));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT5 #(
    .INIT(32'h00000054)) 
    \launch_delay[0]_i_1 
       (.I0(launch_delay[0]),
        .I1(launch_delay[1]),
        .I2(launch_delay[2]),
        .I3(start_acq_pulse),
        .I4(rst_acq),
        .O(\launch_delay_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT5 #(
    .INIT(32'h000000A4)) 
    \launch_delay[1]_i_1 
       (.I0(launch_delay[0]),
        .I1(launch_delay[2]),
        .I2(launch_delay[1]),
        .I3(start_acq_pulse),
        .I4(rst_acq),
        .O(\launch_delay_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT4 #(
    .INIT(16'hFFC8)) 
    \launch_delay[2]_i_1 
       (.I0(launch_delay[0]),
        .I1(launch_delay[2]),
        .I2(launch_delay[1]),
        .I3(start_acq_pulse),
        .O(\launch_delay_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    pulse_start_acq_i_1
       (.I0(launch_delay[1]),
        .I1(launch_delay[2]),
        .I2(launch_delay[0]),
        .I3(start_acq_pulse),
        .I4(rst_acq),
        .O(\launch_delay_reg[1] ));
  LUT2 #(
    .INIT(4'h6)) 
    src_toggle_i_1
       (.I0(start_accepted),
        .I1(src_toggle),
        .O(src_toggle_i_1_n_0));
  FDRE src_toggle_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(src_toggle_i_1_n_0),
        .Q(src_toggle),
        .R(rst_proc));
endmodule

(* ORIG_REF_NAME = "coeff_shadow_bank" *) 
module system_echo_pipeline_0_0_coeff_shadow_bank
   (WEA,
    baseline_commit_accepted,
    baseline_commit_rejected,
    S,
    bank_0_reg_0,
    bank_0_reg_1,
    bank_0_reg_2,
    clk_proc,
    baseline_shadow_wr_en,
    baseline_shadow_wr_addr,
    Q,
    baseline_shadow_wr_data_q2,
    rst_proc,
    baseline_commit_pulse,
    state,
    commit_rejected_reg_0,
    average_debug_rd_data_q2);
  output [0:0]WEA;
  output baseline_commit_accepted;
  output baseline_commit_rejected;
  output [3:0]S;
  output [3:0]bank_0_reg_0;
  output [3:0]bank_0_reg_1;
  output [3:0]bank_0_reg_2;
  input clk_proc;
  input baseline_shadow_wr_en;
  input [9:0]baseline_shadow_wr_addr;
  input [9:0]Q;
  input [15:0]baseline_shadow_wr_data_q2;
  input rst_proc;
  input baseline_commit_pulse;
  input [2:0]state;
  input commit_rejected_reg_0;
  input [15:0]average_debug_rd_data_q2;

  wire [9:0]Q;
  wire [3:0]S;
  wire [0:0]WEA;
  wire active_bank_i_1_n_0;
  wire [15:0]average_debug_rd_data_q2;
  wire [15:0]bank_0_rd_data;
  wire bank_0_rd_data0;
  wire [3:0]bank_0_reg_0;
  wire [3:0]bank_0_reg_1;
  wire [3:0]bank_0_reg_2;
  wire [15:0]bank_1_rd_data;
  wire bank_1_reg_i_1_n_0;
  wire bank_1_reg_i_2_n_0;
  wire baseline_commit_accepted;
  wire baseline_commit_pulse;
  wire baseline_commit_rejected;
  wire [9:0]baseline_shadow_wr_addr;
  wire [15:0]baseline_shadow_wr_data_q2;
  wire baseline_shadow_wr_en;
  wire clk_proc;
  wire commit_accepted_i_1_n_0;
  wire commit_rejected_i_1_n_0;
  wire commit_rejected_reg_0;
  wire rst_proc;
  wire [2:0]state;
  wire [15:0]NLW_bank_0_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_bank_0_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_bank_0_reg_DOPBDOP_UNCONNECTED;
  wire [15:0]NLW_bank_1_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_bank_1_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_bank_1_reg_DOPBDOP_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFEFFFF00010000)) 
    active_bank_i_1
       (.I0(commit_rejected_reg_0),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(baseline_commit_pulse),
        .I5(WEA),
        .O(active_bank_i_1_n_0));
  FDRE active_bank_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(active_bank_i_1_n_0),
        .Q(WEA),
        .R(rst_proc));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/baseline_bank/bank_0_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    bank_0_reg
       (.ADDRARDADDR({baseline_shadow_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(baseline_shadow_wr_data_q2),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_bank_0_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(bank_0_rd_data),
        .DOPADOP(NLW_bank_0_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_bank_0_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(baseline_shadow_wr_en),
        .ENBWREN(bank_0_rd_data0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0008)) 
    bank_0_reg_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(WEA),
        .O(bank_0_rd_data0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/baseline_bank/bank_1_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    bank_1_reg
       (.ADDRARDADDR({baseline_shadow_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(baseline_shadow_wr_data_q2),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_bank_1_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(bank_1_rd_data),
        .DOPADOP(NLW_bank_1_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_bank_1_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(baseline_shadow_wr_en),
        .ENBWREN(bank_1_reg_i_1_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({bank_1_reg_i_2_n_0,bank_1_reg_i_2_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0800)) 
    bank_1_reg_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(WEA),
        .O(bank_1_reg_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    bank_1_reg_i_2
       (.I0(WEA),
        .O(bank_1_reg_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    commit_accepted_i_1
       (.I0(baseline_commit_pulse),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(commit_rejected_reg_0),
        .O(commit_accepted_i_1_n_0));
  FDRE commit_accepted_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(commit_accepted_i_1_n_0),
        .Q(baseline_commit_accepted),
        .R(rst_proc));
  LUT6 #(
    .INIT(64'h00000000FFFE0000)) 
    commit_rejected_i_1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(commit_rejected_reg_0),
        .I4(baseline_commit_pulse),
        .I5(rst_proc),
        .O(commit_rejected_i_1_n_0));
  FDRE commit_rejected_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(commit_rejected_i_1_n_0),
        .Q(baseline_commit_rejected),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__0_i_1
       (.I0(average_debug_rd_data_q2[7]),
        .I1(bank_0_rd_data[7]),
        .I2(WEA),
        .I3(bank_1_rd_data[7]),
        .O(bank_0_reg_0[3]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__0_i_2
       (.I0(average_debug_rd_data_q2[6]),
        .I1(bank_0_rd_data[6]),
        .I2(WEA),
        .I3(bank_1_rd_data[6]),
        .O(bank_0_reg_0[2]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__0_i_3
       (.I0(average_debug_rd_data_q2[5]),
        .I1(bank_0_rd_data[5]),
        .I2(WEA),
        .I3(bank_1_rd_data[5]),
        .O(bank_0_reg_0[1]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__0_i_4
       (.I0(average_debug_rd_data_q2[4]),
        .I1(bank_0_rd_data[4]),
        .I2(WEA),
        .I3(bank_1_rd_data[4]),
        .O(bank_0_reg_0[0]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__1_i_1
       (.I0(average_debug_rd_data_q2[11]),
        .I1(bank_0_rd_data[11]),
        .I2(WEA),
        .I3(bank_1_rd_data[11]),
        .O(bank_0_reg_1[3]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__1_i_2
       (.I0(average_debug_rd_data_q2[10]),
        .I1(bank_0_rd_data[10]),
        .I2(WEA),
        .I3(bank_1_rd_data[10]),
        .O(bank_0_reg_1[2]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__1_i_3
       (.I0(average_debug_rd_data_q2[9]),
        .I1(bank_0_rd_data[9]),
        .I2(WEA),
        .I3(bank_1_rd_data[9]),
        .O(bank_0_reg_1[1]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__1_i_4
       (.I0(average_debug_rd_data_q2[8]),
        .I1(bank_0_rd_data[8]),
        .I2(WEA),
        .I3(bank_1_rd_data[8]),
        .O(bank_0_reg_1[0]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__2_i_2
       (.I0(average_debug_rd_data_q2[15]),
        .I1(bank_0_rd_data[15]),
        .I2(WEA),
        .I3(bank_1_rd_data[15]),
        .O(bank_0_reg_2[3]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__2_i_3
       (.I0(average_debug_rd_data_q2[14]),
        .I1(bank_0_rd_data[14]),
        .I2(WEA),
        .I3(bank_1_rd_data[14]),
        .O(bank_0_reg_2[2]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__2_i_4
       (.I0(average_debug_rd_data_q2[13]),
        .I1(bank_0_rd_data[13]),
        .I2(WEA),
        .I3(bank_1_rd_data[13]),
        .O(bank_0_reg_2[1]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry__2_i_5
       (.I0(average_debug_rd_data_q2[12]),
        .I1(bank_0_rd_data[12]),
        .I2(WEA),
        .I3(bank_1_rd_data[12]),
        .O(bank_0_reg_2[0]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry_i_1
       (.I0(average_debug_rd_data_q2[3]),
        .I1(bank_0_rd_data[3]),
        .I2(WEA),
        .I3(bank_1_rd_data[3]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry_i_2
       (.I0(average_debug_rd_data_q2[2]),
        .I1(bank_0_rd_data[2]),
        .I2(WEA),
        .I3(bank_1_rd_data[2]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry_i_3
       (.I0(average_debug_rd_data_q2[1]),
        .I1(bank_0_rd_data[1]),
        .I2(WEA),
        .I3(bank_1_rd_data[1]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'hA959)) 
    difference_q20_carry_i_4
       (.I0(average_debug_rd_data_q2[0]),
        .I1(bank_0_rd_data[0]),
        .I2(WEA),
        .I3(bank_1_rd_data[0]),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "coeff_shadow_bank" *) 
module system_echo_pipeline_0_0_coeff_shadow_bank__parameterized0
   (WEA,
    template_commit_accepted,
    template_commit_rejected,
    DIADI,
    clk_proc,
    template_shadow_wr_en,
    template_shadow_wr_addr,
    Q,
    template_shadow_wr_data_q14,
    rst_proc,
    template_commit_pulse,
    state,
    commit_rejected_reg_0);
  output [0:0]WEA;
  output template_commit_accepted;
  output template_commit_rejected;
  output [15:0]DIADI;
  input clk_proc;
  input template_shadow_wr_en;
  input [9:0]template_shadow_wr_addr;
  input [9:0]Q;
  input [15:0]template_shadow_wr_data_q14;
  input rst_proc;
  input template_commit_pulse;
  input [2:0]state;
  input commit_rejected_reg_0;

  wire [15:0]DIADI;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire active_bank_i_1__0_n_0;
  wire [15:0]bank_0_rd_data;
  wire bank_0_rd_data0;
  wire [15:0]bank_1_rd_data;
  wire bank_1_reg_i_1__0_n_0;
  wire bank_1_reg_i_2__0_n_0;
  wire clk_proc;
  wire commit_accepted_i_1__0_n_0;
  wire commit_rejected_i_1__0_n_0;
  wire commit_rejected_reg_0;
  wire rst_proc;
  wire [2:0]state;
  wire template_commit_accepted;
  wire template_commit_pulse;
  wire template_commit_rejected;
  wire [9:0]template_shadow_wr_addr;
  wire [15:0]template_shadow_wr_data_q14;
  wire template_shadow_wr_en;
  wire [15:0]NLW_bank_0_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_bank_0_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_bank_0_reg_DOPBDOP_UNCONNECTED;
  wire [15:0]NLW_bank_1_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_bank_1_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_bank_1_reg_DOPBDOP_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFFFEFFFF00010000)) 
    active_bank_i_1__0
       (.I0(commit_rejected_reg_0),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .I4(template_commit_pulse),
        .I5(WEA),
        .O(active_bank_i_1__0_n_0));
  FDRE active_bank_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(active_bank_i_1__0_n_0),
        .Q(WEA),
        .R(rst_proc));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "10240" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/template_bank/bank_0_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    bank_0_reg
       (.ADDRARDADDR({template_shadow_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(template_shadow_wr_data_q14),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_bank_0_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(bank_0_rd_data),
        .DOPADOP(NLW_bank_0_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_bank_0_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(template_shadow_wr_en),
        .ENBWREN(bank_0_rd_data0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0004)) 
    bank_0_reg_i_1__0
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(WEA),
        .O(bank_0_rd_data0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "10240" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/template_bank/bank_1_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    bank_1_reg
       (.ADDRARDADDR({template_shadow_wr_addr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(template_shadow_wr_data_q14),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_bank_1_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(bank_1_rd_data),
        .DOPADOP(NLW_bank_1_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_bank_1_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(template_shadow_wr_en),
        .ENBWREN(bank_1_reg_i_1__0_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({bank_1_reg_i_2__0_n_0,bank_1_reg_i_2__0_n_0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'h0400)) 
    bank_1_reg_i_1__0
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(WEA),
        .O(bank_1_reg_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    bank_1_reg_i_2__0
       (.I0(WEA),
        .O(bank_1_reg_i_2__0_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    commit_accepted_i_1__0
       (.I0(template_commit_pulse),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(commit_rejected_reg_0),
        .O(commit_accepted_i_1__0_n_0));
  FDRE commit_accepted_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(commit_accepted_i_1__0_n_0),
        .Q(template_commit_accepted),
        .R(rst_proc));
  LUT6 #(
    .INIT(64'h00000000FFFE0000)) 
    commit_rejected_i_1__0
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(commit_rejected_reg_0),
        .I4(template_commit_pulse),
        .I5(rst_proc),
        .O(commit_rejected_i_1__0_n_0));
  FDRE commit_rejected_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(commit_rejected_i_1__0_n_0),
        .Q(template_commit_rejected),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_1
       (.I0(bank_1_rd_data[15]),
        .I1(WEA),
        .I2(bank_0_rd_data[15]),
        .O(DIADI[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_10
       (.I0(bank_1_rd_data[6]),
        .I1(WEA),
        .I2(bank_0_rd_data[6]),
        .O(DIADI[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_11
       (.I0(bank_1_rd_data[5]),
        .I1(WEA),
        .I2(bank_0_rd_data[5]),
        .O(DIADI[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_12
       (.I0(bank_1_rd_data[4]),
        .I1(WEA),
        .I2(bank_0_rd_data[4]),
        .O(DIADI[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_13
       (.I0(bank_1_rd_data[3]),
        .I1(WEA),
        .I2(bank_0_rd_data[3]),
        .O(DIADI[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_14
       (.I0(bank_1_rd_data[2]),
        .I1(WEA),
        .I2(bank_0_rd_data[2]),
        .O(DIADI[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_15
       (.I0(bank_1_rd_data[1]),
        .I1(WEA),
        .I2(bank_0_rd_data[1]),
        .O(DIADI[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_16
       (.I0(bank_1_rd_data[0]),
        .I1(WEA),
        .I2(bank_0_rd_data[0]),
        .O(DIADI[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_2
       (.I0(bank_1_rd_data[14]),
        .I1(WEA),
        .I2(bank_0_rd_data[14]),
        .O(DIADI[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_3
       (.I0(bank_1_rd_data[13]),
        .I1(WEA),
        .I2(bank_0_rd_data[13]),
        .O(DIADI[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_4
       (.I0(bank_1_rd_data[12]),
        .I1(WEA),
        .I2(bank_0_rd_data[12]),
        .O(DIADI[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_5
       (.I0(bank_1_rd_data[11]),
        .I1(WEA),
        .I2(bank_0_rd_data[11]),
        .O(DIADI[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_6
       (.I0(bank_1_rd_data[10]),
        .I1(WEA),
        .I2(bank_0_rd_data[10]),
        .O(DIADI[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_7
       (.I0(bank_1_rd_data[9]),
        .I1(WEA),
        .I2(bank_0_rd_data[9]),
        .O(DIADI[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_8
       (.I0(bank_1_rd_data[8]),
        .I1(WEA),
        .I2(bank_0_rd_data[8]),
        .O(DIADI[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    template_mem_reg_i_9
       (.I0(bank_1_rd_data[7]),
        .I1(WEA),
        .I2(bank_0_rd_data[7]),
        .O(DIADI[7]));
endmodule

(* ORIG_REF_NAME = "corr_mac" *) 
module system_echo_pipeline_0_0_corr_mac
   (WEBWE,
    correlation_overflow_count,
    E,
    \FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[1]_0 ,
    \result_lag_reg[7]_0 ,
    \result_q16_reg[47]_0 ,
    clk_proc,
    diff_valid,
    rst_proc,
    Q,
    difference_mem_reg_0,
    template_rsp_valid,
    template_mem_reg_0,
    DIADI,
    acq_done_proc_pulse,
    \result_count_reg[0] ,
    state,
    \FSM_sequential_state[2]_i_2 ,
    \FSM_sequential_state[2]_i_2_0 ,
    \FSM_sequential_state[2]_i_2_1 );
  output [0:0]WEBWE;
  output [31:0]correlation_overflow_count;
  output [0:0]E;
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[1]_0 ;
  output [7:0]\result_lag_reg[7]_0 ;
  output [47:0]\result_q16_reg[47]_0 ;
  input clk_proc;
  input diff_valid;
  input rst_proc;
  input [9:0]Q;
  input [16:0]difference_mem_reg_0;
  input template_rsp_valid;
  input [9:0]template_mem_reg_0;
  input [15:0]DIADI;
  input acq_done_proc_pulse;
  input \result_count_reg[0] ;
  input [2:0]state;
  input \FSM_sequential_state[2]_i_2 ;
  input \FSM_sequential_state[2]_i_2_0 ;
  input \FSM_sequential_state[2]_i_2_1 ;

  wire [15:0]DIADI;
  wire [0:0]E;
  wire \FSM_sequential_state[2]_i_2 ;
  wire \FSM_sequential_state[2]_i_2_0 ;
  wire \FSM_sequential_state[2]_i_2_1 ;
  wire \FSM_sequential_state[2]_i_9_n_0 ;
  wire \FSM_sequential_state_reg[1] ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire [9:0]Q;
  wire [0:0]WEBWE;
  wire [47:0]accumulator;
  wire \accumulator[47]_i_1_n_0 ;
  wire [0:0]accumulator_0;
  wire [47:0]accumulator_next;
  wire accumulator_next1_carry_i_1_n_3;
  wire accumulator_next1_carry_i_2_n_0;
  wire accumulator_next1_carry_n_2;
  wire accumulator_next1_carry_n_3;
  wire \accumulator_next1_inferred__0/i__carry_n_2 ;
  wire \accumulator_next1_inferred__0/i__carry_n_3 ;
  wire accumulator_next2_carry__0_i_1_n_0;
  wire accumulator_next2_carry__0_i_2_n_0;
  wire accumulator_next2_carry__0_i_3_n_0;
  wire accumulator_next2_carry__0_i_4_n_0;
  wire accumulator_next2_carry__0_n_0;
  wire accumulator_next2_carry__0_n_1;
  wire accumulator_next2_carry__0_n_2;
  wire accumulator_next2_carry__0_n_3;
  wire accumulator_next2_carry__0_n_4;
  wire accumulator_next2_carry__0_n_5;
  wire accumulator_next2_carry__0_n_6;
  wire accumulator_next2_carry__0_n_7;
  wire accumulator_next2_carry__10_i_1_n_0;
  wire accumulator_next2_carry__10_i_2_n_0;
  wire accumulator_next2_carry__10_i_3_n_0;
  wire accumulator_next2_carry__10_i_4_n_0;
  wire accumulator_next2_carry__10_n_0;
  wire accumulator_next2_carry__10_n_1;
  wire accumulator_next2_carry__10_n_2;
  wire accumulator_next2_carry__10_n_3;
  wire accumulator_next2_carry__10_n_4;
  wire accumulator_next2_carry__10_n_5;
  wire accumulator_next2_carry__10_n_6;
  wire accumulator_next2_carry__10_n_7;
  wire accumulator_next2_carry__1_i_1_n_0;
  wire accumulator_next2_carry__1_i_2_n_0;
  wire accumulator_next2_carry__1_i_3_n_0;
  wire accumulator_next2_carry__1_i_4_n_0;
  wire accumulator_next2_carry__1_n_0;
  wire accumulator_next2_carry__1_n_1;
  wire accumulator_next2_carry__1_n_2;
  wire accumulator_next2_carry__1_n_3;
  wire accumulator_next2_carry__1_n_4;
  wire accumulator_next2_carry__1_n_5;
  wire accumulator_next2_carry__1_n_6;
  wire accumulator_next2_carry__1_n_7;
  wire accumulator_next2_carry__2_i_1_n_0;
  wire accumulator_next2_carry__2_i_2_n_0;
  wire accumulator_next2_carry__2_i_3_n_0;
  wire accumulator_next2_carry__2_i_4_n_0;
  wire accumulator_next2_carry__2_n_0;
  wire accumulator_next2_carry__2_n_1;
  wire accumulator_next2_carry__2_n_2;
  wire accumulator_next2_carry__2_n_3;
  wire accumulator_next2_carry__2_n_4;
  wire accumulator_next2_carry__2_n_5;
  wire accumulator_next2_carry__2_n_6;
  wire accumulator_next2_carry__2_n_7;
  wire accumulator_next2_carry__3_i_1_n_0;
  wire accumulator_next2_carry__3_i_2_n_0;
  wire accumulator_next2_carry__3_i_3_n_0;
  wire accumulator_next2_carry__3_i_4_n_0;
  wire accumulator_next2_carry__3_n_0;
  wire accumulator_next2_carry__3_n_1;
  wire accumulator_next2_carry__3_n_2;
  wire accumulator_next2_carry__3_n_3;
  wire accumulator_next2_carry__3_n_4;
  wire accumulator_next2_carry__3_n_5;
  wire accumulator_next2_carry__3_n_6;
  wire accumulator_next2_carry__3_n_7;
  wire accumulator_next2_carry__4_i_1_n_0;
  wire accumulator_next2_carry__4_i_2_n_0;
  wire accumulator_next2_carry__4_i_3_n_0;
  wire accumulator_next2_carry__4_i_4_n_0;
  wire accumulator_next2_carry__4_n_0;
  wire accumulator_next2_carry__4_n_1;
  wire accumulator_next2_carry__4_n_2;
  wire accumulator_next2_carry__4_n_3;
  wire accumulator_next2_carry__4_n_4;
  wire accumulator_next2_carry__4_n_5;
  wire accumulator_next2_carry__4_n_6;
  wire accumulator_next2_carry__4_n_7;
  wire accumulator_next2_carry__5_i_1_n_0;
  wire accumulator_next2_carry__5_i_2_n_0;
  wire accumulator_next2_carry__5_i_3_n_0;
  wire accumulator_next2_carry__5_i_4_n_0;
  wire accumulator_next2_carry__5_n_0;
  wire accumulator_next2_carry__5_n_1;
  wire accumulator_next2_carry__5_n_2;
  wire accumulator_next2_carry__5_n_3;
  wire accumulator_next2_carry__5_n_4;
  wire accumulator_next2_carry__5_n_5;
  wire accumulator_next2_carry__5_n_6;
  wire accumulator_next2_carry__5_n_7;
  wire accumulator_next2_carry__6_i_1_n_0;
  wire accumulator_next2_carry__6_i_2_n_0;
  wire accumulator_next2_carry__6_i_3_n_0;
  wire accumulator_next2_carry__6_i_4_n_0;
  wire accumulator_next2_carry__6_n_0;
  wire accumulator_next2_carry__6_n_1;
  wire accumulator_next2_carry__6_n_2;
  wire accumulator_next2_carry__6_n_3;
  wire accumulator_next2_carry__6_n_4;
  wire accumulator_next2_carry__6_n_5;
  wire accumulator_next2_carry__6_n_6;
  wire accumulator_next2_carry__6_n_7;
  wire accumulator_next2_carry__7_i_1_n_0;
  wire accumulator_next2_carry__7_i_2_n_0;
  wire accumulator_next2_carry__7_i_3_n_0;
  wire accumulator_next2_carry__7_i_4_n_0;
  wire accumulator_next2_carry__7_i_5_n_0;
  wire accumulator_next2_carry__7_n_0;
  wire accumulator_next2_carry__7_n_1;
  wire accumulator_next2_carry__7_n_2;
  wire accumulator_next2_carry__7_n_3;
  wire accumulator_next2_carry__7_n_4;
  wire accumulator_next2_carry__7_n_5;
  wire accumulator_next2_carry__7_n_6;
  wire accumulator_next2_carry__7_n_7;
  wire accumulator_next2_carry__8_i_1_n_0;
  wire accumulator_next2_carry__8_i_2_n_0;
  wire accumulator_next2_carry__8_i_3_n_0;
  wire accumulator_next2_carry__8_i_4_n_0;
  wire accumulator_next2_carry__8_n_0;
  wire accumulator_next2_carry__8_n_1;
  wire accumulator_next2_carry__8_n_2;
  wire accumulator_next2_carry__8_n_3;
  wire accumulator_next2_carry__8_n_4;
  wire accumulator_next2_carry__8_n_5;
  wire accumulator_next2_carry__8_n_6;
  wire accumulator_next2_carry__8_n_7;
  wire accumulator_next2_carry__9_i_1_n_0;
  wire accumulator_next2_carry__9_i_2_n_0;
  wire accumulator_next2_carry__9_i_3_n_0;
  wire accumulator_next2_carry__9_i_4_n_0;
  wire accumulator_next2_carry__9_n_0;
  wire accumulator_next2_carry__9_n_1;
  wire accumulator_next2_carry__9_n_2;
  wire accumulator_next2_carry__9_n_3;
  wire accumulator_next2_carry__9_n_4;
  wire accumulator_next2_carry__9_n_5;
  wire accumulator_next2_carry__9_n_6;
  wire accumulator_next2_carry__9_n_7;
  wire accumulator_next2_carry_i_1_n_0;
  wire accumulator_next2_carry_i_2_n_0;
  wire accumulator_next2_carry_i_3_n_0;
  wire accumulator_next2_carry_i_4_n_0;
  wire accumulator_next2_carry_n_0;
  wire accumulator_next2_carry_n_1;
  wire accumulator_next2_carry_n_2;
  wire accumulator_next2_carry_n_3;
  wire accumulator_next2_carry_n_4;
  wire accumulator_next2_carry_n_5;
  wire accumulator_next2_carry_n_6;
  wire accumulator_next2_carry_n_7;
  wire acq_done_proc_pulse;
  wire busy0_out;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire clk_proc;
  wire corr_done;
  wire [31:0]correlation_overflow_count;
  wire diff_valid;
  wire [16:0]difference_mem_reg_0;
  wire difference_mem_reg_i_10_n_0;
  wire difference_mem_reg_i_11_n_0;
  wire difference_mem_reg_i_12_n_0;
  wire difference_mem_reg_i_1_n_0;
  wire difference_mem_reg_i_2_n_3;
  wire difference_mem_reg_i_3_n_0;
  wire difference_mem_reg_i_3_n_1;
  wire difference_mem_reg_i_3_n_2;
  wire difference_mem_reg_i_3_n_3;
  wire difference_mem_reg_i_4_n_0;
  wire difference_mem_reg_i_4_n_1;
  wire difference_mem_reg_i_4_n_2;
  wire difference_mem_reg_i_4_n_3;
  wire difference_mem_reg_i_5_n_0;
  wire difference_mem_reg_i_6_n_0;
  wire difference_mem_reg_i_7_n_0;
  wire difference_mem_reg_i_8_n_0;
  wire difference_mem_reg_i_9_n_0;
  wire [16:0]difference_rd_data;
  wire done_i_2_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire \overflow_count[31]_i_2_n_0 ;
  wire \overflow_count[3]_i_2_n_0 ;
  wire \overflow_count_reg[11]_i_1_n_0 ;
  wire \overflow_count_reg[11]_i_1_n_1 ;
  wire \overflow_count_reg[11]_i_1_n_2 ;
  wire \overflow_count_reg[11]_i_1_n_3 ;
  wire \overflow_count_reg[11]_i_1_n_4 ;
  wire \overflow_count_reg[11]_i_1_n_5 ;
  wire \overflow_count_reg[11]_i_1_n_6 ;
  wire \overflow_count_reg[11]_i_1_n_7 ;
  wire \overflow_count_reg[15]_i_1_n_0 ;
  wire \overflow_count_reg[15]_i_1_n_1 ;
  wire \overflow_count_reg[15]_i_1_n_2 ;
  wire \overflow_count_reg[15]_i_1_n_3 ;
  wire \overflow_count_reg[15]_i_1_n_4 ;
  wire \overflow_count_reg[15]_i_1_n_5 ;
  wire \overflow_count_reg[15]_i_1_n_6 ;
  wire \overflow_count_reg[15]_i_1_n_7 ;
  wire \overflow_count_reg[19]_i_1_n_0 ;
  wire \overflow_count_reg[19]_i_1_n_1 ;
  wire \overflow_count_reg[19]_i_1_n_2 ;
  wire \overflow_count_reg[19]_i_1_n_3 ;
  wire \overflow_count_reg[19]_i_1_n_4 ;
  wire \overflow_count_reg[19]_i_1_n_5 ;
  wire \overflow_count_reg[19]_i_1_n_6 ;
  wire \overflow_count_reg[19]_i_1_n_7 ;
  wire \overflow_count_reg[23]_i_1_n_0 ;
  wire \overflow_count_reg[23]_i_1_n_1 ;
  wire \overflow_count_reg[23]_i_1_n_2 ;
  wire \overflow_count_reg[23]_i_1_n_3 ;
  wire \overflow_count_reg[23]_i_1_n_4 ;
  wire \overflow_count_reg[23]_i_1_n_5 ;
  wire \overflow_count_reg[23]_i_1_n_6 ;
  wire \overflow_count_reg[23]_i_1_n_7 ;
  wire \overflow_count_reg[27]_i_1_n_0 ;
  wire \overflow_count_reg[27]_i_1_n_1 ;
  wire \overflow_count_reg[27]_i_1_n_2 ;
  wire \overflow_count_reg[27]_i_1_n_3 ;
  wire \overflow_count_reg[27]_i_1_n_4 ;
  wire \overflow_count_reg[27]_i_1_n_5 ;
  wire \overflow_count_reg[27]_i_1_n_6 ;
  wire \overflow_count_reg[27]_i_1_n_7 ;
  wire \overflow_count_reg[31]_i_3_n_1 ;
  wire \overflow_count_reg[31]_i_3_n_2 ;
  wire \overflow_count_reg[31]_i_3_n_3 ;
  wire \overflow_count_reg[31]_i_3_n_4 ;
  wire \overflow_count_reg[31]_i_3_n_5 ;
  wire \overflow_count_reg[31]_i_3_n_6 ;
  wire \overflow_count_reg[31]_i_3_n_7 ;
  wire \overflow_count_reg[3]_i_1_n_0 ;
  wire \overflow_count_reg[3]_i_1_n_1 ;
  wire \overflow_count_reg[3]_i_1_n_2 ;
  wire \overflow_count_reg[3]_i_1_n_3 ;
  wire \overflow_count_reg[3]_i_1_n_4 ;
  wire \overflow_count_reg[3]_i_1_n_5 ;
  wire \overflow_count_reg[3]_i_1_n_6 ;
  wire \overflow_count_reg[3]_i_1_n_7 ;
  wire \overflow_count_reg[7]_i_1_n_0 ;
  wire \overflow_count_reg[7]_i_1_n_1 ;
  wire \overflow_count_reg[7]_i_1_n_2 ;
  wire \overflow_count_reg[7]_i_1_n_3 ;
  wire \overflow_count_reg[7]_i_1_n_4 ;
  wire \overflow_count_reg[7]_i_1_n_5 ;
  wire \overflow_count_reg[7]_i_1_n_6 ;
  wire \overflow_count_reg[7]_i_1_n_7 ;
  wire [7:0]p_0_in;
  wire [7:0]product_lag_index;
  wire [0:0]product_reg;
  wire product_reg_reg_n_100;
  wire product_reg_reg_n_101;
  wire product_reg_reg_n_102;
  wire product_reg_reg_n_103;
  wire product_reg_reg_n_104;
  wire product_reg_reg_n_105;
  wire product_reg_reg_n_73;
  wire product_reg_reg_n_74;
  wire product_reg_reg_n_75;
  wire product_reg_reg_n_76;
  wire product_reg_reg_n_77;
  wire product_reg_reg_n_78;
  wire product_reg_reg_n_79;
  wire product_reg_reg_n_80;
  wire product_reg_reg_n_81;
  wire product_reg_reg_n_82;
  wire product_reg_reg_n_83;
  wire product_reg_reg_n_84;
  wire product_reg_reg_n_85;
  wire product_reg_reg_n_86;
  wire product_reg_reg_n_87;
  wire product_reg_reg_n_88;
  wire product_reg_reg_n_89;
  wire product_reg_reg_n_90;
  wire product_reg_reg_n_91;
  wire product_reg_reg_n_92;
  wire product_reg_reg_n_93;
  wire product_reg_reg_n_94;
  wire product_reg_reg_n_95;
  wire product_reg_reg_n_96;
  wire product_reg_reg_n_97;
  wire product_reg_reg_n_98;
  wire product_reg_reg_n_99;
  wire [9:0]product_tap_index;
  wire product_valid;
  wire product_valid_i_1_n_0;
  wire product_valid_reg_n_0;
  wire [9:0]read_index;
  wire read_valid;
  wire read_valid_i_1_n_0;
  wire \request_lag_index[4]_i_1_n_0 ;
  wire \request_lag_index[7]_i_1_n_0 ;
  wire \request_lag_index[7]_i_3_n_0 ;
  wire \request_lag_index[7]_i_4_n_0 ;
  wire [7:0]request_lag_index_reg;
  wire [9:0]request_tap_index;
  wire \request_tap_index[5]_i_1_n_0 ;
  wire \request_tap_index[6]_i_1_n_0 ;
  wire \request_tap_index[9]_i_2_n_0 ;
  wire [9:0]request_tap_index__0;
  wire requests_done;
  wire requests_done_i_1_n_0;
  wire requests_done_i_2_n_0;
  wire [7:0]response_lag_index;
  wire \response_lag_index[7]_i_1_n_0 ;
  wire [9:0]response_tap_index;
  wire \result_count_reg[0] ;
  wire [7:0]\result_lag_reg[7]_0 ;
  wire [47:0]\result_q16_reg[47]_0 ;
  wire result_valid_i_1_n_0;
  wire result_valid_i_2_n_0;
  wire result_valid_i_3_n_0;
  wire rst_proc;
  wire [2:0]state;
  wire [9:0]template_mem_reg_0;
  wire [15:0]template_rd_data;
  wire template_rsp_valid;
  wire [3:2]NLW_accumulator_next1_carry_CO_UNCONNECTED;
  wire [3:0]NLW_accumulator_next1_carry_O_UNCONNECTED;
  wire [3:1]NLW_accumulator_next1_carry_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_accumulator_next1_carry_i_1_O_UNCONNECTED;
  wire [3:2]\NLW_accumulator_next1_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_accumulator_next1_inferred__0/i__carry_O_UNCONNECTED ;
  wire [15:0]NLW_difference_mem_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_difference_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:1]NLW_difference_mem_reg_DOPBDOP_UNCONNECTED;
  wire [3:1]NLW_difference_mem_reg_i_2_CO_UNCONNECTED;
  wire [3:2]NLW_difference_mem_reg_i_2_O_UNCONNECTED;
  wire [3:3]\NLW_overflow_count_reg[31]_i_3_CO_UNCONNECTED ;
  wire NLW_product_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_product_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_product_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_product_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_product_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_product_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_product_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_product_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_product_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:33]NLW_product_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_product_reg_reg_PCOUT_UNCONNECTED;
  wire [15:0]NLW_template_mem_reg_DOADO_UNCONNECTED;
  wire [1:0]NLW_template_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_template_mem_reg_DOPBDOP_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000000002FFFFFF)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(\FSM_sequential_state[2]_i_2 ),
        .I1(\FSM_sequential_state[2]_i_2_0 ),
        .I2(\FSM_sequential_state[2]_i_2_1 ),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\FSM_sequential_state[2]_i_9_n_0 ),
        .O(\FSM_sequential_state_reg[1] ));
  LUT6 #(
    .INIT(64'h8BAA8BBB8BBB8BBB)) 
    \FSM_sequential_state[2]_i_9 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(corr_done),
        .I3(state[0]),
        .I4(acq_done_proc_pulse),
        .I5(\result_count_reg[0] ),
        .O(\FSM_sequential_state[2]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[0]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry_n_7),
        .O(accumulator_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[10]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__1_n_5),
        .O(accumulator_next[10]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[11]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__1_n_4),
        .O(accumulator_next[11]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[12]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__2_n_7),
        .O(accumulator_next[12]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[13]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__2_n_6),
        .O(accumulator_next[13]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[14]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__2_n_5),
        .O(accumulator_next[14]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[15]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__2_n_4),
        .O(accumulator_next[15]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[16]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__3_n_7),
        .O(accumulator_next[16]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[17]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__3_n_6),
        .O(accumulator_next[17]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[18]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__3_n_5),
        .O(accumulator_next[18]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[19]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__3_n_4),
        .O(accumulator_next[19]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[1]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry_n_6),
        .O(accumulator_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[20]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__4_n_7),
        .O(accumulator_next[20]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[21]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__4_n_6),
        .O(accumulator_next[21]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[22]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__4_n_5),
        .O(accumulator_next[22]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[23]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__4_n_4),
        .O(accumulator_next[23]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[24]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__5_n_7),
        .O(accumulator_next[24]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[25]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__5_n_6),
        .O(accumulator_next[25]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[26]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__5_n_5),
        .O(accumulator_next[26]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[27]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__5_n_4),
        .O(accumulator_next[27]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[28]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__6_n_7),
        .O(accumulator_next[28]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[29]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__6_n_6),
        .O(accumulator_next[29]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[2]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry_n_5),
        .O(accumulator_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[30]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__6_n_5),
        .O(accumulator_next[30]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[31]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__6_n_4),
        .O(accumulator_next[31]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[32]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__7_n_7),
        .O(accumulator_next[32]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[33]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__7_n_6),
        .O(accumulator_next[33]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[34]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__7_n_5),
        .O(accumulator_next[34]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[35]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__7_n_4),
        .O(accumulator_next[35]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[36]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__8_n_7),
        .O(accumulator_next[36]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[37]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__8_n_6),
        .O(accumulator_next[37]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[38]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__8_n_5),
        .O(accumulator_next[38]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[39]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__8_n_4),
        .O(accumulator_next[39]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[3]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry_n_4),
        .O(accumulator_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[40]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__9_n_7),
        .O(accumulator_next[40]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[41]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__9_n_6),
        .O(accumulator_next[41]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[42]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__9_n_5),
        .O(accumulator_next[42]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[43]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__9_n_4),
        .O(accumulator_next[43]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[44]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__10_n_7),
        .O(accumulator_next[44]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[45]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__10_n_6),
        .O(accumulator_next[45]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[46]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__10_n_5),
        .O(accumulator_next[46]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0004)) 
    \accumulator[47]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(busy_reg_n_0),
        .I4(rst_proc),
        .I5(result_valid_i_1_n_0),
        .O(\accumulator[47]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \accumulator[47]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product_valid_reg_n_0),
        .O(accumulator_0));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \accumulator[47]_i_3 
       (.I0(accumulator_next2_carry__10_n_4),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next1_carry_n_2),
        .O(accumulator_next[47]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[4]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__0_n_7),
        .O(accumulator_next[4]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[5]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__0_n_6),
        .O(accumulator_next[5]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[6]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__0_n_5),
        .O(accumulator_next[6]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[7]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__0_n_4),
        .O(accumulator_next[7]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[8]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__1_n_7),
        .O(accumulator_next[8]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \accumulator[9]_i_1 
       (.I0(accumulator_next1_carry_n_2),
        .I1(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .I2(accumulator_next2_carry__1_n_6),
        .O(accumulator_next[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 accumulator_next1_carry
       (.CI(1'b0),
        .CO({NLW_accumulator_next1_carry_CO_UNCONNECTED[3:2],accumulator_next1_carry_n_2,accumulator_next1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,accumulator_next2_carry__10_n_4}),
        .O(NLW_accumulator_next1_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,accumulator_next1_carry_i_1_n_3,accumulator_next1_carry_i_2_n_0}));
  CARRY4 accumulator_next1_carry_i_1
       (.CI(accumulator_next2_carry__10_n_0),
        .CO({NLW_accumulator_next1_carry_i_1_CO_UNCONNECTED[3:1],accumulator_next1_carry_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_accumulator_next1_carry_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h2)) 
    accumulator_next1_carry_i_2
       (.I0(accumulator_next2_carry__10_n_5),
        .I1(accumulator_next2_carry__10_n_4),
        .O(accumulator_next1_carry_i_2_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \accumulator_next1_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\NLW_accumulator_next1_inferred__0/i__carry_CO_UNCONNECTED [3:2],\accumulator_next1_inferred__0/i__carry_n_2 ,\accumulator_next1_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i__carry_i_1_n_0}),
        .O(\NLW_accumulator_next1_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry_i_2_n_0,i__carry_i_3_n_0}));
  CARRY4 accumulator_next2_carry
       (.CI(1'b0),
        .CO({accumulator_next2_carry_n_0,accumulator_next2_carry_n_1,accumulator_next2_carry_n_2,accumulator_next2_carry_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[3:0]),
        .O({accumulator_next2_carry_n_4,accumulator_next2_carry_n_5,accumulator_next2_carry_n_6,accumulator_next2_carry_n_7}),
        .S({accumulator_next2_carry_i_1_n_0,accumulator_next2_carry_i_2_n_0,accumulator_next2_carry_i_3_n_0,accumulator_next2_carry_i_4_n_0}));
  CARRY4 accumulator_next2_carry__0
       (.CI(accumulator_next2_carry_n_0),
        .CO({accumulator_next2_carry__0_n_0,accumulator_next2_carry__0_n_1,accumulator_next2_carry__0_n_2,accumulator_next2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[7:4]),
        .O({accumulator_next2_carry__0_n_4,accumulator_next2_carry__0_n_5,accumulator_next2_carry__0_n_6,accumulator_next2_carry__0_n_7}),
        .S({accumulator_next2_carry__0_i_1_n_0,accumulator_next2_carry__0_i_2_n_0,accumulator_next2_carry__0_i_3_n_0,accumulator_next2_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__0_i_1
       (.I0(accumulator[7]),
        .I1(product_reg_reg_n_98),
        .O(accumulator_next2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__0_i_2
       (.I0(accumulator[6]),
        .I1(product_reg_reg_n_99),
        .O(accumulator_next2_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__0_i_3
       (.I0(accumulator[5]),
        .I1(product_reg_reg_n_100),
        .O(accumulator_next2_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__0_i_4
       (.I0(accumulator[4]),
        .I1(product_reg_reg_n_101),
        .O(accumulator_next2_carry__0_i_4_n_0));
  CARRY4 accumulator_next2_carry__1
       (.CI(accumulator_next2_carry__0_n_0),
        .CO({accumulator_next2_carry__1_n_0,accumulator_next2_carry__1_n_1,accumulator_next2_carry__1_n_2,accumulator_next2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[11:8]),
        .O({accumulator_next2_carry__1_n_4,accumulator_next2_carry__1_n_5,accumulator_next2_carry__1_n_6,accumulator_next2_carry__1_n_7}),
        .S({accumulator_next2_carry__1_i_1_n_0,accumulator_next2_carry__1_i_2_n_0,accumulator_next2_carry__1_i_3_n_0,accumulator_next2_carry__1_i_4_n_0}));
  CARRY4 accumulator_next2_carry__10
       (.CI(accumulator_next2_carry__9_n_0),
        .CO({accumulator_next2_carry__10_n_0,accumulator_next2_carry__10_n_1,accumulator_next2_carry__10_n_2,accumulator_next2_carry__10_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[46:43]),
        .O({accumulator_next2_carry__10_n_4,accumulator_next2_carry__10_n_5,accumulator_next2_carry__10_n_6,accumulator_next2_carry__10_n_7}),
        .S({accumulator_next2_carry__10_i_1_n_0,accumulator_next2_carry__10_i_2_n_0,accumulator_next2_carry__10_i_3_n_0,accumulator_next2_carry__10_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__10_i_1
       (.I0(accumulator[46]),
        .I1(accumulator[47]),
        .O(accumulator_next2_carry__10_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__10_i_2
       (.I0(accumulator[45]),
        .I1(accumulator[46]),
        .O(accumulator_next2_carry__10_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__10_i_3
       (.I0(accumulator[44]),
        .I1(accumulator[45]),
        .O(accumulator_next2_carry__10_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__10_i_4
       (.I0(accumulator[43]),
        .I1(accumulator[44]),
        .O(accumulator_next2_carry__10_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__1_i_1
       (.I0(accumulator[11]),
        .I1(product_reg_reg_n_94),
        .O(accumulator_next2_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__1_i_2
       (.I0(accumulator[10]),
        .I1(product_reg_reg_n_95),
        .O(accumulator_next2_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__1_i_3
       (.I0(accumulator[9]),
        .I1(product_reg_reg_n_96),
        .O(accumulator_next2_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__1_i_4
       (.I0(accumulator[8]),
        .I1(product_reg_reg_n_97),
        .O(accumulator_next2_carry__1_i_4_n_0));
  CARRY4 accumulator_next2_carry__2
       (.CI(accumulator_next2_carry__1_n_0),
        .CO({accumulator_next2_carry__2_n_0,accumulator_next2_carry__2_n_1,accumulator_next2_carry__2_n_2,accumulator_next2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[15:12]),
        .O({accumulator_next2_carry__2_n_4,accumulator_next2_carry__2_n_5,accumulator_next2_carry__2_n_6,accumulator_next2_carry__2_n_7}),
        .S({accumulator_next2_carry__2_i_1_n_0,accumulator_next2_carry__2_i_2_n_0,accumulator_next2_carry__2_i_3_n_0,accumulator_next2_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__2_i_1
       (.I0(accumulator[15]),
        .I1(product_reg_reg_n_90),
        .O(accumulator_next2_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__2_i_2
       (.I0(accumulator[14]),
        .I1(product_reg_reg_n_91),
        .O(accumulator_next2_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__2_i_3
       (.I0(accumulator[13]),
        .I1(product_reg_reg_n_92),
        .O(accumulator_next2_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__2_i_4
       (.I0(accumulator[12]),
        .I1(product_reg_reg_n_93),
        .O(accumulator_next2_carry__2_i_4_n_0));
  CARRY4 accumulator_next2_carry__3
       (.CI(accumulator_next2_carry__2_n_0),
        .CO({accumulator_next2_carry__3_n_0,accumulator_next2_carry__3_n_1,accumulator_next2_carry__3_n_2,accumulator_next2_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[19:16]),
        .O({accumulator_next2_carry__3_n_4,accumulator_next2_carry__3_n_5,accumulator_next2_carry__3_n_6,accumulator_next2_carry__3_n_7}),
        .S({accumulator_next2_carry__3_i_1_n_0,accumulator_next2_carry__3_i_2_n_0,accumulator_next2_carry__3_i_3_n_0,accumulator_next2_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__3_i_1
       (.I0(accumulator[19]),
        .I1(product_reg_reg_n_86),
        .O(accumulator_next2_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__3_i_2
       (.I0(accumulator[18]),
        .I1(product_reg_reg_n_87),
        .O(accumulator_next2_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__3_i_3
       (.I0(accumulator[17]),
        .I1(product_reg_reg_n_88),
        .O(accumulator_next2_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__3_i_4
       (.I0(accumulator[16]),
        .I1(product_reg_reg_n_89),
        .O(accumulator_next2_carry__3_i_4_n_0));
  CARRY4 accumulator_next2_carry__4
       (.CI(accumulator_next2_carry__3_n_0),
        .CO({accumulator_next2_carry__4_n_0,accumulator_next2_carry__4_n_1,accumulator_next2_carry__4_n_2,accumulator_next2_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[23:20]),
        .O({accumulator_next2_carry__4_n_4,accumulator_next2_carry__4_n_5,accumulator_next2_carry__4_n_6,accumulator_next2_carry__4_n_7}),
        .S({accumulator_next2_carry__4_i_1_n_0,accumulator_next2_carry__4_i_2_n_0,accumulator_next2_carry__4_i_3_n_0,accumulator_next2_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__4_i_1
       (.I0(accumulator[23]),
        .I1(product_reg_reg_n_82),
        .O(accumulator_next2_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__4_i_2
       (.I0(accumulator[22]),
        .I1(product_reg_reg_n_83),
        .O(accumulator_next2_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__4_i_3
       (.I0(accumulator[21]),
        .I1(product_reg_reg_n_84),
        .O(accumulator_next2_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__4_i_4
       (.I0(accumulator[20]),
        .I1(product_reg_reg_n_85),
        .O(accumulator_next2_carry__4_i_4_n_0));
  CARRY4 accumulator_next2_carry__5
       (.CI(accumulator_next2_carry__4_n_0),
        .CO({accumulator_next2_carry__5_n_0,accumulator_next2_carry__5_n_1,accumulator_next2_carry__5_n_2,accumulator_next2_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[27:24]),
        .O({accumulator_next2_carry__5_n_4,accumulator_next2_carry__5_n_5,accumulator_next2_carry__5_n_6,accumulator_next2_carry__5_n_7}),
        .S({accumulator_next2_carry__5_i_1_n_0,accumulator_next2_carry__5_i_2_n_0,accumulator_next2_carry__5_i_3_n_0,accumulator_next2_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__5_i_1
       (.I0(accumulator[27]),
        .I1(product_reg_reg_n_78),
        .O(accumulator_next2_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__5_i_2
       (.I0(accumulator[26]),
        .I1(product_reg_reg_n_79),
        .O(accumulator_next2_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__5_i_3
       (.I0(accumulator[25]),
        .I1(product_reg_reg_n_80),
        .O(accumulator_next2_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__5_i_4
       (.I0(accumulator[24]),
        .I1(product_reg_reg_n_81),
        .O(accumulator_next2_carry__5_i_4_n_0));
  CARRY4 accumulator_next2_carry__6
       (.CI(accumulator_next2_carry__5_n_0),
        .CO({accumulator_next2_carry__6_n_0,accumulator_next2_carry__6_n_1,accumulator_next2_carry__6_n_2,accumulator_next2_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[31:28]),
        .O({accumulator_next2_carry__6_n_4,accumulator_next2_carry__6_n_5,accumulator_next2_carry__6_n_6,accumulator_next2_carry__6_n_7}),
        .S({accumulator_next2_carry__6_i_1_n_0,accumulator_next2_carry__6_i_2_n_0,accumulator_next2_carry__6_i_3_n_0,accumulator_next2_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__6_i_1
       (.I0(accumulator[31]),
        .I1(product_reg_reg_n_74),
        .O(accumulator_next2_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__6_i_2
       (.I0(accumulator[30]),
        .I1(product_reg_reg_n_75),
        .O(accumulator_next2_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__6_i_3
       (.I0(accumulator[29]),
        .I1(product_reg_reg_n_76),
        .O(accumulator_next2_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__6_i_4
       (.I0(accumulator[28]),
        .I1(product_reg_reg_n_77),
        .O(accumulator_next2_carry__6_i_4_n_0));
  CARRY4 accumulator_next2_carry__7
       (.CI(accumulator_next2_carry__6_n_0),
        .CO({accumulator_next2_carry__7_n_0,accumulator_next2_carry__7_n_1,accumulator_next2_carry__7_n_2,accumulator_next2_carry__7_n_3}),
        .CYINIT(1'b0),
        .DI({accumulator[34:33],accumulator_next2_carry__7_i_1_n_0,product_reg_reg_n_73}),
        .O({accumulator_next2_carry__7_n_4,accumulator_next2_carry__7_n_5,accumulator_next2_carry__7_n_6,accumulator_next2_carry__7_n_7}),
        .S({accumulator_next2_carry__7_i_2_n_0,accumulator_next2_carry__7_i_3_n_0,accumulator_next2_carry__7_i_4_n_0,accumulator_next2_carry__7_i_5_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    accumulator_next2_carry__7_i_1
       (.I0(product_reg_reg_n_73),
        .O(accumulator_next2_carry__7_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__7_i_2
       (.I0(accumulator[34]),
        .I1(accumulator[35]),
        .O(accumulator_next2_carry__7_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__7_i_3
       (.I0(accumulator[33]),
        .I1(accumulator[34]),
        .O(accumulator_next2_carry__7_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__7_i_4
       (.I0(product_reg_reg_n_73),
        .I1(accumulator[33]),
        .O(accumulator_next2_carry__7_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry__7_i_5
       (.I0(product_reg_reg_n_73),
        .I1(accumulator[32]),
        .O(accumulator_next2_carry__7_i_5_n_0));
  CARRY4 accumulator_next2_carry__8
       (.CI(accumulator_next2_carry__7_n_0),
        .CO({accumulator_next2_carry__8_n_0,accumulator_next2_carry__8_n_1,accumulator_next2_carry__8_n_2,accumulator_next2_carry__8_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[38:35]),
        .O({accumulator_next2_carry__8_n_4,accumulator_next2_carry__8_n_5,accumulator_next2_carry__8_n_6,accumulator_next2_carry__8_n_7}),
        .S({accumulator_next2_carry__8_i_1_n_0,accumulator_next2_carry__8_i_2_n_0,accumulator_next2_carry__8_i_3_n_0,accumulator_next2_carry__8_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__8_i_1
       (.I0(accumulator[38]),
        .I1(accumulator[39]),
        .O(accumulator_next2_carry__8_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__8_i_2
       (.I0(accumulator[37]),
        .I1(accumulator[38]),
        .O(accumulator_next2_carry__8_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__8_i_3
       (.I0(accumulator[36]),
        .I1(accumulator[37]),
        .O(accumulator_next2_carry__8_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__8_i_4
       (.I0(accumulator[35]),
        .I1(accumulator[36]),
        .O(accumulator_next2_carry__8_i_4_n_0));
  CARRY4 accumulator_next2_carry__9
       (.CI(accumulator_next2_carry__8_n_0),
        .CO({accumulator_next2_carry__9_n_0,accumulator_next2_carry__9_n_1,accumulator_next2_carry__9_n_2,accumulator_next2_carry__9_n_3}),
        .CYINIT(1'b0),
        .DI(accumulator[42:39]),
        .O({accumulator_next2_carry__9_n_4,accumulator_next2_carry__9_n_5,accumulator_next2_carry__9_n_6,accumulator_next2_carry__9_n_7}),
        .S({accumulator_next2_carry__9_i_1_n_0,accumulator_next2_carry__9_i_2_n_0,accumulator_next2_carry__9_i_3_n_0,accumulator_next2_carry__9_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__9_i_1
       (.I0(accumulator[42]),
        .I1(accumulator[43]),
        .O(accumulator_next2_carry__9_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__9_i_2
       (.I0(accumulator[41]),
        .I1(accumulator[42]),
        .O(accumulator_next2_carry__9_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__9_i_3
       (.I0(accumulator[40]),
        .I1(accumulator[41]),
        .O(accumulator_next2_carry__9_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    accumulator_next2_carry__9_i_4
       (.I0(accumulator[39]),
        .I1(accumulator[40]),
        .O(accumulator_next2_carry__9_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry_i_1
       (.I0(accumulator[3]),
        .I1(product_reg_reg_n_102),
        .O(accumulator_next2_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry_i_2
       (.I0(accumulator[2]),
        .I1(product_reg_reg_n_103),
        .O(accumulator_next2_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry_i_3
       (.I0(accumulator[1]),
        .I1(product_reg_reg_n_104),
        .O(accumulator_next2_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    accumulator_next2_carry_i_4
       (.I0(accumulator[0]),
        .I1(product_reg_reg_n_105),
        .O(accumulator_next2_carry_i_4_n_0));
  FDRE \accumulator_reg[0] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[0]),
        .Q(accumulator[0]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[10] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[10]),
        .Q(accumulator[10]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[11] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[11]),
        .Q(accumulator[11]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[12] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[12]),
        .Q(accumulator[12]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[13] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[13]),
        .Q(accumulator[13]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[14] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[14]),
        .Q(accumulator[14]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[15] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[15]),
        .Q(accumulator[15]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[16] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[16]),
        .Q(accumulator[16]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[17] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[17]),
        .Q(accumulator[17]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[18] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[18]),
        .Q(accumulator[18]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[19] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[19]),
        .Q(accumulator[19]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[1] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[1]),
        .Q(accumulator[1]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[20] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[20]),
        .Q(accumulator[20]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[21] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[21]),
        .Q(accumulator[21]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[22] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[22]),
        .Q(accumulator[22]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[23] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[23]),
        .Q(accumulator[23]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[24] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[24]),
        .Q(accumulator[24]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[25] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[25]),
        .Q(accumulator[25]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[26] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[26]),
        .Q(accumulator[26]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[27] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[27]),
        .Q(accumulator[27]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[28] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[28]),
        .Q(accumulator[28]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[29] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[29]),
        .Q(accumulator[29]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[2] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[2]),
        .Q(accumulator[2]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[30] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[30]),
        .Q(accumulator[30]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[31] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[31]),
        .Q(accumulator[31]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[32] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[32]),
        .Q(accumulator[32]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[33] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[33]),
        .Q(accumulator[33]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[34] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[34]),
        .Q(accumulator[34]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[35] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[35]),
        .Q(accumulator[35]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[36] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[36]),
        .Q(accumulator[36]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[37] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[37]),
        .Q(accumulator[37]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[38] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[38]),
        .Q(accumulator[38]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[39] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[39]),
        .Q(accumulator[39]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[3] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[3]),
        .Q(accumulator[3]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[40] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[40]),
        .Q(accumulator[40]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[41] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[41]),
        .Q(accumulator[41]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[42] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[42]),
        .Q(accumulator[42]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[43] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[43]),
        .Q(accumulator[43]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[44] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[44]),
        .Q(accumulator[44]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[45] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[45]),
        .Q(accumulator[45]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[46] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[46]),
        .Q(accumulator[46]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[47] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[47]),
        .Q(accumulator[47]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[4] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[4]),
        .Q(accumulator[4]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[5] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[5]),
        .Q(accumulator[5]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[6] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[6]),
        .Q(accumulator[6]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[7] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[7]),
        .Q(accumulator[7]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[8] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[8]),
        .Q(accumulator[8]),
        .R(\accumulator[47]_i_1_n_0 ));
  FDRE \accumulator_reg[9] 
       (.C(clk_proc),
        .CE(accumulator_0),
        .D(accumulator_next[9]),
        .Q(accumulator[9]),
        .R(\accumulator[47]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44444744)) 
    busy_i_1
       (.I0(busy0_out),
        .I1(busy_reg_n_0),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(rst_proc));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "17408" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/corr_mac_i/difference_mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "16" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    difference_mem_reg
       (.ADDRARDADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({read_index,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(difference_mem_reg_0[15:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,difference_mem_reg_0[16]}),
        .DIPBDIP({1'b0,1'b1}),
        .DOADO(NLW_difference_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(difference_rd_data[15:0]),
        .DOPADOP(NLW_difference_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP({NLW_difference_mem_reg_DOPBDOP_UNCONNECTED[1],difference_rd_data[16]}),
        .ENARDEN(diff_valid),
        .ENBWREN(difference_mem_reg_i_1_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(rst_proc),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'hBA)) 
    difference_mem_reg_i_1
       (.I0(rst_proc),
        .I1(requests_done),
        .I2(busy_reg_n_0),
        .O(difference_mem_reg_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_10
       (.I0(request_lag_index_reg[2]),
        .I1(request_tap_index[2]),
        .O(difference_mem_reg_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_11
       (.I0(request_lag_index_reg[1]),
        .I1(request_tap_index[1]),
        .O(difference_mem_reg_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_12
       (.I0(request_lag_index_reg[0]),
        .I1(request_tap_index[0]),
        .O(difference_mem_reg_i_12_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 difference_mem_reg_i_2
       (.CI(difference_mem_reg_i_3_n_0),
        .CO({NLW_difference_mem_reg_i_2_CO_UNCONNECTED[3:1],difference_mem_reg_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_difference_mem_reg_i_2_O_UNCONNECTED[3:2],read_index[9:8]}),
        .S({1'b0,1'b0,request_tap_index[9:8]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 difference_mem_reg_i_3
       (.CI(difference_mem_reg_i_4_n_0),
        .CO({difference_mem_reg_i_3_n_0,difference_mem_reg_i_3_n_1,difference_mem_reg_i_3_n_2,difference_mem_reg_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(request_lag_index_reg[7:4]),
        .O(read_index[7:4]),
        .S({difference_mem_reg_i_5_n_0,difference_mem_reg_i_6_n_0,difference_mem_reg_i_7_n_0,difference_mem_reg_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 difference_mem_reg_i_4
       (.CI(1'b0),
        .CO({difference_mem_reg_i_4_n_0,difference_mem_reg_i_4_n_1,difference_mem_reg_i_4_n_2,difference_mem_reg_i_4_n_3}),
        .CYINIT(1'b0),
        .DI(request_lag_index_reg[3:0]),
        .O(read_index[3:0]),
        .S({difference_mem_reg_i_9_n_0,difference_mem_reg_i_10_n_0,difference_mem_reg_i_11_n_0,difference_mem_reg_i_12_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_5
       (.I0(request_lag_index_reg[7]),
        .I1(request_tap_index[7]),
        .O(difference_mem_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_6
       (.I0(request_lag_index_reg[6]),
        .I1(request_tap_index[6]),
        .O(difference_mem_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_7
       (.I0(request_lag_index_reg[5]),
        .I1(request_tap_index[5]),
        .O(difference_mem_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_8
       (.I0(request_lag_index_reg[4]),
        .I1(request_tap_index[4]),
        .O(difference_mem_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    difference_mem_reg_i_9
       (.I0(request_lag_index_reg[3]),
        .I1(request_tap_index[3]),
        .O(difference_mem_reg_i_9_n_0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    done_i_1
       (.I0(result_valid_i_1_n_0),
        .I1(done_i_2_n_0),
        .I2(product_lag_index[4]),
        .I3(product_lag_index[2]),
        .I4(product_lag_index[7]),
        .I5(product_lag_index[0]),
        .O(busy0_out));
  LUT4 #(
    .INIT(16'h7FFF)) 
    done_i_2
       (.I0(product_lag_index[6]),
        .I1(product_lag_index[3]),
        .I2(product_lag_index[5]),
        .I3(product_lag_index[1]),
        .O(done_i_2_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    done_pulse_i_1__0
       (.I0(state[1]),
        .I1(state[2]),
        .I2(corr_done),
        .I3(state[0]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  FDRE done_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(busy0_out),
        .Q(corr_done),
        .R(product_valid));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1
       (.I0(accumulator_next2_carry__10_n_4),
        .O(i__carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2
       (.I0(accumulator_next1_carry_i_1_n_3),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_3
       (.I0(accumulator_next2_carry__10_n_4),
        .I1(accumulator_next2_carry__10_n_5),
        .O(i__carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \overflow_count[31]_i_1 
       (.I0(rst_proc),
        .I1(busy_reg_n_0),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .O(product_valid));
  LUT4 #(
    .INIT(16'h8880)) 
    \overflow_count[31]_i_2 
       (.I0(product_valid_reg_n_0),
        .I1(busy_reg_n_0),
        .I2(accumulator_next1_carry_n_2),
        .I3(\accumulator_next1_inferred__0/i__carry_n_2 ),
        .O(\overflow_count[31]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \overflow_count[3]_i_2 
       (.I0(correlation_overflow_count[0]),
        .O(\overflow_count[3]_i_2_n_0 ));
  FDRE \overflow_count_reg[0] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[3]_i_1_n_7 ),
        .Q(correlation_overflow_count[0]),
        .R(product_valid));
  FDRE \overflow_count_reg[10] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[11]_i_1_n_5 ),
        .Q(correlation_overflow_count[10]),
        .R(product_valid));
  FDRE \overflow_count_reg[11] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[11]_i_1_n_4 ),
        .Q(correlation_overflow_count[11]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[11]_i_1 
       (.CI(\overflow_count_reg[7]_i_1_n_0 ),
        .CO({\overflow_count_reg[11]_i_1_n_0 ,\overflow_count_reg[11]_i_1_n_1 ,\overflow_count_reg[11]_i_1_n_2 ,\overflow_count_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[11]_i_1_n_4 ,\overflow_count_reg[11]_i_1_n_5 ,\overflow_count_reg[11]_i_1_n_6 ,\overflow_count_reg[11]_i_1_n_7 }),
        .S(correlation_overflow_count[11:8]));
  FDRE \overflow_count_reg[12] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[15]_i_1_n_7 ),
        .Q(correlation_overflow_count[12]),
        .R(product_valid));
  FDRE \overflow_count_reg[13] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[15]_i_1_n_6 ),
        .Q(correlation_overflow_count[13]),
        .R(product_valid));
  FDRE \overflow_count_reg[14] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[15]_i_1_n_5 ),
        .Q(correlation_overflow_count[14]),
        .R(product_valid));
  FDRE \overflow_count_reg[15] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[15]_i_1_n_4 ),
        .Q(correlation_overflow_count[15]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[15]_i_1 
       (.CI(\overflow_count_reg[11]_i_1_n_0 ),
        .CO({\overflow_count_reg[15]_i_1_n_0 ,\overflow_count_reg[15]_i_1_n_1 ,\overflow_count_reg[15]_i_1_n_2 ,\overflow_count_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[15]_i_1_n_4 ,\overflow_count_reg[15]_i_1_n_5 ,\overflow_count_reg[15]_i_1_n_6 ,\overflow_count_reg[15]_i_1_n_7 }),
        .S(correlation_overflow_count[15:12]));
  FDRE \overflow_count_reg[16] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[19]_i_1_n_7 ),
        .Q(correlation_overflow_count[16]),
        .R(product_valid));
  FDRE \overflow_count_reg[17] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[19]_i_1_n_6 ),
        .Q(correlation_overflow_count[17]),
        .R(product_valid));
  FDRE \overflow_count_reg[18] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[19]_i_1_n_5 ),
        .Q(correlation_overflow_count[18]),
        .R(product_valid));
  FDRE \overflow_count_reg[19] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[19]_i_1_n_4 ),
        .Q(correlation_overflow_count[19]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[19]_i_1 
       (.CI(\overflow_count_reg[15]_i_1_n_0 ),
        .CO({\overflow_count_reg[19]_i_1_n_0 ,\overflow_count_reg[19]_i_1_n_1 ,\overflow_count_reg[19]_i_1_n_2 ,\overflow_count_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[19]_i_1_n_4 ,\overflow_count_reg[19]_i_1_n_5 ,\overflow_count_reg[19]_i_1_n_6 ,\overflow_count_reg[19]_i_1_n_7 }),
        .S(correlation_overflow_count[19:16]));
  FDRE \overflow_count_reg[1] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[3]_i_1_n_6 ),
        .Q(correlation_overflow_count[1]),
        .R(product_valid));
  FDRE \overflow_count_reg[20] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[23]_i_1_n_7 ),
        .Q(correlation_overflow_count[20]),
        .R(product_valid));
  FDRE \overflow_count_reg[21] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[23]_i_1_n_6 ),
        .Q(correlation_overflow_count[21]),
        .R(product_valid));
  FDRE \overflow_count_reg[22] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[23]_i_1_n_5 ),
        .Q(correlation_overflow_count[22]),
        .R(product_valid));
  FDRE \overflow_count_reg[23] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[23]_i_1_n_4 ),
        .Q(correlation_overflow_count[23]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[23]_i_1 
       (.CI(\overflow_count_reg[19]_i_1_n_0 ),
        .CO({\overflow_count_reg[23]_i_1_n_0 ,\overflow_count_reg[23]_i_1_n_1 ,\overflow_count_reg[23]_i_1_n_2 ,\overflow_count_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[23]_i_1_n_4 ,\overflow_count_reg[23]_i_1_n_5 ,\overflow_count_reg[23]_i_1_n_6 ,\overflow_count_reg[23]_i_1_n_7 }),
        .S(correlation_overflow_count[23:20]));
  FDRE \overflow_count_reg[24] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[27]_i_1_n_7 ),
        .Q(correlation_overflow_count[24]),
        .R(product_valid));
  FDRE \overflow_count_reg[25] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[27]_i_1_n_6 ),
        .Q(correlation_overflow_count[25]),
        .R(product_valid));
  FDRE \overflow_count_reg[26] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[27]_i_1_n_5 ),
        .Q(correlation_overflow_count[26]),
        .R(product_valid));
  FDRE \overflow_count_reg[27] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[27]_i_1_n_4 ),
        .Q(correlation_overflow_count[27]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[27]_i_1 
       (.CI(\overflow_count_reg[23]_i_1_n_0 ),
        .CO({\overflow_count_reg[27]_i_1_n_0 ,\overflow_count_reg[27]_i_1_n_1 ,\overflow_count_reg[27]_i_1_n_2 ,\overflow_count_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[27]_i_1_n_4 ,\overflow_count_reg[27]_i_1_n_5 ,\overflow_count_reg[27]_i_1_n_6 ,\overflow_count_reg[27]_i_1_n_7 }),
        .S(correlation_overflow_count[27:24]));
  FDRE \overflow_count_reg[28] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[31]_i_3_n_7 ),
        .Q(correlation_overflow_count[28]),
        .R(product_valid));
  FDRE \overflow_count_reg[29] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[31]_i_3_n_6 ),
        .Q(correlation_overflow_count[29]),
        .R(product_valid));
  FDRE \overflow_count_reg[2] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[3]_i_1_n_5 ),
        .Q(correlation_overflow_count[2]),
        .R(product_valid));
  FDRE \overflow_count_reg[30] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[31]_i_3_n_5 ),
        .Q(correlation_overflow_count[30]),
        .R(product_valid));
  FDRE \overflow_count_reg[31] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[31]_i_3_n_4 ),
        .Q(correlation_overflow_count[31]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[31]_i_3 
       (.CI(\overflow_count_reg[27]_i_1_n_0 ),
        .CO({\NLW_overflow_count_reg[31]_i_3_CO_UNCONNECTED [3],\overflow_count_reg[31]_i_3_n_1 ,\overflow_count_reg[31]_i_3_n_2 ,\overflow_count_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[31]_i_3_n_4 ,\overflow_count_reg[31]_i_3_n_5 ,\overflow_count_reg[31]_i_3_n_6 ,\overflow_count_reg[31]_i_3_n_7 }),
        .S(correlation_overflow_count[31:28]));
  FDRE \overflow_count_reg[3] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[3]_i_1_n_4 ),
        .Q(correlation_overflow_count[3]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\overflow_count_reg[3]_i_1_n_0 ,\overflow_count_reg[3]_i_1_n_1 ,\overflow_count_reg[3]_i_1_n_2 ,\overflow_count_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\overflow_count_reg[3]_i_1_n_4 ,\overflow_count_reg[3]_i_1_n_5 ,\overflow_count_reg[3]_i_1_n_6 ,\overflow_count_reg[3]_i_1_n_7 }),
        .S({correlation_overflow_count[3:1],\overflow_count[3]_i_2_n_0 }));
  FDRE \overflow_count_reg[4] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[7]_i_1_n_7 ),
        .Q(correlation_overflow_count[4]),
        .R(product_valid));
  FDRE \overflow_count_reg[5] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[7]_i_1_n_6 ),
        .Q(correlation_overflow_count[5]),
        .R(product_valid));
  FDRE \overflow_count_reg[6] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[7]_i_1_n_5 ),
        .Q(correlation_overflow_count[6]),
        .R(product_valid));
  FDRE \overflow_count_reg[7] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[7]_i_1_n_4 ),
        .Q(correlation_overflow_count[7]),
        .R(product_valid));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count_reg[7]_i_1 
       (.CI(\overflow_count_reg[3]_i_1_n_0 ),
        .CO({\overflow_count_reg[7]_i_1_n_0 ,\overflow_count_reg[7]_i_1_n_1 ,\overflow_count_reg[7]_i_1_n_2 ,\overflow_count_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\overflow_count_reg[7]_i_1_n_4 ,\overflow_count_reg[7]_i_1_n_5 ,\overflow_count_reg[7]_i_1_n_6 ,\overflow_count_reg[7]_i_1_n_7 }),
        .S(correlation_overflow_count[7:4]));
  FDRE \overflow_count_reg[8] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[11]_i_1_n_7 ),
        .Q(correlation_overflow_count[8]),
        .R(product_valid));
  FDRE \overflow_count_reg[9] 
       (.C(clk_proc),
        .CE(\overflow_count[31]_i_2_n_0 ),
        .D(\overflow_count_reg[11]_i_1_n_6 ),
        .Q(correlation_overflow_count[9]),
        .R(product_valid));
  LUT2 #(
    .INIT(4'h8)) 
    \product_lag_index[7]_i_1 
       (.I0(busy_reg_n_0),
        .I1(read_valid),
        .O(product_reg));
  FDRE \product_lag_index_reg[0] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[0]),
        .Q(product_lag_index[0]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[1] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[1]),
        .Q(product_lag_index[1]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[2] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[2]),
        .Q(product_lag_index[2]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[3] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[3]),
        .Q(product_lag_index[3]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[4] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[4]),
        .Q(product_lag_index[4]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[5] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[5]),
        .Q(product_lag_index[5]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[6] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[6]),
        .Q(product_lag_index[6]),
        .R(rst_proc));
  FDRE \product_lag_index_reg[7] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_lag_index[7]),
        .Q(product_lag_index[7]),
        .R(rst_proc));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    product_reg_reg
       (.A({difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data[16],difference_rd_data}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_product_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({template_rd_data[15],template_rd_data[15],template_rd_data}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_product_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_product_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_product_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(product_reg),
        .CLK(clk_proc),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_product_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_product_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_product_reg_reg_P_UNCONNECTED[47:33],product_reg_reg_n_73,product_reg_reg_n_74,product_reg_reg_n_75,product_reg_reg_n_76,product_reg_reg_n_77,product_reg_reg_n_78,product_reg_reg_n_79,product_reg_reg_n_80,product_reg_reg_n_81,product_reg_reg_n_82,product_reg_reg_n_83,product_reg_reg_n_84,product_reg_reg_n_85,product_reg_reg_n_86,product_reg_reg_n_87,product_reg_reg_n_88,product_reg_reg_n_89,product_reg_reg_n_90,product_reg_reg_n_91,product_reg_reg_n_92,product_reg_reg_n_93,product_reg_reg_n_94,product_reg_reg_n_95,product_reg_reg_n_96,product_reg_reg_n_97,product_reg_reg_n_98,product_reg_reg_n_99,product_reg_reg_n_100,product_reg_reg_n_101,product_reg_reg_n_102,product_reg_reg_n_103,product_reg_reg_n_104,product_reg_reg_n_105}),
        .PATTERNBDETECT(NLW_product_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_product_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_product_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(rst_proc),
        .UNDERFLOW(NLW_product_reg_reg_UNDERFLOW_UNCONNECTED));
  FDRE \product_tap_index_reg[0] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[0]),
        .Q(product_tap_index[0]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[1] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[1]),
        .Q(product_tap_index[1]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[2] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[2]),
        .Q(product_tap_index[2]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[3] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[3]),
        .Q(product_tap_index[3]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[4] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[4]),
        .Q(product_tap_index[4]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[5] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[5]),
        .Q(product_tap_index[5]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[6] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[6]),
        .Q(product_tap_index[6]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[7] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[7]),
        .Q(product_tap_index[7]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[8] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[8]),
        .Q(product_tap_index[8]),
        .R(rst_proc));
  FDRE \product_tap_index_reg[9] 
       (.C(clk_proc),
        .CE(product_reg),
        .D(response_tap_index[9]),
        .Q(product_tap_index[9]),
        .R(rst_proc));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    product_valid_i_1
       (.I0(read_valid),
        .I1(busy_reg_n_0),
        .I2(product_valid_reg_n_0),
        .O(product_valid_i_1_n_0));
  FDRE product_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(product_valid_i_1_n_0),
        .Q(product_valid_reg_n_0),
        .R(product_valid));
  LUT3 #(
    .INIT(8'h74)) 
    read_valid_i_1
       (.I0(requests_done),
        .I1(busy_reg_n_0),
        .I2(read_valid),
        .O(read_valid_i_1_n_0));
  FDRE read_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(read_valid_i_1_n_0),
        .Q(read_valid),
        .R(product_valid));
  LUT1 #(
    .INIT(2'h1)) 
    \request_lag_index[0]_i_1 
       (.I0(request_lag_index_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \request_lag_index[1]_i_1 
       (.I0(request_lag_index_reg[0]),
        .I1(request_lag_index_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \request_lag_index[2]_i_1 
       (.I0(request_lag_index_reg[2]),
        .I1(request_lag_index_reg[0]),
        .I2(request_lag_index_reg[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \request_lag_index[3]_i_1 
       (.I0(request_lag_index_reg[3]),
        .I1(request_lag_index_reg[1]),
        .I2(request_lag_index_reg[0]),
        .I3(request_lag_index_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \request_lag_index[4]_i_1 
       (.I0(request_lag_index_reg[4]),
        .I1(request_lag_index_reg[3]),
        .I2(request_lag_index_reg[1]),
        .I3(request_lag_index_reg[0]),
        .I4(request_lag_index_reg[2]),
        .O(\request_lag_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \request_lag_index[5]_i_1 
       (.I0(request_lag_index_reg[5]),
        .I1(request_lag_index_reg[3]),
        .I2(request_lag_index_reg[1]),
        .I3(request_lag_index_reg[0]),
        .I4(request_lag_index_reg[2]),
        .I5(request_lag_index_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \request_lag_index[6]_i_1 
       (.I0(\request_lag_index[7]_i_4_n_0 ),
        .I1(request_lag_index_reg[6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'h1010001010101010)) 
    \request_lag_index[7]_i_1 
       (.I0(\request_lag_index[7]_i_3_n_0 ),
        .I1(\request_tap_index[9]_i_2_n_0 ),
        .I2(request_tap_index[6]),
        .I3(request_lag_index_reg[6]),
        .I4(\request_lag_index[7]_i_4_n_0 ),
        .I5(request_lag_index_reg[7]),
        .O(\request_lag_index[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \request_lag_index[7]_i_2 
       (.I0(request_lag_index_reg[7]),
        .I1(\request_lag_index[7]_i_4_n_0 ),
        .I2(request_lag_index_reg[6]),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \request_lag_index[7]_i_3 
       (.I0(request_tap_index[9]),
        .I1(request_tap_index[7]),
        .I2(request_tap_index[8]),
        .I3(requests_done),
        .I4(busy_reg_n_0),
        .O(\request_lag_index[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \request_lag_index[7]_i_4 
       (.I0(request_lag_index_reg[4]),
        .I1(request_lag_index_reg[2]),
        .I2(request_lag_index_reg[0]),
        .I3(request_lag_index_reg[1]),
        .I4(request_lag_index_reg[3]),
        .I5(request_lag_index_reg[5]),
        .O(\request_lag_index[7]_i_4_n_0 ));
  FDRE \request_lag_index_reg[0] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(request_lag_index_reg[0]),
        .R(product_valid));
  FDRE \request_lag_index_reg[1] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(request_lag_index_reg[1]),
        .R(product_valid));
  FDRE \request_lag_index_reg[2] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(request_lag_index_reg[2]),
        .R(product_valid));
  FDRE \request_lag_index_reg[3] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(request_lag_index_reg[3]),
        .R(product_valid));
  FDRE \request_lag_index_reg[4] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(\request_lag_index[4]_i_1_n_0 ),
        .Q(request_lag_index_reg[4]),
        .R(product_valid));
  FDRE \request_lag_index_reg[5] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[5]),
        .Q(request_lag_index_reg[5]),
        .R(product_valid));
  FDRE \request_lag_index_reg[6] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[6]),
        .Q(request_lag_index_reg[6]),
        .R(product_valid));
  FDRE \request_lag_index_reg[7] 
       (.C(clk_proc),
        .CE(\request_lag_index[7]_i_1_n_0 ),
        .D(p_0_in[7]),
        .Q(request_lag_index_reg[7]),
        .R(product_valid));
  LUT1 #(
    .INIT(2'h1)) 
    \request_tap_index[0]_i_1 
       (.I0(request_tap_index[0]),
        .O(request_tap_index__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \request_tap_index[1]_i_1 
       (.I0(request_tap_index[1]),
        .I1(request_tap_index[0]),
        .O(request_tap_index__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \request_tap_index[2]_i_1 
       (.I0(request_tap_index[2]),
        .I1(request_tap_index[0]),
        .I2(request_tap_index[1]),
        .O(request_tap_index__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \request_tap_index[3]_i_1 
       (.I0(request_tap_index[3]),
        .I1(request_tap_index[2]),
        .I2(request_tap_index[0]),
        .I3(request_tap_index[1]),
        .O(request_tap_index__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \request_tap_index[4]_i_1 
       (.I0(request_tap_index[4]),
        .I1(request_tap_index[1]),
        .I2(request_tap_index[0]),
        .I3(request_tap_index[2]),
        .I4(request_tap_index[3]),
        .O(request_tap_index__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \request_tap_index[5]_i_1 
       (.I0(request_tap_index[5]),
        .I1(request_tap_index[4]),
        .I2(request_tap_index[1]),
        .I3(request_tap_index[0]),
        .I4(request_tap_index[2]),
        .I5(request_tap_index[3]),
        .O(\request_tap_index[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \request_tap_index[6]_i_1 
       (.I0(request_tap_index[6]),
        .I1(\request_tap_index[9]_i_2_n_0 ),
        .O(\request_tap_index[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'hD2D2D0D2)) 
    \request_tap_index[7]_i_1 
       (.I0(request_tap_index[6]),
        .I1(\request_tap_index[9]_i_2_n_0 ),
        .I2(request_tap_index[7]),
        .I3(request_tap_index[9]),
        .I4(request_tap_index[8]),
        .O(request_tap_index__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \request_tap_index[8]_i_1 
       (.I0(request_tap_index[8]),
        .I1(request_tap_index[6]),
        .I2(\request_tap_index[9]_i_2_n_0 ),
        .I3(request_tap_index[7]),
        .O(request_tap_index__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'hF6FF0800)) 
    \request_tap_index[9]_i_1 
       (.I0(request_tap_index[8]),
        .I1(request_tap_index[7]),
        .I2(\request_tap_index[9]_i_2_n_0 ),
        .I3(request_tap_index[6]),
        .I4(request_tap_index[9]),
        .O(request_tap_index__0[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \request_tap_index[9]_i_2 
       (.I0(request_tap_index[4]),
        .I1(request_tap_index[1]),
        .I2(request_tap_index[0]),
        .I3(request_tap_index[2]),
        .I4(request_tap_index[3]),
        .I5(request_tap_index[5]),
        .O(\request_tap_index[9]_i_2_n_0 ));
  FDRE \request_tap_index_reg[0] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[0]),
        .Q(request_tap_index[0]),
        .R(product_valid));
  FDRE \request_tap_index_reg[1] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[1]),
        .Q(request_tap_index[1]),
        .R(product_valid));
  FDRE \request_tap_index_reg[2] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[2]),
        .Q(request_tap_index[2]),
        .R(product_valid));
  FDRE \request_tap_index_reg[3] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[3]),
        .Q(request_tap_index[3]),
        .R(product_valid));
  FDRE \request_tap_index_reg[4] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[4]),
        .Q(request_tap_index[4]),
        .R(product_valid));
  FDRE \request_tap_index_reg[5] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(\request_tap_index[5]_i_1_n_0 ),
        .Q(request_tap_index[5]),
        .R(product_valid));
  FDRE \request_tap_index_reg[6] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(\request_tap_index[6]_i_1_n_0 ),
        .Q(request_tap_index[6]),
        .R(product_valid));
  FDRE \request_tap_index_reg[7] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[7]),
        .Q(request_tap_index[7]),
        .R(product_valid));
  FDRE \request_tap_index_reg[8] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[8]),
        .Q(request_tap_index[8]),
        .R(product_valid));
  FDRE \request_tap_index_reg[9] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index__0[9]),
        .Q(request_tap_index[9]),
        .R(product_valid));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    requests_done_i_1
       (.I0(busy_reg_n_0),
        .I1(request_lag_index_reg[6]),
        .I2(\request_lag_index[7]_i_4_n_0 ),
        .I3(request_lag_index_reg[7]),
        .I4(requests_done_i_2_n_0),
        .I5(requests_done),
        .O(requests_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
    requests_done_i_2
       (.I0(\response_lag_index[7]_i_1_n_0 ),
        .I1(request_tap_index[9]),
        .I2(request_tap_index[6]),
        .I3(request_tap_index[7]),
        .I4(request_tap_index[8]),
        .I5(\request_tap_index[9]_i_2_n_0 ),
        .O(requests_done_i_2_n_0));
  FDRE requests_done_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(requests_done_i_1_n_0),
        .Q(requests_done),
        .R(product_valid));
  LUT2 #(
    .INIT(4'h2)) 
    \response_lag_index[7]_i_1 
       (.I0(busy_reg_n_0),
        .I1(requests_done),
        .O(\response_lag_index[7]_i_1_n_0 ));
  FDRE \response_lag_index_reg[0] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[0]),
        .Q(response_lag_index[0]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[1] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[1]),
        .Q(response_lag_index[1]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[2] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[2]),
        .Q(response_lag_index[2]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[3] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[3]),
        .Q(response_lag_index[3]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[4] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[4]),
        .Q(response_lag_index[4]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[5] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[5]),
        .Q(response_lag_index[5]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[6] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[6]),
        .Q(response_lag_index[6]),
        .R(rst_proc));
  FDRE \response_lag_index_reg[7] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_lag_index_reg[7]),
        .Q(response_lag_index[7]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[0] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[0]),
        .Q(response_tap_index[0]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[1] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[1]),
        .Q(response_tap_index[1]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[2] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[2]),
        .Q(response_tap_index[2]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[3] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[3]),
        .Q(response_tap_index[3]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[4] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[4]),
        .Q(response_tap_index[4]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[5] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[5]),
        .Q(response_tap_index[5]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[6] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[6]),
        .Q(response_tap_index[6]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[7] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[7]),
        .Q(response_tap_index[7]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[8] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[8]),
        .Q(response_tap_index[8]),
        .R(rst_proc));
  FDRE \response_tap_index_reg[9] 
       (.C(clk_proc),
        .CE(\response_lag_index[7]_i_1_n_0 ),
        .D(request_tap_index[9]),
        .Q(response_tap_index[9]),
        .R(rst_proc));
  LUT6 #(
    .INIT(64'h00F0F0F0F0F0F0F8)) 
    \result_count[8]_i_1 
       (.I0(acq_done_proc_pulse),
        .I1(\result_count_reg[0] ),
        .I2(WEBWE),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(E));
  FDRE \result_lag_reg[0] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[0]),
        .Q(\result_lag_reg[7]_0 [0]),
        .R(rst_proc));
  FDRE \result_lag_reg[1] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[1]),
        .Q(\result_lag_reg[7]_0 [1]),
        .R(rst_proc));
  FDRE \result_lag_reg[2] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[2]),
        .Q(\result_lag_reg[7]_0 [2]),
        .R(rst_proc));
  FDRE \result_lag_reg[3] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[3]),
        .Q(\result_lag_reg[7]_0 [3]),
        .R(rst_proc));
  FDRE \result_lag_reg[4] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[4]),
        .Q(\result_lag_reg[7]_0 [4]),
        .R(rst_proc));
  FDRE \result_lag_reg[5] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[5]),
        .Q(\result_lag_reg[7]_0 [5]),
        .R(rst_proc));
  FDRE \result_lag_reg[6] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[6]),
        .Q(\result_lag_reg[7]_0 [6]),
        .R(rst_proc));
  FDRE \result_lag_reg[7] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(product_lag_index[7]),
        .Q(\result_lag_reg[7]_0 [7]),
        .R(rst_proc));
  FDRE \result_q16_reg[0] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[0]),
        .Q(\result_q16_reg[47]_0 [0]),
        .R(rst_proc));
  FDRE \result_q16_reg[10] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[10]),
        .Q(\result_q16_reg[47]_0 [10]),
        .R(rst_proc));
  FDRE \result_q16_reg[11] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[11]),
        .Q(\result_q16_reg[47]_0 [11]),
        .R(rst_proc));
  FDRE \result_q16_reg[12] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[12]),
        .Q(\result_q16_reg[47]_0 [12]),
        .R(rst_proc));
  FDRE \result_q16_reg[13] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[13]),
        .Q(\result_q16_reg[47]_0 [13]),
        .R(rst_proc));
  FDRE \result_q16_reg[14] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[14]),
        .Q(\result_q16_reg[47]_0 [14]),
        .R(rst_proc));
  FDRE \result_q16_reg[15] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[15]),
        .Q(\result_q16_reg[47]_0 [15]),
        .R(rst_proc));
  FDRE \result_q16_reg[16] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[16]),
        .Q(\result_q16_reg[47]_0 [16]),
        .R(rst_proc));
  FDRE \result_q16_reg[17] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[17]),
        .Q(\result_q16_reg[47]_0 [17]),
        .R(rst_proc));
  FDRE \result_q16_reg[18] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[18]),
        .Q(\result_q16_reg[47]_0 [18]),
        .R(rst_proc));
  FDRE \result_q16_reg[19] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[19]),
        .Q(\result_q16_reg[47]_0 [19]),
        .R(rst_proc));
  FDRE \result_q16_reg[1] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[1]),
        .Q(\result_q16_reg[47]_0 [1]),
        .R(rst_proc));
  FDRE \result_q16_reg[20] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[20]),
        .Q(\result_q16_reg[47]_0 [20]),
        .R(rst_proc));
  FDRE \result_q16_reg[21] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[21]),
        .Q(\result_q16_reg[47]_0 [21]),
        .R(rst_proc));
  FDRE \result_q16_reg[22] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[22]),
        .Q(\result_q16_reg[47]_0 [22]),
        .R(rst_proc));
  FDRE \result_q16_reg[23] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[23]),
        .Q(\result_q16_reg[47]_0 [23]),
        .R(rst_proc));
  FDRE \result_q16_reg[24] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[24]),
        .Q(\result_q16_reg[47]_0 [24]),
        .R(rst_proc));
  FDRE \result_q16_reg[25] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[25]),
        .Q(\result_q16_reg[47]_0 [25]),
        .R(rst_proc));
  FDRE \result_q16_reg[26] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[26]),
        .Q(\result_q16_reg[47]_0 [26]),
        .R(rst_proc));
  FDRE \result_q16_reg[27] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[27]),
        .Q(\result_q16_reg[47]_0 [27]),
        .R(rst_proc));
  FDRE \result_q16_reg[28] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[28]),
        .Q(\result_q16_reg[47]_0 [28]),
        .R(rst_proc));
  FDRE \result_q16_reg[29] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[29]),
        .Q(\result_q16_reg[47]_0 [29]),
        .R(rst_proc));
  FDRE \result_q16_reg[2] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[2]),
        .Q(\result_q16_reg[47]_0 [2]),
        .R(rst_proc));
  FDRE \result_q16_reg[30] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[30]),
        .Q(\result_q16_reg[47]_0 [30]),
        .R(rst_proc));
  FDRE \result_q16_reg[31] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[31]),
        .Q(\result_q16_reg[47]_0 [31]),
        .R(rst_proc));
  FDRE \result_q16_reg[32] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[32]),
        .Q(\result_q16_reg[47]_0 [32]),
        .R(rst_proc));
  FDRE \result_q16_reg[33] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[33]),
        .Q(\result_q16_reg[47]_0 [33]),
        .R(rst_proc));
  FDRE \result_q16_reg[34] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[34]),
        .Q(\result_q16_reg[47]_0 [34]),
        .R(rst_proc));
  FDRE \result_q16_reg[35] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[35]),
        .Q(\result_q16_reg[47]_0 [35]),
        .R(rst_proc));
  FDRE \result_q16_reg[36] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[36]),
        .Q(\result_q16_reg[47]_0 [36]),
        .R(rst_proc));
  FDRE \result_q16_reg[37] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[37]),
        .Q(\result_q16_reg[47]_0 [37]),
        .R(rst_proc));
  FDRE \result_q16_reg[38] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[38]),
        .Q(\result_q16_reg[47]_0 [38]),
        .R(rst_proc));
  FDRE \result_q16_reg[39] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[39]),
        .Q(\result_q16_reg[47]_0 [39]),
        .R(rst_proc));
  FDRE \result_q16_reg[3] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[3]),
        .Q(\result_q16_reg[47]_0 [3]),
        .R(rst_proc));
  FDRE \result_q16_reg[40] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[40]),
        .Q(\result_q16_reg[47]_0 [40]),
        .R(rst_proc));
  FDRE \result_q16_reg[41] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[41]),
        .Q(\result_q16_reg[47]_0 [41]),
        .R(rst_proc));
  FDRE \result_q16_reg[42] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[42]),
        .Q(\result_q16_reg[47]_0 [42]),
        .R(rst_proc));
  FDRE \result_q16_reg[43] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[43]),
        .Q(\result_q16_reg[47]_0 [43]),
        .R(rst_proc));
  FDRE \result_q16_reg[44] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[44]),
        .Q(\result_q16_reg[47]_0 [44]),
        .R(rst_proc));
  FDRE \result_q16_reg[45] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[45]),
        .Q(\result_q16_reg[47]_0 [45]),
        .R(rst_proc));
  FDRE \result_q16_reg[46] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[46]),
        .Q(\result_q16_reg[47]_0 [46]),
        .R(rst_proc));
  FDRE \result_q16_reg[47] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[47]),
        .Q(\result_q16_reg[47]_0 [47]),
        .R(rst_proc));
  FDRE \result_q16_reg[4] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[4]),
        .Q(\result_q16_reg[47]_0 [4]),
        .R(rst_proc));
  FDRE \result_q16_reg[5] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[5]),
        .Q(\result_q16_reg[47]_0 [5]),
        .R(rst_proc));
  FDRE \result_q16_reg[6] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[6]),
        .Q(\result_q16_reg[47]_0 [6]),
        .R(rst_proc));
  FDRE \result_q16_reg[7] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[7]),
        .Q(\result_q16_reg[47]_0 [7]),
        .R(rst_proc));
  FDRE \result_q16_reg[8] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[8]),
        .Q(\result_q16_reg[47]_0 [8]),
        .R(rst_proc));
  FDRE \result_q16_reg[9] 
       (.C(clk_proc),
        .CE(result_valid_i_1_n_0),
        .D(accumulator_next[9]),
        .Q(\result_q16_reg[47]_0 [9]),
        .R(rst_proc));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    result_valid_i_1
       (.I0(product_tap_index[4]),
        .I1(product_tap_index[6]),
        .I2(product_tap_index[9]),
        .I3(product_tap_index[7]),
        .I4(result_valid_i_2_n_0),
        .I5(result_valid_i_3_n_0),
        .O(result_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hF7FF)) 
    result_valid_i_2
       (.I0(product_valid_reg_n_0),
        .I1(busy_reg_n_0),
        .I2(product_tap_index[8]),
        .I3(product_tap_index[2]),
        .O(result_valid_i_2_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    result_valid_i_3
       (.I0(product_tap_index[3]),
        .I1(product_tap_index[1]),
        .I2(product_tap_index[5]),
        .I3(product_tap_index[0]),
        .O(result_valid_i_3_n_0));
  FDRE result_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(result_valid_i_1_n_0),
        .Q(WEBWE),
        .R(product_valid));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "10240" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/corr_mac_i/template_mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    template_mem_reg
       (.ADDRARDADDR({template_mem_reg_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({request_tap_index,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DIADI(DIADI),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_template_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO(template_rd_data),
        .DOPADOP(NLW_template_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_template_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(template_rsp_valid),
        .ENBWREN(difference_mem_reg_i_1_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(rst_proc),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "echo_pipeline_axi_bridge_phase2" *) 
module system_echo_pipeline_0_0_echo_pipeline_axi_bridge_phase2
   (start_accepted_sticky_reg,
    clear_status_pulse,
    start_rejected_sticky_reg,
    soft_reset_pulse_reg_0,
    s_axi_bvalid_reg_0,
    start_pulse_reg_0,
    SR,
    pulse_width,
    pulse_mode,
    result_select_addr,
    average_select_addr,
    s_axi_rdata,
    s_axi_rresp,
    baseline_commit_pulse,
    template_commit_pulse,
    baseline_shadow_wr_en,
    baseline_shadow_wr_addr,
    baseline_shadow_wr_data_q2,
    template_shadow_wr_en,
    template_shadow_wr_addr,
    template_shadow_wr_data_q14,
    s_axi_bresp,
    s_axi_wready,
    s_axi_awready,
    s_axi_arready,
    s_axi_rvalid_reg_0,
    pn_enable_reg_0,
    irq_f2p,
    start_accepted_sticky,
    start_accepted,
    s_axi_aresetn,
    \status_word_d_reg[3]_0 ,
    start_rejected_not_ready,
    baseline_coeff_valid,
    template_coeff_valid,
    average_frame_available_proc,
    busy,
    s_axi_araddr,
    result_count,
    out,
    correlation_overflow_count,
    average_overflow_count,
    s_axi_wstrb,
    s_axi_aclk,
    s_axi_wdata,
    s_axi_awaddr,
    frame_error_sticky_proc,
    D,
    selected_result_q16,
    selected_average_q2,
    s_axi_wvalid,
    s_axi_awvalid,
    template_commit_rejected,
    baseline_commit_rejected,
    s_axi_bready,
    baseline_active_bank,
    template_active_bank,
    frames_seen_proc,
    \s_axi_rdata_reg[5]_i_2_0 ,
    \s_axi_rdata[1]_i_4_0 ,
    \s_axi_rdata[1]_i_4_1 ,
    s_axi_arvalid,
    baseline_commit_accepted,
    template_commit_accepted,
    s_axi_rready);
  output start_accepted_sticky_reg;
  output clear_status_pulse;
  output start_rejected_sticky_reg;
  output soft_reset_pulse_reg_0;
  output s_axi_bvalid_reg_0;
  output start_pulse_reg_0;
  output [0:0]SR;
  output [5:0]pulse_width;
  output [2:0]pulse_mode;
  output [7:0]result_select_addr;
  output [9:0]average_select_addr;
  output [31:0]s_axi_rdata;
  output [0:0]s_axi_rresp;
  output baseline_commit_pulse;
  output template_commit_pulse;
  output baseline_shadow_wr_en;
  output [9:0]baseline_shadow_wr_addr;
  output [15:0]baseline_shadow_wr_data_q2;
  output template_shadow_wr_en;
  output [9:0]template_shadow_wr_addr;
  output [15:0]template_shadow_wr_data_q14;
  output [0:0]s_axi_bresp;
  output s_axi_wready;
  output s_axi_awready;
  output s_axi_arready;
  output s_axi_rvalid_reg_0;
  output pn_enable_reg_0;
  output irq_f2p;
  input start_accepted_sticky;
  input start_accepted;
  input s_axi_aresetn;
  input \status_word_d_reg[3]_0 ;
  input start_rejected_not_ready;
  input baseline_coeff_valid;
  input template_coeff_valid;
  input average_frame_available_proc;
  input busy;
  input [7:0]s_axi_araddr;
  input [8:0]result_count;
  input [31:0]out;
  input [31:0]correlation_overflow_count;
  input [31:0]average_overflow_count;
  input [3:0]s_axi_wstrb;
  input s_axi_aclk;
  input [31:0]s_axi_wdata;
  input [7:0]s_axi_awaddr;
  input frame_error_sticky_proc;
  input [1:0]D;
  input [63:0]selected_result_q16;
  input [15:0]selected_average_q2;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input template_commit_rejected;
  input baseline_commit_rejected;
  input s_axi_bready;
  input baseline_active_bank;
  input template_active_bank;
  input [5:0]frames_seen_proc;
  input [0:0]\s_axi_rdata_reg[5]_i_2_0 ;
  input [0:0]\s_axi_rdata[1]_i_4_0 ;
  input [0:0]\s_axi_rdata[1]_i_4_1 ;
  input s_axi_arvalid;
  input baseline_commit_accepted;
  input template_commit_accepted;
  input s_axi_rready;

  wire [1:0]D;
  wire [0:0]SR;
  wire average_capture_pending_i_1_n_0;
  wire average_capture_pending_reg_n_0;
  wire [2:0]average_capture_wait;
  wire \average_capture_wait[0]_i_1_n_0 ;
  wire \average_capture_wait[1]_i_1_n_0 ;
  wire \average_capture_wait[2]_i_1_n_0 ;
  wire average_frame_available_proc;
  wire [31:0]average_overflow_count;
  wire [9:0]average_select_addr;
  wire \average_select_addr[9]_i_1_n_0 ;
  wire \average_select_addr[9]_i_3_n_0 ;
  wire \average_select_addr[9]_i_4_n_0 ;
  wire \average_snapshot_q2[15]_i_1_n_0 ;
  wire \average_snapshot_q2_reg_n_0_[0] ;
  wire \average_snapshot_q2_reg_n_0_[10] ;
  wire \average_snapshot_q2_reg_n_0_[11] ;
  wire \average_snapshot_q2_reg_n_0_[12] ;
  wire \average_snapshot_q2_reg_n_0_[13] ;
  wire \average_snapshot_q2_reg_n_0_[14] ;
  wire \average_snapshot_q2_reg_n_0_[15] ;
  wire \average_snapshot_q2_reg_n_0_[1] ;
  wire \average_snapshot_q2_reg_n_0_[2] ;
  wire \average_snapshot_q2_reg_n_0_[3] ;
  wire \average_snapshot_q2_reg_n_0_[4] ;
  wire \average_snapshot_q2_reg_n_0_[5] ;
  wire \average_snapshot_q2_reg_n_0_[6] ;
  wire \average_snapshot_q2_reg_n_0_[7] ;
  wire \average_snapshot_q2_reg_n_0_[8] ;
  wire \average_snapshot_q2_reg_n_0_[9] ;
  wire average_snapshot_valid_i_1_n_0;
  wire average_snapshot_valid_i_2_n_0;
  wire average_snapshot_valid_i_3_n_0;
  wire average_snapshot_valid_i_4_n_0;
  wire average_snapshot_valid_i_5_n_0;
  wire average_snapshot_valid_reg_n_0;
  wire aw_pending44_out;
  wire aw_pending_i_1_n_0;
  wire aw_pending_reg_n_0;
  wire [7:0]awaddr_hold;
  wire baseline_active_bank;
  wire [9:0]baseline_addr_ptr;
  wire \baseline_addr_ptr[5]_i_2_n_0 ;
  wire \baseline_addr_ptr[7]_i_2_n_0 ;
  wire \baseline_addr_ptr[9]_i_1_n_0 ;
  wire \baseline_addr_ptr[9]_i_3_n_0 ;
  wire \baseline_addr_ptr[9]_i_4_n_0 ;
  wire \baseline_addr_ptr[9]_i_5_n_0 ;
  wire \baseline_addr_ptr_reg_n_0_[0] ;
  wire \baseline_addr_ptr_reg_n_0_[1] ;
  wire \baseline_addr_ptr_reg_n_0_[2] ;
  wire \baseline_addr_ptr_reg_n_0_[3] ;
  wire \baseline_addr_ptr_reg_n_0_[4] ;
  wire \baseline_addr_ptr_reg_n_0_[5] ;
  wire \baseline_addr_ptr_reg_n_0_[6] ;
  wire \baseline_addr_ptr_reg_n_0_[7] ;
  wire \baseline_addr_ptr_reg_n_0_[8] ;
  wire \baseline_addr_ptr_reg_n_0_[9] ;
  wire baseline_coeff_valid;
  wire baseline_commit_accepted;
  wire baseline_commit_accepted_sticky_i_1_n_0;
  wire baseline_commit_accepted_sticky_i_2_n_0;
  wire baseline_commit_accepted_sticky_i_3_n_0;
  wire baseline_commit_accepted_sticky_reg_n_0;
  wire baseline_commit_pulse;
  wire baseline_commit_pulse_i_1_n_0;
  wire baseline_commit_pulse_i_2_n_0;
  wire baseline_commit_rejected;
  wire baseline_commit_rejected_sticky_i_1_n_0;
  wire baseline_commit_rejected_sticky_reg_n_0;
  wire [30:1]baseline_crc_state;
  wire \baseline_crc_state[0]_i_1_n_0 ;
  wire \baseline_crc_state[10]_i_2_n_0 ;
  wire \baseline_crc_state[10]_i_3_n_0 ;
  wire \baseline_crc_state[11]_i_1_n_0 ;
  wire \baseline_crc_state[11]_i_2_n_0 ;
  wire \baseline_crc_state[11]_i_3_n_0 ;
  wire \baseline_crc_state[11]_i_4_n_0 ;
  wire \baseline_crc_state[12]_i_1_n_0 ;
  wire \baseline_crc_state[12]_i_2_n_0 ;
  wire \baseline_crc_state[12]_i_3_n_0 ;
  wire \baseline_crc_state[12]_i_4_n_0 ;
  wire \baseline_crc_state[13]_i_1_n_0 ;
  wire \baseline_crc_state[13]_i_2_n_0 ;
  wire \baseline_crc_state[14]_i_1_n_0 ;
  wire \baseline_crc_state[14]_i_2_n_0 ;
  wire \baseline_crc_state[15]_i_1_n_0 ;
  wire \baseline_crc_state[15]_i_2_n_0 ;
  wire \baseline_crc_state[15]_i_3_n_0 ;
  wire \baseline_crc_state[16]_i_2_n_0 ;
  wire \baseline_crc_state[17]_i_1_n_0 ;
  wire \baseline_crc_state[17]_i_2_n_0 ;
  wire \baseline_crc_state[18]_i_1_n_0 ;
  wire \baseline_crc_state[18]_i_2_n_0 ;
  wire \baseline_crc_state[19]_i_1_n_0 ;
  wire \baseline_crc_state[19]_i_2_n_0 ;
  wire \baseline_crc_state[19]_i_3_n_0 ;
  wire \baseline_crc_state[20]_i_1_n_0 ;
  wire \baseline_crc_state[21]_i_1_n_0 ;
  wire \baseline_crc_state[21]_i_2_n_0 ;
  wire \baseline_crc_state[21]_i_3_n_0 ;
  wire \baseline_crc_state[21]_i_4_n_0 ;
  wire \baseline_crc_state[22]_i_1_n_0 ;
  wire \baseline_crc_state[22]_i_2_n_0 ;
  wire \baseline_crc_state[22]_i_3_n_0 ;
  wire \baseline_crc_state[23]_i_2_n_0 ;
  wire \baseline_crc_state[23]_i_3_n_0 ;
  wire \baseline_crc_state[23]_i_4_n_0 ;
  wire \baseline_crc_state[24]_i_2_n_0 ;
  wire \baseline_crc_state[24]_i_3_n_0 ;
  wire \baseline_crc_state[25]_i_1_n_0 ;
  wire \baseline_crc_state[25]_i_2_n_0 ;
  wire \baseline_crc_state[26]_i_1_n_0 ;
  wire \baseline_crc_state[26]_i_2_n_0 ;
  wire \baseline_crc_state[27]_i_1_n_0 ;
  wire \baseline_crc_state[27]_i_2_n_0 ;
  wire \baseline_crc_state[27]_i_3_n_0 ;
  wire \baseline_crc_state[27]_i_4_n_0 ;
  wire \baseline_crc_state[28]_i_1_n_0 ;
  wire \baseline_crc_state[28]_i_2_n_0 ;
  wire \baseline_crc_state[29]_i_1_n_0 ;
  wire \baseline_crc_state[29]_i_2_n_0 ;
  wire \baseline_crc_state[2]_i_1_n_0 ;
  wire \baseline_crc_state[30]_i_2_n_0 ;
  wire \baseline_crc_state[31]_i_1_n_0 ;
  wire \baseline_crc_state[31]_i_2_n_0 ;
  wire \baseline_crc_state[31]_i_3_n_0 ;
  wire \baseline_crc_state[31]_i_4_n_0 ;
  wire \baseline_crc_state[31]_i_5_n_0 ;
  wire \baseline_crc_state[31]_i_6_n_0 ;
  wire \baseline_crc_state[3]_i_1_n_0 ;
  wire \baseline_crc_state[3]_i_2_n_0 ;
  wire \baseline_crc_state[4]_i_1_n_0 ;
  wire \baseline_crc_state[5]_i_1_n_0 ;
  wire \baseline_crc_state[5]_i_2_n_0 ;
  wire \baseline_crc_state[6]_i_1_n_0 ;
  wire \baseline_crc_state[6]_i_2_n_0 ;
  wire \baseline_crc_state[7]_i_1_n_0 ;
  wire \baseline_crc_state[8]_i_1_n_0 ;
  wire \baseline_crc_state[8]_i_2_n_0 ;
  wire \baseline_crc_state[8]_i_3_n_0 ;
  wire \baseline_crc_state[9]_i_1_n_0 ;
  wire \baseline_crc_state[9]_i_2_n_0 ;
  wire \baseline_crc_state_reg_n_0_[0] ;
  wire \baseline_crc_state_reg_n_0_[10] ;
  wire \baseline_crc_state_reg_n_0_[11] ;
  wire \baseline_crc_state_reg_n_0_[12] ;
  wire \baseline_crc_state_reg_n_0_[13] ;
  wire \baseline_crc_state_reg_n_0_[14] ;
  wire \baseline_crc_state_reg_n_0_[15] ;
  wire \baseline_crc_state_reg_n_0_[16] ;
  wire \baseline_crc_state_reg_n_0_[17] ;
  wire \baseline_crc_state_reg_n_0_[18] ;
  wire \baseline_crc_state_reg_n_0_[19] ;
  wire \baseline_crc_state_reg_n_0_[1] ;
  wire \baseline_crc_state_reg_n_0_[20] ;
  wire \baseline_crc_state_reg_n_0_[21] ;
  wire \baseline_crc_state_reg_n_0_[22] ;
  wire \baseline_crc_state_reg_n_0_[23] ;
  wire \baseline_crc_state_reg_n_0_[24] ;
  wire \baseline_crc_state_reg_n_0_[25] ;
  wire \baseline_crc_state_reg_n_0_[26] ;
  wire \baseline_crc_state_reg_n_0_[27] ;
  wire \baseline_crc_state_reg_n_0_[28] ;
  wire \baseline_crc_state_reg_n_0_[29] ;
  wire \baseline_crc_state_reg_n_0_[2] ;
  wire \baseline_crc_state_reg_n_0_[30] ;
  wire \baseline_crc_state_reg_n_0_[31] ;
  wire \baseline_crc_state_reg_n_0_[3] ;
  wire \baseline_crc_state_reg_n_0_[4] ;
  wire \baseline_crc_state_reg_n_0_[5] ;
  wire \baseline_crc_state_reg_n_0_[6] ;
  wire \baseline_crc_state_reg_n_0_[7] ;
  wire \baseline_crc_state_reg_n_0_[8] ;
  wire \baseline_crc_state_reg_n_0_[9] ;
  wire baseline_load_complete_i_1_n_0;
  wire baseline_load_complete_i_2_n_0;
  wire baseline_sequence_valid;
  wire baseline_sequence_valid_i_1_n_0;
  wire baseline_sequence_valid_i_3_n_0;
  wire baseline_sequence_valid_reg_n_0;
  wire [9:0]baseline_shadow_wr_addr;
  wire \baseline_shadow_wr_addr[9]_i_1_n_0 ;
  wire [15:0]baseline_shadow_wr_data_q2;
  wire baseline_shadow_wr_en;
  wire baseline_shadow_wr_en_i_1_n_0;
  wire baseline_shadow_wr_en_i_2_n_0;
  wire [10:0]baseline_write_count;
  wire \baseline_write_count[10]_i_1_n_0 ;
  wire \baseline_write_count[10]_i_3_n_0 ;
  wire \baseline_write_count[1]_i_1_n_0 ;
  wire \baseline_write_count[7]_i_2_n_0 ;
  wire \baseline_write_count[8]_i_2_n_0 ;
  wire \baseline_write_count[9]_i_1_n_0 ;
  wire \baseline_write_count_reg_n_0_[0] ;
  wire \baseline_write_count_reg_n_0_[10] ;
  wire \baseline_write_count_reg_n_0_[1] ;
  wire \baseline_write_count_reg_n_0_[2] ;
  wire \baseline_write_count_reg_n_0_[3] ;
  wire \baseline_write_count_reg_n_0_[4] ;
  wire \baseline_write_count_reg_n_0_[5] ;
  wire \baseline_write_count_reg_n_0_[6] ;
  wire \baseline_write_count_reg_n_0_[7] ;
  wire \baseline_write_count_reg_n_0_[8] ;
  wire \baseline_write_count_reg_n_0_[9] ;
  wire busy;
  wire clear_status_pulse;
  wire clear_status_pulse_i_1_n_0;
  wire clear_status_pulse_i_2_n_0;
  wire clear_status_pulse_i_3_n_0;
  wire clear_status_pulse_i_4_n_0;
  wire [1:0]coeff_status_word;
  wire [31:0]correlation_overflow_count;
  wire [9:8]data0;
  wire data00;
  wire [31:0]data11;
  wire error_event_pulse_i_10_n_0;
  wire error_event_pulse_i_11_n_0;
  wire error_event_pulse_i_12_n_0;
  wire error_event_pulse_i_13_n_0;
  wire error_event_pulse_i_1_n_0;
  wire error_event_pulse_i_2_n_0;
  wire error_event_pulse_i_3_n_0;
  wire error_event_pulse_i_4_n_0;
  wire error_event_pulse_i_5_n_0;
  wire error_event_pulse_i_6_n_0;
  wire error_event_pulse_i_7_n_0;
  wire error_event_pulse_i_8_n_0;
  wire error_event_pulse_i_9_n_0;
  wire error_event_pulse_reg_n_0;
  wire frame_error_sticky_proc;
  wire [5:0]frames_seen_proc;
  wire \irq_enable[31]_i_2_n_0 ;
  wire \irq_enable[31]_i_3_n_0 ;
  wire \irq_enable[31]_i_4_n_0 ;
  wire \irq_enable_reg_n_0_[0] ;
  wire \irq_enable_reg_n_0_[10] ;
  wire \irq_enable_reg_n_0_[11] ;
  wire \irq_enable_reg_n_0_[12] ;
  wire \irq_enable_reg_n_0_[13] ;
  wire \irq_enable_reg_n_0_[14] ;
  wire \irq_enable_reg_n_0_[15] ;
  wire \irq_enable_reg_n_0_[16] ;
  wire \irq_enable_reg_n_0_[17] ;
  wire \irq_enable_reg_n_0_[18] ;
  wire \irq_enable_reg_n_0_[19] ;
  wire \irq_enable_reg_n_0_[1] ;
  wire \irq_enable_reg_n_0_[20] ;
  wire \irq_enable_reg_n_0_[21] ;
  wire \irq_enable_reg_n_0_[22] ;
  wire \irq_enable_reg_n_0_[23] ;
  wire \irq_enable_reg_n_0_[24] ;
  wire \irq_enable_reg_n_0_[25] ;
  wire \irq_enable_reg_n_0_[26] ;
  wire \irq_enable_reg_n_0_[27] ;
  wire \irq_enable_reg_n_0_[28] ;
  wire \irq_enable_reg_n_0_[29] ;
  wire \irq_enable_reg_n_0_[2] ;
  wire \irq_enable_reg_n_0_[30] ;
  wire \irq_enable_reg_n_0_[31] ;
  wire \irq_enable_reg_n_0_[3] ;
  wire \irq_enable_reg_n_0_[4] ;
  wire \irq_enable_reg_n_0_[5] ;
  wire \irq_enable_reg_n_0_[6] ;
  wire \irq_enable_reg_n_0_[7] ;
  wire \irq_enable_reg_n_0_[8] ;
  wire \irq_enable_reg_n_0_[9] ;
  wire irq_f2p;
  wire irq_f2p_INST_0_i_1_n_0;
  wire \irq_status[0]_i_1_n_0 ;
  wire \irq_status[1]_i_1_n_0 ;
  wire \irq_status[1]_i_2_n_0 ;
  wire \irq_status[1]_i_3_n_0 ;
  wire \irq_status[2]_i_1_n_0 ;
  wire \irq_status[2]_i_2_n_0 ;
  wire \irq_status[2]_i_3_n_0 ;
  wire \irq_status[2]_i_4_n_0 ;
  wire \irq_status[3]_i_1_n_0 ;
  wire \irq_status[3]_i_2_n_0 ;
  wire \irq_status_reg_n_0_[0] ;
  wire \irq_status_reg_n_0_[1] ;
  wire \irq_status_reg_n_0_[2] ;
  wire \irq_status_reg_n_0_[3] ;
  wire \last_error[0]_i_1_n_0 ;
  wire \last_error[0]_i_2_n_0 ;
  wire \last_error[0]_i_3_n_0 ;
  wire \last_error[0]_i_4_n_0 ;
  wire \last_error[0]_i_5_n_0 ;
  wire \last_error[0]_i_6_n_0 ;
  wire \last_error[0]_i_7_n_0 ;
  wire \last_error[1]_i_1_n_0 ;
  wire \last_error[1]_i_2_n_0 ;
  wire \last_error[1]_i_3_n_0 ;
  wire \last_error[1]_i_4_n_0 ;
  wire \last_error[1]_i_5_n_0 ;
  wire \last_error[1]_i_6_n_0 ;
  wire \last_error[2]_i_1_n_0 ;
  wire \last_error[2]_i_2_n_0 ;
  wire \last_error[2]_i_3_n_0 ;
  wire \last_error[2]_i_4_n_0 ;
  wire \last_error[2]_i_5_n_0 ;
  wire \last_error[2]_i_6_n_0 ;
  wire \last_error[3]_i_1_n_0 ;
  wire \last_error[3]_i_2_n_0 ;
  wire \last_error[3]_i_3_n_0 ;
  wire \last_error[3]_i_4_n_0 ;
  wire \last_error[3]_i_5_n_0 ;
  wire \last_error[3]_i_6_n_0 ;
  wire \last_error[3]_i_7_n_0 ;
  wire \last_error[3]_i_8_n_0 ;
  wire \last_error[3]_i_9_n_0 ;
  wire \last_error[4]_i_1_n_0 ;
  wire \last_error[4]_i_2_n_0 ;
  wire \last_error[5]_i_1_n_0 ;
  wire \last_error[5]_i_2_n_0 ;
  wire \last_error[6]_i_1_n_0 ;
  wire \last_error[6]_i_2_n_0 ;
  wire \last_error[6]_i_3_n_0 ;
  wire \last_error[6]_i_4_n_0 ;
  wire \last_error[6]_i_5_n_0 ;
  wire \last_error[6]_i_6_n_0 ;
  wire \last_error[7]_i_1_n_0 ;
  wire \last_error[8]_i_1_n_0 ;
  wire \last_error[8]_i_2_n_0 ;
  wire \last_error[8]_i_3_n_0 ;
  wire \last_error[8]_i_4_n_0 ;
  wire \last_error[9]_i_1_n_0 ;
  wire \last_error[9]_i_2_n_0 ;
  wire \last_error[9]_i_3_n_0 ;
  wire \last_error[9]_i_4_n_0 ;
  wire \last_error[9]_i_5_n_0 ;
  wire \last_error[9]_i_6_n_0 ;
  wire \last_error_reg_n_0_[0] ;
  wire \last_error_reg_n_0_[1] ;
  wire \last_error_reg_n_0_[2] ;
  wire \last_error_reg_n_0_[3] ;
  wire \last_error_reg_n_0_[4] ;
  wire \last_error_reg_n_0_[5] ;
  wire \last_error_reg_n_0_[6] ;
  wire \last_error_reg_n_0_[7] ;
  wire \last_error_reg_n_0_[8] ;
  wire \last_error_reg_n_0_[9] ;
  wire [31:0]out;
  wire p_0_in;
  wire p_0_in1_in;
  wire [7:0]p_0_in1_in_0;
  wire p_15_in;
  wire [5:0]p_1_in;
  wire [31:7]p_1_in__0;
  wire [7:0]p_2_in;
  wire p_4_in;
  wire p_5_in;
  wire p_6_in;
  wire pn_enable_i_1_n_0;
  wire pn_enable_i_2_n_0;
  wire pn_enable_i_3_n_0;
  wire pn_enable_i_4_n_0;
  wire pn_enable_i_5_n_0;
  wire pn_enable_i_6_n_0;
  wire pn_enable_i_7_n_0;
  wire pn_enable_i_8_n_0;
  wire pn_enable_i_9_n_0;
  wire pn_enable_reg_0;
  wire \pulse_config_word[0]_i_1_n_0 ;
  wire \pulse_config_word[14]_i_1_n_0 ;
  wire \pulse_config_word[15]_i_1_n_0 ;
  wire \pulse_config_word[16]_i_1_n_0 ;
  wire \pulse_config_word[17]_i_1_n_0 ;
  wire \pulse_config_word[18]_i_1_n_0 ;
  wire \pulse_config_word[19]_i_1_n_0 ;
  wire \pulse_config_word[1]_i_1_n_0 ;
  wire \pulse_config_word[20]_i_1_n_0 ;
  wire \pulse_config_word[21]_i_1_n_0 ;
  wire \pulse_config_word[22]_i_1_n_0 ;
  wire \pulse_config_word[23]_i_1_n_0 ;
  wire \pulse_config_word[24]_i_1_n_0 ;
  wire \pulse_config_word[25]_i_1_n_0 ;
  wire \pulse_config_word[26]_i_1_n_0 ;
  wire \pulse_config_word[27]_i_1_n_0 ;
  wire \pulse_config_word[28]_i_1_n_0 ;
  wire \pulse_config_word[29]_i_1_n_0 ;
  wire \pulse_config_word[2]_i_1_n_0 ;
  wire \pulse_config_word[2]_i_2_n_0 ;
  wire \pulse_config_word[2]_i_3_n_0 ;
  wire \pulse_config_word[2]_i_4_n_0 ;
  wire \pulse_config_word[2]_i_5_n_0 ;
  wire \pulse_config_word[2]_i_6_n_0 ;
  wire \pulse_config_word[2]_i_7_n_0 ;
  wire \pulse_config_word[2]_i_8_n_0 ;
  wire \pulse_config_word[30]_i_1_n_0 ;
  wire \pulse_config_word[31]_i_1_n_0 ;
  wire \pulse_config_word[3]_i_1_n_0 ;
  wire \pulse_config_word[4]_i_1_n_0 ;
  wire \pulse_config_word[5]_i_1_n_0 ;
  wire \pulse_config_word[6]_i_1_n_0 ;
  wire \pulse_config_word[7]_i_1_n_0 ;
  wire \pulse_config_word_reg_n_0_[14] ;
  wire \pulse_config_word_reg_n_0_[15] ;
  wire \pulse_config_word_reg_n_0_[16] ;
  wire \pulse_config_word_reg_n_0_[17] ;
  wire \pulse_config_word_reg_n_0_[18] ;
  wire \pulse_config_word_reg_n_0_[19] ;
  wire \pulse_config_word_reg_n_0_[20] ;
  wire \pulse_config_word_reg_n_0_[21] ;
  wire \pulse_config_word_reg_n_0_[22] ;
  wire \pulse_config_word_reg_n_0_[23] ;
  wire \pulse_config_word_reg_n_0_[24] ;
  wire \pulse_config_word_reg_n_0_[25] ;
  wire \pulse_config_word_reg_n_0_[26] ;
  wire \pulse_config_word_reg_n_0_[27] ;
  wire \pulse_config_word_reg_n_0_[28] ;
  wire \pulse_config_word_reg_n_0_[29] ;
  wire \pulse_config_word_reg_n_0_[30] ;
  wire \pulse_config_word_reg_n_0_[31] ;
  wire \pulse_config_word_reg_n_0_[3] ;
  wire \pulse_config_word_reg_n_0_[4] ;
  wire \pulse_config_word_reg_n_0_[5] ;
  wire \pulse_config_word_reg_n_0_[6] ;
  wire \pulse_config_word_reg_n_0_[7] ;
  wire [2:0]pulse_mode;
  wire [5:0]pulse_width;
  wire result_capture_pending_i_10_n_0;
  wire result_capture_pending_i_11_n_0;
  wire result_capture_pending_i_12_n_0;
  wire result_capture_pending_i_1_n_0;
  wire result_capture_pending_i_2_n_0;
  wire result_capture_pending_i_3_n_0;
  wire result_capture_pending_i_4_n_0;
  wire result_capture_pending_i_5_n_0;
  wire result_capture_pending_i_6_n_0;
  wire result_capture_pending_i_7_n_0;
  wire result_capture_pending_i_8_n_0;
  wire result_capture_pending_i_9_n_0;
  wire result_capture_pending_reg_n_0;
  wire \result_capture_wait[0]_i_1_n_0 ;
  wire \result_capture_wait[1]_i_1_n_0 ;
  wire \result_capture_wait[2]_i_1_n_0 ;
  wire \result_capture_wait_reg_n_0_[0] ;
  wire \result_capture_wait_reg_n_0_[1] ;
  wire \result_capture_wait_reg_n_0_[2] ;
  wire [8:0]result_count;
  wire [7:0]result_select_addr;
  wire \result_select_addr[0]_i_1_n_0 ;
  wire \result_select_addr[5]_i_1_n_0 ;
  wire \result_select_addr[6]_i_1_n_0 ;
  wire \result_select_addr[7]_i_1_n_0 ;
  wire \result_select_addr[7]_i_2_n_0 ;
  wire \result_select_addr[7]_i_3_n_0 ;
  wire \result_select_addr[7]_i_4_n_0 ;
  wire \result_snapshot_q16[63]_i_1_n_0 ;
  wire \result_snapshot_q16_reg_n_0_[0] ;
  wire \result_snapshot_q16_reg_n_0_[10] ;
  wire \result_snapshot_q16_reg_n_0_[11] ;
  wire \result_snapshot_q16_reg_n_0_[12] ;
  wire \result_snapshot_q16_reg_n_0_[13] ;
  wire \result_snapshot_q16_reg_n_0_[14] ;
  wire \result_snapshot_q16_reg_n_0_[15] ;
  wire \result_snapshot_q16_reg_n_0_[16] ;
  wire \result_snapshot_q16_reg_n_0_[17] ;
  wire \result_snapshot_q16_reg_n_0_[18] ;
  wire \result_snapshot_q16_reg_n_0_[19] ;
  wire \result_snapshot_q16_reg_n_0_[1] ;
  wire \result_snapshot_q16_reg_n_0_[20] ;
  wire \result_snapshot_q16_reg_n_0_[21] ;
  wire \result_snapshot_q16_reg_n_0_[22] ;
  wire \result_snapshot_q16_reg_n_0_[23] ;
  wire \result_snapshot_q16_reg_n_0_[24] ;
  wire \result_snapshot_q16_reg_n_0_[25] ;
  wire \result_snapshot_q16_reg_n_0_[26] ;
  wire \result_snapshot_q16_reg_n_0_[27] ;
  wire \result_snapshot_q16_reg_n_0_[28] ;
  wire \result_snapshot_q16_reg_n_0_[29] ;
  wire \result_snapshot_q16_reg_n_0_[2] ;
  wire \result_snapshot_q16_reg_n_0_[30] ;
  wire \result_snapshot_q16_reg_n_0_[31] ;
  wire \result_snapshot_q16_reg_n_0_[3] ;
  wire \result_snapshot_q16_reg_n_0_[4] ;
  wire \result_snapshot_q16_reg_n_0_[5] ;
  wire \result_snapshot_q16_reg_n_0_[6] ;
  wire \result_snapshot_q16_reg_n_0_[7] ;
  wire \result_snapshot_q16_reg_n_0_[8] ;
  wire \result_snapshot_q16_reg_n_0_[9] ;
  wire result_snapshot_valid_i_1_n_0;
  wire result_snapshot_valid_reg_n_0;
  wire s_axi_aclk;
  wire [7:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [7:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire [1:1]s_axi_bresp1_in;
  wire \s_axi_bresp[1]_i_10_n_0 ;
  wire \s_axi_bresp[1]_i_11_n_0 ;
  wire \s_axi_bresp[1]_i_12_n_0 ;
  wire \s_axi_bresp[1]_i_13_n_0 ;
  wire \s_axi_bresp[1]_i_14_n_0 ;
  wire \s_axi_bresp[1]_i_15_n_0 ;
  wire \s_axi_bresp[1]_i_16_n_0 ;
  wire \s_axi_bresp[1]_i_17_n_0 ;
  wire \s_axi_bresp[1]_i_18_n_0 ;
  wire \s_axi_bresp[1]_i_19_n_0 ;
  wire \s_axi_bresp[1]_i_1_n_0 ;
  wire \s_axi_bresp[1]_i_20_n_0 ;
  wire \s_axi_bresp[1]_i_21_n_0 ;
  wire \s_axi_bresp[1]_i_22_n_0 ;
  wire \s_axi_bresp[1]_i_3_n_0 ;
  wire \s_axi_bresp[1]_i_4_n_0 ;
  wire \s_axi_bresp[1]_i_5_n_0 ;
  wire \s_axi_bresp[1]_i_6_n_0 ;
  wire \s_axi_bresp[1]_i_7_n_0 ;
  wire \s_axi_bresp[1]_i_8_n_0 ;
  wire \s_axi_bresp[1]_i_9_n_0 ;
  wire s_axi_bvalid_i_10_n_0;
  wire s_axi_bvalid_i_1_n_0;
  wire s_axi_bvalid_i_2_n_0;
  wire s_axi_bvalid_i_3_n_0;
  wire s_axi_bvalid_i_4_n_0;
  wire s_axi_bvalid_i_5_n_0;
  wire s_axi_bvalid_i_6_n_0;
  wire s_axi_bvalid_i_7_n_0;
  wire s_axi_bvalid_i_8_n_0;
  wire s_axi_bvalid_i_9_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire \s_axi_rdata[0]_i_10_n_0 ;
  wire \s_axi_rdata[0]_i_11_n_0 ;
  wire \s_axi_rdata[0]_i_12_n_0 ;
  wire \s_axi_rdata[0]_i_13_n_0 ;
  wire \s_axi_rdata[0]_i_14_n_0 ;
  wire \s_axi_rdata[0]_i_1_n_0 ;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[0]_i_5_n_0 ;
  wire \s_axi_rdata[0]_i_6_n_0 ;
  wire \s_axi_rdata[0]_i_8_n_0 ;
  wire \s_axi_rdata[0]_i_9_n_0 ;
  wire \s_axi_rdata[10]_i_10_n_0 ;
  wire \s_axi_rdata[10]_i_1_n_0 ;
  wire \s_axi_rdata[10]_i_2_n_0 ;
  wire \s_axi_rdata[10]_i_3_n_0 ;
  wire \s_axi_rdata[10]_i_4_n_0 ;
  wire \s_axi_rdata[10]_i_5_n_0 ;
  wire \s_axi_rdata[10]_i_6_n_0 ;
  wire \s_axi_rdata[10]_i_7_n_0 ;
  wire \s_axi_rdata[10]_i_8_n_0 ;
  wire \s_axi_rdata[10]_i_9_n_0 ;
  wire \s_axi_rdata[11]_i_1_n_0 ;
  wire \s_axi_rdata[11]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_3_n_0 ;
  wire \s_axi_rdata[11]_i_5_n_0 ;
  wire \s_axi_rdata[11]_i_6_n_0 ;
  wire \s_axi_rdata[11]_i_7_n_0 ;
  wire \s_axi_rdata[11]_i_8_n_0 ;
  wire \s_axi_rdata[12]_i_1_n_0 ;
  wire \s_axi_rdata[12]_i_2_n_0 ;
  wire \s_axi_rdata[12]_i_4_n_0 ;
  wire \s_axi_rdata[12]_i_5_n_0 ;
  wire \s_axi_rdata[12]_i_6_n_0 ;
  wire \s_axi_rdata[12]_i_7_n_0 ;
  wire \s_axi_rdata[12]_i_8_n_0 ;
  wire \s_axi_rdata[13]_i_1_n_0 ;
  wire \s_axi_rdata[13]_i_2_n_0 ;
  wire \s_axi_rdata[13]_i_3_n_0 ;
  wire \s_axi_rdata[13]_i_4_n_0 ;
  wire \s_axi_rdata[13]_i_5_n_0 ;
  wire \s_axi_rdata[13]_i_6_n_0 ;
  wire \s_axi_rdata[13]_i_7_n_0 ;
  wire \s_axi_rdata[14]_i_1_n_0 ;
  wire \s_axi_rdata[14]_i_2_n_0 ;
  wire \s_axi_rdata[14]_i_3_n_0 ;
  wire \s_axi_rdata[14]_i_4_n_0 ;
  wire \s_axi_rdata[14]_i_5_n_0 ;
  wire \s_axi_rdata[14]_i_6_n_0 ;
  wire \s_axi_rdata[14]_i_7_n_0 ;
  wire \s_axi_rdata[15]_i_1_n_0 ;
  wire \s_axi_rdata[15]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_3_n_0 ;
  wire \s_axi_rdata[15]_i_4_n_0 ;
  wire \s_axi_rdata[15]_i_5_n_0 ;
  wire \s_axi_rdata[15]_i_6_n_0 ;
  wire \s_axi_rdata[15]_i_7_n_0 ;
  wire \s_axi_rdata[16]_i_1_n_0 ;
  wire \s_axi_rdata[16]_i_2_n_0 ;
  wire \s_axi_rdata[16]_i_4_n_0 ;
  wire \s_axi_rdata[16]_i_5_n_0 ;
  wire \s_axi_rdata[16]_i_6_n_0 ;
  wire \s_axi_rdata[16]_i_7_n_0 ;
  wire \s_axi_rdata[17]_i_1_n_0 ;
  wire \s_axi_rdata[17]_i_4_n_0 ;
  wire \s_axi_rdata[17]_i_5_n_0 ;
  wire \s_axi_rdata[17]_i_6_n_0 ;
  wire \s_axi_rdata[17]_i_7_n_0 ;
  wire \s_axi_rdata[17]_i_8_n_0 ;
  wire \s_axi_rdata[18]_i_1_n_0 ;
  wire \s_axi_rdata[18]_i_3_n_0 ;
  wire \s_axi_rdata[18]_i_4_n_0 ;
  wire \s_axi_rdata[18]_i_5_n_0 ;
  wire \s_axi_rdata[18]_i_6_n_0 ;
  wire \s_axi_rdata[18]_i_7_n_0 ;
  wire \s_axi_rdata[18]_i_8_n_0 ;
  wire \s_axi_rdata[19]_i_1_n_0 ;
  wire \s_axi_rdata[19]_i_2_n_0 ;
  wire \s_axi_rdata[19]_i_3_n_0 ;
  wire \s_axi_rdata[19]_i_5_n_0 ;
  wire \s_axi_rdata[19]_i_6_n_0 ;
  wire \s_axi_rdata[19]_i_7_n_0 ;
  wire \s_axi_rdata[19]_i_8_n_0 ;
  wire \s_axi_rdata[1]_i_10_n_0 ;
  wire \s_axi_rdata[1]_i_11_n_0 ;
  wire \s_axi_rdata[1]_i_12_n_0 ;
  wire \s_axi_rdata[1]_i_1_n_0 ;
  wire \s_axi_rdata[1]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire [0:0]\s_axi_rdata[1]_i_4_0 ;
  wire [0:0]\s_axi_rdata[1]_i_4_1 ;
  wire \s_axi_rdata[1]_i_4_n_0 ;
  wire \s_axi_rdata[1]_i_5_n_0 ;
  wire \s_axi_rdata[1]_i_6_n_0 ;
  wire \s_axi_rdata[1]_i_7_n_0 ;
  wire \s_axi_rdata[1]_i_8_n_0 ;
  wire \s_axi_rdata[1]_i_9_n_0 ;
  wire \s_axi_rdata[20]_i_1_n_0 ;
  wire \s_axi_rdata[20]_i_2_n_0 ;
  wire \s_axi_rdata[20]_i_3_n_0 ;
  wire \s_axi_rdata[20]_i_4_n_0 ;
  wire \s_axi_rdata[20]_i_5_n_0 ;
  wire \s_axi_rdata[20]_i_6_n_0 ;
  wire \s_axi_rdata[20]_i_7_n_0 ;
  wire \s_axi_rdata[21]_i_1_n_0 ;
  wire \s_axi_rdata[21]_i_2_n_0 ;
  wire \s_axi_rdata[21]_i_3_n_0 ;
  wire \s_axi_rdata[21]_i_4_n_0 ;
  wire \s_axi_rdata[21]_i_5_n_0 ;
  wire \s_axi_rdata[21]_i_6_n_0 ;
  wire \s_axi_rdata[21]_i_7_n_0 ;
  wire \s_axi_rdata[22]_i_1_n_0 ;
  wire \s_axi_rdata[22]_i_2_n_0 ;
  wire \s_axi_rdata[22]_i_3_n_0 ;
  wire \s_axi_rdata[22]_i_4_n_0 ;
  wire \s_axi_rdata[22]_i_5_n_0 ;
  wire \s_axi_rdata[22]_i_6_n_0 ;
  wire \s_axi_rdata[22]_i_7_n_0 ;
  wire \s_axi_rdata[22]_i_8_n_0 ;
  wire \s_axi_rdata[23]_i_1_n_0 ;
  wire \s_axi_rdata[23]_i_2_n_0 ;
  wire \s_axi_rdata[23]_i_3_n_0 ;
  wire \s_axi_rdata[23]_i_4_n_0 ;
  wire \s_axi_rdata[23]_i_5_n_0 ;
  wire \s_axi_rdata[23]_i_6_n_0 ;
  wire \s_axi_rdata[23]_i_7_n_0 ;
  wire \s_axi_rdata[23]_i_8_n_0 ;
  wire \s_axi_rdata[23]_i_9_n_0 ;
  wire \s_axi_rdata[24]_i_1_n_0 ;
  wire \s_axi_rdata[24]_i_2_n_0 ;
  wire \s_axi_rdata[24]_i_4_n_0 ;
  wire \s_axi_rdata[24]_i_5_n_0 ;
  wire \s_axi_rdata[24]_i_6_n_0 ;
  wire \s_axi_rdata[24]_i_7_n_0 ;
  wire \s_axi_rdata[25]_i_1_n_0 ;
  wire \s_axi_rdata[25]_i_2_n_0 ;
  wire \s_axi_rdata[25]_i_3_n_0 ;
  wire \s_axi_rdata[25]_i_4_n_0 ;
  wire \s_axi_rdata[25]_i_5_n_0 ;
  wire \s_axi_rdata[25]_i_6_n_0 ;
  wire \s_axi_rdata[26]_i_1_n_0 ;
  wire \s_axi_rdata[26]_i_2_n_0 ;
  wire \s_axi_rdata[26]_i_3_n_0 ;
  wire \s_axi_rdata[26]_i_4_n_0 ;
  wire \s_axi_rdata[26]_i_5_n_0 ;
  wire \s_axi_rdata[26]_i_6_n_0 ;
  wire \s_axi_rdata[26]_i_7_n_0 ;
  wire \s_axi_rdata[26]_i_8_n_0 ;
  wire \s_axi_rdata[27]_i_1_n_0 ;
  wire \s_axi_rdata[27]_i_2_n_0 ;
  wire \s_axi_rdata[27]_i_3_n_0 ;
  wire \s_axi_rdata[27]_i_4_n_0 ;
  wire \s_axi_rdata[27]_i_5_n_0 ;
  wire \s_axi_rdata[27]_i_6_n_0 ;
  wire \s_axi_rdata[27]_i_7_n_0 ;
  wire \s_axi_rdata[27]_i_8_n_0 ;
  wire \s_axi_rdata[27]_i_9_n_0 ;
  wire \s_axi_rdata[28]_i_1_n_0 ;
  wire \s_axi_rdata[28]_i_2_n_0 ;
  wire \s_axi_rdata[28]_i_3_n_0 ;
  wire \s_axi_rdata[28]_i_4_n_0 ;
  wire \s_axi_rdata[28]_i_5_n_0 ;
  wire \s_axi_rdata[28]_i_6_n_0 ;
  wire \s_axi_rdata[28]_i_7_n_0 ;
  wire \s_axi_rdata[29]_i_1_n_0 ;
  wire \s_axi_rdata[29]_i_2_n_0 ;
  wire \s_axi_rdata[29]_i_3_n_0 ;
  wire \s_axi_rdata[29]_i_4_n_0 ;
  wire \s_axi_rdata[29]_i_5_n_0 ;
  wire \s_axi_rdata[29]_i_6_n_0 ;
  wire \s_axi_rdata[29]_i_7_n_0 ;
  wire \s_axi_rdata[2]_i_10_n_0 ;
  wire \s_axi_rdata[2]_i_11_n_0 ;
  wire \s_axi_rdata[2]_i_12_n_0 ;
  wire \s_axi_rdata[2]_i_1_n_0 ;
  wire \s_axi_rdata[2]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[2]_i_5_n_0 ;
  wire \s_axi_rdata[2]_i_6_n_0 ;
  wire \s_axi_rdata[2]_i_8_n_0 ;
  wire \s_axi_rdata[2]_i_9_n_0 ;
  wire \s_axi_rdata[30]_i_1_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[30]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_4_n_0 ;
  wire \s_axi_rdata[30]_i_5_n_0 ;
  wire \s_axi_rdata[30]_i_6_n_0 ;
  wire \s_axi_rdata[30]_i_7_n_0 ;
  wire \s_axi_rdata[30]_i_8_n_0 ;
  wire \s_axi_rdata[30]_i_9_n_0 ;
  wire \s_axi_rdata[31]_i_10_n_0 ;
  wire \s_axi_rdata[31]_i_1_n_0 ;
  wire \s_axi_rdata[31]_i_2_n_0 ;
  wire \s_axi_rdata[31]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire \s_axi_rdata[31]_i_6_n_0 ;
  wire \s_axi_rdata[31]_i_7_n_0 ;
  wire \s_axi_rdata[31]_i_8_n_0 ;
  wire \s_axi_rdata[31]_i_9_n_0 ;
  wire \s_axi_rdata[3]_i_10_n_0 ;
  wire \s_axi_rdata[3]_i_11_n_0 ;
  wire \s_axi_rdata[3]_i_12_n_0 ;
  wire \s_axi_rdata[3]_i_1_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire \s_axi_rdata[3]_i_4_n_0 ;
  wire \s_axi_rdata[3]_i_5_n_0 ;
  wire \s_axi_rdata[3]_i_6_n_0 ;
  wire \s_axi_rdata[3]_i_7_n_0 ;
  wire \s_axi_rdata[3]_i_8_n_0 ;
  wire \s_axi_rdata[3]_i_9_n_0 ;
  wire \s_axi_rdata[4]_i_11_n_0 ;
  wire \s_axi_rdata[4]_i_12_n_0 ;
  wire \s_axi_rdata[4]_i_1_n_0 ;
  wire \s_axi_rdata[4]_i_3_n_0 ;
  wire \s_axi_rdata[4]_i_4_n_0 ;
  wire \s_axi_rdata[4]_i_5_n_0 ;
  wire \s_axi_rdata[4]_i_6_n_0 ;
  wire \s_axi_rdata[4]_i_7_n_0 ;
  wire \s_axi_rdata[4]_i_8_n_0 ;
  wire \s_axi_rdata[4]_i_9_n_0 ;
  wire \s_axi_rdata[5]_i_11_n_0 ;
  wire \s_axi_rdata[5]_i_12_n_0 ;
  wire \s_axi_rdata[5]_i_1_n_0 ;
  wire \s_axi_rdata[5]_i_3_n_0 ;
  wire \s_axi_rdata[5]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_5_n_0 ;
  wire \s_axi_rdata[5]_i_6_n_0 ;
  wire \s_axi_rdata[5]_i_7_n_0 ;
  wire \s_axi_rdata[5]_i_8_n_0 ;
  wire \s_axi_rdata[5]_i_9_n_0 ;
  wire \s_axi_rdata[6]_i_10_n_0 ;
  wire \s_axi_rdata[6]_i_11_n_0 ;
  wire \s_axi_rdata[6]_i_12_n_0 ;
  wire \s_axi_rdata[6]_i_13_n_0 ;
  wire \s_axi_rdata[6]_i_1_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[6]_i_3_n_0 ;
  wire \s_axi_rdata[6]_i_4_n_0 ;
  wire \s_axi_rdata[6]_i_6_n_0 ;
  wire \s_axi_rdata[6]_i_7_n_0 ;
  wire \s_axi_rdata[6]_i_9_n_0 ;
  wire \s_axi_rdata[7]_i_10_n_0 ;
  wire \s_axi_rdata[7]_i_11_n_0 ;
  wire \s_axi_rdata[7]_i_12_n_0 ;
  wire \s_axi_rdata[7]_i_1_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_3_n_0 ;
  wire \s_axi_rdata[7]_i_5_n_0 ;
  wire \s_axi_rdata[7]_i_6_n_0 ;
  wire \s_axi_rdata[7]_i_8_n_0 ;
  wire \s_axi_rdata[7]_i_9_n_0 ;
  wire \s_axi_rdata[8]_i_10_n_0 ;
  wire \s_axi_rdata[8]_i_11_n_0 ;
  wire \s_axi_rdata[8]_i_1_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[8]_i_3_n_0 ;
  wire \s_axi_rdata[8]_i_4_n_0 ;
  wire \s_axi_rdata[8]_i_5_n_0 ;
  wire \s_axi_rdata[8]_i_6_n_0 ;
  wire \s_axi_rdata[8]_i_8_n_0 ;
  wire \s_axi_rdata[8]_i_9_n_0 ;
  wire \s_axi_rdata[9]_i_10_n_0 ;
  wire \s_axi_rdata[9]_i_11_n_0 ;
  wire \s_axi_rdata[9]_i_12_n_0 ;
  wire \s_axi_rdata[9]_i_1_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_3_n_0 ;
  wire \s_axi_rdata[9]_i_4_n_0 ;
  wire \s_axi_rdata[9]_i_5_n_0 ;
  wire \s_axi_rdata[9]_i_6_n_0 ;
  wire \s_axi_rdata[9]_i_7_n_0 ;
  wire \s_axi_rdata[9]_i_8_n_0 ;
  wire \s_axi_rdata[9]_i_9_n_0 ;
  wire \s_axi_rdata_reg[0]_i_4_n_0 ;
  wire \s_axi_rdata_reg[0]_i_7_n_0 ;
  wire \s_axi_rdata_reg[11]_i_4_n_0 ;
  wire \s_axi_rdata_reg[12]_i_3_n_0 ;
  wire \s_axi_rdata_reg[16]_i_3_n_0 ;
  wire \s_axi_rdata_reg[17]_i_2_n_0 ;
  wire \s_axi_rdata_reg[17]_i_3_n_0 ;
  wire \s_axi_rdata_reg[18]_i_2_n_0 ;
  wire \s_axi_rdata_reg[19]_i_4_n_0 ;
  wire \s_axi_rdata_reg[24]_i_3_n_0 ;
  wire \s_axi_rdata_reg[2]_i_4_n_0 ;
  wire \s_axi_rdata_reg[2]_i_7_n_0 ;
  wire \s_axi_rdata_reg[3]_i_2_n_0 ;
  wire \s_axi_rdata_reg[4]_i_10_n_0 ;
  wire \s_axi_rdata_reg[4]_i_2_n_0 ;
  wire \s_axi_rdata_reg[5]_i_10_n_0 ;
  wire [0:0]\s_axi_rdata_reg[5]_i_2_0 ;
  wire \s_axi_rdata_reg[5]_i_2_n_0 ;
  wire \s_axi_rdata_reg[6]_i_5_n_0 ;
  wire \s_axi_rdata_reg[6]_i_8_n_0 ;
  wire \s_axi_rdata_reg[7]_i_4_n_0 ;
  wire \s_axi_rdata_reg[7]_i_7_n_0 ;
  wire \s_axi_rdata_reg[8]_i_7_n_0 ;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire \s_axi_rresp[1]_i_1_n_0 ;
  wire \s_axi_rresp[1]_i_2_n_0 ;
  wire \s_axi_rresp[1]_i_3_n_0 ;
  wire \s_axi_rresp[1]_i_4_n_0 ;
  wire \s_axi_rresp[1]_i_5_n_0 ;
  wire s_axi_rvalid_i_1_n_0;
  wire s_axi_rvalid_reg_0;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [15:0]selected_average_q2;
  wire [63:0]selected_result_q16;
  wire soft_reset_pulse;
  wire soft_reset_pulse_i_1_n_0;
  wire soft_reset_pulse_reg_0;
  wire start_accepted;
  wire start_accepted_sticky;
  wire start_accepted_sticky_reg;
  wire start_pulse;
  wire start_pulse_i_1_n_0;
  wire start_pulse_reg_0;
  wire start_rejected_not_ready;
  wire start_rejected_sticky_reg;
  wire [24:3]status_word_d;
  wire \status_word_d[19]_i_1_n_0 ;
  wire \status_word_d[19]_i_2_n_0 ;
  wire \status_word_d[19]_i_3_n_0 ;
  wire \status_word_d[19]_i_4_n_0 ;
  wire \status_word_d[19]_i_5_n_0 ;
  wire \status_word_d[19]_i_6_n_0 ;
  wire \status_word_d[19]_i_7_n_0 ;
  wire \status_word_d[20]_i_1_n_0 ;
  wire \status_word_d[20]_i_2_n_0 ;
  wire \status_word_d[20]_i_3_n_0 ;
  wire \status_word_d[20]_i_4_n_0 ;
  wire \status_word_d[20]_i_5_n_0 ;
  wire \status_word_d[20]_i_6_n_0 ;
  wire \status_word_d[20]_i_7_n_0 ;
  wire \status_word_d_reg[3]_0 ;
  wire template_active_bank;
  wire [9:0]template_addr_ptr;
  wire \template_addr_ptr[5]_i_2_n_0 ;
  wire \template_addr_ptr[7]_i_2_n_0 ;
  wire \template_addr_ptr[8]_i_2_n_0 ;
  wire \template_addr_ptr[9]_i_1_n_0 ;
  wire \template_addr_ptr[9]_i_3_n_0 ;
  wire \template_addr_ptr[9]_i_4_n_0 ;
  wire \template_addr_ptr[9]_i_5_n_0 ;
  wire \template_addr_ptr[9]_i_6_n_0 ;
  wire \template_addr_ptr[9]_i_7_n_0 ;
  wire \template_addr_ptr[9]_i_8_n_0 ;
  wire \template_addr_ptr_reg_n_0_[0] ;
  wire \template_addr_ptr_reg_n_0_[1] ;
  wire \template_addr_ptr_reg_n_0_[2] ;
  wire \template_addr_ptr_reg_n_0_[3] ;
  wire \template_addr_ptr_reg_n_0_[4] ;
  wire \template_addr_ptr_reg_n_0_[5] ;
  wire \template_addr_ptr_reg_n_0_[6] ;
  wire \template_addr_ptr_reg_n_0_[7] ;
  wire \template_addr_ptr_reg_n_0_[8] ;
  wire \template_addr_ptr_reg_n_0_[9] ;
  wire template_coeff_valid;
  wire template_commit_accepted;
  wire template_commit_accepted_sticky_i_1_n_0;
  wire template_commit_accepted_sticky_reg_n_0;
  wire template_commit_pulse;
  wire template_commit_pulse_i_1_n_0;
  wire template_commit_pulse_i_2_n_0;
  wire template_commit_rejected;
  wire template_commit_rejected_sticky_i_1_n_0;
  wire template_commit_rejected_sticky_reg_n_0;
  wire [30:1]template_crc_state;
  wire \template_crc_state[0]_i_1_n_0 ;
  wire \template_crc_state[10]_i_1_n_0 ;
  wire \template_crc_state[10]_i_2_n_0 ;
  wire \template_crc_state[11]_i_1_n_0 ;
  wire \template_crc_state[11]_i_2_n_0 ;
  wire \template_crc_state[11]_i_3_n_0 ;
  wire \template_crc_state[12]_i_1_n_0 ;
  wire \template_crc_state[12]_i_2_n_0 ;
  wire \template_crc_state[13]_i_1_n_0 ;
  wire \template_crc_state[13]_i_2_n_0 ;
  wire \template_crc_state[14]_i_1_n_0 ;
  wire \template_crc_state[14]_i_2_n_0 ;
  wire \template_crc_state[14]_i_3_n_0 ;
  wire \template_crc_state[15]_i_1_n_0 ;
  wire \template_crc_state[15]_i_2_n_0 ;
  wire \template_crc_state[15]_i_3_n_0 ;
  wire \template_crc_state[16]_i_1_n_0 ;
  wire \template_crc_state[16]_i_2_n_0 ;
  wire \template_crc_state[16]_i_3_n_0 ;
  wire \template_crc_state[17]_i_1_n_0 ;
  wire \template_crc_state[17]_i_2_n_0 ;
  wire \template_crc_state[18]_i_1_n_0 ;
  wire \template_crc_state[18]_i_2_n_0 ;
  wire \template_crc_state[18]_i_3_n_0 ;
  wire \template_crc_state[19]_i_1_n_0 ;
  wire \template_crc_state[19]_i_2_n_0 ;
  wire \template_crc_state[19]_i_3_n_0 ;
  wire \template_crc_state[19]_i_4_n_0 ;
  wire \template_crc_state[20]_i_1_n_0 ;
  wire \template_crc_state[20]_i_2_n_0 ;
  wire \template_crc_state[21]_i_1_n_0 ;
  wire \template_crc_state[21]_i_2_n_0 ;
  wire \template_crc_state[21]_i_3_n_0 ;
  wire \template_crc_state[22]_i_1_n_0 ;
  wire \template_crc_state[22]_i_2_n_0 ;
  wire \template_crc_state[22]_i_3_n_0 ;
  wire \template_crc_state[23]_i_1_n_0 ;
  wire \template_crc_state[23]_i_2_n_0 ;
  wire \template_crc_state[23]_i_3_n_0 ;
  wire \template_crc_state[24]_i_1_n_0 ;
  wire \template_crc_state[24]_i_2_n_0 ;
  wire \template_crc_state[25]_i_1_n_0 ;
  wire \template_crc_state[25]_i_2_n_0 ;
  wire \template_crc_state[26]_i_1_n_0 ;
  wire \template_crc_state[26]_i_2_n_0 ;
  wire \template_crc_state[27]_i_1_n_0 ;
  wire \template_crc_state[27]_i_2_n_0 ;
  wire \template_crc_state[28]_i_1_n_0 ;
  wire \template_crc_state[28]_i_2_n_0 ;
  wire \template_crc_state[29]_i_1_n_0 ;
  wire \template_crc_state[29]_i_2_n_0 ;
  wire \template_crc_state[2]_i_1_n_0 ;
  wire \template_crc_state[30]_i_2_n_0 ;
  wire \template_crc_state[31]_i_1_n_0 ;
  wire \template_crc_state[31]_i_2_n_0 ;
  wire \template_crc_state[31]_i_3_n_0 ;
  wire \template_crc_state[3]_i_1_n_0 ;
  wire \template_crc_state[3]_i_2_n_0 ;
  wire \template_crc_state[5]_i_1_n_0 ;
  wire \template_crc_state[5]_i_2_n_0 ;
  wire \template_crc_state[6]_i_1_n_0 ;
  wire \template_crc_state[6]_i_2_n_0 ;
  wire \template_crc_state[6]_i_3_n_0 ;
  wire \template_crc_state[7]_i_1_n_0 ;
  wire \template_crc_state[7]_i_2_n_0 ;
  wire \template_crc_state[8]_i_1_n_0 ;
  wire \template_crc_state[9]_i_1_n_0 ;
  wire \template_crc_state[9]_i_2_n_0 ;
  wire \template_crc_state_reg_n_0_[0] ;
  wire \template_crc_state_reg_n_0_[10] ;
  wire \template_crc_state_reg_n_0_[11] ;
  wire \template_crc_state_reg_n_0_[12] ;
  wire \template_crc_state_reg_n_0_[13] ;
  wire \template_crc_state_reg_n_0_[14] ;
  wire \template_crc_state_reg_n_0_[15] ;
  wire \template_crc_state_reg_n_0_[16] ;
  wire \template_crc_state_reg_n_0_[17] ;
  wire \template_crc_state_reg_n_0_[18] ;
  wire \template_crc_state_reg_n_0_[19] ;
  wire \template_crc_state_reg_n_0_[1] ;
  wire \template_crc_state_reg_n_0_[20] ;
  wire \template_crc_state_reg_n_0_[21] ;
  wire \template_crc_state_reg_n_0_[22] ;
  wire \template_crc_state_reg_n_0_[23] ;
  wire \template_crc_state_reg_n_0_[24] ;
  wire \template_crc_state_reg_n_0_[25] ;
  wire \template_crc_state_reg_n_0_[26] ;
  wire \template_crc_state_reg_n_0_[27] ;
  wire \template_crc_state_reg_n_0_[28] ;
  wire \template_crc_state_reg_n_0_[29] ;
  wire \template_crc_state_reg_n_0_[2] ;
  wire \template_crc_state_reg_n_0_[30] ;
  wire \template_crc_state_reg_n_0_[31] ;
  wire \template_crc_state_reg_n_0_[3] ;
  wire \template_crc_state_reg_n_0_[4] ;
  wire \template_crc_state_reg_n_0_[5] ;
  wire \template_crc_state_reg_n_0_[6] ;
  wire \template_crc_state_reg_n_0_[7] ;
  wire \template_crc_state_reg_n_0_[8] ;
  wire \template_crc_state_reg_n_0_[9] ;
  wire template_load_complete32_out;
  wire template_load_complete_i_1_n_0;
  wire template_load_complete_i_2_n_0;
  wire template_load_complete_i_4_n_0;
  wire template_sequence_valid;
  wire template_sequence_valid_i_1_n_0;
  wire template_sequence_valid_i_3_n_0;
  wire template_sequence_valid_reg_n_0;
  wire [9:0]template_shadow_wr_addr;
  wire \template_shadow_wr_addr[9]_i_1_n_0 ;
  wire [15:0]template_shadow_wr_data_q14;
  wire template_shadow_wr_en;
  wire template_shadow_wr_en_i_1_n_0;
  wire [10:0]template_write_count;
  wire \template_write_count[10]_i_1_n_0 ;
  wire \template_write_count[10]_i_3_n_0 ;
  wire \template_write_count[10]_i_4_n_0 ;
  wire \template_write_count[10]_i_5_n_0 ;
  wire \template_write_count[10]_i_6_n_0 ;
  wire \template_write_count[1]_i_1_n_0 ;
  wire \template_write_count[5]_i_2_n_0 ;
  wire \template_write_count[9]_i_1_n_0 ;
  wire \template_write_count[9]_i_2_n_0 ;
  wire \template_write_count_reg_n_0_[0] ;
  wire \template_write_count_reg_n_0_[10] ;
  wire \template_write_count_reg_n_0_[1] ;
  wire \template_write_count_reg_n_0_[2] ;
  wire \template_write_count_reg_n_0_[3] ;
  wire \template_write_count_reg_n_0_[4] ;
  wire \template_write_count_reg_n_0_[5] ;
  wire \template_write_count_reg_n_0_[6] ;
  wire \template_write_count_reg_n_0_[7] ;
  wire \template_write_count_reg_n_0_[8] ;
  wire \template_write_count_reg_n_0_[9] ;
  wire w_pending48_out;
  wire w_pending_i_1_n_0;
  wire w_pending_reg_n_0;
  wire \wdata_hold_reg_n_0_[10] ;
  wire \wdata_hold_reg_n_0_[11] ;
  wire \wdata_hold_reg_n_0_[12] ;
  wire \wdata_hold_reg_n_0_[13] ;
  wire \wdata_hold_reg_n_0_[14] ;
  wire \wdata_hold_reg_n_0_[15] ;
  wire \wdata_hold_reg_n_0_[24] ;
  wire \wdata_hold_reg_n_0_[25] ;
  wire \wdata_hold_reg_n_0_[26] ;
  wire \wdata_hold_reg_n_0_[27] ;
  wire \wdata_hold_reg_n_0_[28] ;
  wire \wdata_hold_reg_n_0_[29] ;
  wire \wdata_hold_reg_n_0_[30] ;
  wire \wdata_hold_reg_n_0_[31] ;
  wire \wdata_hold_reg_n_0_[8] ;
  wire \wdata_hold_reg_n_0_[9] ;
  wire \wstrb_hold_reg_n_0_[0] ;
  wire \wstrb_hold_reg_n_0_[3] ;

  LUT6 #(
    .INIT(64'h3838383838383808)) 
    average_capture_pending_i_1
       (.I0(result_capture_pending_i_2_n_0),
        .I1(\average_select_addr[9]_i_1_n_0 ),
        .I2(average_capture_pending_reg_n_0),
        .I3(average_capture_wait[1]),
        .I4(average_capture_wait[0]),
        .I5(average_capture_wait[2]),
        .O(average_capture_pending_i_1_n_0));
  FDRE average_capture_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(average_capture_pending_i_1_n_0),
        .Q(average_capture_pending_reg_n_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h33FF32CC)) 
    \average_capture_wait[0]_i_1 
       (.I0(average_capture_wait[1]),
        .I1(average_capture_wait[0]),
        .I2(average_capture_wait[2]),
        .I3(average_capture_pending_reg_n_0),
        .I4(\average_select_addr[9]_i_1_n_0 ),
        .O(\average_capture_wait[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT5 #(
    .INIT(32'h99FF98AA)) 
    \average_capture_wait[1]_i_1 
       (.I0(average_capture_wait[1]),
        .I1(average_capture_wait[0]),
        .I2(average_capture_wait[2]),
        .I3(average_capture_pending_reg_n_0),
        .I4(\average_select_addr[9]_i_1_n_0 ),
        .O(\average_capture_wait[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT5 #(
    .INIT(32'hE100E0F0)) 
    \average_capture_wait[2]_i_1 
       (.I0(average_capture_wait[1]),
        .I1(average_capture_wait[0]),
        .I2(average_capture_wait[2]),
        .I3(average_capture_pending_reg_n_0),
        .I4(\average_select_addr[9]_i_1_n_0 ),
        .O(\average_capture_wait[2]_i_1_n_0 ));
  FDRE \average_capture_wait_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\average_capture_wait[0]_i_1_n_0 ),
        .Q(average_capture_wait[0]),
        .R(SR));
  FDRE \average_capture_wait_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\average_capture_wait[1]_i_1_n_0 ),
        .Q(average_capture_wait[1]),
        .R(SR));
  FDRE \average_capture_wait_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\average_capture_wait[2]_i_1_n_0 ),
        .Q(average_capture_wait[2]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \average_select_addr[8]_i_1 
       (.I0(p_0_in),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .O(data0[8]));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \average_select_addr[9]_i_1 
       (.I0(\last_error[3]_i_3_n_0 ),
        .I1(\average_select_addr[9]_i_3_n_0 ),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[6]),
        .I4(\average_select_addr[9]_i_4_n_0 ),
        .I5(awaddr_hold[2]),
        .O(\average_select_addr[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \average_select_addr[9]_i_2 
       (.I0(p_0_in),
        .I1(\wdata_hold_reg_n_0_[9] ),
        .O(data0[9]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \average_select_addr[9]_i_3 
       (.I0(average_frame_available_proc),
        .I1(busy),
        .I2(result_capture_pending_i_2_n_0),
        .I3(awaddr_hold[7]),
        .O(\average_select_addr[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \average_select_addr[9]_i_4 
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[4]),
        .O(\average_select_addr[9]_i_4_n_0 ));
  FDRE \average_select_addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(\result_select_addr[0]_i_1_n_0 ),
        .Q(average_select_addr[0]),
        .R(SR));
  FDRE \average_select_addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(p_15_in),
        .Q(average_select_addr[1]),
        .R(SR));
  FDRE \average_select_addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(p_4_in),
        .Q(average_select_addr[2]),
        .R(SR));
  FDRE \average_select_addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(p_5_in),
        .Q(average_select_addr[3]),
        .R(SR));
  FDRE \average_select_addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(p_6_in),
        .Q(average_select_addr[4]),
        .R(SR));
  FDRE \average_select_addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(\result_select_addr[5]_i_1_n_0 ),
        .Q(average_select_addr[5]),
        .R(SR));
  FDRE \average_select_addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(\result_select_addr[6]_i_1_n_0 ),
        .Q(average_select_addr[6]),
        .R(SR));
  FDRE \average_select_addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(\result_select_addr[7]_i_2_n_0 ),
        .Q(average_select_addr[7]),
        .R(SR));
  FDRE \average_select_addr_reg[8] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(data0[8]),
        .Q(average_select_addr[8]),
        .R(SR));
  FDRE \average_select_addr_reg[9] 
       (.C(s_axi_aclk),
        .CE(\average_select_addr[9]_i_1_n_0 ),
        .D(data0[9]),
        .Q(average_select_addr[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0100)) 
    \average_snapshot_q2[15]_i_1 
       (.I0(average_capture_wait[2]),
        .I1(average_capture_wait[0]),
        .I2(average_capture_wait[1]),
        .I3(average_capture_pending_reg_n_0),
        .O(\average_snapshot_q2[15]_i_1_n_0 ));
  FDRE \average_snapshot_q2_reg[0] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[0]),
        .Q(\average_snapshot_q2_reg_n_0_[0] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[10] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[10]),
        .Q(\average_snapshot_q2_reg_n_0_[10] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[11] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[11]),
        .Q(\average_snapshot_q2_reg_n_0_[11] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[12] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[12]),
        .Q(\average_snapshot_q2_reg_n_0_[12] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[13] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[13]),
        .Q(\average_snapshot_q2_reg_n_0_[13] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[14] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[14]),
        .Q(\average_snapshot_q2_reg_n_0_[14] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[15] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[15]),
        .Q(\average_snapshot_q2_reg_n_0_[15] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[1] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[1]),
        .Q(\average_snapshot_q2_reg_n_0_[1] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[2] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[2]),
        .Q(\average_snapshot_q2_reg_n_0_[2] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[3] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[3]),
        .Q(\average_snapshot_q2_reg_n_0_[3] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[4] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[4]),
        .Q(\average_snapshot_q2_reg_n_0_[4] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[5] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[5]),
        .Q(\average_snapshot_q2_reg_n_0_[5] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[6] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[6]),
        .Q(\average_snapshot_q2_reg_n_0_[6] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[7] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[7]),
        .Q(\average_snapshot_q2_reg_n_0_[7] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[8] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[8]),
        .Q(\average_snapshot_q2_reg_n_0_[8] ),
        .R(SR));
  FDRE \average_snapshot_q2_reg[9] 
       (.C(s_axi_aclk),
        .CE(\average_snapshot_q2[15]_i_1_n_0 ),
        .D(selected_average_q2[9]),
        .Q(\average_snapshot_q2_reg_n_0_[9] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFABBBFFFF0000)) 
    average_snapshot_valid_i_1
       (.I0(average_snapshot_valid_i_2_n_0),
        .I1(\average_select_addr[9]_i_3_n_0 ),
        .I2(awaddr_hold[4]),
        .I3(\result_select_addr[0]_i_1_n_0 ),
        .I4(\average_snapshot_q2[15]_i_1_n_0 ),
        .I5(average_snapshot_valid_reg_n_0),
        .O(average_snapshot_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFD1)) 
    average_snapshot_valid_i_2
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[4]),
        .I3(pn_enable_i_8_n_0),
        .I4(average_snapshot_valid_i_3_n_0),
        .I5(average_snapshot_valid_i_4_n_0),
        .O(average_snapshot_valid_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFFFCFFFEFF)) 
    average_snapshot_valid_i_3
       (.I0(awaddr_hold[2]),
        .I1(average_capture_pending_reg_n_0),
        .I2(result_capture_pending_reg_n_0),
        .I3(average_snapshot_valid_i_5_n_0),
        .I4(awaddr_hold[4]),
        .I5(awaddr_hold[7]),
        .O(average_snapshot_valid_i_3_n_0));
  LUT3 #(
    .INIT(8'hBF)) 
    average_snapshot_valid_i_4
       (.I0(s_axi_bvalid_reg_0),
        .I1(aw_pending_reg_n_0),
        .I2(w_pending_reg_n_0),
        .O(average_snapshot_valid_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h1)) 
    average_snapshot_valid_i_5
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[6]),
        .O(average_snapshot_valid_i_5_n_0));
  FDRE average_snapshot_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(average_snapshot_valid_i_1_n_0),
        .Q(average_snapshot_valid_reg_n_0),
        .R(SR));
  LUT4 #(
    .INIT(16'hAEAA)) 
    aw_pending_i_1
       (.I0(aw_pending44_out),
        .I1(s_axi_aresetn),
        .I2(pn_enable_i_3_n_0),
        .I3(aw_pending_reg_n_0),
        .O(aw_pending_i_1_n_0));
  FDRE aw_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(aw_pending_i_1_n_0),
        .Q(aw_pending_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \awaddr_hold[7]_i_1 
       (.I0(s_axi_awvalid),
        .I1(result_capture_pending_reg_n_0),
        .I2(average_capture_pending_reg_n_0),
        .I3(s_axi_aresetn),
        .I4(s_axi_bvalid_reg_0),
        .I5(aw_pending_reg_n_0),
        .O(aw_pending44_out));
  FDRE \awaddr_hold_reg[0] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[0]),
        .Q(awaddr_hold[0]),
        .R(SR));
  FDRE \awaddr_hold_reg[1] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[1]),
        .Q(awaddr_hold[1]),
        .R(SR));
  FDRE \awaddr_hold_reg[2] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[2]),
        .Q(awaddr_hold[2]),
        .R(SR));
  FDRE \awaddr_hold_reg[3] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[3]),
        .Q(awaddr_hold[3]),
        .R(SR));
  FDRE \awaddr_hold_reg[4] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[4]),
        .Q(awaddr_hold[4]),
        .R(SR));
  FDRE \awaddr_hold_reg[5] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[5]),
        .Q(awaddr_hold[5]),
        .R(SR));
  FDRE \awaddr_hold_reg[6] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[6]),
        .Q(awaddr_hold[6]),
        .R(SR));
  FDRE \awaddr_hold_reg[7] 
       (.C(s_axi_aclk),
        .CE(aw_pending44_out),
        .D(s_axi_awaddr[7]),
        .Q(awaddr_hold[7]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair212" *) 
  LUT4 #(
    .INIT(16'h0F88)) 
    \baseline_addr_ptr[0]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\baseline_addr_ptr_reg_n_0_[0] ),
        .I3(awaddr_hold[3]),
        .O(baseline_addr_ptr[0]));
  LUT5 #(
    .INIT(32'h6F606060)) 
    \baseline_addr_ptr[1]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[0] ),
        .I1(\baseline_addr_ptr_reg_n_0_[1] ),
        .I2(awaddr_hold[3]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[1]),
        .O(baseline_addr_ptr[1]));
  LUT6 #(
    .INIT(64'h6AFF6A006A006A00)) 
    \baseline_addr_ptr[2]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[2] ),
        .I1(\baseline_addr_ptr_reg_n_0_[0] ),
        .I2(\baseline_addr_ptr_reg_n_0_[1] ),
        .I3(awaddr_hold[3]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[2]),
        .O(baseline_addr_ptr[2]));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \baseline_addr_ptr[3]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[3] ),
        .I1(\baseline_addr_ptr_reg_n_0_[1] ),
        .I2(\baseline_addr_ptr_reg_n_0_[0] ),
        .I3(\baseline_addr_ptr_reg_n_0_[2] ),
        .I4(awaddr_hold[3]),
        .I5(p_5_in),
        .O(baseline_addr_ptr[3]));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT5 #(
    .INIT(32'h9F909090)) 
    \baseline_addr_ptr[4]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[4] ),
        .I1(\baseline_addr_ptr[5]_i_2_n_0 ),
        .I2(awaddr_hold[3]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[4]),
        .O(baseline_addr_ptr[4]));
  LUT6 #(
    .INIT(64'h9AFF9A009A009A00)) 
    \baseline_addr_ptr[5]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[5] ),
        .I1(\baseline_addr_ptr[5]_i_2_n_0 ),
        .I2(\baseline_addr_ptr_reg_n_0_[4] ),
        .I3(awaddr_hold[3]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[5]),
        .O(baseline_addr_ptr[5]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \baseline_addr_ptr[5]_i_2 
       (.I0(\baseline_addr_ptr_reg_n_0_[2] ),
        .I1(\baseline_addr_ptr_reg_n_0_[0] ),
        .I2(\baseline_addr_ptr_reg_n_0_[1] ),
        .I3(\baseline_addr_ptr_reg_n_0_[3] ),
        .O(\baseline_addr_ptr[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT5 #(
    .INIT(32'h9F909090)) 
    \baseline_addr_ptr[6]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[6] ),
        .I1(\baseline_addr_ptr[7]_i_2_n_0 ),
        .I2(awaddr_hold[3]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[6]),
        .O(baseline_addr_ptr[6]));
  LUT6 #(
    .INIT(64'hB4FFB400B400B400)) 
    \baseline_addr_ptr[7]_i_1 
       (.I0(\baseline_addr_ptr[7]_i_2_n_0 ),
        .I1(\baseline_addr_ptr_reg_n_0_[6] ),
        .I2(\baseline_addr_ptr_reg_n_0_[7] ),
        .I3(awaddr_hold[3]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[7]),
        .O(baseline_addr_ptr[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \baseline_addr_ptr[7]_i_2 
       (.I0(\baseline_addr_ptr_reg_n_0_[4] ),
        .I1(\baseline_addr_ptr_reg_n_0_[2] ),
        .I2(\baseline_addr_ptr_reg_n_0_[0] ),
        .I3(\baseline_addr_ptr_reg_n_0_[1] ),
        .I4(\baseline_addr_ptr_reg_n_0_[3] ),
        .I5(\baseline_addr_ptr_reg_n_0_[5] ),
        .O(\baseline_addr_ptr[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT5 #(
    .INIT(32'h6F606060)) 
    \baseline_addr_ptr[8]_i_1 
       (.I0(\baseline_addr_ptr_reg_n_0_[8] ),
        .I1(\baseline_addr_ptr[9]_i_5_n_0 ),
        .I2(awaddr_hold[3]),
        .I3(p_0_in),
        .I4(\wdata_hold_reg_n_0_[8] ),
        .O(baseline_addr_ptr[8]));
  LUT3 #(
    .INIT(8'hA8)) 
    \baseline_addr_ptr[9]_i_1 
       (.I0(\baseline_crc_state[31]_i_1_n_0 ),
        .I1(\baseline_addr_ptr[9]_i_3_n_0 ),
        .I2(\baseline_addr_ptr[9]_i_4_n_0 ),
        .O(\baseline_addr_ptr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AFF6A006A006A00)) 
    \baseline_addr_ptr[9]_i_2 
       (.I0(\baseline_addr_ptr_reg_n_0_[9] ),
        .I1(\baseline_addr_ptr_reg_n_0_[8] ),
        .I2(\baseline_addr_ptr[9]_i_5_n_0 ),
        .I3(awaddr_hold[3]),
        .I4(p_0_in),
        .I5(\wdata_hold_reg_n_0_[9] ),
        .O(baseline_addr_ptr[9]));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT5 #(
    .INIT(32'hF7FFFFFF)) 
    \baseline_addr_ptr[9]_i_3 
       (.I0(\baseline_addr_ptr_reg_n_0_[8] ),
        .I1(\baseline_addr_ptr_reg_n_0_[9] ),
        .I2(\baseline_addr_ptr[7]_i_2_n_0 ),
        .I3(\baseline_addr_ptr_reg_n_0_[6] ),
        .I4(\baseline_addr_ptr_reg_n_0_[7] ),
        .O(\baseline_addr_ptr[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair189" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \baseline_addr_ptr[9]_i_4 
       (.I0(result_capture_pending_i_2_n_0),
        .I1(busy),
        .I2(awaddr_hold[2]),
        .I3(awaddr_hold[3]),
        .O(\baseline_addr_ptr[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \baseline_addr_ptr[9]_i_5 
       (.I0(\baseline_addr_ptr_reg_n_0_[7] ),
        .I1(\baseline_addr_ptr_reg_n_0_[6] ),
        .I2(\baseline_addr_ptr[7]_i_2_n_0 ),
        .O(\baseline_addr_ptr[9]_i_5_n_0 ));
  FDRE \baseline_addr_ptr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[0]),
        .Q(\baseline_addr_ptr_reg_n_0_[0] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[1]),
        .Q(\baseline_addr_ptr_reg_n_0_[1] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[2]),
        .Q(\baseline_addr_ptr_reg_n_0_[2] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[3]),
        .Q(\baseline_addr_ptr_reg_n_0_[3] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[4]),
        .Q(\baseline_addr_ptr_reg_n_0_[4] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[5]),
        .Q(\baseline_addr_ptr_reg_n_0_[5] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[6]),
        .Q(\baseline_addr_ptr_reg_n_0_[6] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[7]),
        .Q(\baseline_addr_ptr_reg_n_0_[7] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[8] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[8]),
        .Q(\baseline_addr_ptr_reg_n_0_[8] ),
        .R(SR));
  FDRE \baseline_addr_ptr_reg[9] 
       (.C(s_axi_aclk),
        .CE(\baseline_addr_ptr[9]_i_1_n_0 ),
        .D(baseline_addr_ptr[9]),
        .Q(\baseline_addr_ptr_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair217" *) 
  LUT3 #(
    .INIT(8'h32)) 
    baseline_commit_accepted_sticky_i_1
       (.I0(baseline_commit_accepted),
        .I1(baseline_commit_accepted_sticky_i_2_n_0),
        .I2(baseline_commit_accepted_sticky_reg_n_0),
        .O(baseline_commit_accepted_sticky_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    baseline_commit_accepted_sticky_i_2
       (.I0(baseline_commit_accepted_sticky_i_3_n_0),
        .I1(awaddr_hold[7]),
        .I2(awaddr_hold[1]),
        .I3(awaddr_hold[0]),
        .I4(pn_enable_i_3_n_0),
        .O(baseline_commit_accepted_sticky_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFDFFFFFFFFF)) 
    baseline_commit_accepted_sticky_i_3
       (.I0(p_15_in),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[6]),
        .I4(awaddr_hold[3]),
        .I5(awaddr_hold[2]),
        .O(baseline_commit_accepted_sticky_i_3_n_0));
  FDRE baseline_commit_accepted_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_commit_accepted_sticky_i_1_n_0),
        .Q(baseline_commit_accepted_sticky_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    baseline_commit_pulse_i_1
       (.I0(\baseline_crc_state[31]_i_4_n_0 ),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[5]),
        .I3(baseline_commit_pulse_i_2_n_0),
        .I4(p_4_in),
        .I5(awaddr_hold[2]),
        .O(baseline_commit_pulse_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    baseline_commit_pulse_i_2
       (.I0(coeff_status_word[0]),
        .I1(busy),
        .O(baseline_commit_pulse_i_2_n_0));
  FDRE baseline_commit_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_commit_pulse_i_1_n_0),
        .Q(baseline_commit_pulse),
        .R(clear_status_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair218" *) 
  LUT3 #(
    .INIT(8'h32)) 
    baseline_commit_rejected_sticky_i_1
       (.I0(baseline_commit_rejected),
        .I1(baseline_commit_accepted_sticky_i_2_n_0),
        .I2(baseline_commit_rejected_sticky_reg_n_0),
        .O(baseline_commit_rejected_sticky_i_1_n_0));
  FDRE baseline_commit_rejected_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_commit_rejected_sticky_i_1_n_0),
        .Q(baseline_commit_rejected_sticky_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[0]_i_1 
       (.I0(\baseline_crc_state[21]_i_2_n_0 ),
        .I1(p_0_in1_in_0[6]),
        .I2(\baseline_crc_state_reg_n_0_[6] ),
        .I3(\baseline_crc_state_reg_n_0_[16] ),
        .I4(\baseline_crc_state[24]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7DD7D77DD77D7DD7)) 
    \baseline_crc_state[10]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_crc_state[21]_i_3_n_0 ),
        .I2(\baseline_crc_state_reg_n_0_[26] ),
        .I3(\baseline_crc_state[10]_i_2_n_0 ),
        .I4(\baseline_crc_state[10]_i_3_n_0 ),
        .I5(\baseline_crc_state[24]_i_2_n_0 ),
        .O(baseline_crc_state[10]));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \baseline_crc_state[10]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\baseline_crc_state_reg_n_0_[4] ),
        .O(\baseline_crc_state[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[10]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[2] ),
        .I1(p_0_in1_in_0[2]),
        .I2(\baseline_crc_state_reg_n_0_[1] ),
        .I3(p_0_in1_in_0[1]),
        .O(\baseline_crc_state[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[11]_i_1 
       (.I0(\baseline_crc_state[27]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[27] ),
        .I2(\baseline_crc_state[11]_i_2_n_0 ),
        .I3(\baseline_crc_state[11]_i_3_n_0 ),
        .I4(\baseline_crc_state[11]_i_4_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \baseline_crc_state[11]_i_2 
       (.I0(p_0_in1_in_0[0]),
        .I1(\baseline_crc_state_reg_n_0_[0] ),
        .O(\baseline_crc_state[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[11]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[3] ),
        .I1(p_0_in1_in_0[3]),
        .I2(\baseline_crc_state_reg_n_0_[2] ),
        .I3(p_0_in1_in_0[2]),
        .O(\baseline_crc_state[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \baseline_crc_state[11]_i_4 
       (.I0(\baseline_crc_state[21]_i_3_n_0 ),
        .I1(p_0_in1_in_0[7]),
        .I2(\baseline_crc_state_reg_n_0_[7] ),
        .I3(p_0_in1_in_0[1]),
        .I4(\baseline_crc_state_reg_n_0_[1] ),
        .O(\baseline_crc_state[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[12]_i_1 
       (.I0(\baseline_crc_state[12]_i_2_n_0 ),
        .I1(\baseline_crc_state[21]_i_2_n_0 ),
        .I2(\baseline_crc_state[12]_i_3_n_0 ),
        .I3(\baseline_crc_state[12]_i_4_n_0 ),
        .I4(\baseline_crc_state[28]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \baseline_crc_state[12]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[2] ),
        .I1(p_0_in1_in_0[2]),
        .I2(\baseline_crc_state_reg_n_0_[8] ),
        .I3(\wdata_hold_reg_n_0_[8] ),
        .O(\baseline_crc_state[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[12]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\baseline_crc_state_reg_n_0_[6] ),
        .I3(p_0_in1_in_0[6]),
        .O(\baseline_crc_state[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[12]_i_4 
       (.I0(\baseline_crc_state[9]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[3] ),
        .I2(p_0_in1_in_0[3]),
        .I3(\baseline_crc_state_reg_n_0_[4] ),
        .I4(p_0_in1_in_0[4]),
        .I5(\baseline_crc_state_reg_n_0_[28] ),
        .O(\baseline_crc_state[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[13]_i_1 
       (.I0(\baseline_crc_state[24]_i_3_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[29] ),
        .I2(\baseline_crc_state[22]_i_2_n_0 ),
        .I3(\baseline_crc_state[13]_i_2_n_0 ),
        .I4(\baseline_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[13]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[2] ),
        .I1(p_0_in1_in_0[2]),
        .I2(\baseline_crc_state_reg_n_0_[7] ),
        .I3(p_0_in1_in_0[7]),
        .O(\baseline_crc_state[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[14]_i_1 
       (.I0(\baseline_crc_state[30]_i_2_n_0 ),
        .I1(\baseline_crc_state[14]_i_2_n_0 ),
        .I2(\baseline_crc_state[21]_i_3_n_0 ),
        .I3(\baseline_crc_state[24]_i_2_n_0 ),
        .I4(\baseline_crc_state[24]_i_3_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[14]_i_2 
       (.I0(p_0_in1_in_0[2]),
        .I1(\baseline_crc_state_reg_n_0_[2] ),
        .I2(p_0_in1_in_0[3]),
        .I3(\baseline_crc_state_reg_n_0_[3] ),
        .I4(\baseline_crc_state[11]_i_2_n_0 ),
        .I5(\baseline_crc_state_reg_n_0_[30] ),
        .O(\baseline_crc_state[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[15]_i_1 
       (.I0(\baseline_crc_state[26]_i_2_n_0 ),
        .I1(\baseline_crc_state[15]_i_2_n_0 ),
        .I2(\baseline_crc_state[25]_i_2_n_0 ),
        .I3(\baseline_crc_state[15]_i_3_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[15]_i_2 
       (.I0(\baseline_crc_state[23]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\baseline_crc_state_reg_n_0_[1] ),
        .I4(p_0_in1_in_0[1]),
        .I5(\baseline_crc_state_reg_n_0_[31] ),
        .O(\baseline_crc_state[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[15]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[3] ),
        .I1(p_0_in1_in_0[3]),
        .I2(\baseline_crc_state_reg_n_0_[4] ),
        .I3(p_0_in1_in_0[4]),
        .O(\baseline_crc_state[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair205" *) 
  LUT4 #(
    .INIT(16'h9F6F)) 
    \baseline_crc_state[16]_i_1 
       (.I0(\baseline_crc_state[28]_i_2_n_0 ),
        .I1(\baseline_crc_state[26]_i_2_n_0 ),
        .I2(awaddr_hold[3]),
        .I3(\baseline_crc_state[16]_i_2_n_0 ),
        .O(baseline_crc_state[16]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \baseline_crc_state[16]_i_2 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\baseline_crc_state_reg_n_0_[8] ),
        .I2(\baseline_crc_state[22]_i_2_n_0 ),
        .I3(\baseline_crc_state[21]_i_2_n_0 ),
        .I4(\baseline_crc_state[9]_i_2_n_0 ),
        .O(\baseline_crc_state[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[17]_i_1 
       (.I0(\baseline_crc_state[28]_i_2_n_0 ),
        .I1(\baseline_crc_state[21]_i_3_n_0 ),
        .I2(\baseline_crc_state[17]_i_2_n_0 ),
        .I3(\baseline_crc_state[23]_i_3_n_0 ),
        .I4(\baseline_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[17]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[1] ),
        .I1(p_0_in1_in_0[1]),
        .I2(p_0_in1_in_0[2]),
        .I3(\baseline_crc_state_reg_n_0_[2] ),
        .I4(p_0_in1_in_0[3]),
        .I5(\baseline_crc_state_reg_n_0_[3] ),
        .O(\baseline_crc_state[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \baseline_crc_state[18]_i_1 
       (.I0(\baseline_crc_state[29]_i_2_n_0 ),
        .I1(\baseline_crc_state[18]_i_2_n_0 ),
        .I2(\baseline_crc_state[28]_i_2_n_0 ),
        .I3(\baseline_crc_state[30]_i_2_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[18]_i_2 
       (.I0(\baseline_crc_state[24]_i_2_n_0 ),
        .I1(\baseline_crc_state[25]_i_2_n_0 ),
        .I2(\baseline_crc_state_reg_n_0_[4] ),
        .I3(p_0_in1_in_0[4]),
        .I4(\baseline_crc_state[11]_i_3_n_0 ),
        .I5(\baseline_crc_state[23]_i_2_n_0 ),
        .O(\baseline_crc_state[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[19]_i_1 
       (.I0(\baseline_crc_state[30]_i_2_n_0 ),
        .I1(\baseline_crc_state[19]_i_2_n_0 ),
        .I2(\baseline_crc_state[19]_i_3_n_0 ),
        .I3(\baseline_crc_state[22]_i_3_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \baseline_crc_state[19]_i_2 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\baseline_crc_state_reg_n_0_[8] ),
        .I2(p_0_in1_in_0[2]),
        .I3(\baseline_crc_state_reg_n_0_[2] ),
        .I4(\baseline_crc_state[21]_i_2_n_0 ),
        .O(\baseline_crc_state[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[19]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[3] ),
        .I1(p_0_in1_in_0[3]),
        .I2(p_0_in1_in_0[4]),
        .I3(\baseline_crc_state_reg_n_0_[4] ),
        .I4(p_0_in1_in_0[5]),
        .I5(\baseline_crc_state_reg_n_0_[5] ),
        .O(\baseline_crc_state[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7DD7D77DD77D7DD7)) 
    \baseline_crc_state[1]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_crc_state[13]_i_2_n_0 ),
        .I2(\wdata_hold_reg_n_0_[8] ),
        .I3(\baseline_crc_state_reg_n_0_[8] ),
        .I4(\baseline_crc_state_reg_n_0_[17] ),
        .I5(\baseline_crc_state[27]_i_2_n_0 ),
        .O(baseline_crc_state[1]));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[20]_i_1 
       (.I0(\baseline_crc_state[30]_i_2_n_0 ),
        .I1(\baseline_crc_state[22]_i_2_n_0 ),
        .I2(\baseline_crc_state[23]_i_4_n_0 ),
        .I3(\baseline_crc_state[23]_i_3_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[21]_i_1 
       (.I0(\baseline_crc_state[24]_i_2_n_0 ),
        .I1(\baseline_crc_state[25]_i_2_n_0 ),
        .I2(\baseline_crc_state[21]_i_2_n_0 ),
        .I3(\baseline_crc_state[21]_i_3_n_0 ),
        .I4(\baseline_crc_state[21]_i_4_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \baseline_crc_state[21]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[1] ),
        .I1(p_0_in1_in_0[1]),
        .I2(\baseline_crc_state_reg_n_0_[7] ),
        .I3(p_0_in1_in_0[7]),
        .O(\baseline_crc_state[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[21]_i_3 
       (.I0(p_0_in1_in_0[6]),
        .I1(\baseline_crc_state_reg_n_0_[6] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\baseline_crc_state_reg_n_0_[0] ),
        .I4(\baseline_crc_state_reg_n_0_[5] ),
        .I5(p_0_in1_in_0[5]),
        .O(\baseline_crc_state[21]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \baseline_crc_state[21]_i_4 
       (.I0(\baseline_crc_state[31]_i_5_n_0 ),
        .I1(\baseline_crc_state[28]_i_2_n_0 ),
        .I2(\baseline_crc_state[29]_i_2_n_0 ),
        .O(\baseline_crc_state[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[22]_i_1 
       (.I0(\wdata_hold_reg_n_0_[14] ),
        .I1(\baseline_crc_state_reg_n_0_[14] ),
        .I2(\baseline_crc_state[22]_i_2_n_0 ),
        .I3(\baseline_crc_state[23]_i_2_n_0 ),
        .I4(\baseline_crc_state[22]_i_3_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair209" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[22]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[5] ),
        .I1(p_0_in1_in_0[5]),
        .I2(\baseline_crc_state_reg_n_0_[4] ),
        .I3(p_0_in1_in_0[4]),
        .O(\baseline_crc_state[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \baseline_crc_state[22]_i_3 
       (.I0(\baseline_crc_state[29]_i_2_n_0 ),
        .I1(\baseline_crc_state[26]_i_2_n_0 ),
        .O(\baseline_crc_state[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7DD7D77DD77D7DD7)) 
    \baseline_crc_state[23]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_crc_state[23]_i_2_n_0 ),
        .I2(\baseline_crc_state[23]_i_3_n_0 ),
        .I3(\baseline_crc_state[23]_i_4_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(\baseline_crc_state[30]_i_2_n_0 ),
        .O(baseline_crc_state[23]));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \baseline_crc_state[23]_i_2 
       (.I0(p_0_in1_in_0[6]),
        .I1(\baseline_crc_state_reg_n_0_[6] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\baseline_crc_state_reg_n_0_[0] ),
        .I4(\baseline_crc_state[21]_i_2_n_0 ),
        .O(\baseline_crc_state[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[23]_i_3 
       (.I0(\baseline_crc_state[27]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[2] ),
        .I2(p_0_in1_in_0[2]),
        .I3(\baseline_crc_state_reg_n_0_[8] ),
        .I4(\wdata_hold_reg_n_0_[8] ),
        .I5(\baseline_crc_state[25]_i_2_n_0 ),
        .O(\baseline_crc_state[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[23]_i_4 
       (.I0(p_0_in1_in_0[2]),
        .I1(\baseline_crc_state_reg_n_0_[2] ),
        .I2(p_0_in1_in_0[3]),
        .I3(\baseline_crc_state_reg_n_0_[3] ),
        .I4(\baseline_crc_state_reg_n_0_[12] ),
        .I5(\wdata_hold_reg_n_0_[12] ),
        .O(\baseline_crc_state[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hD77D7DD77DD7D77D)) 
    \baseline_crc_state[24]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_crc_state[24]_i_2_n_0 ),
        .I2(\baseline_crc_state[24]_i_3_n_0 ),
        .I3(\baseline_crc_state[31]_i_5_n_0 ),
        .I4(\baseline_crc_state[28]_i_2_n_0 ),
        .I5(\baseline_crc_state[29]_i_2_n_0 ),
        .O(baseline_crc_state[24]));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \baseline_crc_state[24]_i_2 
       (.I0(\baseline_crc_state[9]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[10] ),
        .I2(\baseline_crc_state_reg_n_0_[10] ),
        .I3(p_0_in1_in_0[4]),
        .I4(\baseline_crc_state_reg_n_0_[4] ),
        .O(\baseline_crc_state[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \baseline_crc_state[24]_i_3 
       (.I0(\baseline_crc_state[25]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\baseline_crc_state_reg_n_0_[8] ),
        .I3(p_0_in1_in_0[2]),
        .I4(\baseline_crc_state_reg_n_0_[2] ),
        .O(\baseline_crc_state[24]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \baseline_crc_state[25]_i_1 
       (.I0(\baseline_crc_state[29]_i_2_n_0 ),
        .I1(\baseline_crc_state[26]_i_2_n_0 ),
        .I2(\baseline_crc_state[25]_i_2_n_0 ),
        .I3(\baseline_crc_state[30]_i_2_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[25]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[3] ),
        .I1(p_0_in1_in_0[3]),
        .I2(\wdata_hold_reg_n_0_[9] ),
        .I3(\baseline_crc_state_reg_n_0_[9] ),
        .I4(p_0_in1_in_0[0]),
        .I5(\baseline_crc_state_reg_n_0_[0] ),
        .O(\baseline_crc_state[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \baseline_crc_state[26]_i_1 
       (.I0(\baseline_crc_state[28]_i_2_n_0 ),
        .I1(\baseline_crc_state[26]_i_2_n_0 ),
        .I2(\baseline_crc_state[31]_i_5_n_0 ),
        .I3(\baseline_crc_state[30]_i_2_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[26]_i_2 
       (.I0(\baseline_crc_state[27]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[4] ),
        .I2(p_0_in1_in_0[4]),
        .I3(\baseline_crc_state_reg_n_0_[10] ),
        .I4(\wdata_hold_reg_n_0_[10] ),
        .I5(\baseline_crc_state[9]_i_2_n_0 ),
        .O(\baseline_crc_state[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \baseline_crc_state[27]_i_1 
       (.I0(\baseline_crc_state[31]_i_5_n_0 ),
        .I1(\baseline_crc_state[28]_i_2_n_0 ),
        .I2(\baseline_crc_state[29]_i_2_n_0 ),
        .I3(\baseline_crc_state[27]_i_2_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[27]_i_2 
       (.I0(p_0_in1_in_0[1]),
        .I1(\baseline_crc_state_reg_n_0_[1] ),
        .I2(\baseline_crc_state[27]_i_3_n_0 ),
        .I3(\wdata_hold_reg_n_0_[11] ),
        .I4(\baseline_crc_state_reg_n_0_[11] ),
        .I5(\baseline_crc_state[27]_i_4_n_0 ),
        .O(\baseline_crc_state[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \baseline_crc_state[27]_i_3 
       (.I0(p_0_in1_in_0[2]),
        .I1(\baseline_crc_state_reg_n_0_[2] ),
        .O(\baseline_crc_state[27]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair209" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \baseline_crc_state[27]_i_4 
       (.I0(p_0_in1_in_0[5]),
        .I1(\baseline_crc_state_reg_n_0_[5] ),
        .O(\baseline_crc_state[27]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \baseline_crc_state[28]_i_1 
       (.I0(\baseline_crc_state[29]_i_2_n_0 ),
        .I1(\baseline_crc_state[28]_i_2_n_0 ),
        .I2(\baseline_crc_state[30]_i_2_n_0 ),
        .I3(awaddr_hold[3]),
        .O(\baseline_crc_state[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[28]_i_2 
       (.I0(\baseline_crc_state[11]_i_3_n_0 ),
        .I1(\wdata_hold_reg_n_0_[12] ),
        .I2(\baseline_crc_state_reg_n_0_[12] ),
        .I3(\baseline_crc_state[11]_i_2_n_0 ),
        .I4(\baseline_crc_state_reg_n_0_[6] ),
        .I5(p_0_in1_in_0[6]),
        .O(\baseline_crc_state[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair198" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \baseline_crc_state[29]_i_1 
       (.I0(\baseline_crc_state[30]_i_2_n_0 ),
        .I1(\baseline_crc_state[29]_i_2_n_0 ),
        .I2(\baseline_crc_state[31]_i_5_n_0 ),
        .I3(awaddr_hold[3]),
        .O(\baseline_crc_state[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \baseline_crc_state[29]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[13] ),
        .I1(\wdata_hold_reg_n_0_[13] ),
        .I2(\baseline_crc_state_reg_n_0_[3] ),
        .I3(p_0_in1_in_0[3]),
        .I4(\baseline_crc_state[10]_i_2_n_0 ),
        .I5(\baseline_crc_state[21]_i_2_n_0 ),
        .O(\baseline_crc_state[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[2]_i_1 
       (.I0(\baseline_crc_state[25]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\baseline_crc_state_reg_n_0_[8] ),
        .I3(\baseline_crc_state_reg_n_0_[18] ),
        .I4(\baseline_crc_state[28]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \baseline_crc_state[30]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_crc_state[30]_i_2_n_0 ),
        .I2(\baseline_crc_state[31]_i_5_n_0 ),
        .O(baseline_crc_state[30]));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \baseline_crc_state[30]_i_2 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\baseline_crc_state_reg_n_0_[8] ),
        .I2(p_0_in1_in_0[2]),
        .I3(\baseline_crc_state_reg_n_0_[2] ),
        .I4(\baseline_crc_state[8]_i_2_n_0 ),
        .O(\baseline_crc_state[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hE0000000)) 
    \baseline_crc_state[31]_i_1 
       (.I0(\baseline_addr_ptr[9]_i_4_n_0 ),
        .I1(\baseline_crc_state[31]_i_3_n_0 ),
        .I2(pn_enable_i_3_n_0),
        .I3(awaddr_hold[5]),
        .I4(\baseline_crc_state[31]_i_4_n_0 ),
        .O(\baseline_crc_state[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \baseline_crc_state[31]_i_2 
       (.I0(\baseline_crc_state[31]_i_5_n_0 ),
        .I1(awaddr_hold[3]),
        .O(\baseline_crc_state[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \baseline_crc_state[31]_i_3 
       (.I0(busy),
        .I1(p_0_in),
        .I2(\wstrb_hold_reg_n_0_[0] ),
        .I3(baseline_sequence_valid_reg_n_0),
        .I4(coeff_status_word[0]),
        .I5(\baseline_crc_state[31]_i_6_n_0 ),
        .O(\baseline_crc_state[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \baseline_crc_state[31]_i_4 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[0]),
        .I3(awaddr_hold[1]),
        .I4(awaddr_hold[7]),
        .O(\baseline_crc_state[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h9669)) 
    \baseline_crc_state[31]_i_5 
       (.I0(\baseline_crc_state[21]_i_3_n_0 ),
        .I1(\wdata_hold_reg_n_0_[15] ),
        .I2(\baseline_crc_state_reg_n_0_[15] ),
        .I3(\baseline_crc_state[25]_i_2_n_0 ),
        .O(\baseline_crc_state[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair189" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baseline_crc_state[31]_i_6 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[2]),
        .O(\baseline_crc_state[31]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \baseline_crc_state[3]_i_1 
       (.I0(\baseline_crc_state[24]_i_2_n_0 ),
        .I1(\baseline_crc_state[3]_i_2_n_0 ),
        .I2(\baseline_crc_state_reg_n_0_[19] ),
        .I3(\baseline_crc_state[29]_i_2_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[3]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\baseline_crc_state_reg_n_0_[9] ),
        .I3(\wdata_hold_reg_n_0_[9] ),
        .O(\baseline_crc_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[4]_i_1 
       (.I0(\baseline_crc_state[26]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[20] ),
        .I2(\baseline_crc_state[11]_i_2_n_0 ),
        .I3(\baseline_crc_state[10]_i_2_n_0 ),
        .I4(\baseline_crc_state[30]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT5 #(
    .INIT(32'h6996FFFF)) 
    \baseline_crc_state[5]_i_1 
       (.I0(\baseline_crc_state[28]_i_2_n_0 ),
        .I1(\baseline_crc_state[5]_i_2_n_0 ),
        .I2(\baseline_crc_state[27]_i_2_n_0 ),
        .I3(\baseline_crc_state[31]_i_5_n_0 ),
        .I4(awaddr_hold[3]),
        .O(\baseline_crc_state[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[5]_i_2 
       (.I0(p_0_in1_in_0[1]),
        .I1(\baseline_crc_state_reg_n_0_[1] ),
        .I2(\baseline_crc_state[11]_i_2_n_0 ),
        .I3(p_0_in1_in_0[5]),
        .I4(\baseline_crc_state_reg_n_0_[5] ),
        .I5(\baseline_crc_state_reg_n_0_[21] ),
        .O(\baseline_crc_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[6]_i_1 
       (.I0(\baseline_crc_state[28]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[22] ),
        .I2(\baseline_crc_state[12]_i_3_n_0 ),
        .I3(\baseline_crc_state[6]_i_2_n_0 ),
        .I4(\baseline_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[6]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[2] ),
        .I1(p_0_in1_in_0[2]),
        .I2(p_0_in1_in_0[1]),
        .I3(\baseline_crc_state_reg_n_0_[1] ),
        .I4(p_0_in1_in_0[0]),
        .I5(\baseline_crc_state_reg_n_0_[0] ),
        .O(\baseline_crc_state[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[7]_i_1 
       (.I0(\baseline_crc_state[29]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[23] ),
        .I2(\baseline_crc_state[21]_i_2_n_0 ),
        .I3(\baseline_crc_state[17]_i_2_n_0 ),
        .I4(\baseline_crc_state[30]_i_2_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \baseline_crc_state[8]_i_1 
       (.I0(\baseline_crc_state[8]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[24] ),
        .I2(\baseline_crc_state[11]_i_2_n_0 ),
        .I3(\baseline_crc_state[8]_i_3_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[8]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\baseline_crc_state_reg_n_0_[4] ),
        .I2(p_0_in1_in_0[5]),
        .I3(\baseline_crc_state_reg_n_0_[5] ),
        .I4(\baseline_crc_state_reg_n_0_[14] ),
        .I5(\wdata_hold_reg_n_0_[14] ),
        .O(\baseline_crc_state[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \baseline_crc_state[8]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[4] ),
        .I1(p_0_in1_in_0[4]),
        .I2(p_0_in1_in_0[2]),
        .I3(\baseline_crc_state_reg_n_0_[2] ),
        .I4(p_0_in1_in_0[3]),
        .I5(\baseline_crc_state_reg_n_0_[3] ),
        .O(\baseline_crc_state[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \baseline_crc_state[9]_i_1 
       (.I0(\baseline_crc_state[25]_i_2_n_0 ),
        .I1(\baseline_crc_state_reg_n_0_[25] ),
        .I2(\baseline_crc_state[9]_i_2_n_0 ),
        .I3(\baseline_crc_state[19]_i_3_n_0 ),
        .I4(\baseline_crc_state[31]_i_5_n_0 ),
        .I5(awaddr_hold[3]),
        .O(\baseline_crc_state[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair204" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \baseline_crc_state[9]_i_2 
       (.I0(\baseline_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\baseline_crc_state_reg_n_0_[1] ),
        .I3(p_0_in1_in_0[1]),
        .O(\baseline_crc_state[9]_i_2_n_0 ));
  FDSE \baseline_crc_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[0]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[0] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[10] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[10]),
        .Q(\baseline_crc_state_reg_n_0_[10] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[11] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[11]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[11] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[12] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[12]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[12] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[13] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[13]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[13] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[14] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[14]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[14] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[15] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[15]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[15] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[16] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[16]),
        .Q(\baseline_crc_state_reg_n_0_[16] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[17] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[17]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[17] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[18] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[18]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[18] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[19] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[19]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[19] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[1]),
        .Q(\baseline_crc_state_reg_n_0_[1] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[20] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[20]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[20] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[21] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[21]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[21] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[22] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[22]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[22] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[23] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[23]),
        .Q(\baseline_crc_state_reg_n_0_[23] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[24] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[24]),
        .Q(\baseline_crc_state_reg_n_0_[24] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[25] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[25]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[25] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[26] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[26]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[26] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[27] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[27]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[27] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[28] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[28]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[28] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[29] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[29]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[29] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[2]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[2] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[30] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(baseline_crc_state[30]),
        .Q(\baseline_crc_state_reg_n_0_[30] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[31] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[31]_i_2_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[31] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[3]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[3] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[4] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[4]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[4] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[5] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[5]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[5] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[6] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[6]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[6] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[7] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[7]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[7] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[8] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[8]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[8] ),
        .S(SR));
  FDSE \baseline_crc_state_reg[9] 
       (.C(s_axi_aclk),
        .CE(\baseline_crc_state[31]_i_1_n_0 ),
        .D(\baseline_crc_state[9]_i_1_n_0 ),
        .Q(\baseline_crc_state_reg_n_0_[9] ),
        .S(SR));
  LUT6 #(
    .INIT(64'hAA03BB33AA008800)) 
    baseline_load_complete_i_1
       (.I0(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .I1(baseline_commit_accepted),
        .I2(\baseline_addr_ptr[9]_i_4_n_0 ),
        .I3(baseline_load_complete_i_2_n_0),
        .I4(\baseline_crc_state[31]_i_1_n_0 ),
        .I5(coeff_status_word[0]),
        .O(baseline_load_complete_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair201" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    baseline_load_complete_i_2
       (.I0(\baseline_write_count_reg_n_0_[10] ),
        .I1(\baseline_write_count_reg_n_0_[9] ),
        .I2(\baseline_write_count[10]_i_3_n_0 ),
        .I3(\baseline_addr_ptr[9]_i_3_n_0 ),
        .O(baseline_load_complete_i_2_n_0));
  FDRE baseline_load_complete_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_load_complete_i_1_n_0),
        .Q(coeff_status_word[0]),
        .R(SR));
  LUT5 #(
    .INIT(32'hBBBF8880)) 
    baseline_sequence_valid_i_1
       (.I0(baseline_sequence_valid),
        .I1(\baseline_crc_state[31]_i_1_n_0 ),
        .I2(baseline_sequence_valid_i_3_n_0),
        .I3(\baseline_addr_ptr[9]_i_4_n_0 ),
        .I4(baseline_sequence_valid_reg_n_0),
        .O(baseline_sequence_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    baseline_sequence_valid_i_2
       (.I0(pn_enable_i_6_n_0),
        .I1(data0[9]),
        .I2(data0[8]),
        .I3(result_capture_pending_i_2_n_0),
        .I4(\result_select_addr[0]_i_1_n_0 ),
        .I5(awaddr_hold[3]),
        .O(baseline_sequence_valid));
  (* SOFT_HLUTNM = "soft_lutpair201" *) 
  LUT4 #(
    .INIT(16'h00BF)) 
    baseline_sequence_valid_i_3
       (.I0(\baseline_write_count_reg_n_0_[10] ),
        .I1(\baseline_write_count_reg_n_0_[9] ),
        .I2(\baseline_write_count[10]_i_3_n_0 ),
        .I3(\baseline_addr_ptr[9]_i_3_n_0 ),
        .O(baseline_sequence_valid_i_3_n_0));
  FDRE baseline_sequence_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_sequence_valid_i_1_n_0),
        .Q(baseline_sequence_valid_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \baseline_shadow_wr_addr[9]_i_1 
       (.I0(awaddr_hold[5]),
        .I1(\baseline_crc_state[31]_i_4_n_0 ),
        .I2(baseline_shadow_wr_en_i_2_n_0),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[3]),
        .I5(pn_enable_i_3_n_0),
        .O(\baseline_shadow_wr_addr[9]_i_1_n_0 ));
  FDRE \baseline_shadow_wr_addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[0] ),
        .Q(baseline_shadow_wr_addr[0]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[1] ),
        .Q(baseline_shadow_wr_addr[1]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[2] ),
        .Q(baseline_shadow_wr_addr[2]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[3] ),
        .Q(baseline_shadow_wr_addr[3]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[4] ),
        .Q(baseline_shadow_wr_addr[4]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[5] ),
        .Q(baseline_shadow_wr_addr[5]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[6] ),
        .Q(baseline_shadow_wr_addr[6]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[7] ),
        .Q(baseline_shadow_wr_addr[7]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[8] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[8] ),
        .Q(baseline_shadow_wr_addr[8]),
        .R(SR));
  FDRE \baseline_shadow_wr_addr_reg[9] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\baseline_addr_ptr_reg_n_0_[9] ),
        .Q(baseline_shadow_wr_addr[9]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[0] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[0]),
        .Q(baseline_shadow_wr_data_q2[0]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[10] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[10] ),
        .Q(baseline_shadow_wr_data_q2[10]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[11] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[11] ),
        .Q(baseline_shadow_wr_data_q2[11]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[12] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[12] ),
        .Q(baseline_shadow_wr_data_q2[12]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[13] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[13] ),
        .Q(baseline_shadow_wr_data_q2[13]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[14] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[14] ),
        .Q(baseline_shadow_wr_data_q2[14]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[15] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[15] ),
        .Q(baseline_shadow_wr_data_q2[15]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[1] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[1]),
        .Q(baseline_shadow_wr_data_q2[1]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[2] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[2]),
        .Q(baseline_shadow_wr_data_q2[2]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[3] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[3]),
        .Q(baseline_shadow_wr_data_q2[3]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[4] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[4]),
        .Q(baseline_shadow_wr_data_q2[4]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[5] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[5]),
        .Q(baseline_shadow_wr_data_q2[5]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[6] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[6]),
        .Q(baseline_shadow_wr_data_q2[6]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[7] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[7]),
        .Q(baseline_shadow_wr_data_q2[7]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[8] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[8] ),
        .Q(baseline_shadow_wr_data_q2[8]),
        .R(SR));
  FDRE \baseline_shadow_wr_data_q2_reg[9] 
       (.C(s_axi_aclk),
        .CE(\baseline_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[9] ),
        .Q(baseline_shadow_wr_data_q2[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    baseline_shadow_wr_en_i_1
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[2]),
        .I2(baseline_shadow_wr_en_i_2_n_0),
        .I3(\baseline_crc_state[31]_i_4_n_0 ),
        .I4(awaddr_hold[5]),
        .O(baseline_shadow_wr_en_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    baseline_shadow_wr_en_i_2
       (.I0(coeff_status_word[0]),
        .I1(baseline_sequence_valid_reg_n_0),
        .I2(\wstrb_hold_reg_n_0_[0] ),
        .I3(p_0_in),
        .I4(busy),
        .O(baseline_shadow_wr_en_i_2_n_0));
  FDRE baseline_shadow_wr_en_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_shadow_wr_en_i_1_n_0),
        .Q(baseline_shadow_wr_en),
        .R(clear_status_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair222" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \baseline_write_count[0]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[0] ),
        .O(baseline_write_count[0]));
  LUT6 #(
    .INIT(64'hEEEEFEEE00000000)) 
    \baseline_write_count[10]_i_1 
       (.I0(\baseline_addr_ptr[9]_i_4_n_0 ),
        .I1(\baseline_addr_ptr[9]_i_3_n_0 ),
        .I2(\baseline_write_count[10]_i_3_n_0 ),
        .I3(\baseline_write_count_reg_n_0_[9] ),
        .I4(\baseline_write_count_reg_n_0_[10] ),
        .I5(\baseline_crc_state[31]_i_1_n_0 ),
        .O(\baseline_write_count[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair211" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \baseline_write_count[10]_i_2 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[9] ),
        .I2(\baseline_write_count[10]_i_3_n_0 ),
        .I3(\baseline_write_count_reg_n_0_[10] ),
        .O(baseline_write_count[10]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \baseline_write_count[10]_i_3 
       (.I0(\baseline_write_count_reg_n_0_[8] ),
        .I1(\baseline_write_count_reg_n_0_[5] ),
        .I2(\baseline_write_count_reg_n_0_[4] ),
        .I3(\baseline_write_count_reg_n_0_[7] ),
        .I4(\baseline_write_count_reg_n_0_[6] ),
        .I5(\baseline_write_count[7]_i_2_n_0 ),
        .O(\baseline_write_count[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair202" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \baseline_write_count[1]_i_1 
       (.I0(\baseline_write_count_reg_n_0_[1] ),
        .I1(\baseline_write_count_reg_n_0_[0] ),
        .I2(awaddr_hold[3]),
        .O(\baseline_write_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \baseline_write_count[2]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[0] ),
        .I2(\baseline_write_count_reg_n_0_[1] ),
        .I3(\baseline_write_count_reg_n_0_[2] ),
        .O(baseline_write_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \baseline_write_count[3]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[1] ),
        .I2(\baseline_write_count_reg_n_0_[0] ),
        .I3(\baseline_write_count_reg_n_0_[2] ),
        .I4(\baseline_write_count_reg_n_0_[3] ),
        .O(baseline_write_count[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \baseline_write_count[4]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[2] ),
        .I2(\baseline_write_count_reg_n_0_[0] ),
        .I3(\baseline_write_count_reg_n_0_[1] ),
        .I4(\baseline_write_count_reg_n_0_[3] ),
        .I5(\baseline_write_count_reg_n_0_[4] ),
        .O(baseline_write_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT4 #(
    .INIT(16'h8A20)) 
    \baseline_write_count[5]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count[7]_i_2_n_0 ),
        .I2(\baseline_write_count_reg_n_0_[4] ),
        .I3(\baseline_write_count_reg_n_0_[5] ),
        .O(baseline_write_count[5]));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \baseline_write_count[6]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[4] ),
        .I2(\baseline_write_count[7]_i_2_n_0 ),
        .I3(\baseline_write_count_reg_n_0_[5] ),
        .I4(\baseline_write_count_reg_n_0_[6] ),
        .O(baseline_write_count[6]));
  LUT6 #(
    .INIT(64'hA2AAAAAA08000000)) 
    \baseline_write_count[7]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count_reg_n_0_[5] ),
        .I2(\baseline_write_count[7]_i_2_n_0 ),
        .I3(\baseline_write_count_reg_n_0_[4] ),
        .I4(\baseline_write_count_reg_n_0_[6] ),
        .I5(\baseline_write_count_reg_n_0_[7] ),
        .O(baseline_write_count[7]));
  (* SOFT_HLUTNM = "soft_lutpair202" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \baseline_write_count[7]_i_2 
       (.I0(\baseline_write_count_reg_n_0_[2] ),
        .I1(\baseline_write_count_reg_n_0_[0] ),
        .I2(\baseline_write_count_reg_n_0_[1] ),
        .I3(\baseline_write_count_reg_n_0_[3] ),
        .O(\baseline_write_count[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair222" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \baseline_write_count[8]_i_1 
       (.I0(awaddr_hold[3]),
        .I1(\baseline_write_count[8]_i_2_n_0 ),
        .I2(\baseline_write_count_reg_n_0_[8] ),
        .O(baseline_write_count[8]));
  LUT5 #(
    .INIT(32'hBFFFFFFF)) 
    \baseline_write_count[8]_i_2 
       (.I0(\baseline_write_count[7]_i_2_n_0 ),
        .I1(\baseline_write_count_reg_n_0_[6] ),
        .I2(\baseline_write_count_reg_n_0_[7] ),
        .I3(\baseline_write_count_reg_n_0_[4] ),
        .I4(\baseline_write_count_reg_n_0_[5] ),
        .O(\baseline_write_count[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair211" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \baseline_write_count[9]_i_1 
       (.I0(\baseline_write_count[10]_i_3_n_0 ),
        .I1(\baseline_write_count_reg_n_0_[9] ),
        .I2(awaddr_hold[3]),
        .O(\baseline_write_count[9]_i_1_n_0 ));
  FDRE \baseline_write_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[0]),
        .Q(\baseline_write_count_reg_n_0_[0] ),
        .R(SR));
  FDRE \baseline_write_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[10]),
        .Q(\baseline_write_count_reg_n_0_[10] ),
        .R(SR));
  FDRE \baseline_write_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(\baseline_write_count[1]_i_1_n_0 ),
        .Q(\baseline_write_count_reg_n_0_[1] ),
        .R(SR));
  FDRE \baseline_write_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[2]),
        .Q(\baseline_write_count_reg_n_0_[2] ),
        .R(SR));
  FDRE \baseline_write_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[3]),
        .Q(\baseline_write_count_reg_n_0_[3] ),
        .R(SR));
  FDRE \baseline_write_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[4]),
        .Q(\baseline_write_count_reg_n_0_[4] ),
        .R(SR));
  FDRE \baseline_write_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[5]),
        .Q(\baseline_write_count_reg_n_0_[5] ),
        .R(SR));
  FDRE \baseline_write_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[6]),
        .Q(\baseline_write_count_reg_n_0_[6] ),
        .R(SR));
  FDRE \baseline_write_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[7]),
        .Q(\baseline_write_count_reg_n_0_[7] ),
        .R(SR));
  FDRE \baseline_write_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(baseline_write_count[8]),
        .Q(\baseline_write_count_reg_n_0_[8] ),
        .R(SR));
  FDRE \baseline_write_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\baseline_write_count[10]_i_1_n_0 ),
        .D(\baseline_write_count[9]_i_1_n_0 ),
        .Q(\baseline_write_count_reg_n_0_[9] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFBFFFFFFFFFFFF)) 
    clear_status_pulse_i_1
       (.I0(s_axi_bvalid_reg_0),
        .I1(s_axi_aresetn),
        .I2(average_capture_pending_reg_n_0),
        .I3(result_capture_pending_reg_n_0),
        .I4(aw_pending_reg_n_0),
        .I5(w_pending_reg_n_0),
        .O(clear_status_pulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000080000000000)) 
    clear_status_pulse_i_2
       (.I0(clear_status_pulse_i_3_n_0),
        .I1(awaddr_hold[2]),
        .I2(awaddr_hold[3]),
        .I3(clear_status_pulse_i_4_n_0),
        .I4(awaddr_hold[5]),
        .I5(p_15_in),
        .O(clear_status_pulse_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'h01)) 
    clear_status_pulse_i_3
       (.I0(awaddr_hold[7]),
        .I1(awaddr_hold[1]),
        .I2(awaddr_hold[0]),
        .O(clear_status_pulse_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT2 #(
    .INIT(4'h2)) 
    clear_status_pulse_i_4
       (.I0(awaddr_hold[4]),
        .I1(awaddr_hold[6]),
        .O(clear_status_pulse_i_4_n_0));
  FDRE clear_status_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(clear_status_pulse_i_2_n_0),
        .Q(clear_status_pulse),
        .R(clear_status_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    done_sticky_i_1
       (.I0(soft_reset_pulse),
        .I1(clear_status_pulse),
        .I2(s_axi_aresetn),
        .O(soft_reset_pulse_reg_0));
  LUT6 #(
    .INIT(64'hDDD0DDD0DDD0DDDD)) 
    error_event_pulse_i_1
       (.I0(error_event_pulse_i_2_n_0),
        .I1(pn_enable_i_3_n_0),
        .I2(error_event_pulse_i_3_n_0),
        .I3(error_event_pulse_i_4_n_0),
        .I4(error_event_pulse_i_5_n_0),
        .I5(error_event_pulse_i_6_n_0),
        .O(error_event_pulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h88888808FFFFFFFF)) 
    error_event_pulse_i_10
       (.I0(\s_axi_bresp[1]_i_16_n_0 ),
        .I1(error_event_pulse_i_11_n_0),
        .I2(awaddr_hold[7]),
        .I3(awaddr_hold[6]),
        .I4(awaddr_hold[3]),
        .I5(error_event_pulse_i_12_n_0),
        .O(error_event_pulse_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT2 #(
    .INIT(4'h2)) 
    error_event_pulse_i_11
       (.I0(awaddr_hold[4]),
        .I1(awaddr_hold[5]),
        .O(error_event_pulse_i_11_n_0));
  LUT6 #(
    .INIT(64'hFF2AFF2800000000)) 
    error_event_pulse_i_12
       (.I0(error_event_pulse_i_13_n_0),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[5]),
        .I3(error_event_pulse_i_2_n_0),
        .I4(awaddr_hold[4]),
        .I5(\last_error[3]_i_3_n_0 ),
        .O(error_event_pulse_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT5 #(
    .INIT(32'hF30F032F)) 
    error_event_pulse_i_13
       (.I0(awaddr_hold[7]),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[5]),
        .I4(awaddr_hold[3]),
        .O(error_event_pulse_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair218" *) 
  LUT2 #(
    .INIT(4'h1)) 
    error_event_pulse_i_2
       (.I0(baseline_commit_rejected),
        .I1(template_commit_rejected),
        .O(error_event_pulse_i_2_n_0));
  LUT6 #(
    .INIT(64'h00000000EAEAEEFF)) 
    error_event_pulse_i_3
       (.I0(error_event_pulse_i_7_n_0),
        .I1(error_event_pulse_i_8_n_0),
        .I2(\template_addr_ptr[9]_i_8_n_0 ),
        .I3(awaddr_hold[4]),
        .I4(error_event_pulse_i_2_n_0),
        .I5(\s_axi_bresp[1]_i_3_n_0 ),
        .O(error_event_pulse_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF5400FE00)) 
    error_event_pulse_i_4
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[7]),
        .I2(error_event_pulse_i_9_n_0),
        .I3(awaddr_hold[5]),
        .I4(awaddr_hold[4]),
        .I5(error_event_pulse_i_10_n_0),
        .O(error_event_pulse_i_4_n_0));
  LUT6 #(
    .INIT(64'h000000003030303B)) 
    error_event_pulse_i_5
       (.I0(pn_enable_i_2_n_0),
        .I1(awaddr_hold[7]),
        .I2(awaddr_hold[6]),
        .I3(template_commit_rejected),
        .I4(baseline_commit_rejected),
        .I5(awaddr_hold[3]),
        .O(error_event_pulse_i_5_n_0));
  LUT6 #(
    .INIT(64'h003000300030003A)) 
    error_event_pulse_i_6
       (.I0(\average_select_addr[9]_i_3_n_0 ),
        .I1(awaddr_hold[7]),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[6]),
        .I4(template_commit_rejected),
        .I5(baseline_commit_rejected),
        .O(error_event_pulse_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT5 #(
    .INIT(32'h23FFE3FF)) 
    error_event_pulse_i_7
       (.I0(\last_error[9]_i_4_n_0 ),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[5]),
        .O(error_event_pulse_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT2 #(
    .INIT(4'h8)) 
    error_event_pulse_i_8
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[3]),
        .O(error_event_pulse_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT5 #(
    .INIT(32'hFAFFF300)) 
    error_event_pulse_i_9
       (.I0(\pulse_config_word[2]_i_5_n_0 ),
        .I1(result_capture_pending_i_2_n_0),
        .I2(busy),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[6]),
        .O(error_event_pulse_i_9_n_0));
  FDRE error_event_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(error_event_pulse_i_1_n_0),
        .Q(error_event_pulse_reg_n_0),
        .R(SR));
  LUT3 #(
    .INIT(8'h08)) 
    \irq_enable[15]_i_1 
       (.I0(\irq_enable[31]_i_2_n_0 ),
        .I1(p_0_in),
        .I2(\irq_enable[31]_i_3_n_0 ),
        .O(p_1_in__0[15]));
  LUT3 #(
    .INIT(8'h08)) 
    \irq_enable[23]_i_1 
       (.I0(\irq_enable[31]_i_2_n_0 ),
        .I1(data00),
        .I2(\irq_enable[31]_i_3_n_0 ),
        .O(p_1_in__0[23]));
  LUT3 #(
    .INIT(8'h08)) 
    \irq_enable[31]_i_1 
       (.I0(\irq_enable[31]_i_2_n_0 ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\irq_enable[31]_i_3_n_0 ),
        .O(p_1_in__0[31]));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \irq_enable[31]_i_2 
       (.I0(awaddr_hold[5]),
        .I1(average_capture_pending_reg_n_0),
        .I2(awaddr_hold[3]),
        .I3(pn_enable_i_8_n_0),
        .I4(\irq_enable[31]_i_4_n_0 ),
        .I5(s_axi_bvalid_i_5_n_0),
        .O(\irq_enable[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hD0D0D0D0FFFFD0FF)) 
    \irq_enable[31]_i_3 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[6]),
        .I5(awaddr_hold[7]),
        .O(\irq_enable[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair234" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \irq_enable[31]_i_4 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[7]),
        .O(\irq_enable[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \irq_enable[7]_i_1 
       (.I0(\irq_enable[31]_i_2_n_0 ),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\irq_enable[31]_i_3_n_0 ),
        .O(p_1_in__0[7]));
  FDRE \irq_enable_reg[0] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[0]),
        .Q(\irq_enable_reg_n_0_[0] ),
        .R(SR));
  FDRE \irq_enable_reg[10] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[10] ),
        .Q(\irq_enable_reg_n_0_[10] ),
        .R(SR));
  FDRE \irq_enable_reg[11] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[11] ),
        .Q(\irq_enable_reg_n_0_[11] ),
        .R(SR));
  FDRE \irq_enable_reg[12] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[12] ),
        .Q(\irq_enable_reg_n_0_[12] ),
        .R(SR));
  FDRE \irq_enable_reg[13] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[13] ),
        .Q(\irq_enable_reg_n_0_[13] ),
        .R(SR));
  FDRE \irq_enable_reg[14] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[14] ),
        .Q(\irq_enable_reg_n_0_[14] ),
        .R(SR));
  FDRE \irq_enable_reg[15] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[15] ),
        .Q(\irq_enable_reg_n_0_[15] ),
        .R(SR));
  FDRE \irq_enable_reg[16] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[0]),
        .Q(\irq_enable_reg_n_0_[16] ),
        .R(SR));
  FDRE \irq_enable_reg[17] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[1]),
        .Q(\irq_enable_reg_n_0_[17] ),
        .R(SR));
  FDRE \irq_enable_reg[18] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[2]),
        .Q(\irq_enable_reg_n_0_[18] ),
        .R(SR));
  FDRE \irq_enable_reg[19] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[3]),
        .Q(\irq_enable_reg_n_0_[19] ),
        .R(SR));
  FDRE \irq_enable_reg[1] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[1]),
        .Q(\irq_enable_reg_n_0_[1] ),
        .R(SR));
  FDRE \irq_enable_reg[20] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[4]),
        .Q(\irq_enable_reg_n_0_[20] ),
        .R(SR));
  FDRE \irq_enable_reg[21] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[5]),
        .Q(\irq_enable_reg_n_0_[21] ),
        .R(SR));
  FDRE \irq_enable_reg[22] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[6]),
        .Q(\irq_enable_reg_n_0_[22] ),
        .R(SR));
  FDRE \irq_enable_reg[23] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[23]),
        .D(p_2_in[7]),
        .Q(\irq_enable_reg_n_0_[23] ),
        .R(SR));
  FDRE \irq_enable_reg[24] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[24] ),
        .Q(\irq_enable_reg_n_0_[24] ),
        .R(SR));
  FDRE \irq_enable_reg[25] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[25] ),
        .Q(\irq_enable_reg_n_0_[25] ),
        .R(SR));
  FDRE \irq_enable_reg[26] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[26] ),
        .Q(\irq_enable_reg_n_0_[26] ),
        .R(SR));
  FDRE \irq_enable_reg[27] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[27] ),
        .Q(\irq_enable_reg_n_0_[27] ),
        .R(SR));
  FDRE \irq_enable_reg[28] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[28] ),
        .Q(\irq_enable_reg_n_0_[28] ),
        .R(SR));
  FDRE \irq_enable_reg[29] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[29] ),
        .Q(\irq_enable_reg_n_0_[29] ),
        .R(SR));
  FDRE \irq_enable_reg[2] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[2]),
        .Q(\irq_enable_reg_n_0_[2] ),
        .R(SR));
  FDRE \irq_enable_reg[30] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[30] ),
        .Q(\irq_enable_reg_n_0_[30] ),
        .R(SR));
  FDRE \irq_enable_reg[31] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[31]),
        .D(\wdata_hold_reg_n_0_[31] ),
        .Q(\irq_enable_reg_n_0_[31] ),
        .R(SR));
  FDRE \irq_enable_reg[3] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[3]),
        .Q(\irq_enable_reg_n_0_[3] ),
        .R(SR));
  FDRE \irq_enable_reg[4] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[4]),
        .Q(\irq_enable_reg_n_0_[4] ),
        .R(SR));
  FDRE \irq_enable_reg[5] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[5]),
        .Q(\irq_enable_reg_n_0_[5] ),
        .R(SR));
  FDRE \irq_enable_reg[6] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[6]),
        .Q(\irq_enable_reg_n_0_[6] ),
        .R(SR));
  FDRE \irq_enable_reg[7] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[7]),
        .D(p_0_in1_in_0[7]),
        .Q(\irq_enable_reg_n_0_[7] ),
        .R(SR));
  FDRE \irq_enable_reg[8] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[8] ),
        .Q(\irq_enable_reg_n_0_[8] ),
        .R(SR));
  FDRE \irq_enable_reg[9] 
       (.C(s_axi_aclk),
        .CE(p_1_in__0[15]),
        .D(\wdata_hold_reg_n_0_[9] ),
        .Q(\irq_enable_reg_n_0_[9] ),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    irq_f2p_INST_0
       (.I0(\irq_status_reg_n_0_[0] ),
        .I1(\irq_enable_reg_n_0_[0] ),
        .I2(\irq_status_reg_n_0_[1] ),
        .I3(\irq_enable_reg_n_0_[1] ),
        .I4(irq_f2p_INST_0_i_1_n_0),
        .O(irq_f2p));
  LUT4 #(
    .INIT(16'hF888)) 
    irq_f2p_INST_0_i_1
       (.I0(\irq_enable_reg_n_0_[2] ),
        .I1(\irq_status_reg_n_0_[2] ),
        .I2(\irq_enable_reg_n_0_[3] ),
        .I3(\irq_status_reg_n_0_[3] ),
        .O(irq_f2p_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h4F4F4FFF44444444)) 
    \irq_status[0]_i_1 
       (.I0(status_word_d[6]),
        .I1(D[0]),
        .I2(\irq_status[2]_i_2_n_0 ),
        .I3(\irq_status[2]_i_3_n_0 ),
        .I4(\result_select_addr[0]_i_1_n_0 ),
        .I5(\irq_status_reg_n_0_[0] ),
        .O(\irq_status[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFFAAAAAAAA)) 
    \irq_status[1]_i_1 
       (.I0(\irq_status[1]_i_2_n_0 ),
        .I1(p_0_in1_in_0[1]),
        .I2(\wstrb_hold_reg_n_0_[0] ),
        .I3(pn_enable_i_3_n_0),
        .I4(\irq_status[1]_i_3_n_0 ),
        .I5(\irq_status_reg_n_0_[1] ),
        .O(\irq_status[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF2FFF2F2FFFFFFFF)) 
    \irq_status[1]_i_2 
       (.I0(\status_word_d_reg[3]_0 ),
        .I1(status_word_d[3]),
        .I2(error_event_pulse_reg_n_0),
        .I3(status_word_d[24]),
        .I4(frame_error_sticky_proc),
        .I5(error_event_pulse_i_2_n_0),
        .O(\irq_status[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFEFFFFFF)) 
    \irq_status[1]_i_3 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[7]),
        .I2(\irq_status[2]_i_4_n_0 ),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[2]),
        .I5(awaddr_hold[5]),
        .O(\irq_status[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4F4F4FFF44444444)) 
    \irq_status[2]_i_1 
       (.I0(status_word_d[7]),
        .I1(D[1]),
        .I2(\irq_status[2]_i_2_n_0 ),
        .I3(\irq_status[2]_i_3_n_0 ),
        .I4(p_4_in),
        .I5(\irq_status_reg_n_0_[2] ),
        .O(\irq_status[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT5 #(
    .INIT(32'h00008F00)) 
    \irq_status[2]_i_2 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[1]),
        .I2(template_commit_pulse_i_2_n_0),
        .I3(pn_enable_i_3_n_0),
        .I4(\irq_status[1]_i_3_n_0 ),
        .O(\irq_status[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBDFFFF)) 
    \irq_status[2]_i_3 
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[2]),
        .I2(awaddr_hold[4]),
        .I3(\irq_status[2]_i_4_n_0 ),
        .I4(\irq_enable[31]_i_4_n_0 ),
        .I5(template_commit_pulse_i_2_n_0),
        .O(\irq_status[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair220" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \irq_status[2]_i_4 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[1]),
        .I2(awaddr_hold[0]),
        .O(\irq_status[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \irq_status[3]_i_1 
       (.I0(\status_word_d[19]_i_1_n_0 ),
        .I1(status_word_d[19]),
        .I2(\status_word_d[20]_i_1_n_0 ),
        .I3(status_word_d[20]),
        .I4(\irq_status[3]_i_2_n_0 ),
        .I5(\irq_status_reg_n_0_[3] ),
        .O(\irq_status[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h080A000008000000)) 
    \irq_status[3]_i_2 
       (.I0(pn_enable_i_3_n_0),
        .I1(p_0_in1_in_0[1]),
        .I2(\irq_status[1]_i_3_n_0 ),
        .I3(template_commit_pulse_i_2_n_0),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[3]),
        .O(\irq_status[3]_i_2_n_0 ));
  FDRE \irq_status_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\irq_status[0]_i_1_n_0 ),
        .Q(\irq_status_reg_n_0_[0] ),
        .R(SR));
  FDRE \irq_status_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\irq_status[1]_i_1_n_0 ),
        .Q(\irq_status_reg_n_0_[1] ),
        .R(SR));
  FDRE \irq_status_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\irq_status[2]_i_1_n_0 ),
        .Q(\irq_status_reg_n_0_[2] ),
        .R(SR));
  FDRE \irq_status_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\irq_status[3]_i_1_n_0 ),
        .Q(\irq_status_reg_n_0_[3] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFF07FF00000500)) 
    \last_error[0]_i_1 
       (.I0(\last_error[0]_i_2_n_0 ),
        .I1(\result_select_addr[0]_i_1_n_0 ),
        .I2(\last_error[0]_i_3_n_0 ),
        .I3(\last_error[0]_i_4_n_0 ),
        .I4(\last_error[0]_i_5_n_0 ),
        .I5(\last_error_reg_n_0_[0] ),
        .O(\last_error[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair198" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \last_error[0]_i_2 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[3]),
        .O(\last_error[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \last_error[0]_i_3 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[6]),
        .O(\last_error[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100400)) 
    \last_error[0]_i_4 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[7]),
        .I5(\last_error[0]_i_6_n_0 ),
        .O(\last_error[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFB00FFFF)) 
    \last_error[0]_i_5 
       (.I0(busy),
        .I1(average_frame_available_proc),
        .I2(result_capture_pending_i_2_n_0),
        .I3(awaddr_hold[7]),
        .I4(\last_error[3]_i_3_n_0 ),
        .I5(awaddr_hold[5]),
        .O(\last_error[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000002C00000020)) 
    \last_error[0]_i_6 
       (.I0(\last_error[9]_i_4_n_0 ),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[6]),
        .I3(\last_error[0]_i_7_n_0 ),
        .I4(awaddr_hold[7]),
        .I5(p_15_in),
        .O(\last_error[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair207" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \last_error[0]_i_7 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[2]),
        .O(\last_error[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8BBBFFFF88880000)) 
    \last_error[1]_i_1 
       (.I0(\last_error[1]_i_2_n_0 ),
        .I1(awaddr_hold[2]),
        .I2(p_0_in1_in_0[1]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(\last_error[1]_i_3_n_0 ),
        .I5(\last_error_reg_n_0_[1] ),
        .O(\last_error[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0FF000000FF0000)) 
    \last_error[1]_i_2 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\result_select_addr[7]_i_2_n_0 ),
        .I2(data0[9]),
        .I3(result_capture_pending_i_2_n_0),
        .I4(awaddr_hold[5]),
        .I5(awaddr_hold[3]),
        .O(\last_error[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF040000)) 
    \last_error[1]_i_3 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[2]),
        .I2(\last_error[1]_i_4_n_0 ),
        .I3(\last_error[1]_i_5_n_0 ),
        .I4(awaddr_hold[4]),
        .I5(\pulse_config_word[2]_i_4_n_0 ),
        .O(\last_error[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFF0FFFF33F033)) 
    \last_error[1]_i_4 
       (.I0(\last_error[1]_i_6_n_0 ),
        .I1(p_15_in),
        .I2(busy),
        .I3(awaddr_hold[5]),
        .I4(result_capture_pending_i_2_n_0),
        .I5(awaddr_hold[3]),
        .O(\last_error[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair207" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \last_error[1]_i_5 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[2]),
        .I3(awaddr_hold[5]),
        .O(\last_error[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT5 #(
    .INIT(32'h88888000)) 
    \last_error[1]_i_6 
       (.I0(\wdata_hold_reg_n_0_[9] ),
        .I1(p_0_in),
        .I2(\wstrb_hold_reg_n_0_[0] ),
        .I3(p_0_in1_in_0[7]),
        .I4(\wdata_hold_reg_n_0_[8] ),
        .O(\last_error[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFBFBFBB80808088)) 
    \last_error[2]_i_1 
       (.I0(\last_error[2]_i_2_n_0 ),
        .I1(pn_enable_i_3_n_0),
        .I2(\last_error[2]_i_3_n_0 ),
        .I3(awaddr_hold[3]),
        .I4(\last_error[2]_i_4_n_0 ),
        .I5(\last_error_reg_n_0_[2] ),
        .O(\last_error[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAFAFAAFEFEFEF)) 
    \last_error[2]_i_2 
       (.I0(\last_error[2]_i_5_n_0 ),
        .I1(\last_error_reg_n_0_[2] ),
        .I2(awaddr_hold[6]),
        .I3(p_0_in1_in_0[2]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(awaddr_hold[2]),
        .O(\last_error[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBEEC0B)) 
    \last_error[2]_i_3 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[7]),
        .I4(awaddr_hold[6]),
        .I5(\last_error[2]_i_6_n_0 ),
        .O(\last_error[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBBB8088)) 
    \last_error[2]_i_4 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[7]),
        .I3(p_15_in),
        .I4(awaddr_hold[5]),
        .I5(awaddr_hold[6]),
        .O(\last_error[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEEEFFFF)) 
    \last_error[2]_i_5 
       (.I0(pn_enable_i_8_n_0),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[7]),
        .I4(awaddr_hold[4]),
        .I5(awaddr_hold[5]),
        .O(\last_error[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEFEEEEEFEFEE)) 
    \last_error[2]_i_6 
       (.I0(awaddr_hold[1]),
        .I1(awaddr_hold[0]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[4]),
        .I5(awaddr_hold[5]),
        .O(\last_error[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF4FF0000F000)) 
    \last_error[3]_i_1 
       (.I0(p_5_in),
        .I1(awaddr_hold[6]),
        .I2(\last_error[3]_i_2_n_0 ),
        .I3(\last_error[3]_i_3_n_0 ),
        .I4(\last_error[3]_i_4_n_0 ),
        .I5(\last_error_reg_n_0_[3] ),
        .O(\last_error[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF1F)) 
    \last_error[3]_i_2 
       (.I0(p_15_in),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[3]),
        .I4(awaddr_hold[5]),
        .I5(awaddr_hold[7]),
        .O(\last_error[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \last_error[3]_i_3 
       (.I0(pn_enable_i_3_n_0),
        .I1(awaddr_hold[1]),
        .I2(awaddr_hold[0]),
        .O(\last_error[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0CAAFFAAFFAAFFAA)) 
    \last_error[3]_i_4 
       (.I0(\last_error[3]_i_5_n_0 ),
        .I1(awaddr_hold[7]),
        .I2(busy),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[4]),
        .I5(\last_error[3]_i_6_n_0 ),
        .O(\last_error[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFAF3FFF3FFA3FFAF)) 
    \last_error[3]_i_5 
       (.I0(\last_error[3]_i_7_n_0 ),
        .I1(\last_error[3]_i_8_n_0 ),
        .I2(awaddr_hold[7]),
        .I3(awaddr_hold[5]),
        .I4(busy),
        .I5(awaddr_hold[4]),
        .O(\last_error[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAABAAABAAAA)) 
    \last_error[3]_i_6 
       (.I0(\last_error[3]_i_9_n_0 ),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[5]),
        .I4(p_15_in),
        .I5(awaddr_hold[7]),
        .O(\last_error[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair206" *) 
  LUT4 #(
    .INIT(16'hFF4F)) 
    \last_error[3]_i_7 
       (.I0(busy),
        .I1(average_frame_available_proc),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[6]),
        .O(\last_error[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair206" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \last_error[3]_i_8 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[3]),
        .O(\last_error[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800A0A0A8)) 
    \last_error[3]_i_9 
       (.I0(busy),
        .I1(pn_enable_i_9_n_0),
        .I2(awaddr_hold[5]),
        .I3(awaddr_hold[6]),
        .I4(awaddr_hold[3]),
        .I5(awaddr_hold[7]),
        .O(\last_error[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h773FFFFF77000000)) 
    \last_error[4]_i_1 
       (.I0(p_0_in1_in_0[1]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[4]),
        .I3(awaddr_hold[2]),
        .I4(\last_error[4]_i_2_n_0 ),
        .I5(\last_error_reg_n_0_[4] ),
        .O(\last_error[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA0008)) 
    \last_error[4]_i_2 
       (.I0(\last_error[8]_i_3_n_0 ),
        .I1(p_4_in),
        .I2(coeff_status_word[0]),
        .I3(busy),
        .I4(awaddr_hold[6]),
        .I5(p_15_in),
        .O(\last_error[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h773FFFFF77000000)) 
    \last_error[5]_i_1 
       (.I0(p_0_in1_in_0[1]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[5]),
        .I3(awaddr_hold[2]),
        .I4(\last_error[5]_i_2_n_0 ),
        .I5(\last_error_reg_n_0_[5] ),
        .O(\last_error[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA0020)) 
    \last_error[5]_i_2 
       (.I0(\last_error[8]_i_3_n_0 ),
        .I1(coeff_status_word[1]),
        .I2(p_5_in),
        .I3(busy),
        .I4(awaddr_hold[6]),
        .I5(p_15_in),
        .O(\last_error[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF7F0FFFFF3F00000)) 
    \last_error[6]_i_1 
       (.I0(\result_select_addr[6]_i_1_n_0 ),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[6]),
        .I4(\last_error[6]_i_2_n_0 ),
        .I5(\last_error_reg_n_0_[6] ),
        .O(\last_error[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000007577)) 
    \last_error[6]_i_2 
       (.I0(awaddr_hold[5]),
        .I1(busy),
        .I2(baseline_sequence_valid_i_3_n_0),
        .I3(\last_error[6]_i_3_n_0 ),
        .I4(\last_error[6]_i_4_n_0 ),
        .I5(\pulse_config_word[2]_i_4_n_0 ),
        .O(\last_error[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \last_error[6]_i_3 
       (.I0(p_0_in),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(baseline_sequence_valid_reg_n_0),
        .I3(coeff_status_word[0]),
        .O(\last_error[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000077775575)) 
    \last_error[6]_i_4 
       (.I0(\last_error[1]_i_5_n_0 ),
        .I1(awaddr_hold[4]),
        .I2(\template_write_count[10]_i_3_n_0 ),
        .I3(\last_error[6]_i_5_n_0 ),
        .I4(busy),
        .I5(\last_error[6]_i_6_n_0 ),
        .O(\last_error[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \last_error[6]_i_5 
       (.I0(p_0_in),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(template_sequence_valid_reg_n_0),
        .I3(coeff_status_word[1]),
        .O(\last_error[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400020004000000)) 
    \last_error[6]_i_6 
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[5]),
        .I5(p_15_in),
        .O(\last_error[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1DFF1DFF00000CFF)) 
    \last_error[7]_i_1 
       (.I0(\result_select_addr[7]_i_2_n_0 ),
        .I1(awaddr_hold[2]),
        .I2(p_15_in),
        .I3(\last_error[8]_i_3_n_0 ),
        .I4(error_event_pulse_i_2_n_0),
        .I5(\last_error_reg_n_0_[7] ),
        .O(\last_error[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h05F5FFFF00C0CCCC)) 
    \last_error[8]_i_1 
       (.I0(data0[8]),
        .I1(\last_error[8]_i_2_n_0 ),
        .I2(awaddr_hold[2]),
        .I3(p_15_in),
        .I4(\last_error[8]_i_3_n_0 ),
        .I5(\last_error_reg_n_0_[8] ),
        .O(\last_error[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \last_error[8]_i_2 
       (.I0(frame_error_sticky_proc),
        .I1(clear_status_pulse),
        .O(\last_error[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200020000000)) 
    \last_error[8]_i_3 
       (.I0(\last_error[3]_i_3_n_0 ),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[4]),
        .I3(\last_error[8]_i_4_n_0 ),
        .I4(awaddr_hold[2]),
        .I5(awaddr_hold[6]),
        .O(\last_error[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \last_error[8]_i_4 
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[7]),
        .O(\last_error[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8BBBFFFF88880000)) 
    \last_error[9]_i_1 
       (.I0(\last_error[9]_i_2_n_0 ),
        .I1(awaddr_hold[2]),
        .I2(\wdata_hold_reg_n_0_[9] ),
        .I3(p_0_in),
        .I4(\last_error[9]_i_3_n_0 ),
        .I5(\last_error_reg_n_0_[9] ),
        .O(\last_error[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFE00FE00FE00)) 
    \last_error[9]_i_2 
       (.I0(pn_enable_i_6_n_0),
        .I1(\last_error[9]_i_4_n_0 ),
        .I2(pn_enable_i_5_n_0),
        .I3(awaddr_hold[7]),
        .I4(awaddr_hold[5]),
        .I5(\pulse_config_word[2]_i_5_n_0 ),
        .O(\last_error[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF020002)) 
    \last_error[9]_i_3 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[7]),
        .I3(awaddr_hold[2]),
        .I4(\last_error[9]_i_5_n_0 ),
        .I5(\last_error[9]_i_6_n_0 ),
        .O(\last_error[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFA8)) 
    \last_error[9]_i_4 
       (.I0(p_0_in),
        .I1(\wdata_hold_reg_n_0_[9] ),
        .I2(\wdata_hold_reg_n_0_[8] ),
        .I3(result_capture_pending_i_5_n_0),
        .I4(result_capture_pending_i_4_n_0),
        .I5(result_capture_pending_i_3_n_0),
        .O(\last_error[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00320C3200320032)) 
    \last_error[9]_i_5 
       (.I0(p_15_in),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[7]),
        .I3(awaddr_hold[5]),
        .I4(busy),
        .I5(\pulse_config_word[2]_i_5_n_0 ),
        .O(\last_error[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE0FFFFFFFFFF)) 
    \last_error[9]_i_6 
       (.I0(busy),
        .I1(\s_axi_bresp[1]_i_17_n_0 ),
        .I2(awaddr_hold[7]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[3]),
        .I5(\last_error[3]_i_3_n_0 ),
        .O(\last_error[9]_i_6_n_0 ));
  FDRE \last_error_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[0]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[0] ),
        .R(SR));
  FDRE \last_error_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[1]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[1] ),
        .R(SR));
  FDRE \last_error_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[2]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[2] ),
        .R(SR));
  FDRE \last_error_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[3]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[3] ),
        .R(SR));
  FDRE \last_error_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[4]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[4] ),
        .R(SR));
  FDRE \last_error_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[5]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[5] ),
        .R(SR));
  FDRE \last_error_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[6]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[6] ),
        .R(SR));
  FDRE \last_error_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[7]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[7] ),
        .R(SR));
  FDRE \last_error_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[8]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[8] ),
        .R(SR));
  FDRE \last_error_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\last_error[9]_i_1_n_0 ),
        .Q(\last_error_reg_n_0_[9] ),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    pipeline_i_i_1
       (.I0(s_axi_aresetn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair219" *) 
  LUT3 #(
    .INIT(8'h80)) 
    pipeline_i_i_2
       (.I0(start_pulse),
        .I1(template_coeff_valid),
        .I2(baseline_coeff_valid),
        .O(start_pulse_reg_0));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    pn_enable_i_1
       (.I0(p_0_in1_in_0[0]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(pn_enable_i_2_n_0),
        .I3(pn_enable_i_3_n_0),
        .I4(pn_enable_i_4_n_0),
        .I5(pn_enable_reg_0),
        .O(pn_enable_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    pn_enable_i_2
       (.I0(pn_enable_i_5_n_0),
        .I1(result_capture_pending_i_2_n_0),
        .I2(data0[8]),
        .I3(data0[9]),
        .I4(pn_enable_i_6_n_0),
        .I5(busy),
        .O(pn_enable_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT5 #(
    .INIT(32'h00001000)) 
    pn_enable_i_3
       (.I0(result_capture_pending_reg_n_0),
        .I1(average_capture_pending_reg_n_0),
        .I2(w_pending_reg_n_0),
        .I3(aw_pending_reg_n_0),
        .I4(s_axi_bvalid_reg_0),
        .O(pn_enable_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    pn_enable_i_4
       (.I0(awaddr_hold[2]),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[5]),
        .I3(pn_enable_i_7_n_0),
        .I4(awaddr_hold[3]),
        .I5(pn_enable_i_8_n_0),
        .O(pn_enable_i_4_n_0));
  LUT6 #(
    .INIT(64'hE200E2E2E2E2E2E2)) 
    pn_enable_i_5
       (.I0(pn_enable_reg_0),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[0]),
        .I3(pulse_mode[1]),
        .I4(pulse_mode[0]),
        .I5(pulse_mode[2]),
        .O(pn_enable_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFAAFFAAFFAAFEAA)) 
    pn_enable_i_6
       (.I0(pn_enable_i_9_n_0),
        .I1(p_0_in1_in_0[1]),
        .I2(p_0_in1_in_0[5]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[7]),
        .I5(p_0_in1_in_0[6]),
        .O(pn_enable_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair235" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pn_enable_i_7
       (.I0(awaddr_hold[4]),
        .I1(awaddr_hold[7]),
        .O(pn_enable_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'hE)) 
    pn_enable_i_8
       (.I0(awaddr_hold[0]),
        .I1(awaddr_hold[1]),
        .O(pn_enable_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair200" *) 
  LUT4 #(
    .INIT(16'hCCC8)) 
    pn_enable_i_9
       (.I0(p_0_in1_in_0[2]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[3]),
        .I3(p_0_in1_in_0[4]),
        .O(pn_enable_i_9_n_0));
  FDRE pn_enable_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pn_enable_i_1_n_0),
        .Q(pn_enable_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair212" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[0]_i_1 
       (.I0(p_0_in1_in_0[0]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(pulse_mode[0]),
        .O(\pulse_config_word[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[10]_i_1 
       (.I0(\wdata_hold_reg_n_0_[10] ),
        .I1(p_0_in),
        .I2(pulse_width[2]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair225" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[11]_i_1 
       (.I0(\wdata_hold_reg_n_0_[11] ),
        .I1(p_0_in),
        .I2(pulse_width[3]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair225" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[12]_i_1 
       (.I0(\wdata_hold_reg_n_0_[12] ),
        .I1(p_0_in),
        .I2(pulse_width[4]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair216" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[13]_i_1 
       (.I0(\wdata_hold_reg_n_0_[13] ),
        .I1(p_0_in),
        .I2(pulse_width[5]),
        .O(p_1_in[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[14]_i_1 
       (.I0(\wdata_hold_reg_n_0_[14] ),
        .I1(p_0_in),
        .I2(\pulse_config_word_reg_n_0_[14] ),
        .O(\pulse_config_word[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair194" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[15]_i_1 
       (.I0(\wdata_hold_reg_n_0_[15] ),
        .I1(p_0_in),
        .I2(\pulse_config_word_reg_n_0_[15] ),
        .O(\pulse_config_word[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair232" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[16]_i_1 
       (.I0(p_2_in[0]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[16] ),
        .O(\pulse_config_word[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair191" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[17]_i_1 
       (.I0(p_2_in[1]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[17] ),
        .O(\pulse_config_word[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair232" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[18]_i_1 
       (.I0(p_2_in[2]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[18] ),
        .O(\pulse_config_word[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[19]_i_1 
       (.I0(p_2_in[3]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[19] ),
        .O(\pulse_config_word[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[1]_i_1 
       (.I0(p_0_in1_in_0[1]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(pulse_mode[1]),
        .O(\pulse_config_word[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair231" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[20]_i_1 
       (.I0(p_2_in[4]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[20] ),
        .O(\pulse_config_word[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair193" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[21]_i_1 
       (.I0(p_2_in[5]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[21] ),
        .O(\pulse_config_word[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair230" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[22]_i_1 
       (.I0(p_2_in[6]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[22] ),
        .O(\pulse_config_word[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair230" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[23]_i_1 
       (.I0(p_2_in[7]),
        .I1(data00),
        .I2(\pulse_config_word_reg_n_0_[23] ),
        .O(\pulse_config_word[23]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[24]_i_1 
       (.I0(\wdata_hold_reg_n_0_[24] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[24] ),
        .O(\pulse_config_word[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair229" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[25]_i_1 
       (.I0(\wdata_hold_reg_n_0_[25] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[25] ),
        .O(\pulse_config_word[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair214" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[26]_i_1 
       (.I0(\wdata_hold_reg_n_0_[26] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[26] ),
        .O(\pulse_config_word[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair229" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[27]_i_1 
       (.I0(\wdata_hold_reg_n_0_[27] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[27] ),
        .O(\pulse_config_word[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair190" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[28]_i_1 
       (.I0(\wdata_hold_reg_n_0_[28] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[28] ),
        .O(\pulse_config_word[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair228" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[29]_i_1 
       (.I0(\wdata_hold_reg_n_0_[29] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[29] ),
        .O(\pulse_config_word[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pulse_config_word[2]_i_1 
       (.I0(\pulse_config_word[2]_i_3_n_0 ),
        .I1(\pulse_config_word[2]_i_4_n_0 ),
        .I2(\pulse_config_word[2]_i_5_n_0 ),
        .I3(busy),
        .O(\pulse_config_word[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[2]_i_2 
       (.I0(p_0_in1_in_0[2]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(pulse_mode[2]),
        .O(\pulse_config_word[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF1FFFFFFF)) 
    \pulse_config_word[2]_i_3 
       (.I0(awaddr_hold[4]),
        .I1(awaddr_hold[7]),
        .I2(awaddr_hold[5]),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[6]),
        .I5(awaddr_hold[3]),
        .O(\pulse_config_word[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFFFFFF)) 
    \pulse_config_word[2]_i_4 
       (.I0(average_capture_pending_reg_n_0),
        .I1(clear_status_pulse_i_3_n_0),
        .I2(result_capture_pending_reg_n_0),
        .I3(w_pending_reg_n_0),
        .I4(aw_pending_reg_n_0),
        .I5(s_axi_bvalid_reg_0),
        .O(\pulse_config_word[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFEFDFECDFECDFECD)) 
    \pulse_config_word[2]_i_5 
       (.I0(\pulse_config_word[2]_i_6_n_0 ),
        .I1(\pulse_config_word[2]_i_7_n_0 ),
        .I2(p_1_in[0]),
        .I3(p_1_in[5]),
        .I4(\pulse_config_word[1]_i_1_n_0 ),
        .I5(\pulse_config_word[0]_i_1_n_0 ),
        .O(\pulse_config_word[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBBFCB8)) 
    \pulse_config_word[2]_i_6 
       (.I0(\wdata_hold_reg_n_0_[10] ),
        .I1(p_0_in),
        .I2(pulse_width[2]),
        .I3(\wdata_hold_reg_n_0_[11] ),
        .I4(pulse_width[3]),
        .I5(\pulse_config_word[2]_i_8_n_0 ),
        .O(\pulse_config_word[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFF47FFFF474700FF)) 
    \pulse_config_word[2]_i_7 
       (.I0(p_0_in1_in_0[2]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(pulse_mode[2]),
        .I3(\pulse_config_word[1]_i_1_n_0 ),
        .I4(\pulse_config_word[0]_i_1_n_0 ),
        .I5(pn_enable_reg_0),
        .O(\pulse_config_word[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \pulse_config_word[2]_i_8 
       (.I0(pulse_width[1]),
        .I1(\wdata_hold_reg_n_0_[9] ),
        .I2(pulse_width[4]),
        .I3(p_0_in),
        .I4(\wdata_hold_reg_n_0_[12] ),
        .O(\pulse_config_word[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair192" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[30]_i_1 
       (.I0(\wdata_hold_reg_n_0_[30] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[30] ),
        .O(\pulse_config_word[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair228" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[31]_i_1 
       (.I0(\wdata_hold_reg_n_0_[31] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\pulse_config_word_reg_n_0_[31] ),
        .O(\pulse_config_word[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[3]_i_1 
       (.I0(p_0_in1_in_0[3]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\pulse_config_word_reg_n_0_[3] ),
        .O(\pulse_config_word[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair227" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[4]_i_1 
       (.I0(p_0_in1_in_0[4]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\pulse_config_word_reg_n_0_[4] ),
        .O(\pulse_config_word[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair227" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[5]_i_1 
       (.I0(p_0_in1_in_0[5]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\pulse_config_word_reg_n_0_[5] ),
        .O(\pulse_config_word[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair226" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[6]_i_1 
       (.I0(p_0_in1_in_0[6]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\pulse_config_word_reg_n_0_[6] ),
        .O(\pulse_config_word[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair226" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[7]_i_1 
       (.I0(p_0_in1_in_0[7]),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(\pulse_config_word_reg_n_0_[7] ),
        .O(\pulse_config_word[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair216" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[8]_i_1 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(p_0_in),
        .I2(pulse_width[0]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \pulse_config_word[9]_i_1 
       (.I0(\wdata_hold_reg_n_0_[9] ),
        .I1(p_0_in),
        .I2(pulse_width[1]),
        .O(p_1_in[1]));
  FDSE \pulse_config_word_reg[0] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[0]_i_1_n_0 ),
        .Q(pulse_mode[0]),
        .S(SR));
  FDSE \pulse_config_word_reg[10] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(pulse_width[2]),
        .S(SR));
  FDRE \pulse_config_word_reg[11] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(pulse_width[3]),
        .R(SR));
  FDRE \pulse_config_word_reg[12] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(pulse_width[4]),
        .R(SR));
  FDRE \pulse_config_word_reg[13] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(pulse_width[5]),
        .R(SR));
  FDRE \pulse_config_word_reg[14] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[14]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[14] ),
        .R(SR));
  FDRE \pulse_config_word_reg[15] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[15]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[15] ),
        .R(SR));
  FDRE \pulse_config_word_reg[16] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[16]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[16] ),
        .R(SR));
  FDRE \pulse_config_word_reg[17] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[17]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[17] ),
        .R(SR));
  FDRE \pulse_config_word_reg[18] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[18]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[18] ),
        .R(SR));
  FDRE \pulse_config_word_reg[19] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[19]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[19] ),
        .R(SR));
  FDRE \pulse_config_word_reg[1] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[1]_i_1_n_0 ),
        .Q(pulse_mode[1]),
        .R(SR));
  FDRE \pulse_config_word_reg[20] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[20]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[20] ),
        .R(SR));
  FDRE \pulse_config_word_reg[21] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[21]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[21] ),
        .R(SR));
  FDRE \pulse_config_word_reg[22] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[22]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[22] ),
        .R(SR));
  FDRE \pulse_config_word_reg[23] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[23]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[23] ),
        .R(SR));
  FDRE \pulse_config_word_reg[24] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[24]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[24] ),
        .R(SR));
  FDRE \pulse_config_word_reg[25] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[25]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[25] ),
        .R(SR));
  FDRE \pulse_config_word_reg[26] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[26]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[26] ),
        .R(SR));
  FDRE \pulse_config_word_reg[27] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[27]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[27] ),
        .R(SR));
  FDRE \pulse_config_word_reg[28] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[28]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[28] ),
        .R(SR));
  FDRE \pulse_config_word_reg[29] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[29]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[29] ),
        .R(SR));
  FDSE \pulse_config_word_reg[2] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[2]_i_2_n_0 ),
        .Q(pulse_mode[2]),
        .S(SR));
  FDRE \pulse_config_word_reg[30] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[30]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[30] ),
        .R(SR));
  FDRE \pulse_config_word_reg[31] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[31]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[31] ),
        .R(SR));
  FDRE \pulse_config_word_reg[3] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[3]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[3] ),
        .R(SR));
  FDRE \pulse_config_word_reg[4] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[4]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[4] ),
        .R(SR));
  FDRE \pulse_config_word_reg[5] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[5]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[5] ),
        .R(SR));
  FDRE \pulse_config_word_reg[6] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[6]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[6] ),
        .R(SR));
  FDRE \pulse_config_word_reg[7] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(\pulse_config_word[7]_i_1_n_0 ),
        .Q(\pulse_config_word_reg_n_0_[7] ),
        .R(SR));
  FDRE \pulse_config_word_reg[8] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(pulse_width[0]),
        .R(SR));
  FDRE \pulse_config_word_reg[9] 
       (.C(s_axi_aclk),
        .CE(\pulse_config_word[2]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(pulse_width[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'h000000FF02020200)) 
    result_capture_pending_i_1
       (.I0(result_capture_pending_i_2_n_0),
        .I1(data0[8]),
        .I2(data0[9]),
        .I3(\result_select_addr[7]_i_1_n_0 ),
        .I4(\result_snapshot_q16[63]_i_1_n_0 ),
        .I5(result_capture_pending_reg_n_0),
        .O(result_capture_pending_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair192" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    result_capture_pending_i_10
       (.I0(\wdata_hold_reg_n_0_[30] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\wdata_hold_reg_n_0_[12] ),
        .I3(p_0_in),
        .O(result_capture_pending_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair191" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    result_capture_pending_i_11
       (.I0(p_2_in[1]),
        .I1(data00),
        .I2(\wdata_hold_reg_n_0_[10] ),
        .I3(p_0_in),
        .O(result_capture_pending_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair214" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    result_capture_pending_i_12
       (.I0(\wdata_hold_reg_n_0_[25] ),
        .I1(\wdata_hold_reg_n_0_[26] ),
        .I2(\wstrb_hold_reg_n_0_[3] ),
        .O(result_capture_pending_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair199" *) 
  LUT3 #(
    .INIT(8'h01)) 
    result_capture_pending_i_2
       (.I0(result_capture_pending_i_3_n_0),
        .I1(result_capture_pending_i_4_n_0),
        .I2(result_capture_pending_i_5_n_0),
        .O(result_capture_pending_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFEEEEE)) 
    result_capture_pending_i_3
       (.I0(result_capture_pending_i_6_n_0),
        .I1(result_capture_pending_i_7_n_0),
        .I2(\wdata_hold_reg_n_0_[14] ),
        .I3(\wdata_hold_reg_n_0_[13] ),
        .I4(p_0_in),
        .O(result_capture_pending_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    result_capture_pending_i_4
       (.I0(result_capture_pending_i_8_n_0),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\wdata_hold_reg_n_0_[31] ),
        .I3(p_2_in[6]),
        .I4(data00),
        .I5(result_capture_pending_i_9_n_0),
        .O(result_capture_pending_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEAA)) 
    result_capture_pending_i_5
       (.I0(result_capture_pending_i_10_n_0),
        .I1(p_2_in[7]),
        .I2(p_2_in[4]),
        .I3(data00),
        .I4(result_capture_pending_i_11_n_0),
        .I5(result_capture_pending_i_12_n_0),
        .O(result_capture_pending_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair194" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    result_capture_pending_i_6
       (.I0(\wdata_hold_reg_n_0_[15] ),
        .I1(p_0_in),
        .I2(\wdata_hold_reg_n_0_[29] ),
        .I3(\wstrb_hold_reg_n_0_[3] ),
        .O(result_capture_pending_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair193" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    result_capture_pending_i_7
       (.I0(p_2_in[5]),
        .I1(data00),
        .I2(\wdata_hold_reg_n_0_[24] ),
        .I3(\wstrb_hold_reg_n_0_[3] ),
        .O(result_capture_pending_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair190" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    result_capture_pending_i_8
       (.I0(\wdata_hold_reg_n_0_[28] ),
        .I1(\wstrb_hold_reg_n_0_[3] ),
        .I2(\wdata_hold_reg_n_0_[11] ),
        .I3(p_0_in),
        .O(result_capture_pending_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFF8888FFF88888)) 
    result_capture_pending_i_9
       (.I0(\wstrb_hold_reg_n_0_[3] ),
        .I1(\wdata_hold_reg_n_0_[27] ),
        .I2(p_2_in[2]),
        .I3(p_2_in[0]),
        .I4(data00),
        .I5(p_2_in[3]),
        .O(result_capture_pending_i_9_n_0));
  FDRE result_capture_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(result_capture_pending_i_1_n_0),
        .Q(result_capture_pending_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h33FF33FFCCCC32CC)) 
    \result_capture_wait[0]_i_1 
       (.I0(\result_capture_wait_reg_n_0_[1] ),
        .I1(\result_capture_wait_reg_n_0_[0] ),
        .I2(\result_capture_wait_reg_n_0_[2] ),
        .I3(result_capture_pending_reg_n_0),
        .I4(average_capture_pending_reg_n_0),
        .I5(\result_select_addr[7]_i_1_n_0 ),
        .O(\result_capture_wait[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h99FF99FFAAAA98AA)) 
    \result_capture_wait[1]_i_1 
       (.I0(\result_capture_wait_reg_n_0_[1] ),
        .I1(\result_capture_wait_reg_n_0_[0] ),
        .I2(\result_capture_wait_reg_n_0_[2] ),
        .I3(result_capture_pending_reg_n_0),
        .I4(average_capture_pending_reg_n_0),
        .I5(\result_select_addr[7]_i_1_n_0 ),
        .O(\result_capture_wait[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE100E100F0F0E0F0)) 
    \result_capture_wait[2]_i_1 
       (.I0(\result_capture_wait_reg_n_0_[1] ),
        .I1(\result_capture_wait_reg_n_0_[0] ),
        .I2(\result_capture_wait_reg_n_0_[2] ),
        .I3(result_capture_pending_reg_n_0),
        .I4(average_capture_pending_reg_n_0),
        .I5(\result_select_addr[7]_i_1_n_0 ),
        .O(\result_capture_wait[2]_i_1_n_0 ));
  FDRE \result_capture_wait_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\result_capture_wait[0]_i_1_n_0 ),
        .Q(\result_capture_wait_reg_n_0_[0] ),
        .R(SR));
  FDRE \result_capture_wait_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\result_capture_wait[1]_i_1_n_0 ),
        .Q(\result_capture_wait_reg_n_0_[1] ),
        .R(SR));
  FDRE \result_capture_wait_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\result_capture_wait[2]_i_1_n_0 ),
        .Q(\result_capture_wait_reg_n_0_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair204" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[0]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .O(\result_select_addr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[1]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[1]),
        .O(p_15_in));
  (* SOFT_HLUTNM = "soft_lutpair200" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[2]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[2]),
        .O(p_4_in));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[3]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[3]),
        .O(p_5_in));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[4]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[4]),
        .O(p_6_in));
  (* SOFT_HLUTNM = "soft_lutpair213" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[5]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[5]),
        .O(\result_select_addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[6]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[6]),
        .O(\result_select_addr[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \result_select_addr[7]_i_1 
       (.I0(awaddr_hold[0]),
        .I1(awaddr_hold[1]),
        .I2(pn_enable_i_3_n_0),
        .I3(\result_select_addr[7]_i_3_n_0 ),
        .O(\result_select_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair210" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \result_select_addr[7]_i_2 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[7]),
        .O(\result_select_addr[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT5 #(
    .INIT(32'h000002AA)) 
    \result_select_addr[7]_i_3 
       (.I0(result_capture_pending_i_2_n_0),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\wdata_hold_reg_n_0_[9] ),
        .I3(p_0_in),
        .I4(\result_select_addr[7]_i_4_n_0 ),
        .O(\result_select_addr[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFDF)) 
    \result_select_addr[7]_i_4 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[2]),
        .I3(awaddr_hold[7]),
        .I4(awaddr_hold[4]),
        .I5(awaddr_hold[3]),
        .O(\result_select_addr[7]_i_4_n_0 ));
  FDRE \result_select_addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(\result_select_addr[0]_i_1_n_0 ),
        .Q(result_select_addr[0]),
        .R(SR));
  FDRE \result_select_addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(p_15_in),
        .Q(result_select_addr[1]),
        .R(SR));
  FDRE \result_select_addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(p_4_in),
        .Q(result_select_addr[2]),
        .R(SR));
  FDRE \result_select_addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(p_5_in),
        .Q(result_select_addr[3]),
        .R(SR));
  FDRE \result_select_addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(p_6_in),
        .Q(result_select_addr[4]),
        .R(SR));
  FDRE \result_select_addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(\result_select_addr[5]_i_1_n_0 ),
        .Q(result_select_addr[5]),
        .R(SR));
  FDRE \result_select_addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(\result_select_addr[6]_i_1_n_0 ),
        .Q(result_select_addr[6]),
        .R(SR));
  FDRE \result_select_addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\result_select_addr[7]_i_1_n_0 ),
        .D(\result_select_addr[7]_i_2_n_0 ),
        .Q(result_select_addr[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000002)) 
    \result_snapshot_q16[63]_i_1 
       (.I0(result_capture_pending_reg_n_0),
        .I1(\result_capture_wait_reg_n_0_[1] ),
        .I2(\result_capture_wait_reg_n_0_[0] ),
        .I3(\result_capture_wait_reg_n_0_[2] ),
        .I4(average_capture_pending_reg_n_0),
        .O(\result_snapshot_q16[63]_i_1_n_0 ));
  FDRE \result_snapshot_q16_reg[0] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[0]),
        .Q(\result_snapshot_q16_reg_n_0_[0] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[10] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[10]),
        .Q(\result_snapshot_q16_reg_n_0_[10] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[11] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[11]),
        .Q(\result_snapshot_q16_reg_n_0_[11] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[12] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[12]),
        .Q(\result_snapshot_q16_reg_n_0_[12] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[13] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[13]),
        .Q(\result_snapshot_q16_reg_n_0_[13] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[14] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[14]),
        .Q(\result_snapshot_q16_reg_n_0_[14] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[15] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[15]),
        .Q(\result_snapshot_q16_reg_n_0_[15] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[16] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[16]),
        .Q(\result_snapshot_q16_reg_n_0_[16] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[17] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[17]),
        .Q(\result_snapshot_q16_reg_n_0_[17] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[18] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[18]),
        .Q(\result_snapshot_q16_reg_n_0_[18] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[19] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[19]),
        .Q(\result_snapshot_q16_reg_n_0_[19] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[1] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[1]),
        .Q(\result_snapshot_q16_reg_n_0_[1] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[20] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[20]),
        .Q(\result_snapshot_q16_reg_n_0_[20] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[21] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[21]),
        .Q(\result_snapshot_q16_reg_n_0_[21] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[22] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[22]),
        .Q(\result_snapshot_q16_reg_n_0_[22] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[23] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[23]),
        .Q(\result_snapshot_q16_reg_n_0_[23] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[24] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[24]),
        .Q(\result_snapshot_q16_reg_n_0_[24] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[25] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[25]),
        .Q(\result_snapshot_q16_reg_n_0_[25] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[26] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[26]),
        .Q(\result_snapshot_q16_reg_n_0_[26] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[27] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[27]),
        .Q(\result_snapshot_q16_reg_n_0_[27] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[28] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[28]),
        .Q(\result_snapshot_q16_reg_n_0_[28] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[29] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[29]),
        .Q(\result_snapshot_q16_reg_n_0_[29] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[2] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[2]),
        .Q(\result_snapshot_q16_reg_n_0_[2] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[30] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[30]),
        .Q(\result_snapshot_q16_reg_n_0_[30] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[31] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[31]),
        .Q(\result_snapshot_q16_reg_n_0_[31] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[32] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[32]),
        .Q(data11[0]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[33] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[33]),
        .Q(data11[1]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[34] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[34]),
        .Q(data11[2]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[35] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[35]),
        .Q(data11[3]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[36] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[36]),
        .Q(data11[4]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[37] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[37]),
        .Q(data11[5]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[38] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[38]),
        .Q(data11[6]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[39] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[39]),
        .Q(data11[7]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[3] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[3]),
        .Q(\result_snapshot_q16_reg_n_0_[3] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[40] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[40]),
        .Q(data11[8]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[41] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[41]),
        .Q(data11[9]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[42] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[42]),
        .Q(data11[10]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[43] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[43]),
        .Q(data11[11]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[44] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[44]),
        .Q(data11[12]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[45] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[45]),
        .Q(data11[13]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[46] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[46]),
        .Q(data11[14]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[47] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[47]),
        .Q(data11[15]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[48] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[48]),
        .Q(data11[16]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[49] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[49]),
        .Q(data11[17]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[4] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[4]),
        .Q(\result_snapshot_q16_reg_n_0_[4] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[50] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[50]),
        .Q(data11[18]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[51] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[51]),
        .Q(data11[19]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[52] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[52]),
        .Q(data11[20]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[53] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[53]),
        .Q(data11[21]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[54] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[54]),
        .Q(data11[22]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[55] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[55]),
        .Q(data11[23]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[56] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[56]),
        .Q(data11[24]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[57] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[57]),
        .Q(data11[25]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[58] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[58]),
        .Q(data11[26]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[59] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[59]),
        .Q(data11[27]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[5] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[5]),
        .Q(\result_snapshot_q16_reg_n_0_[5] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[60] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[60]),
        .Q(data11[28]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[61] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[61]),
        .Q(data11[29]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[62] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[62]),
        .Q(data11[30]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[63] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[63]),
        .Q(data11[31]),
        .R(SR));
  FDRE \result_snapshot_q16_reg[6] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[6]),
        .Q(\result_snapshot_q16_reg_n_0_[6] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[7] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[7]),
        .Q(\result_snapshot_q16_reg_n_0_[7] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[8] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[8]),
        .Q(\result_snapshot_q16_reg_n_0_[8] ),
        .R(SR));
  FDRE \result_snapshot_q16_reg[9] 
       (.C(s_axi_aclk),
        .CE(\result_snapshot_q16[63]_i_1_n_0 ),
        .D(selected_result_q16[9]),
        .Q(\result_snapshot_q16_reg_n_0_[9] ),
        .R(SR));
  LUT3 #(
    .INIT(8'hDC)) 
    result_snapshot_valid_i_1
       (.I0(\result_select_addr[7]_i_1_n_0 ),
        .I1(\result_snapshot_q16[63]_i_1_n_0 ),
        .I2(result_snapshot_valid_reg_n_0),
        .O(result_snapshot_valid_i_1_n_0));
  FDRE result_snapshot_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(result_snapshot_valid_i_1_n_0),
        .Q(result_snapshot_valid_reg_n_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair208" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_arready_INST_0
       (.I0(s_axi_aresetn),
        .I1(s_axi_rvalid_reg_0),
        .O(s_axi_arready));
  LUT5 #(
    .INIT(32'h00000010)) 
    s_axi_awready_INST_0
       (.I0(aw_pending_reg_n_0),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_aresetn),
        .I3(average_capture_pending_reg_n_0),
        .I4(result_capture_pending_reg_n_0),
        .O(s_axi_awready));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_bresp[1]_i_1 
       (.I0(\result_snapshot_q16[63]_i_1_n_0 ),
        .I1(\average_snapshot_q2[15]_i_1_n_0 ),
        .I2(s_axi_bresp1_in),
        .I3(pn_enable_i_3_n_0),
        .I4(s_axi_bresp),
        .I5(s_axi_aresetn),
        .O(\s_axi_bresp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'h733F)) 
    \s_axi_bresp[1]_i_10 
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[2]),
        .I2(awaddr_hold[6]),
        .I3(awaddr_hold[4]),
        .O(\s_axi_bresp[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE0)) 
    \s_axi_bresp[1]_i_11 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\result_select_addr[7]_i_2_n_0 ),
        .I2(data0[9]),
        .I3(result_capture_pending_i_5_n_0),
        .I4(result_capture_pending_i_4_n_0),
        .I5(result_capture_pending_i_3_n_0),
        .O(\s_axi_bresp[1]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \s_axi_bresp[1]_i_12 
       (.I0(awaddr_hold[5]),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[4]),
        .O(\s_axi_bresp[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFAFFFFFBAF)) 
    \s_axi_bresp[1]_i_13 
       (.I0(busy),
        .I1(\s_axi_bresp[1]_i_19_n_0 ),
        .I2(p_1_in[5]),
        .I3(p_1_in[0]),
        .I4(\pulse_config_word[2]_i_7_n_0 ),
        .I5(\pulse_config_word[2]_i_6_n_0 ),
        .O(\s_axi_bresp[1]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair199" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_axi_bresp[1]_i_14 
       (.I0(busy),
        .I1(result_capture_pending_i_5_n_0),
        .I2(result_capture_pending_i_4_n_0),
        .I3(result_capture_pending_i_3_n_0),
        .O(\s_axi_bresp[1]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair220" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_axi_bresp[1]_i_15 
       (.I0(awaddr_hold[7]),
        .I1(awaddr_hold[3]),
        .O(\s_axi_bresp[1]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A88888888888)) 
    \s_axi_bresp[1]_i_16 
       (.I0(\s_axi_bresp[1]_i_20_n_0 ),
        .I1(\s_axi_bresp[1]_i_21_n_0 ),
        .I2(\wstrb_hold_reg_n_0_[0] ),
        .I3(p_0_in1_in_0[3]),
        .I4(p_0_in1_in_0[4]),
        .I5(busy),
        .O(\s_axi_bresp[1]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \s_axi_bresp[1]_i_17 
       (.I0(pn_enable_i_6_n_0),
        .I1(\s_axi_bresp[1]_i_22_n_0 ),
        .I2(result_capture_pending_i_5_n_0),
        .I3(result_capture_pending_i_4_n_0),
        .I4(result_capture_pending_i_3_n_0),
        .I5(pn_enable_i_5_n_0),
        .O(\s_axi_bresp[1]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT5 #(
    .INIT(32'hFFFF0C05)) 
    \s_axi_bresp[1]_i_18 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[5]),
        .I3(awaddr_hold[3]),
        .I4(awaddr_hold[2]),
        .O(\s_axi_bresp[1]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \s_axi_bresp[1]_i_19 
       (.I0(pulse_mode[1]),
        .I1(p_0_in1_in_0[1]),
        .I2(pulse_mode[0]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[0]),
        .O(\s_axi_bresp[1]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF4)) 
    \s_axi_bresp[1]_i_2 
       (.I0(\s_axi_bresp[1]_i_3_n_0 ),
        .I1(\s_axi_bresp[1]_i_4_n_0 ),
        .I2(\s_axi_bresp[1]_i_5_n_0 ),
        .I3(\s_axi_bresp[1]_i_6_n_0 ),
        .I4(\s_axi_bresp[1]_i_7_n_0 ),
        .I5(\s_axi_bresp[1]_i_8_n_0 ),
        .O(s_axi_bresp1_in));
  (* SOFT_HLUTNM = "soft_lutpair205" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_axi_bresp[1]_i_20 
       (.I0(awaddr_hold[6]),
        .I1(awaddr_hold[3]),
        .O(\s_axi_bresp[1]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hD0FF0000D0D00000)) 
    \s_axi_bresp[1]_i_21 
       (.I0(coeff_status_word[0]),
        .I1(busy),
        .I2(p_0_in1_in_0[2]),
        .I3(coeff_status_word[1]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[3]),
        .O(\s_axi_bresp[1]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \s_axi_bresp[1]_i_22 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\wdata_hold_reg_n_0_[9] ),
        .I2(p_0_in),
        .O(\s_axi_bresp[1]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT5 #(
    .INIT(32'h08AAAAAA)) 
    \s_axi_bresp[1]_i_3 
       (.I0(\s_axi_bresp[1]_i_9_n_0 ),
        .I1(baseline_shadow_wr_en_i_2_n_0),
        .I2(baseline_sequence_valid_i_3_n_0),
        .I3(awaddr_hold[5]),
        .I4(awaddr_hold[3]),
        .O(\s_axi_bresp[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFAEFFAEFFAEAEAE)) 
    \s_axi_bresp[1]_i_4 
       (.I0(\s_axi_bresp[1]_i_10_n_0 ),
        .I1(\last_error[9]_i_4_n_0 ),
        .I2(awaddr_hold[4]),
        .I3(error_event_pulse_i_8_n_0),
        .I4(busy),
        .I5(\s_axi_bresp[1]_i_11_n_0 ),
        .O(\s_axi_bresp[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h88AAA000AAAAAAAA)) 
    \s_axi_bresp[1]_i_5 
       (.I0(\s_axi_bresp[1]_i_12_n_0 ),
        .I1(\s_axi_bresp[1]_i_13_n_0 ),
        .I2(\s_axi_bresp[1]_i_14_n_0 ),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[6]),
        .I5(\s_axi_bresp[1]_i_15_n_0 ),
        .O(\s_axi_bresp[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT5 #(
    .INIT(32'hEEEFEEEE)) 
    \s_axi_bresp[1]_i_6 
       (.I0(awaddr_hold[1]),
        .I1(awaddr_hold[0]),
        .I2(awaddr_hold[5]),
        .I3(awaddr_hold[7]),
        .I4(\s_axi_bresp[1]_i_16_n_0 ),
        .O(\s_axi_bresp[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA22022222)) 
    \s_axi_bresp[1]_i_7 
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[4]),
        .I2(average_frame_available_proc),
        .I3(busy),
        .I4(result_capture_pending_i_2_n_0),
        .I5(awaddr_hold[6]),
        .O(\s_axi_bresp[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA9999AAAA8088)) 
    \s_axi_bresp[1]_i_8 
       (.I0(awaddr_hold[7]),
        .I1(awaddr_hold[4]),
        .I2(busy),
        .I3(\s_axi_bresp[1]_i_17_n_0 ),
        .I4(awaddr_hold[6]),
        .I5(awaddr_hold[3]),
        .O(\s_axi_bresp[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F6F6F7F6)) 
    \s_axi_bresp[1]_i_9 
       (.I0(awaddr_hold[4]),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[3]),
        .I3(\template_write_count[10]_i_3_n_0 ),
        .I4(\template_addr_ptr[9]_i_4_n_0 ),
        .I5(\s_axi_bresp[1]_i_18_n_0 ),
        .O(\s_axi_bresp[1]_i_9_n_0 ));
  FDRE \s_axi_bresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\s_axi_bresp[1]_i_1_n_0 ),
        .Q(s_axi_bresp),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hABFF0000AB000000)) 
    s_axi_bvalid_i_1
       (.I0(s_axi_bvalid_i_2_n_0),
        .I1(average_capture_pending_reg_n_0),
        .I2(s_axi_bvalid_i_3_n_0),
        .I3(s_axi_bvalid_i_4_n_0),
        .I4(s_axi_aresetn),
        .I5(s_axi_bvalid_reg_0),
        .O(s_axi_bvalid_i_1_n_0));
  LUT4 #(
    .INIT(16'h0100)) 
    s_axi_bvalid_i_10
       (.I0(\result_capture_wait_reg_n_0_[2] ),
        .I1(\result_capture_wait_reg_n_0_[0] ),
        .I2(\result_capture_wait_reg_n_0_[1] ),
        .I3(result_capture_pending_reg_n_0),
        .O(s_axi_bvalid_i_10_n_0));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    s_axi_bvalid_i_2
       (.I0(average_capture_pending_reg_n_0),
        .I1(average_capture_wait[1]),
        .I2(average_capture_wait[0]),
        .I3(average_capture_wait[2]),
        .I4(\result_snapshot_q16[63]_i_1_n_0 ),
        .O(s_axi_bvalid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT5 #(
    .INIT(32'hAAAAAAFB)) 
    s_axi_bvalid_i_3
       (.I0(s_axi_bvalid_i_5_n_0),
        .I1(s_axi_bvalid_i_6_n_0),
        .I2(\result_select_addr[7]_i_3_n_0 ),
        .I3(awaddr_hold[0]),
        .I4(awaddr_hold[1]),
        .O(s_axi_bvalid_i_3_n_0));
  LUT6 #(
    .INIT(64'h8A8A8A8A88888A88)) 
    s_axi_bvalid_i_4
       (.I0(s_axi_bvalid_i_7_n_0),
        .I1(s_axi_bvalid_i_8_n_0),
        .I2(s_axi_bvalid_i_5_n_0),
        .I3(s_axi_bvalid_i_6_n_0),
        .I4(\result_select_addr[7]_i_3_n_0 ),
        .I5(pn_enable_i_8_n_0),
        .O(s_axi_bvalid_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT4 #(
    .INIT(16'hFFBF)) 
    s_axi_bvalid_i_5
       (.I0(result_capture_pending_reg_n_0),
        .I1(w_pending_reg_n_0),
        .I2(aw_pending_reg_n_0),
        .I3(s_axi_bvalid_reg_0),
        .O(s_axi_bvalid_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT5 #(
    .INIT(32'hFFBFFFFF)) 
    s_axi_bvalid_i_6
       (.I0(s_axi_bvalid_i_9_n_0),
        .I1(awaddr_hold[7]),
        .I2(result_capture_pending_i_2_n_0),
        .I3(busy),
        .I4(average_frame_available_proc),
        .O(s_axi_bvalid_i_6_n_0));
  LUT6 #(
    .INIT(64'h8888888FFFFFFFFF)) 
    s_axi_bvalid_i_7
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid_reg_0),
        .I2(average_capture_wait[1]),
        .I3(average_capture_wait[0]),
        .I4(average_capture_wait[2]),
        .I5(average_capture_pending_reg_n_0),
        .O(s_axi_bvalid_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFF8)) 
    s_axi_bvalid_i_8
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_bvalid_i_10_n_0),
        .I3(average_capture_pending_reg_n_0),
        .O(s_axi_bvalid_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    s_axi_bvalid_i_9
       (.I0(awaddr_hold[3]),
        .I1(awaddr_hold[6]),
        .I2(awaddr_hold[5]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[2]),
        .O(s_axi_bvalid_i_9_n_0));
  FDRE s_axi_bvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_1_n_0),
        .Q(s_axi_bvalid_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0504000400040004)) 
    \s_axi_rdata[0]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[0]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[6]_i_4_n_0 ),
        .I5(\s_axi_rdata[0]_i_3_n_0 ),
        .O(\s_axi_rdata[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[0]_i_10 
       (.I0(\template_addr_ptr_reg_n_0_[0] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[0] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[0]),
        .O(\s_axi_rdata[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFAA330F00AA33)) 
    \s_axi_rdata[0]_i_11 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(\template_write_count_reg_n_0_[0] ),
        .I2(coeff_status_word[0]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_crc_state_reg_n_0_[0] ),
        .O(\s_axi_rdata[0]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[0]_i_12 
       (.I0(data11[0]),
        .I1(\result_snapshot_q16_reg_n_0_[0] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(result_select_addr[0]),
        .O(\s_axi_rdata[0]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \s_axi_rdata[0]_i_13 
       (.I0(\baseline_write_count_reg_n_0_[0] ),
        .I1(s_axi_araddr[2]),
        .I2(result_snapshot_valid_reg_n_0),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[0]_i_14_n_0 ),
        .O(\s_axi_rdata[0]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair195" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \s_axi_rdata[0]_i_14 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(\baseline_crc_state_reg_n_0_[0] ),
        .I2(s_axi_araddr[2]),
        .I3(\last_error_reg_n_0_[0] ),
        .O(\s_axi_rdata[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hA0AFA0AFCFCFC0C0)) 
    \s_axi_rdata[0]_i_2 
       (.I0(\s_axi_rdata_reg[0]_i_4_n_0 ),
        .I1(\s_axi_rdata[0]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[0]_i_6_n_0 ),
        .I4(\s_axi_rdata_reg[0]_i_7_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \s_axi_rdata[0]_i_3 
       (.I0(\s_axi_rdata[0]_i_8_n_0 ),
        .I1(\s_axi_rdata[26]_i_5_n_0 ),
        .I2(s_axi_araddr[3]),
        .I3(average_snapshot_valid_reg_n_0),
        .I4(s_axi_araddr[2]),
        .I5(pn_enable_reg_0),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8888911100009111)) 
    \s_axi_rdata[0]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[4]),
        .I2(baseline_coeff_valid),
        .I3(template_coeff_valid),
        .I4(s_axi_araddr[2]),
        .I5(\irq_enable_reg_n_0_[0] ),
        .O(\s_axi_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4C7CFFFF4C7C0000)) 
    \s_axi_rdata[0]_i_6 
       (.I0(frames_seen_proc[0]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(pulse_mode[0]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[0]_i_11_n_0 ),
        .O(\s_axi_rdata[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s_axi_rdata[0]_i_8 
       (.I0(\average_snapshot_q2_reg_n_0_[0] ),
        .I1(average_select_addr[0]),
        .I2(s_axi_araddr[3]),
        .I3(frames_seen_proc[0]),
        .I4(s_axi_araddr[2]),
        .O(\s_axi_rdata[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[0]_i_9 
       (.I0(average_overflow_count[0]),
        .I1(result_count[0]),
        .I2(s_axi_araddr[3]),
        .I3(out[0]),
        .I4(s_axi_araddr[2]),
        .I5(\irq_status_reg_n_0_[0] ),
        .O(\s_axi_rdata[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h01000105)) 
    \s_axi_rdata[10]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[10]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[10]_i_3_n_0 ),
        .O(\s_axi_rdata[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \s_axi_rdata[10]_i_10 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .O(\s_axi_rdata[10]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
    \s_axi_rdata[10]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(\average_snapshot_q2_reg_n_0_[10] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[6]),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0A0C0AFCFA0CF)) 
    \s_axi_rdata[10]_i_3 
       (.I0(\s_axi_rdata[10]_i_4_n_0 ),
        .I1(\s_axi_rdata[10]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[10]_i_6_n_0 ),
        .I5(\s_axi_rdata[10]_i_7_n_0 ),
        .O(\s_axi_rdata[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF053FFFFFF53FF)) 
    \s_axi_rdata[10]_i_4 
       (.I0(average_overflow_count[10]),
        .I1(out[10]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[10]),
        .O(\s_axi_rdata[10]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h3F50FFFF)) 
    \s_axi_rdata[10]_i_5 
       (.I0(result_count[0]),
        .I1(\irq_enable_reg_n_0_[10] ),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFECFFEF)) 
    \s_axi_rdata[10]_i_6 
       (.I0(\baseline_crc_state_reg_n_0_[10] ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(\template_write_count_reg_n_0_[10] ),
        .I5(\s_axi_rdata[10]_i_8_n_0 ),
        .O(\s_axi_rdata[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4FFF4FFF4F4F4)) 
    \s_axi_rdata[10]_i_7 
       (.I0(\s_axi_rdata[27]_i_7_n_0 ),
        .I1(\baseline_write_count_reg_n_0_[10] ),
        .I2(\s_axi_rdata[10]_i_9_n_0 ),
        .I3(\s_axi_rdata[10]_i_10_n_0 ),
        .I4(\baseline_crc_state_reg_n_0_[10] ),
        .I5(\template_crc_state_reg_n_0_[10] ),
        .O(\s_axi_rdata[10]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h08000830)) 
    \s_axi_rdata[10]_i_8 
       (.I0(pulse_width[2]),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\template_crc_state_reg_n_0_[10] ),
        .O(\s_axi_rdata[10]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[10]_i_9 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[10]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[10] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[10]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0004110444045504)) 
    \s_axi_rdata[11]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[11]_i_2_n_0 ),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata[11]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[11]_i_4_n_0 ),
        .O(\s_axi_rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
    \s_axi_rdata[11]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(\average_snapshot_q2_reg_n_0_[11] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[6]),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AFACACAF)) 
    \s_axi_rdata[11]_i_3 
       (.I0(\s_axi_rdata[11]_i_5_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[11] ),
        .I4(\template_crc_state_reg_n_0_[11] ),
        .I5(\s_axi_rdata[11]_i_6_n_0 ),
        .O(\s_axi_rdata[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF3AFFFFFF3AF0FF)) 
    \s_axi_rdata[11]_i_5 
       (.I0(\baseline_crc_state_reg_n_0_[11] ),
        .I1(pulse_width[3]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\template_crc_state_reg_n_0_[11] ),
        .O(\s_axi_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[11]_i_6 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[11]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[11] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[11]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h57F7FAFA)) 
    \s_axi_rdata[11]_i_7 
       (.I0(s_axi_araddr[3]),
        .I1(result_count[1]),
        .I2(s_axi_araddr[2]),
        .I3(\irq_enable_reg_n_0_[11] ),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFF03FF5FFFF3F)) 
    \s_axi_rdata[11]_i_8 
       (.I0(average_overflow_count[11]),
        .I1(correlation_overflow_count[11]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .I5(out[11]),
        .O(\s_axi_rdata[11]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0004110444045504)) 
    \s_axi_rdata[12]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[12]_i_2_n_0 ),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata_reg[12]_i_3_n_0 ),
        .I5(\s_axi_rdata[12]_i_4_n_0 ),
        .O(\s_axi_rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFBFFFFEFFFF)) 
    \s_axi_rdata[12]_i_2 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[6]),
        .I4(s_axi_araddr[5]),
        .I5(\average_snapshot_q2_reg_n_0_[12] ),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8BBB8B8B8BBBBBBB)) 
    \s_axi_rdata[12]_i_4 
       (.I0(\s_axi_rdata[12]_i_7_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(\s_axi_rdata[18]_i_7_n_0 ),
        .I3(\irq_enable_reg_n_0_[12] ),
        .I4(s_axi_araddr[2]),
        .I5(result_count[2]),
        .O(\s_axi_rdata[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[12]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[12] ),
        .I2(\baseline_crc_state_reg_n_0_[12] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[12]_i_8_n_0 ),
        .O(\s_axi_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFF3FFAFFFF30FAFF)) 
    \s_axi_rdata[12]_i_6 
       (.I0(\template_crc_state_reg_n_0_[12] ),
        .I1(pulse_width[4]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_crc_state_reg_n_0_[12] ),
        .O(\s_axi_rdata[12]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFF503FFFFF5F3FF)) 
    \s_axi_rdata[12]_i_7 
       (.I0(correlation_overflow_count[12]),
        .I1(out[12]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(average_overflow_count[12]),
        .O(\s_axi_rdata[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[12]_i_8 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[12] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[12]),
        .O(\s_axi_rdata[12]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h5454444444544444)) 
    \s_axi_rdata[13]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[13]_i_2_n_0 ),
        .I2(\s_axi_rdata[23]_i_3_n_0 ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\average_snapshot_q2_reg_n_0_[13] ),
        .O(\s_axi_rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB0A0B0A00000B000)) 
    \s_axi_rdata[13]_i_2 
       (.I0(\s_axi_rdata[13]_i_3_n_0 ),
        .I1(\s_axi_rdata[13]_i_4_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[13]_i_5_n_0 ),
        .I5(\s_axi_rdata[13]_i_6_n_0 ),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0110)) 
    \s_axi_rdata[13]_i_3 
       (.I0(\s_axi_rdata[30]_i_8_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(\baseline_crc_state_reg_n_0_[13] ),
        .I3(\template_crc_state_reg_n_0_[13] ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[13]_i_7_n_0 ),
        .O(\s_axi_rdata[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF3AFFFFFF3AF0FF)) 
    \s_axi_rdata[13]_i_4 
       (.I0(\baseline_crc_state_reg_n_0_[13] ),
        .I1(pulse_width[5]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\template_crc_state_reg_n_0_[13] ),
        .O(\s_axi_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFF03FF5FFFF3F)) 
    \s_axi_rdata[13]_i_5 
       (.I0(average_overflow_count[13]),
        .I1(correlation_overflow_count[13]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .I5(out[13]),
        .O(\s_axi_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h40444000FFFFFFFF)) 
    \s_axi_rdata[13]_i_6 
       (.I0(s_axi_araddr[5]),
        .I1(\s_axi_rdata[18]_i_7_n_0 ),
        .I2(\irq_enable_reg_n_0_[13] ),
        .I3(s_axi_araddr[2]),
        .I4(result_count[3]),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[13]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[13]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[13] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[13]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h5454444444544444)) 
    \s_axi_rdata[14]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[14]_i_2_n_0 ),
        .I2(\s_axi_rdata[23]_i_3_n_0 ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\average_snapshot_q2_reg_n_0_[14] ),
        .O(\s_axi_rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2)) 
    \s_axi_rdata[14]_i_2 
       (.I0(\s_axi_rdata[30]_i_2_n_0 ),
        .I1(\s_axi_rdata[14]_i_3_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[14]_i_4_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[14]_i_5_n_0 ),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AFACACAF)) 
    \s_axi_rdata[14]_i_3 
       (.I0(\s_axi_rdata[14]_i_6_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[14] ),
        .I4(\template_crc_state_reg_n_0_[14] ),
        .I5(\s_axi_rdata[14]_i_7_n_0 ),
        .O(\s_axi_rdata[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h772AFF2A)) 
    \s_axi_rdata[14]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[4]),
        .I2(result_count[4]),
        .I3(s_axi_araddr[2]),
        .I4(\irq_enable_reg_n_0_[14] ),
        .O(\s_axi_rdata[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFF03FF5FFFF3F)) 
    \s_axi_rdata[14]_i_5 
       (.I0(average_overflow_count[14]),
        .I1(correlation_overflow_count[14]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .I5(out[14]),
        .O(\s_axi_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[14]_i_6 
       (.I0(\baseline_crc_state_reg_n_0_[14] ),
        .I1(\template_crc_state_reg_n_0_[14] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[14] ),
        .O(\s_axi_rdata[14]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[14]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[14]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[14] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[14]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h5544454444444444)) 
    \s_axi_rdata[15]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[15]_i_2_n_0 ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\average_snapshot_q2_reg_n_0_[15] ),
        .I5(\s_axi_rdata[23]_i_3_n_0 ),
        .O(\s_axi_rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB0A0B0A00000B000)) 
    \s_axi_rdata[15]_i_2 
       (.I0(\s_axi_rdata[15]_i_3_n_0 ),
        .I1(\s_axi_rdata[15]_i_4_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[15]_i_5_n_0 ),
        .I5(\s_axi_rdata[15]_i_6_n_0 ),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAABABAA)) 
    \s_axi_rdata[15]_i_3 
       (.I0(\s_axi_rdata[15]_i_7_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[15] ),
        .I4(\template_crc_state_reg_n_0_[15] ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[15]_i_4 
       (.I0(\baseline_crc_state_reg_n_0_[15] ),
        .I1(\template_crc_state_reg_n_0_[15] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[15] ),
        .O(\s_axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFF053FFFFFF53FF)) 
    \s_axi_rdata[15]_i_5 
       (.I0(average_overflow_count[15]),
        .I1(out[15]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[15]),
        .O(\s_axi_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA0C0FFFF00F0FFFF)) 
    \s_axi_rdata[15]_i_6 
       (.I0(\irq_enable_reg_n_0_[15] ),
        .I1(result_count[5]),
        .I2(\s_axi_rdata[23]_i_9_n_0 ),
        .I3(s_axi_araddr[2]),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[15]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[15]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[15] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[16]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[16]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[16]_i_3_n_0 ),
        .O(\s_axi_rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5554545505040405)) 
    \s_axi_rdata[16]_i_2 
       (.I0(\s_axi_rdata[16]_i_4_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[16] ),
        .I4(\template_crc_state_reg_n_0_[16] ),
        .I5(\s_axi_rdata[16]_i_5_n_0 ),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[16]_i_4 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[16]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[16] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[16]_i_5 
       (.I0(\baseline_crc_state_reg_n_0_[16] ),
        .I1(\template_crc_state_reg_n_0_[16] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[16] ),
        .O(\s_axi_rdata[16]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h1DFFCC00)) 
    \s_axi_rdata[16]_i_6 
       (.I0(result_count[6]),
        .I1(s_axi_araddr[2]),
        .I2(\irq_enable_reg_n_0_[16] ),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFF53FFFFFF53F)) 
    \s_axi_rdata[16]_i_7 
       (.I0(out[16]),
        .I1(correlation_overflow_count[16]),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .I5(average_overflow_count[16]),
        .O(\s_axi_rdata[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[17]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[19]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata_reg[17]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[17]_i_3_n_0 ),
        .O(\s_axi_rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[17]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[17] ),
        .I2(\baseline_crc_state_reg_n_0_[17] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[17]_i_8_n_0 ),
        .O(\s_axi_rdata[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[17]_i_5 
       (.I0(\baseline_crc_state_reg_n_0_[17] ),
        .I1(\template_crc_state_reg_n_0_[17] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[17] ),
        .O(\s_axi_rdata[17]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h1DFFCC00)) 
    \s_axi_rdata[17]_i_6 
       (.I0(result_count[7]),
        .I1(s_axi_araddr[2]),
        .I2(\irq_enable_reg_n_0_[17] ),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[17]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFF503FFFFF5F3FF)) 
    \s_axi_rdata[17]_i_7 
       (.I0(correlation_overflow_count[17]),
        .I1(out[17]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(average_overflow_count[17]),
        .O(\s_axi_rdata[17]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[17]_i_8 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[17] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[17]),
        .O(\s_axi_rdata[17]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[18]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata_reg[18]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[18]_i_3_n_0 ),
        .O(\s_axi_rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8BBB8B8B8BBBBBBB)) 
    \s_axi_rdata[18]_i_3 
       (.I0(\s_axi_rdata[18]_i_6_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(\s_axi_rdata[18]_i_7_n_0 ),
        .I3(\irq_enable_reg_n_0_[18] ),
        .I4(s_axi_araddr[2]),
        .I5(result_count[8]),
        .O(\s_axi_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[18]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[18] ),
        .I2(\baseline_crc_state_reg_n_0_[18] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[18]_i_8_n_0 ),
        .O(\s_axi_rdata[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFFCFFF5FFFC0F)) 
    \s_axi_rdata[18]_i_5 
       (.I0(\pulse_config_word_reg_n_0_[18] ),
        .I1(\baseline_crc_state_reg_n_0_[18] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\template_crc_state_reg_n_0_[18] ),
        .O(\s_axi_rdata[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF03F5FFFFF3F5F)) 
    \s_axi_rdata[18]_i_6 
       (.I0(out[18]),
        .I1(average_overflow_count[18]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[18]),
        .O(\s_axi_rdata[18]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[18]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[3]),
        .O(\s_axi_rdata[18]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[18]_i_8 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[18] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[18]),
        .O(\s_axi_rdata[18]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[19]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[19]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[19]_i_3_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[19]_i_4_n_0 ),
        .O(\s_axi_rdata[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFF5FFFFFFFFFF)) 
    \s_axi_rdata[19]_i_2 
       (.I0(\s_axi_rdata[6]_i_4_n_0 ),
        .I1(\average_snapshot_q2_reg_n_0_[15] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[26]_i_5_n_0 ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00F9000000F9)) 
    \s_axi_rdata[19]_i_3 
       (.I0(\template_crc_state_reg_n_0_[19] ),
        .I1(\baseline_crc_state_reg_n_0_[19] ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(\s_axi_rdata[19]_i_5_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[19]_i_6_n_0 ),
        .O(\s_axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[19]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[19]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[19] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFF3AFFFFFF3AF0FF)) 
    \s_axi_rdata[19]_i_6 
       (.I0(\baseline_crc_state_reg_n_0_[19] ),
        .I1(\pulse_config_word_reg_n_0_[19] ),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\template_crc_state_reg_n_0_[19] ),
        .O(\s_axi_rdata[19]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h5D7DDDFD)) 
    \s_axi_rdata[19]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\status_word_d[19]_i_1_n_0 ),
        .I4(\irq_enable_reg_n_0_[19] ),
        .O(\s_axi_rdata[19]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFF53F0FFFF53FFF)) 
    \s_axi_rdata[19]_i_8 
       (.I0(correlation_overflow_count[19]),
        .I1(average_overflow_count[19]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(out[19]),
        .O(\s_axi_rdata[19]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0004110444045504)) 
    \s_axi_rdata[1]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[1]_i_2_n_0 ),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata[1]_i_3_n_0 ),
        .I5(\s_axi_rdata[1]_i_4_n_0 ),
        .O(\s_axi_rdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5F5F57F7FFFF57F7)) 
    \s_axi_rdata[1]_i_10 
       (.I0(s_axi_araddr[4]),
        .I1(correlation_overflow_count[1]),
        .I2(s_axi_araddr[2]),
        .I3(\baseline_addr_ptr_reg_n_0_[1] ),
        .I4(s_axi_araddr[3]),
        .I5(\template_addr_ptr_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[1]_i_11 
       (.I0(average_overflow_count[1]),
        .I1(result_count[1]),
        .I2(s_axi_araddr[3]),
        .I3(out[1]),
        .I4(s_axi_araddr[2]),
        .I5(\irq_status_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h7C3C7CFC7CFC7CFC)) 
    \s_axi_rdata[1]_i_12 
       (.I0(\irq_enable_reg_n_0_[1] ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\s_axi_rdata[1]_i_4_0 ),
        .I5(\s_axi_rdata[1]_i_4_1 ),
        .O(\s_axi_rdata[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h555555F7FFFF55F7)) 
    \s_axi_rdata[1]_i_2 
       (.I0(\s_axi_rdata[6]_i_4_n_0 ),
        .I1(average_frame_available_proc),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[26]_i_5_n_0 ),
        .I5(\s_axi_rdata[1]_i_5_n_0 ),
        .O(\s_axi_rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[1]_i_3 
       (.I0(\s_axi_rdata[1]_i_6_n_0 ),
        .I1(\s_axi_rdata[1]_i_7_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\s_axi_rdata[1]_i_8_n_0 ),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[1]_i_9_n_0 ),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT5 #(
    .INIT(32'h8AFF8A00)) 
    \s_axi_rdata[1]_i_4 
       (.I0(\s_axi_rdata[1]_i_10_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(\s_axi_rdata[1]_i_11_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[1]_i_12_n_0 ),
        .O(\s_axi_rdata[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s_axi_rdata[1]_i_5 
       (.I0(\average_snapshot_q2_reg_n_0_[1] ),
        .I1(average_select_addr[1]),
        .I2(s_axi_araddr[3]),
        .I3(frames_seen_proc[1]),
        .I4(s_axi_araddr[2]),
        .O(\s_axi_rdata[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h4C7C)) 
    \s_axi_rdata[1]_i_6 
       (.I0(frames_seen_proc[1]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(pulse_mode[1]),
        .O(\s_axi_rdata[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFAA330F00AA33)) 
    \s_axi_rdata[1]_i_7 
       (.I0(\template_crc_state_reg_n_0_[1] ),
        .I1(\template_write_count_reg_n_0_[1] ),
        .I2(coeff_status_word[1]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_crc_state_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3FF530F530F53FF5)) 
    \s_axi_rdata[1]_i_8 
       (.I0(\last_error_reg_n_0_[1] ),
        .I1(\baseline_write_count_reg_n_0_[1] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\template_crc_state_reg_n_0_[1] ),
        .I5(\baseline_crc_state_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \s_axi_rdata[1]_i_9 
       (.I0(result_select_addr[1]),
        .I1(s_axi_araddr[3]),
        .I2(data11[1]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[1] ),
        .O(\s_axi_rdata[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[20]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[20]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[20]_i_3_n_0 ),
        .O(\s_axi_rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00F9000000F9)) 
    \s_axi_rdata[20]_i_2 
       (.I0(\template_crc_state_reg_n_0_[20] ),
        .I1(\baseline_crc_state_reg_n_0_[20] ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(\s_axi_rdata[20]_i_4_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[20]_i_5_n_0 ),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FBB0B0000BB0B)) 
    \s_axi_rdata[20]_i_3 
       (.I0(\s_axi_rdata[20]_i_6_n_0 ),
        .I1(\status_word_d[20]_i_1_n_0 ),
        .I2(\irq_enable_reg_n_0_[20] ),
        .I3(\s_axi_rdata[27]_i_7_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[20]_i_7_n_0 ),
        .O(\s_axi_rdata[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[20]_i_4 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[20]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[20] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFF5FFCFFFF5FFC0F)) 
    \s_axi_rdata[20]_i_5 
       (.I0(\pulse_config_word_reg_n_0_[20] ),
        .I1(\template_crc_state_reg_n_0_[20] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\baseline_crc_state_reg_n_0_[20] ),
        .O(\s_axi_rdata[20]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \s_axi_rdata[20]_i_6 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[4]),
        .O(\s_axi_rdata[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFF503FFFFF5F3FF)) 
    \s_axi_rdata[20]_i_7 
       (.I0(correlation_overflow_count[20]),
        .I1(out[20]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(average_overflow_count[20]),
        .O(\s_axi_rdata[20]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[21]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[21]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[21]_i_3_n_0 ),
        .O(\s_axi_rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2233223022302233)) 
    \s_axi_rdata[21]_i_2 
       (.I0(\s_axi_rdata[21]_i_4_n_0 ),
        .I1(\s_axi_rdata[21]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\baseline_crc_state_reg_n_0_[21] ),
        .I5(\template_crc_state_reg_n_0_[21] ),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF15555005)) 
    \s_axi_rdata[21]_i_3 
       (.I0(s_axi_araddr[5]),
        .I1(\irq_enable_reg_n_0_[21] ),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[21]_i_6_n_0 ),
        .O(\s_axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[21]_i_4 
       (.I0(\baseline_crc_state_reg_n_0_[21] ),
        .I1(\template_crc_state_reg_n_0_[21] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[21] ),
        .O(\s_axi_rdata[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[21]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[21]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[21] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFDF0000)) 
    \s_axi_rdata[21]_i_6 
       (.I0(out[21]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[21]_i_7_n_0 ),
        .O(\s_axi_rdata[21]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h30080008)) 
    \s_axi_rdata[21]_i_7 
       (.I0(correlation_overflow_count[21]),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(average_overflow_count[21]),
        .O(\s_axi_rdata[21]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[22]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[22]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[22]_i_3_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[22]_i_4_n_0 ),
        .O(\s_axi_rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F5FF5FFFFFFFFFF)) 
    \s_axi_rdata[22]_i_2 
       (.I0(\s_axi_rdata[6]_i_4_n_0 ),
        .I1(\average_snapshot_q2_reg_n_0_[15] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[26]_i_5_n_0 ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00F9000000F9)) 
    \s_axi_rdata[22]_i_3 
       (.I0(\template_crc_state_reg_n_0_[22] ),
        .I1(\baseline_crc_state_reg_n_0_[22] ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(\s_axi_rdata[22]_i_5_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[22]_i_6_n_0 ),
        .O(\s_axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00007FF0)) 
    \s_axi_rdata[22]_i_4 
       (.I0(\irq_enable_reg_n_0_[22] ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[22]_i_7_n_0 ),
        .O(\s_axi_rdata[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[22]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[22]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[22] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF00FFCAFFF0FFCAF)) 
    \s_axi_rdata[22]_i_6 
       (.I0(\template_crc_state_reg_n_0_[22] ),
        .I1(\baseline_crc_state_reg_n_0_[22] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[22] ),
        .O(\s_axi_rdata[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CFF7FFF7)) 
    \s_axi_rdata[22]_i_7 
       (.I0(correlation_overflow_count[22]),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(average_overflow_count[22]),
        .I5(\s_axi_rdata[22]_i_8_n_0 ),
        .O(\s_axi_rdata[22]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT5 #(
    .INIT(32'h0400FFFF)) 
    \s_axi_rdata[22]_i_8 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(out[22]),
        .I4(s_axi_araddr[5]),
        .O(\s_axi_rdata[22]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h5544454444444444)) 
    \s_axi_rdata[23]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[23]_i_2_n_0 ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\average_snapshot_q2_reg_n_0_[15] ),
        .I5(\s_axi_rdata[23]_i_3_n_0 ),
        .O(\s_axi_rdata[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair219" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[23]_i_10 
       (.I0(baseline_coeff_valid),
        .I1(template_coeff_valid),
        .O(p_0_in1_in));
  LUT6 #(
    .INIT(64'hB0A0B0A00000B000)) 
    \s_axi_rdata[23]_i_2 
       (.I0(\s_axi_rdata[23]_i_4_n_0 ),
        .I1(\s_axi_rdata[23]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[23]_i_6_n_0 ),
        .I5(\s_axi_rdata[23]_i_7_n_0 ),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \s_axi_rdata[23]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[7]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[6]),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAABABAA)) 
    \s_axi_rdata[23]_i_4 
       (.I0(\s_axi_rdata[23]_i_8_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[23] ),
        .I4(\template_crc_state_reg_n_0_[23] ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFFCFFF5FFFC0F)) 
    \s_axi_rdata[23]_i_5 
       (.I0(\pulse_config_word_reg_n_0_[23] ),
        .I1(\baseline_crc_state_reg_n_0_[23] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\template_crc_state_reg_n_0_[23] ),
        .O(\s_axi_rdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF03F5FFFFF3F5F)) 
    \s_axi_rdata[23]_i_6 
       (.I0(out[23]),
        .I1(average_overflow_count[23]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[23]),
        .O(\s_axi_rdata[23]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hDDD555D555DD55DD)) 
    \s_axi_rdata[23]_i_7 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(\s_axi_rdata[23]_i_9_n_0 ),
        .I2(p_0_in1_in),
        .I3(s_axi_araddr[2]),
        .I4(\irq_enable_reg_n_0_[23] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[23]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[23]_i_8 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[23]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[23] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[23]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[23]_i_9 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .O(\s_axi_rdata[23]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[24]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[26]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[24]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[24]_i_3_n_0 ),
        .O(\s_axi_rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2233223022302233)) 
    \s_axi_rdata[24]_i_2 
       (.I0(\s_axi_rdata[24]_i_4_n_0 ),
        .I1(\s_axi_rdata[24]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\baseline_crc_state_reg_n_0_[24] ),
        .I5(\template_crc_state_reg_n_0_[24] ),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[24]_i_4 
       (.I0(\baseline_crc_state_reg_n_0_[24] ),
        .I1(\template_crc_state_reg_n_0_[24] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[24] ),
        .O(\s_axi_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[24]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[24]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[24] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[24]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h35F00FF0)) 
    \s_axi_rdata[24]_i_6 
       (.I0(frame_error_sticky_proc),
        .I1(\irq_enable_reg_n_0_[24] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFF035FFFFFF35FF)) 
    \s_axi_rdata[24]_i_7 
       (.I0(out[24]),
        .I1(average_overflow_count[24]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[24]),
        .O(\s_axi_rdata[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000445455555555)) 
    \s_axi_rdata[25]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[25]_i_2_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\s_axi_rdata[25]_i_3_n_0 ),
        .I4(\s_axi_rdata[25]_i_4_n_0 ),
        .I5(\s_axi_rdata[27]_i_5_n_0 ),
        .O(\s_axi_rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAABABAA)) 
    \s_axi_rdata[25]_i_2 
       (.I0(\s_axi_rdata[25]_i_5_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[25] ),
        .I4(\template_crc_state_reg_n_0_[25] ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FFCAFFFFFFCAF)) 
    \s_axi_rdata[25]_i_3 
       (.I0(\baseline_crc_state_reg_n_0_[25] ),
        .I1(\template_crc_state_reg_n_0_[25] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[25] ),
        .O(\s_axi_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h45004545FFFFFFFF)) 
    \s_axi_rdata[25]_i_4 
       (.I0(\s_axi_rdata[27]_i_8_n_0 ),
        .I1(\s_axi_rdata[27]_i_7_n_0 ),
        .I2(\irq_enable_reg_n_0_[25] ),
        .I3(\s_axi_rdata[25]_i_6_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[30]_i_2_n_0 ),
        .O(\s_axi_rdata[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[25]_i_5 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[25]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[25] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[25]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF503FFFFF5F3FF)) 
    \s_axi_rdata[25]_i_6 
       (.I0(correlation_overflow_count[25]),
        .I1(out[25]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(average_overflow_count[25]),
        .O(\s_axi_rdata[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[26]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[26]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[26]_i_3_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[26]_i_4_n_0 ),
        .O(\s_axi_rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5FDFFFFFFFFFFFFF)) 
    \s_axi_rdata[26]_i_2 
       (.I0(\s_axi_rdata[6]_i_4_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\average_snapshot_q2_reg_n_0_[15] ),
        .I4(\s_axi_rdata[26]_i_5_n_0 ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2233223022302233)) 
    \s_axi_rdata[26]_i_3 
       (.I0(\s_axi_rdata[26]_i_6_n_0 ),
        .I1(\s_axi_rdata[26]_i_7_n_0 ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\baseline_crc_state_reg_n_0_[26] ),
        .I5(\template_crc_state_reg_n_0_[26] ),
        .O(\s_axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8BBBBBB8BBBBBBB8)) 
    \s_axi_rdata[26]_i_4 
       (.I0(\s_axi_rdata[26]_i_8_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(\irq_enable_reg_n_0_[26] ),
        .O(\s_axi_rdata[26]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair233" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \s_axi_rdata[26]_i_5 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[4]),
        .O(\s_axi_rdata[26]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFFCAFFFFFFCAF)) 
    \s_axi_rdata[26]_i_6 
       (.I0(\template_crc_state_reg_n_0_[26] ),
        .I1(\baseline_crc_state_reg_n_0_[26] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[26] ),
        .O(\s_axi_rdata[26]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[26]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[26]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[26] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[26]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFF53F0FFFF53FFF)) 
    \s_axi_rdata[26]_i_8 
       (.I0(correlation_overflow_count[26]),
        .I1(average_overflow_count[26]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(out[26]),
        .O(\s_axi_rdata[26]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000445455555555)) 
    \s_axi_rdata[27]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[27]_i_2_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\s_axi_rdata[27]_i_3_n_0 ),
        .I4(\s_axi_rdata[27]_i_4_n_0 ),
        .I5(\s_axi_rdata[27]_i_5_n_0 ),
        .O(\s_axi_rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAABABAA)) 
    \s_axi_rdata[27]_i_2 
       (.I0(\s_axi_rdata[27]_i_6_n_0 ),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\baseline_crc_state_reg_n_0_[27] ),
        .I4(\template_crc_state_reg_n_0_[27] ),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFFCAFFFFFFCAF)) 
    \s_axi_rdata[27]_i_3 
       (.I0(\template_crc_state_reg_n_0_[27] ),
        .I1(\baseline_crc_state_reg_n_0_[27] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[27] ),
        .O(\s_axi_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0B000B0BFFFFFFFF)) 
    \s_axi_rdata[27]_i_4 
       (.I0(\s_axi_rdata[27]_i_7_n_0 ),
        .I1(\irq_enable_reg_n_0_[27] ),
        .I2(\s_axi_rdata[27]_i_8_n_0 ),
        .I3(\s_axi_rdata[27]_i_9_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[30]_i_2_n_0 ),
        .O(\s_axi_rdata[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFFFFFF)) 
    \s_axi_rdata[27]_i_5 
       (.I0(\average_snapshot_q2_reg_n_0_[15] ),
        .I1(\s_axi_rdata[31]_i_5_n_0 ),
        .I2(s_axi_araddr[4]),
        .I3(\s_axi_rdata[6]_i_4_n_0 ),
        .I4(s_axi_araddr[7]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[27]_i_6 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[27]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[27] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[27]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT4 #(
    .INIT(16'hF7FF)) 
    \s_axi_rdata[27]_i_7 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[4]),
        .O(\s_axi_rdata[27]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT5 #(
    .INIT(32'h5555555D)) 
    \s_axi_rdata[27]_i_8 
       (.I0(\s_axi_rdata[30]_i_4_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[27]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFF03F5FFFFF3F5F)) 
    \s_axi_rdata[27]_i_9 
       (.I0(out[27]),
        .I1(average_overflow_count[27]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[27]),
        .O(\s_axi_rdata[27]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h11101115)) 
    \s_axi_rdata[28]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[31]_i_3_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[28]_i_2_n_0 ),
        .O(\s_axi_rdata[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \s_axi_rdata[28]_i_2 
       (.I0(\s_axi_rdata[28]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[28]_i_4_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[28]_i_5_n_0 ),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAAFFAAFFAAFF)) 
    \s_axi_rdata[28]_i_3 
       (.I0(\s_axi_rdata[28]_i_6_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[4]),
        .I5(\irq_enable_reg_n_0_[28] ),
        .O(\s_axi_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFFCAFFFFFFCAF)) 
    \s_axi_rdata[28]_i_4 
       (.I0(\template_crc_state_reg_n_0_[28] ),
        .I1(\baseline_crc_state_reg_n_0_[28] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\pulse_config_word_reg_n_0_[28] ),
        .O(\s_axi_rdata[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[28]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[28] ),
        .I2(\baseline_crc_state_reg_n_0_[28] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[28]_i_7_n_0 ),
        .O(\s_axi_rdata[28]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF053FFFFFF53FF)) 
    \s_axi_rdata[28]_i_6 
       (.I0(average_overflow_count[28]),
        .I1(out[28]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[28]),
        .O(\s_axi_rdata[28]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[28]_i_7 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[28] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[28]),
        .O(\s_axi_rdata[28]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h11101115)) 
    \s_axi_rdata[29]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[31]_i_3_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[29]_i_2_n_0 ),
        .O(\s_axi_rdata[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \s_axi_rdata[29]_i_2 
       (.I0(\s_axi_rdata[29]_i_3_n_0 ),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[29]_i_4_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[29]_i_5_n_0 ),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAAFFAAFFAAFF)) 
    \s_axi_rdata[29]_i_3 
       (.I0(\s_axi_rdata[29]_i_6_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[4]),
        .I5(\irq_enable_reg_n_0_[29] ),
        .O(\s_axi_rdata[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFFCFFF5FFFC0F)) 
    \s_axi_rdata[29]_i_4 
       (.I0(\pulse_config_word_reg_n_0_[29] ),
        .I1(\baseline_crc_state_reg_n_0_[29] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\template_crc_state_reg_n_0_[29] ),
        .O(\s_axi_rdata[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[29]_i_5 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[29] ),
        .I2(\baseline_crc_state_reg_n_0_[29] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[29]_i_7_n_0 ),
        .O(\s_axi_rdata[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF053FFFFFF53FF)) 
    \s_axi_rdata[29]_i_6 
       (.I0(average_overflow_count[29]),
        .I1(out[29]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[29]),
        .O(\s_axi_rdata[29]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[29]_i_7 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[29] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[29]),
        .O(\s_axi_rdata[29]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000400055554000)) 
    \s_axi_rdata[2]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[6]_i_4_n_0 ),
        .I3(\s_axi_rdata[2]_i_2_n_0 ),
        .I4(\s_axi_rdata[30]_i_2_n_0 ),
        .I5(\s_axi_rdata[2]_i_3_n_0 ),
        .O(\s_axi_rdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFAA330F00AA33)) 
    \s_axi_rdata[2]_i_10 
       (.I0(\template_crc_state_reg_n_0_[2] ),
        .I1(\template_write_count_reg_n_0_[2] ),
        .I2(baseline_commit_accepted_sticky_reg_n_0),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_crc_state_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \s_axi_rdata[2]_i_11 
       (.I0(result_select_addr[2]),
        .I1(s_axi_araddr[3]),
        .I2(data11[2]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0099FF0FFF99FF0F)) 
    \s_axi_rdata[2]_i_12 
       (.I0(\template_crc_state_reg_n_0_[2] ),
        .I1(\baseline_crc_state_reg_n_0_[2] ),
        .I2(\last_error_reg_n_0_[2] ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_write_count_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAACCFFFF00F00000)) 
    \s_axi_rdata[2]_i_2 
       (.I0(\average_snapshot_q2_reg_n_0_[2] ),
        .I1(average_select_addr[2]),
        .I2(frames_seen_proc[2]),
        .I3(s_axi_araddr[2]),
        .I4(\s_axi_rdata[26]_i_5_n_0 ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1F103F3F1F103030)) 
    \s_axi_rdata[2]_i_3 
       (.I0(\s_axi_rdata_reg[2]_i_4_n_0 ),
        .I1(\s_axi_rdata[2]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[2]_i_6_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata_reg[2]_i_7_n_0 ),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000008C038003)) 
    \s_axi_rdata[2]_i_5 
       (.I0(\irq_enable_reg_n_0_[2] ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(start_accepted_sticky),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4C7CFFFF4C7C0000)) 
    \s_axi_rdata[2]_i_6 
       (.I0(frames_seen_proc[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(pulse_mode[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[2]_i_10_n_0 ),
        .O(\s_axi_rdata[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[2]_i_8 
       (.I0(average_overflow_count[2]),
        .I1(result_count[2]),
        .I2(s_axi_araddr[3]),
        .I3(out[2]),
        .I4(s_axi_araddr[2]),
        .I5(\irq_status_reg_n_0_[2] ),
        .O(\s_axi_rdata[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[2]_i_9 
       (.I0(\template_addr_ptr_reg_n_0_[2] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[2] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[2]),
        .O(\s_axi_rdata[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0101015151510151)) 
    \s_axi_rdata[30]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[31]_i_3_n_0 ),
        .I2(\s_axi_rdata[30]_i_2_n_0 ),
        .I3(\s_axi_rdata[30]_i_3_n_0 ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[30]_i_5_n_0 ),
        .O(\s_axi_rdata[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_axi_rdata[30]_i_2 
       (.I0(s_axi_araddr[7]),
        .I1(s_axi_araddr[0]),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2233223022302233)) 
    \s_axi_rdata[30]_i_3 
       (.I0(\s_axi_rdata[30]_i_6_n_0 ),
        .I1(\s_axi_rdata[30]_i_7_n_0 ),
        .I2(\s_axi_rdata[30]_i_8_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\baseline_crc_state_reg_n_0_[30] ),
        .I5(\template_crc_state_reg_n_0_[30] ),
        .O(\s_axi_rdata[30]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h45)) 
    \s_axi_rdata[30]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[7]),
        .I2(s_axi_araddr[6]),
        .O(\s_axi_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8BBBBBBBBBBBBB88)) 
    \s_axi_rdata[30]_i_5 
       (.I0(\s_axi_rdata[30]_i_9_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(\irq_enable_reg_n_0_[30] ),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFFCFFF5FFFC0F)) 
    \s_axi_rdata[30]_i_6 
       (.I0(\pulse_config_word_reg_n_0_[30] ),
        .I1(\baseline_crc_state_reg_n_0_[30] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\template_crc_state_reg_n_0_[30] ),
        .O(\s_axi_rdata[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[30]_i_7 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[30]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[30] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[30]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \s_axi_rdata[30]_i_8 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[4]),
        .O(\s_axi_rdata[30]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFF503FFFFF5F3FF)) 
    \s_axi_rdata[30]_i_9 
       (.I0(correlation_overflow_count[30]),
        .I1(out[30]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(average_overflow_count[30]),
        .O(\s_axi_rdata[30]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid_reg_0),
        .O(\s_axi_rdata[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h57F7)) 
    \s_axi_rdata[31]_i_10 
       (.I0(s_axi_araddr[3]),
        .I1(\result_snapshot_q16_reg_n_0_[31] ),
        .I2(s_axi_araddr[2]),
        .I3(data11[31]),
        .O(\s_axi_rdata[31]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT5 #(
    .INIT(32'h11101115)) 
    \s_axi_rdata[31]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[31]_i_3_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    \s_axi_rdata[31]_i_3 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[6]),
        .I2(\average_snapshot_q2_reg_n_0_[15] ),
        .I3(\s_axi_rdata[31]_i_5_n_0 ),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[30]_i_4_n_0 ),
        .O(\s_axi_rdata[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \s_axi_rdata[31]_i_4 
       (.I0(\s_axi_rdata[31]_i_6_n_0 ),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[31]_i_7_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[31]_i_8_n_0 ),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \s_axi_rdata[31]_i_5 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAA3FAAFFAAFFAAFF)) 
    \s_axi_rdata[31]_i_6 
       (.I0(\s_axi_rdata[31]_i_9_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[4]),
        .I5(\irq_enable_reg_n_0_[31] ),
        .O(\s_axi_rdata[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF5FFFCFFF5FFFC0F)) 
    \s_axi_rdata[31]_i_7 
       (.I0(\pulse_config_word_reg_n_0_[31] ),
        .I1(\baseline_crc_state_reg_n_0_[31] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\template_crc_state_reg_n_0_[31] ),
        .O(\s_axi_rdata[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hEBFFFFFFEBFF0000)) 
    \s_axi_rdata[31]_i_8 
       (.I0(s_axi_araddr[3]),
        .I1(\template_crc_state_reg_n_0_[31] ),
        .I2(\baseline_crc_state_reg_n_0_[31] ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[31]_i_10_n_0 ),
        .O(\s_axi_rdata[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFF053FFFFFF53FF)) 
    \s_axi_rdata[31]_i_9 
       (.I0(average_overflow_count[31]),
        .I1(out[31]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[4]),
        .I5(correlation_overflow_count[31]),
        .O(\s_axi_rdata[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h1011000100010001)) 
    \s_axi_rdata[3]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[7]),
        .I3(\s_axi_rdata_reg[3]_i_2_n_0 ),
        .I4(\s_axi_rdata[6]_i_4_n_0 ),
        .I5(\s_axi_rdata[3]_i_3_n_0 ),
        .O(\s_axi_rdata[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5F5F57F7FFFF57F7)) 
    \s_axi_rdata[3]_i_10 
       (.I0(s_axi_araddr[4]),
        .I1(correlation_overflow_count[3]),
        .I2(s_axi_araddr[2]),
        .I3(\baseline_addr_ptr_reg_n_0_[3] ),
        .I4(s_axi_araddr[3]),
        .I5(\template_addr_ptr_reg_n_0_[3] ),
        .O(\s_axi_rdata[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s_axi_rdata[3]_i_11 
       (.I0(average_overflow_count[3]),
        .I1(result_count[3]),
        .I2(s_axi_araddr[3]),
        .I3(out[3]),
        .I4(s_axi_araddr[2]),
        .I5(\irq_status_reg_n_0_[3] ),
        .O(\s_axi_rdata[3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT5 #(
    .INIT(32'h7F3C7FFC)) 
    \s_axi_rdata[3]_i_12 
       (.I0(\irq_enable_reg_n_0_[3] ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\status_word_d_reg[3]_0 ),
        .O(\s_axi_rdata[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAAFF0000CC00F000)) 
    \s_axi_rdata[3]_i_3 
       (.I0(\average_snapshot_q2_reg_n_0_[3] ),
        .I1(average_select_addr[3]),
        .I2(frames_seen_proc[3]),
        .I3(\s_axi_rdata[26]_i_5_n_0 ),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFC0A0C0AFCFA0CF)) 
    \s_axi_rdata[3]_i_4 
       (.I0(\s_axi_rdata[3]_i_6_n_0 ),
        .I1(\s_axi_rdata[3]_i_7_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(s_axi_araddr[4]),
        .I4(\s_axi_rdata[3]_i_8_n_0 ),
        .I5(\s_axi_rdata[3]_i_9_n_0 ),
        .O(\s_axi_rdata[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8AFF8A00)) 
    \s_axi_rdata[3]_i_5 
       (.I0(\s_axi_rdata[3]_i_10_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(\s_axi_rdata[3]_i_11_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(\s_axi_rdata[3]_i_12_n_0 ),
        .O(\s_axi_rdata[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h4C7C)) 
    \s_axi_rdata[3]_i_6 
       (.I0(frames_seen_proc[3]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\pulse_config_word_reg_n_0_[3] ),
        .O(\s_axi_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFAA330F00AA33)) 
    \s_axi_rdata[3]_i_7 
       (.I0(\template_crc_state_reg_n_0_[3] ),
        .I1(\template_write_count_reg_n_0_[3] ),
        .I2(template_commit_accepted_sticky_reg_n_0),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_crc_state_reg_n_0_[3] ),
        .O(\s_axi_rdata[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0099FF0FFF99FF0F)) 
    \s_axi_rdata[3]_i_8 
       (.I0(\template_crc_state_reg_n_0_[3] ),
        .I1(\baseline_crc_state_reg_n_0_[3] ),
        .I2(\last_error_reg_n_0_[3] ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_write_count_reg_n_0_[3] ),
        .O(\s_axi_rdata[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[3]_i_9 
       (.I0(data11[3]),
        .I1(\result_snapshot_q16_reg_n_0_[3] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(result_select_addr[3]),
        .O(\s_axi_rdata[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h1011000100010001)) 
    \s_axi_rdata[4]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[7]),
        .I3(\s_axi_rdata_reg[4]_i_2_n_0 ),
        .I4(\s_axi_rdata[6]_i_4_n_0 ),
        .I5(\s_axi_rdata[4]_i_3_n_0 ),
        .O(\s_axi_rdata[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[4]_i_11 
       (.I0(average_overflow_count[4]),
        .I1(result_count[4]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(out[4]),
        .O(\s_axi_rdata[4]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[4]_i_12 
       (.I0(\template_addr_ptr_reg_n_0_[4] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[4] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[4]),
        .O(\s_axi_rdata[4]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAAFF0000CC00F000)) 
    \s_axi_rdata[4]_i_3 
       (.I0(\average_snapshot_q2_reg_n_0_[4] ),
        .I1(average_select_addr[4]),
        .I2(frames_seen_proc[4]),
        .I3(\s_axi_rdata[26]_i_5_n_0 ),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3F302F2F3F302020)) 
    \s_axi_rdata[4]_i_4 
       (.I0(\s_axi_rdata[4]_i_6_n_0 ),
        .I1(\s_axi_rdata[4]_i_7_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\s_axi_rdata[4]_i_8_n_0 ),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[4]_i_9_n_0 ),
        .O(\s_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF0FDD0DDD0D)) 
    \s_axi_rdata[4]_i_5 
       (.I0(busy),
        .I1(\s_axi_rdata[20]_i_6_n_0 ),
        .I2(\irq_enable_reg_n_0_[4] ),
        .I3(\s_axi_rdata[27]_i_7_n_0 ),
        .I4(\s_axi_rdata_reg[4]_i_10_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5F50C0C05F50CFCF)) 
    \s_axi_rdata[4]_i_6 
       (.I0(baseline_commit_rejected_sticky_reg_n_0),
        .I1(\template_crc_state_reg_n_0_[4] ),
        .I2(s_axi_araddr[3]),
        .I3(\baseline_crc_state_reg_n_0_[4] ),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[4] ),
        .O(\s_axi_rdata[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT5 #(
    .INIT(32'hC8000800)) 
    \s_axi_rdata[4]_i_7 
       (.I0(\pulse_config_word_reg_n_0_[4] ),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[4]),
        .I4(frames_seen_proc[4]),
        .O(\s_axi_rdata[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3FF530F530F53FF5)) 
    \s_axi_rdata[4]_i_8 
       (.I0(\last_error_reg_n_0_[4] ),
        .I1(\baseline_write_count_reg_n_0_[4] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\template_crc_state_reg_n_0_[4] ),
        .I5(\baseline_crc_state_reg_n_0_[4] ),
        .O(\s_axi_rdata[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \s_axi_rdata[4]_i_9 
       (.I0(result_select_addr[4]),
        .I1(s_axi_araddr[3]),
        .I2(data11[4]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[4] ),
        .O(\s_axi_rdata[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0504000400040004)) 
    \s_axi_rdata[5]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata_reg[5]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[6]_i_4_n_0 ),
        .I5(\s_axi_rdata[5]_i_3_n_0 ),
        .O(\s_axi_rdata[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[5]_i_11 
       (.I0(average_overflow_count[5]),
        .I1(result_count[5]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(out[5]),
        .O(\s_axi_rdata[5]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[5]_i_12 
       (.I0(\template_addr_ptr_reg_n_0_[5] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[5] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[5]),
        .O(\s_axi_rdata[5]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAAFF0000CC00F000)) 
    \s_axi_rdata[5]_i_3 
       (.I0(\average_snapshot_q2_reg_n_0_[5] ),
        .I1(average_select_addr[5]),
        .I2(frames_seen_proc[5]),
        .I3(\s_axi_rdata[26]_i_5_n_0 ),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0BFBFAFA0B0B0)) 
    \s_axi_rdata[5]_i_4 
       (.I0(\s_axi_rdata[5]_i_6_n_0 ),
        .I1(\s_axi_rdata[5]_i_7_n_0 ),
        .I2(s_axi_araddr[5]),
        .I3(\s_axi_rdata[5]_i_8_n_0 ),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[5]_i_9_n_0 ),
        .O(\s_axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF00F044F444F4)) 
    \s_axi_rdata[5]_i_5 
       (.I0(\s_axi_rdata[20]_i_6_n_0 ),
        .I1(\s_axi_rdata_reg[5]_i_2_0 ),
        .I2(\irq_enable_reg_n_0_[5] ),
        .I3(\s_axi_rdata[27]_i_7_n_0 ),
        .I4(\s_axi_rdata_reg[5]_i_10_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT5 #(
    .INIT(32'h8C008000)) 
    \s_axi_rdata[5]_i_6 
       (.I0(frames_seen_proc[5]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[4]),
        .I4(\pulse_config_word_reg_n_0_[5] ),
        .O(\s_axi_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h5F50C0C05F50CFCF)) 
    \s_axi_rdata[5]_i_7 
       (.I0(template_commit_rejected_sticky_reg_n_0),
        .I1(\template_crc_state_reg_n_0_[5] ),
        .I2(s_axi_araddr[3]),
        .I3(\baseline_crc_state_reg_n_0_[5] ),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[5] ),
        .O(\s_axi_rdata[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0FF00000AAAA)) 
    \s_axi_rdata[5]_i_8 
       (.I0(\last_error_reg_n_0_[5] ),
        .I1(\baseline_write_count_reg_n_0_[5] ),
        .I2(\template_crc_state_reg_n_0_[5] ),
        .I3(\baseline_crc_state_reg_n_0_[5] ),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[5]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[5]_i_9 
       (.I0(data11[5]),
        .I1(\result_snapshot_q16_reg_n_0_[5] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(result_select_addr[5]),
        .O(\s_axi_rdata[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0001101100010001)) 
    \s_axi_rdata[6]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[7]),
        .I3(\s_axi_rdata[6]_i_2_n_0 ),
        .I4(\s_axi_rdata[6]_i_3_n_0 ),
        .I5(\s_axi_rdata[6]_i_4_n_0 ),
        .O(\s_axi_rdata[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[6]_i_10 
       (.I0(\template_addr_ptr_reg_n_0_[6] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[6] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[6]),
        .O(\s_axi_rdata[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h5F50C0C05F50CFCF)) 
    \s_axi_rdata[6]_i_11 
       (.I0(busy),
        .I1(\template_crc_state_reg_n_0_[6] ),
        .I2(s_axi_araddr[3]),
        .I3(\baseline_crc_state_reg_n_0_[6] ),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[6] ),
        .O(\s_axi_rdata[6]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h1D331DFF)) 
    \s_axi_rdata[6]_i_12 
       (.I0(result_select_addr[6]),
        .I1(s_axi_araddr[3]),
        .I2(data11[6]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[6] ),
        .O(\s_axi_rdata[6]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h3FF530F530F53FF5)) 
    \s_axi_rdata[6]_i_13 
       (.I0(\last_error_reg_n_0_[6] ),
        .I1(\baseline_write_count_reg_n_0_[6] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(\template_crc_state_reg_n_0_[6] ),
        .I5(\baseline_crc_state_reg_n_0_[6] ),
        .O(\s_axi_rdata[6]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h1F103F3F1F103030)) 
    \s_axi_rdata[6]_i_2 
       (.I0(\s_axi_rdata_reg[6]_i_5_n_0 ),
        .I1(\s_axi_rdata[6]_i_6_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[6]_i_7_n_0 ),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata_reg[6]_i_8_n_0 ),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h305FFFFF)) 
    \s_axi_rdata[6]_i_3 
       (.I0(average_select_addr[6]),
        .I1(\average_snapshot_q2_reg_n_0_[6] ),
        .I2(\s_axi_rdata[26]_i_5_n_0 ),
        .I3(s_axi_araddr[2]),
        .I4(s_axi_araddr[3]),
        .O(\s_axi_rdata[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair233" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_axi_rdata[6]_i_4 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[6]),
        .O(\s_axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000008C038003)) 
    \s_axi_rdata[6]_i_6 
       (.I0(\irq_enable_reg_n_0_[6] ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(D[0]),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT5 #(
    .INIT(32'hF7F7FF00)) 
    \s_axi_rdata[6]_i_7 
       (.I0(\pulse_config_word_reg_n_0_[6] ),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\s_axi_rdata[6]_i_11_n_0 ),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[6]_i_9 
       (.I0(average_overflow_count[6]),
        .I1(result_count[6]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(out[6]),
        .O(\s_axi_rdata[6]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT5 #(
    .INIT(32'h00045555)) 
    \s_axi_rdata[7]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[7]_i_2_n_0 ),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[7]),
        .I4(\s_axi_rdata[7]_i_3_n_0 ),
        .O(\s_axi_rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5F50C0C05F50CFCF)) 
    \s_axi_rdata[7]_i_10 
       (.I0(p_0_in1_in),
        .I1(\template_crc_state_reg_n_0_[7] ),
        .I2(s_axi_araddr[3]),
        .I3(\baseline_crc_state_reg_n_0_[7] ),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[7] ),
        .O(\s_axi_rdata[7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[7]_i_11 
       (.I0(data11[7]),
        .I1(\result_snapshot_q16_reg_n_0_[7] ),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(result_select_addr[7]),
        .O(\s_axi_rdata[7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0FF00000AAAA)) 
    \s_axi_rdata[7]_i_12 
       (.I0(\last_error_reg_n_0_[7] ),
        .I1(\baseline_write_count_reg_n_0_[7] ),
        .I2(\template_crc_state_reg_n_0_[7] ),
        .I3(\baseline_crc_state_reg_n_0_[7] ),
        .I4(s_axi_araddr[3]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hA0AFA0AFCFCFC0C0)) 
    \s_axi_rdata[7]_i_2 
       (.I0(\s_axi_rdata_reg[7]_i_4_n_0 ),
        .I1(\s_axi_rdata[7]_i_5_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[7]_i_6_n_0 ),
        .I4(\s_axi_rdata_reg[7]_i_7_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFBFBFBFFFFFFF)) 
    \s_axi_rdata[7]_i_3 
       (.I0(s_axi_araddr[4]),
        .I1(\s_axi_rdata[9]_i_10_n_0 ),
        .I2(s_axi_araddr[3]),
        .I3(\average_snapshot_q2_reg_n_0_[7] ),
        .I4(s_axi_araddr[2]),
        .I5(average_select_addr[7]),
        .O(\s_axi_rdata[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hE020C0C0)) 
    \s_axi_rdata[7]_i_5 
       (.I0(D[1]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[3]),
        .I3(\irq_enable_reg_n_0_[7] ),
        .I4(s_axi_araddr[4]),
        .O(\s_axi_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3A0AFAFA3AFAFAFA)) 
    \s_axi_rdata[7]_i_6 
       (.I0(\s_axi_rdata[7]_i_10_n_0 ),
        .I1(frame_error_sticky_proc),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\pulse_config_word_reg_n_0_[7] ),
        .O(\s_axi_rdata[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[7]_i_8 
       (.I0(average_overflow_count[7]),
        .I1(result_count[7]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(out[7]),
        .O(\s_axi_rdata[7]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[7]_i_9 
       (.I0(\template_addr_ptr_reg_n_0_[7] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[7] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[7]),
        .O(\s_axi_rdata[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000510055555555)) 
    \s_axi_rdata[8]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[8]_i_2_n_0 ),
        .I2(\s_axi_rdata[30]_i_4_n_0 ),
        .I3(\s_axi_rdata[30]_i_2_n_0 ),
        .I4(\s_axi_rdata[8]_i_3_n_0 ),
        .I5(\s_axi_rdata[8]_i_4_n_0 ),
        .O(\s_axi_rdata[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \s_axi_rdata[8]_i_10 
       (.I0(average_overflow_count[8]),
        .I1(result_count[8]),
        .I2(s_axi_araddr[3]),
        .I3(s_axi_araddr[2]),
        .I4(out[8]),
        .O(\s_axi_rdata[8]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \s_axi_rdata[8]_i_11 
       (.I0(\template_addr_ptr_reg_n_0_[8] ),
        .I1(s_axi_araddr[3]),
        .I2(\baseline_addr_ptr_reg_n_0_[8] ),
        .I3(s_axi_araddr[2]),
        .I4(correlation_overflow_count[8]),
        .O(\s_axi_rdata[8]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hDDD0FFFFDDD00000)) 
    \s_axi_rdata[8]_i_2 
       (.I0(pulse_width[0]),
        .I1(\s_axi_rdata[30]_i_8_n_0 ),
        .I2(\s_axi_rdata[8]_i_5_n_0 ),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .I5(\s_axi_rdata[8]_i_6_n_0 ),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000070770000)) 
    \s_axi_rdata[8]_i_3 
       (.I0(\s_axi_rdata_reg[8]_i_7_n_0 ),
        .I1(s_axi_araddr[5]),
        .I2(\s_axi_rdata[27]_i_7_n_0 ),
        .I3(\irq_enable_reg_n_0_[8] ),
        .I4(\s_axi_rdata[30]_i_4_n_0 ),
        .I5(\s_axi_rdata[8]_i_8_n_0 ),
        .O(\s_axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBFBBFBFBFFFBFBF)) 
    \s_axi_rdata[8]_i_4 
       (.I0(s_axi_araddr[4]),
        .I1(\s_axi_rdata[9]_i_10_n_0 ),
        .I2(s_axi_araddr[2]),
        .I3(\average_snapshot_q2_reg_n_0_[8] ),
        .I4(s_axi_araddr[3]),
        .I5(average_select_addr[8]),
        .O(\s_axi_rdata[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5F50C0C05F50CFCF)) 
    \s_axi_rdata[8]_i_5 
       (.I0(baseline_active_bank),
        .I1(\template_crc_state_reg_n_0_[8] ),
        .I2(s_axi_araddr[3]),
        .I3(\baseline_crc_state_reg_n_0_[8] ),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[8] ),
        .O(\s_axi_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B8BBBBBBB8BBB)) 
    \s_axi_rdata[8]_i_6 
       (.I0(\s_axi_rdata[8]_i_9_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[3]),
        .I3(\result_snapshot_q16_reg_n_0_[8] ),
        .I4(s_axi_araddr[2]),
        .I5(data11[8]),
        .O(\s_axi_rdata[8]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    \s_axi_rdata[8]_i_8 
       (.I0(baseline_active_bank),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .O(\s_axi_rdata[8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0099FF0FFF99FF0F)) 
    \s_axi_rdata[8]_i_9 
       (.I0(\template_crc_state_reg_n_0_[8] ),
        .I1(\baseline_crc_state_reg_n_0_[8] ),
        .I2(\last_error_reg_n_0_[8] ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_write_count_reg_n_0_[8] ),
        .O(\s_axi_rdata[8]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000000455555555)) 
    \s_axi_rdata[9]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\s_axi_rdata[9]_i_2_n_0 ),
        .I2(s_axi_araddr[7]),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[9]_i_3_n_0 ),
        .I5(\s_axi_rdata[9]_i_4_n_0 ),
        .O(\s_axi_rdata[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \s_axi_rdata[9]_i_10 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_araddr[5]),
        .I2(s_axi_araddr[7]),
        .I3(s_axi_araddr[0]),
        .O(\s_axi_rdata[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h55CCF00055CCF0FF)) 
    \s_axi_rdata[9]_i_11 
       (.I0(template_active_bank),
        .I1(\baseline_crc_state_reg_n_0_[9] ),
        .I2(\template_crc_state_reg_n_0_[9] ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\template_write_count_reg_n_0_[9] ),
        .O(\s_axi_rdata[9]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hCCE200E200000000)) 
    \s_axi_rdata[9]_i_12 
       (.I0(correlation_overflow_count[9]),
        .I1(s_axi_araddr[2]),
        .I2(\baseline_addr_ptr_reg_n_0_[9] ),
        .I3(s_axi_araddr[3]),
        .I4(\template_addr_ptr_reg_n_0_[9] ),
        .I5(s_axi_araddr[4]),
        .O(\s_axi_rdata[9]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEFEFFFEFE)) 
    \s_axi_rdata[9]_i_2 
       (.I0(\s_axi_rdata[9]_i_5_n_0 ),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(\s_axi_rdata[9]_i_6_n_0 ),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[4]),
        .I5(\s_axi_rdata[9]_i_7_n_0 ),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1111111133330030)) 
    \s_axi_rdata[9]_i_3 
       (.I0(\s_axi_rdata[9]_i_8_n_0 ),
        .I1(\s_axi_rdata[9]_i_9_n_0 ),
        .I2(s_axi_araddr[4]),
        .I3(\irq_enable_reg_n_0_[9] ),
        .I4(\s_axi_rdata[31]_i_5_n_0 ),
        .I5(s_axi_araddr[5]),
        .O(\s_axi_rdata[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5DDD7DFDFFFFFFFF)) 
    \s_axi_rdata[9]_i_4 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(\s_axi_rdata[26]_i_5_n_0 ),
        .I3(\average_snapshot_q2_reg_n_0_[9] ),
        .I4(average_select_addr[9]),
        .I5(\s_axi_rdata[9]_i_10_n_0 ),
        .O(\s_axi_rdata[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h02A202A2A2020202)) 
    \s_axi_rdata[9]_i_5 
       (.I0(s_axi_araddr[5]),
        .I1(\s_axi_rdata[9]_i_11_n_0 ),
        .I2(s_axi_araddr[4]),
        .I3(s_axi_araddr[2]),
        .I4(pulse_width[1]),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1011100000000000)) 
    \s_axi_rdata[9]_i_6 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_araddr[5]),
        .I2(data11[9]),
        .I3(s_axi_araddr[2]),
        .I4(\result_snapshot_q16_reg_n_0_[9] ),
        .I5(s_axi_araddr[3]),
        .O(\s_axi_rdata[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0099FF0FFF99FF0F)) 
    \s_axi_rdata[9]_i_7 
       (.I0(\template_crc_state_reg_n_0_[9] ),
        .I1(\baseline_crc_state_reg_n_0_[9] ),
        .I2(\last_error_reg_n_0_[9] ),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[2]),
        .I5(\baseline_write_count_reg_n_0_[9] ),
        .O(\s_axi_rdata[9]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAEAFAAAAAEAAA)) 
    \s_axi_rdata[9]_i_8 
       (.I0(\s_axi_rdata[9]_i_12_n_0 ),
        .I1(average_overflow_count[9]),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(s_axi_araddr[4]),
        .I5(out[9]),
        .O(\s_axi_rdata[9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h333F333333373333)) 
    \s_axi_rdata[9]_i_9 
       (.I0(s_axi_araddr[3]),
        .I1(\s_axi_rdata[30]_i_4_n_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[5]),
        .I4(s_axi_araddr[4]),
        .I5(template_active_bank),
        .O(\s_axi_rdata[9]_i_9_n_0 ));
  FDRE \s_axi_rdata_reg[0] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[0]_i_1_n_0 ),
        .Q(s_axi_rdata[0]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[0]_i_4 
       (.I0(\s_axi_rdata[0]_i_9_n_0 ),
        .I1(\s_axi_rdata[0]_i_10_n_0 ),
        .O(\s_axi_rdata_reg[0]_i_4_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[0]_i_7 
       (.I0(\s_axi_rdata[0]_i_12_n_0 ),
        .I1(\s_axi_rdata[0]_i_13_n_0 ),
        .O(\s_axi_rdata_reg[0]_i_7_n_0 ),
        .S(s_axi_araddr[4]));
  FDRE \s_axi_rdata_reg[10] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[10]_i_1_n_0 ),
        .Q(s_axi_rdata[10]),
        .R(SR));
  FDRE \s_axi_rdata_reg[11] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[11]_i_1_n_0 ),
        .Q(s_axi_rdata[11]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[11]_i_4 
       (.I0(\s_axi_rdata[11]_i_7_n_0 ),
        .I1(\s_axi_rdata[11]_i_8_n_0 ),
        .O(\s_axi_rdata_reg[11]_i_4_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[12] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[12]_i_1_n_0 ),
        .Q(s_axi_rdata[12]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[12]_i_3 
       (.I0(\s_axi_rdata[12]_i_5_n_0 ),
        .I1(\s_axi_rdata[12]_i_6_n_0 ),
        .O(\s_axi_rdata_reg[12]_i_3_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[13] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[13]_i_1_n_0 ),
        .Q(s_axi_rdata[13]),
        .R(SR));
  FDRE \s_axi_rdata_reg[14] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[14]_i_1_n_0 ),
        .Q(s_axi_rdata[14]),
        .R(SR));
  FDRE \s_axi_rdata_reg[15] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[15]_i_1_n_0 ),
        .Q(s_axi_rdata[15]),
        .R(SR));
  FDRE \s_axi_rdata_reg[16] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[16]_i_1_n_0 ),
        .Q(s_axi_rdata[16]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[16]_i_3 
       (.I0(\s_axi_rdata[16]_i_6_n_0 ),
        .I1(\s_axi_rdata[16]_i_7_n_0 ),
        .O(\s_axi_rdata_reg[16]_i_3_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[17] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[17]_i_1_n_0 ),
        .Q(s_axi_rdata[17]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[17]_i_2 
       (.I0(\s_axi_rdata[17]_i_4_n_0 ),
        .I1(\s_axi_rdata[17]_i_5_n_0 ),
        .O(\s_axi_rdata_reg[17]_i_2_n_0 ),
        .S(s_axi_araddr[5]));
  MUXF7 \s_axi_rdata_reg[17]_i_3 
       (.I0(\s_axi_rdata[17]_i_6_n_0 ),
        .I1(\s_axi_rdata[17]_i_7_n_0 ),
        .O(\s_axi_rdata_reg[17]_i_3_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[18] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[18]_i_1_n_0 ),
        .Q(s_axi_rdata[18]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[18]_i_2 
       (.I0(\s_axi_rdata[18]_i_4_n_0 ),
        .I1(\s_axi_rdata[18]_i_5_n_0 ),
        .O(\s_axi_rdata_reg[18]_i_2_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[19] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[19]_i_1_n_0 ),
        .Q(s_axi_rdata[19]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[19]_i_4 
       (.I0(\s_axi_rdata[19]_i_7_n_0 ),
        .I1(\s_axi_rdata[19]_i_8_n_0 ),
        .O(\s_axi_rdata_reg[19]_i_4_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[1] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[1]_i_1_n_0 ),
        .Q(s_axi_rdata[1]),
        .R(SR));
  FDRE \s_axi_rdata_reg[20] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[20]_i_1_n_0 ),
        .Q(s_axi_rdata[20]),
        .R(SR));
  FDRE \s_axi_rdata_reg[21] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[21]_i_1_n_0 ),
        .Q(s_axi_rdata[21]),
        .R(SR));
  FDRE \s_axi_rdata_reg[22] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[22]_i_1_n_0 ),
        .Q(s_axi_rdata[22]),
        .R(SR));
  FDRE \s_axi_rdata_reg[23] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[23]_i_1_n_0 ),
        .Q(s_axi_rdata[23]),
        .R(SR));
  FDRE \s_axi_rdata_reg[24] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[24]_i_1_n_0 ),
        .Q(s_axi_rdata[24]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[24]_i_3 
       (.I0(\s_axi_rdata[24]_i_6_n_0 ),
        .I1(\s_axi_rdata[24]_i_7_n_0 ),
        .O(\s_axi_rdata_reg[24]_i_3_n_0 ),
        .S(s_axi_araddr[5]));
  FDRE \s_axi_rdata_reg[25] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[25]_i_1_n_0 ),
        .Q(s_axi_rdata[25]),
        .R(SR));
  FDRE \s_axi_rdata_reg[26] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[26]_i_1_n_0 ),
        .Q(s_axi_rdata[26]),
        .R(SR));
  FDRE \s_axi_rdata_reg[27] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[27]_i_1_n_0 ),
        .Q(s_axi_rdata[27]),
        .R(SR));
  FDRE \s_axi_rdata_reg[28] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[28]_i_1_n_0 ),
        .Q(s_axi_rdata[28]),
        .R(SR));
  FDRE \s_axi_rdata_reg[29] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[29]_i_1_n_0 ),
        .Q(s_axi_rdata[29]),
        .R(SR));
  FDRE \s_axi_rdata_reg[2] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[2]_i_1_n_0 ),
        .Q(s_axi_rdata[2]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[2]_i_4 
       (.I0(\s_axi_rdata[2]_i_8_n_0 ),
        .I1(\s_axi_rdata[2]_i_9_n_0 ),
        .O(\s_axi_rdata_reg[2]_i_4_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[2]_i_7 
       (.I0(\s_axi_rdata[2]_i_11_n_0 ),
        .I1(\s_axi_rdata[2]_i_12_n_0 ),
        .O(\s_axi_rdata_reg[2]_i_7_n_0 ),
        .S(s_axi_araddr[4]));
  FDRE \s_axi_rdata_reg[30] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[30]_i_1_n_0 ),
        .Q(s_axi_rdata[30]),
        .R(SR));
  FDRE \s_axi_rdata_reg[31] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[31]_i_2_n_0 ),
        .Q(s_axi_rdata[31]),
        .R(SR));
  FDRE \s_axi_rdata_reg[3] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[3]_i_1_n_0 ),
        .Q(s_axi_rdata[3]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[3]_i_2 
       (.I0(\s_axi_rdata[3]_i_4_n_0 ),
        .I1(\s_axi_rdata[3]_i_5_n_0 ),
        .O(\s_axi_rdata_reg[3]_i_2_n_0 ),
        .S(\s_axi_rdata[30]_i_4_n_0 ));
  FDRE \s_axi_rdata_reg[4] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[4]_i_1_n_0 ),
        .Q(s_axi_rdata[4]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[4]_i_10 
       (.I0(\s_axi_rdata[4]_i_11_n_0 ),
        .I1(\s_axi_rdata[4]_i_12_n_0 ),
        .O(\s_axi_rdata_reg[4]_i_10_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[4]_i_2 
       (.I0(\s_axi_rdata[4]_i_4_n_0 ),
        .I1(\s_axi_rdata[4]_i_5_n_0 ),
        .O(\s_axi_rdata_reg[4]_i_2_n_0 ),
        .S(\s_axi_rdata[30]_i_4_n_0 ));
  FDRE \s_axi_rdata_reg[5] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[5]_i_1_n_0 ),
        .Q(s_axi_rdata[5]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[5]_i_10 
       (.I0(\s_axi_rdata[5]_i_11_n_0 ),
        .I1(\s_axi_rdata[5]_i_12_n_0 ),
        .O(\s_axi_rdata_reg[5]_i_10_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[5]_i_2 
       (.I0(\s_axi_rdata[5]_i_4_n_0 ),
        .I1(\s_axi_rdata[5]_i_5_n_0 ),
        .O(\s_axi_rdata_reg[5]_i_2_n_0 ),
        .S(\s_axi_rdata[30]_i_4_n_0 ));
  FDRE \s_axi_rdata_reg[6] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[6]_i_1_n_0 ),
        .Q(s_axi_rdata[6]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[6]_i_5 
       (.I0(\s_axi_rdata[6]_i_9_n_0 ),
        .I1(\s_axi_rdata[6]_i_10_n_0 ),
        .O(\s_axi_rdata_reg[6]_i_5_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[6]_i_8 
       (.I0(\s_axi_rdata[6]_i_12_n_0 ),
        .I1(\s_axi_rdata[6]_i_13_n_0 ),
        .O(\s_axi_rdata_reg[6]_i_8_n_0 ),
        .S(s_axi_araddr[4]));
  FDRE \s_axi_rdata_reg[7] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[7]_i_1_n_0 ),
        .Q(s_axi_rdata[7]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[7]_i_4 
       (.I0(\s_axi_rdata[7]_i_8_n_0 ),
        .I1(\s_axi_rdata[7]_i_9_n_0 ),
        .O(\s_axi_rdata_reg[7]_i_4_n_0 ),
        .S(s_axi_araddr[4]));
  MUXF7 \s_axi_rdata_reg[7]_i_7 
       (.I0(\s_axi_rdata[7]_i_11_n_0 ),
        .I1(\s_axi_rdata[7]_i_12_n_0 ),
        .O(\s_axi_rdata_reg[7]_i_7_n_0 ),
        .S(s_axi_araddr[4]));
  FDRE \s_axi_rdata_reg[8] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[8]_i_1_n_0 ),
        .Q(s_axi_rdata[8]),
        .R(SR));
  MUXF7 \s_axi_rdata_reg[8]_i_7 
       (.I0(\s_axi_rdata[8]_i_10_n_0 ),
        .I1(\s_axi_rdata[8]_i_11_n_0 ),
        .O(\s_axi_rdata_reg[8]_i_7_n_0 ),
        .S(s_axi_araddr[4]));
  FDRE \s_axi_rdata_reg[9] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rdata[9]_i_1_n_0 ),
        .Q(s_axi_rdata[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFCFFFC55545557)) 
    \s_axi_rresp[1]_i_1 
       (.I0(result_snapshot_valid_reg_n_0),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[0]),
        .I3(\s_axi_rresp[1]_i_2_n_0 ),
        .I4(average_snapshot_valid_reg_n_0),
        .I5(\s_axi_rresp[1]_i_3_n_0 ),
        .O(\s_axi_rresp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0FAF0E00000)) 
    \s_axi_rresp[1]_i_2 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .I2(s_axi_araddr[7]),
        .I3(s_axi_araddr[4]),
        .I4(s_axi_araddr[5]),
        .I5(s_axi_araddr[6]),
        .O(\s_axi_rresp[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFCDFFFFFFFFFFFFF)) 
    \s_axi_rresp[1]_i_3 
       (.I0(s_axi_araddr[2]),
        .I1(\s_axi_rresp[1]_i_4_n_0 ),
        .I2(s_axi_araddr[7]),
        .I3(s_axi_araddr[6]),
        .I4(s_axi_araddr[3]),
        .I5(\s_axi_rresp[1]_i_5_n_0 ),
        .O(\s_axi_rresp[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_axi_rresp[1]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .O(\s_axi_rresp[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_axi_rresp[1]_i_5 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[4]),
        .O(\s_axi_rresp[1]_i_5_n_0 ));
  FDRE \s_axi_rresp_reg[1] 
       (.C(s_axi_aclk),
        .CE(\s_axi_rdata[31]_i_1_n_0 ),
        .D(\s_axi_rresp[1]_i_1_n_0 ),
        .Q(s_axi_rresp),
        .R(SR));
  LUT3 #(
    .INIT(8'h3A)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid_reg_0),
        .O(s_axi_rvalid_i_1_n_0));
  FDRE s_axi_rvalid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid_reg_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000010)) 
    s_axi_wready_INST_0
       (.I0(w_pending_reg_n_0),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_aresetn),
        .I3(average_capture_pending_reg_n_0),
        .I4(result_capture_pending_reg_n_0),
        .O(s_axi_wready));
  (* SOFT_HLUTNM = "soft_lutpair210" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    soft_reset_pulse_i_1
       (.I0(template_commit_pulse_i_2_n_0),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[4]),
        .I3(busy),
        .O(soft_reset_pulse_i_1_n_0));
  FDRE soft_reset_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(soft_reset_pulse_i_1_n_0),
        .Q(soft_reset_pulse),
        .R(clear_status_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT5 #(
    .INIT(32'h000000E0)) 
    start_accepted_sticky_i_1
       (.I0(start_accepted_sticky),
        .I1(start_accepted),
        .I2(s_axi_aresetn),
        .I3(clear_status_pulse),
        .I4(soft_reset_pulse),
        .O(start_accepted_sticky_reg));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    start_pulse_i_1
       (.I0(\baseline_crc_state[31]_i_4_n_0 ),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(p_0_in1_in_0[0]),
        .I3(awaddr_hold[5]),
        .I4(awaddr_hold[2]),
        .I5(awaddr_hold[3]),
        .O(start_pulse_i_1_n_0));
  FDRE start_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(start_pulse_i_1_n_0),
        .Q(start_pulse),
        .R(clear_status_pulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000EFFFEEEE)) 
    start_rejected_sticky_i_1
       (.I0(\status_word_d_reg[3]_0 ),
        .I1(start_rejected_not_ready),
        .I2(baseline_coeff_valid),
        .I3(template_coeff_valid),
        .I4(start_pulse),
        .I5(soft_reset_pulse_reg_0),
        .O(start_rejected_sticky_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_1 
       (.I0(\status_word_d[19]_i_2_n_0 ),
        .I1(\status_word_d[19]_i_3_n_0 ),
        .I2(\status_word_d[19]_i_4_n_0 ),
        .I3(\status_word_d[19]_i_5_n_0 ),
        .I4(\status_word_d[19]_i_6_n_0 ),
        .I5(\status_word_d[19]_i_7_n_0 ),
        .O(\status_word_d[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_2 
       (.I0(average_overflow_count[12]),
        .I1(average_overflow_count[13]),
        .I2(average_overflow_count[10]),
        .I3(average_overflow_count[11]),
        .I4(average_overflow_count[9]),
        .I5(average_overflow_count[8]),
        .O(\status_word_d[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_3 
       (.I0(average_overflow_count[18]),
        .I1(average_overflow_count[19]),
        .I2(average_overflow_count[16]),
        .I3(average_overflow_count[17]),
        .I4(average_overflow_count[15]),
        .I5(average_overflow_count[14]),
        .O(\status_word_d[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_4 
       (.I0(average_overflow_count[30]),
        .I1(average_overflow_count[31]),
        .I2(average_overflow_count[28]),
        .I3(average_overflow_count[29]),
        .I4(average_overflow_count[27]),
        .I5(average_overflow_count[26]),
        .O(\status_word_d[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_5 
       (.I0(average_overflow_count[24]),
        .I1(average_overflow_count[25]),
        .I2(average_overflow_count[22]),
        .I3(average_overflow_count[23]),
        .I4(average_overflow_count[21]),
        .I5(average_overflow_count[20]),
        .O(\status_word_d[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \status_word_d[19]_i_6 
       (.I0(average_overflow_count[0]),
        .I1(average_overflow_count[1]),
        .O(\status_word_d[19]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[19]_i_7 
       (.I0(average_overflow_count[6]),
        .I1(average_overflow_count[7]),
        .I2(average_overflow_count[4]),
        .I3(average_overflow_count[5]),
        .I4(average_overflow_count[3]),
        .I5(average_overflow_count[2]),
        .O(\status_word_d[19]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_1 
       (.I0(\status_word_d[20]_i_2_n_0 ),
        .I1(\status_word_d[20]_i_3_n_0 ),
        .I2(\status_word_d[20]_i_4_n_0 ),
        .I3(\status_word_d[20]_i_5_n_0 ),
        .I4(\status_word_d[20]_i_6_n_0 ),
        .I5(\status_word_d[20]_i_7_n_0 ),
        .O(\status_word_d[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_2 
       (.I0(correlation_overflow_count[12]),
        .I1(correlation_overflow_count[13]),
        .I2(correlation_overflow_count[10]),
        .I3(correlation_overflow_count[11]),
        .I4(correlation_overflow_count[9]),
        .I5(correlation_overflow_count[8]),
        .O(\status_word_d[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_3 
       (.I0(correlation_overflow_count[18]),
        .I1(correlation_overflow_count[19]),
        .I2(correlation_overflow_count[16]),
        .I3(correlation_overflow_count[17]),
        .I4(correlation_overflow_count[15]),
        .I5(correlation_overflow_count[14]),
        .O(\status_word_d[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_4 
       (.I0(correlation_overflow_count[30]),
        .I1(correlation_overflow_count[31]),
        .I2(correlation_overflow_count[28]),
        .I3(correlation_overflow_count[29]),
        .I4(correlation_overflow_count[27]),
        .I5(correlation_overflow_count[26]),
        .O(\status_word_d[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_5 
       (.I0(correlation_overflow_count[24]),
        .I1(correlation_overflow_count[25]),
        .I2(correlation_overflow_count[22]),
        .I3(correlation_overflow_count[23]),
        .I4(correlation_overflow_count[21]),
        .I5(correlation_overflow_count[20]),
        .O(\status_word_d[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \status_word_d[20]_i_6 
       (.I0(correlation_overflow_count[0]),
        .I1(correlation_overflow_count[1]),
        .O(\status_word_d[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \status_word_d[20]_i_7 
       (.I0(correlation_overflow_count[6]),
        .I1(correlation_overflow_count[7]),
        .I2(correlation_overflow_count[4]),
        .I3(correlation_overflow_count[5]),
        .I4(correlation_overflow_count[3]),
        .I5(correlation_overflow_count[2]),
        .O(\status_word_d[20]_i_7_n_0 ));
  FDRE \status_word_d_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\status_word_d[19]_i_1_n_0 ),
        .Q(status_word_d[19]),
        .R(SR));
  FDRE \status_word_d_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\status_word_d[20]_i_1_n_0 ),
        .Q(status_word_d[20]),
        .R(SR));
  FDRE \status_word_d_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(frame_error_sticky_proc),
        .Q(status_word_d[24]),
        .R(SR));
  FDRE \status_word_d_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\status_word_d_reg[3]_0 ),
        .Q(status_word_d[3]),
        .R(SR));
  FDRE \status_word_d_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(status_word_d[6]),
        .R(SR));
  FDRE \status_word_d_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(status_word_d[7]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair213" *) 
  LUT4 #(
    .INIT(16'h0F88)) 
    \template_addr_ptr[0]_i_1 
       (.I0(\wstrb_hold_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\template_addr_ptr_reg_n_0_[0] ),
        .I3(awaddr_hold[6]),
        .O(template_addr_ptr[0]));
  LUT5 #(
    .INIT(32'h6F606060)) 
    \template_addr_ptr[1]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[0] ),
        .I1(\template_addr_ptr_reg_n_0_[1] ),
        .I2(awaddr_hold[6]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[1]),
        .O(template_addr_ptr[1]));
  LUT6 #(
    .INIT(64'h6AFF6A006A006A00)) 
    \template_addr_ptr[2]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[2] ),
        .I1(\template_addr_ptr_reg_n_0_[0] ),
        .I2(\template_addr_ptr_reg_n_0_[1] ),
        .I3(awaddr_hold[6]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[2]),
        .O(template_addr_ptr[2]));
  LUT6 #(
    .INIT(64'h6AAAFFFF6AAA0000)) 
    \template_addr_ptr[3]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[3] ),
        .I1(\template_addr_ptr_reg_n_0_[1] ),
        .I2(\template_addr_ptr_reg_n_0_[0] ),
        .I3(\template_addr_ptr_reg_n_0_[2] ),
        .I4(awaddr_hold[6]),
        .I5(p_5_in),
        .O(template_addr_ptr[3]));
  LUT5 #(
    .INIT(32'h9F909090)) 
    \template_addr_ptr[4]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[4] ),
        .I1(\template_addr_ptr[5]_i_2_n_0 ),
        .I2(awaddr_hold[6]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[4]),
        .O(template_addr_ptr[4]));
  LUT6 #(
    .INIT(64'h9AFF9A009A009A00)) 
    \template_addr_ptr[5]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[5] ),
        .I1(\template_addr_ptr[5]_i_2_n_0 ),
        .I2(\template_addr_ptr_reg_n_0_[4] ),
        .I3(awaddr_hold[6]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[5]),
        .O(template_addr_ptr[5]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \template_addr_ptr[5]_i_2 
       (.I0(\template_addr_ptr_reg_n_0_[2] ),
        .I1(\template_addr_ptr_reg_n_0_[0] ),
        .I2(\template_addr_ptr_reg_n_0_[1] ),
        .I3(\template_addr_ptr_reg_n_0_[3] ),
        .O(\template_addr_ptr[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT5 #(
    .INIT(32'h9F909090)) 
    \template_addr_ptr[6]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[6] ),
        .I1(\template_addr_ptr[7]_i_2_n_0 ),
        .I2(awaddr_hold[6]),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in1_in_0[6]),
        .O(template_addr_ptr[6]));
  LUT6 #(
    .INIT(64'hB4FFB400B400B400)) 
    \template_addr_ptr[7]_i_1 
       (.I0(\template_addr_ptr[7]_i_2_n_0 ),
        .I1(\template_addr_ptr_reg_n_0_[6] ),
        .I2(\template_addr_ptr_reg_n_0_[7] ),
        .I3(awaddr_hold[6]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .I5(p_0_in1_in_0[7]),
        .O(template_addr_ptr[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \template_addr_ptr[7]_i_2 
       (.I0(\template_addr_ptr_reg_n_0_[4] ),
        .I1(\template_addr_ptr_reg_n_0_[2] ),
        .I2(\template_addr_ptr_reg_n_0_[0] ),
        .I3(\template_addr_ptr_reg_n_0_[1] ),
        .I4(\template_addr_ptr_reg_n_0_[3] ),
        .I5(\template_addr_ptr_reg_n_0_[5] ),
        .O(\template_addr_ptr[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9AFF9A009A009A00)) 
    \template_addr_ptr[8]_i_1 
       (.I0(\template_addr_ptr_reg_n_0_[8] ),
        .I1(\template_addr_ptr[8]_i_2_n_0 ),
        .I2(\template_addr_ptr_reg_n_0_[7] ),
        .I3(awaddr_hold[6]),
        .I4(p_0_in),
        .I5(\wdata_hold_reg_n_0_[8] ),
        .O(template_addr_ptr[8]));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \template_addr_ptr[8]_i_2 
       (.I0(\template_addr_ptr[7]_i_2_n_0 ),
        .I1(\template_addr_ptr_reg_n_0_[6] ),
        .O(\template_addr_ptr[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04005555)) 
    \template_addr_ptr[9]_i_1 
       (.I0(\template_addr_ptr[9]_i_3_n_0 ),
        .I1(awaddr_hold[6]),
        .I2(\template_addr_ptr[9]_i_4_n_0 ),
        .I3(\template_addr_ptr[9]_i_5_n_0 ),
        .I4(\template_addr_ptr[9]_i_6_n_0 ),
        .O(\template_addr_ptr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AFF6A006A006A00)) 
    \template_addr_ptr[9]_i_2 
       (.I0(\template_addr_ptr_reg_n_0_[9] ),
        .I1(\template_addr_ptr[9]_i_7_n_0 ),
        .I2(\template_addr_ptr_reg_n_0_[8] ),
        .I3(awaddr_hold[6]),
        .I4(p_0_in),
        .I5(\wdata_hold_reg_n_0_[9] ),
        .O(template_addr_ptr[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFEBFFFFFFF)) 
    \template_addr_ptr[9]_i_3 
       (.I0(\pulse_config_word[2]_i_4_n_0 ),
        .I1(awaddr_hold[4]),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[2]),
        .I4(awaddr_hold[5]),
        .I5(awaddr_hold[6]),
        .O(\template_addr_ptr[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \template_addr_ptr[9]_i_4 
       (.I0(busy),
        .I1(coeff_status_word[1]),
        .I2(template_sequence_valid_reg_n_0),
        .I3(\wstrb_hold_reg_n_0_[0] ),
        .I4(p_0_in),
        .O(\template_addr_ptr[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT5 #(
    .INIT(32'hFFFFFDFF)) 
    \template_addr_ptr[9]_i_5 
       (.I0(\template_addr_ptr_reg_n_0_[6] ),
        .I1(\template_addr_ptr[7]_i_2_n_0 ),
        .I2(\template_addr_ptr_reg_n_0_[8] ),
        .I3(\template_addr_ptr_reg_n_0_[9] ),
        .I4(\template_addr_ptr_reg_n_0_[7] ),
        .O(\template_addr_ptr[9]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair223" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \template_addr_ptr[9]_i_6 
       (.I0(awaddr_hold[6]),
        .I1(\template_addr_ptr[9]_i_8_n_0 ),
        .O(\template_addr_ptr[9]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \template_addr_ptr[9]_i_7 
       (.I0(\template_addr_ptr_reg_n_0_[7] ),
        .I1(\template_addr_ptr_reg_n_0_[6] ),
        .I2(\template_addr_ptr[7]_i_2_n_0 ),
        .O(\template_addr_ptr[9]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFBBBFBBBFBBBBBBB)) 
    \template_addr_ptr[9]_i_8 
       (.I0(busy),
        .I1(result_capture_pending_i_2_n_0),
        .I2(\wdata_hold_reg_n_0_[9] ),
        .I3(p_0_in),
        .I4(\result_select_addr[7]_i_2_n_0 ),
        .I5(\wdata_hold_reg_n_0_[8] ),
        .O(\template_addr_ptr[9]_i_8_n_0 ));
  FDRE \template_addr_ptr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[0]),
        .Q(\template_addr_ptr_reg_n_0_[0] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[1]),
        .Q(\template_addr_ptr_reg_n_0_[1] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[2]),
        .Q(\template_addr_ptr_reg_n_0_[2] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[3]),
        .Q(\template_addr_ptr_reg_n_0_[3] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[4]),
        .Q(\template_addr_ptr_reg_n_0_[4] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[5]),
        .Q(\template_addr_ptr_reg_n_0_[5] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[6]),
        .Q(\template_addr_ptr_reg_n_0_[6] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[7]),
        .Q(\template_addr_ptr_reg_n_0_[7] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[8] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[8]),
        .Q(\template_addr_ptr_reg_n_0_[8] ),
        .R(SR));
  FDRE \template_addr_ptr_reg[9] 
       (.C(s_axi_aclk),
        .CE(\template_addr_ptr[9]_i_1_n_0 ),
        .D(template_addr_ptr[9]),
        .Q(\template_addr_ptr_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair217" *) 
  LUT3 #(
    .INIT(8'h32)) 
    template_commit_accepted_sticky_i_1
       (.I0(template_commit_accepted),
        .I1(baseline_commit_accepted_sticky_i_2_n_0),
        .I2(template_commit_accepted_sticky_reg_n_0),
        .O(template_commit_accepted_sticky_i_1_n_0));
  FDRE template_commit_accepted_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_commit_accepted_sticky_i_1_n_0),
        .Q(template_commit_accepted_sticky_reg_n_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT5 #(
    .INIT(32'h08000000)) 
    template_commit_pulse_i_1
       (.I0(template_commit_pulse_i_2_n_0),
        .I1(coeff_status_word[1]),
        .I2(busy),
        .I3(p_0_in1_in_0[3]),
        .I4(\wstrb_hold_reg_n_0_[0] ),
        .O(template_commit_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    template_commit_pulse_i_2
       (.I0(\baseline_crc_state[31]_i_4_n_0 ),
        .I1(awaddr_hold[3]),
        .I2(awaddr_hold[2]),
        .I3(awaddr_hold[5]),
        .O(template_commit_pulse_i_2_n_0));
  FDRE template_commit_pulse_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_commit_pulse_i_1_n_0),
        .Q(template_commit_pulse),
        .R(clear_status_pulse_i_1_n_0));
  LUT3 #(
    .INIT(8'h32)) 
    template_commit_rejected_sticky_i_1
       (.I0(template_commit_rejected),
        .I1(baseline_commit_accepted_sticky_i_2_n_0),
        .I2(template_commit_rejected_sticky_reg_n_0),
        .O(template_commit_rejected_sticky_i_1_n_0));
  FDRE template_commit_rejected_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_commit_rejected_sticky_i_1_n_0),
        .Q(template_commit_rejected_sticky_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[0]_i_1 
       (.I0(\template_crc_state[23]_i_2_n_0 ),
        .I1(p_0_in1_in_0[6]),
        .I2(\template_crc_state_reg_n_0_[6] ),
        .I3(\template_crc_state_reg_n_0_[16] ),
        .I4(\template_crc_state[26]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[10]_i_1 
       (.I0(\template_crc_state[14]_i_3_n_0 ),
        .I1(\template_crc_state_reg_n_0_[26] ),
        .I2(\template_crc_state[10]_i_2_n_0 ),
        .I3(\template_crc_state[13]_i_2_n_0 ),
        .I4(\template_crc_state[26]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \template_crc_state[10]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\template_crc_state_reg_n_0_[4] ),
        .O(\template_crc_state[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[11]_i_1 
       (.I0(\template_crc_state[27]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[27] ),
        .I2(\template_crc_state[11]_i_2_n_0 ),
        .I3(\template_crc_state[11]_i_3_n_0 ),
        .I4(\template_crc_state[21]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair195" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \template_crc_state[11]_i_2 
       (.I0(p_0_in1_in_0[0]),
        .I1(\template_crc_state_reg_n_0_[0] ),
        .O(\template_crc_state[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[11]_i_3 
       (.I0(\template_crc_state_reg_n_0_[3] ),
        .I1(p_0_in1_in_0[3]),
        .I2(p_0_in1_in_0[2]),
        .I3(\template_crc_state_reg_n_0_[2] ),
        .O(\template_crc_state[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[12]_i_1 
       (.I0(\template_crc_state[12]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[28] ),
        .I2(\template_crc_state[19]_i_4_n_0 ),
        .I3(\template_crc_state[22]_i_3_n_0 ),
        .I4(\template_crc_state[28]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[12]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\template_crc_state_reg_n_0_[4] ),
        .I2(p_0_in1_in_0[3]),
        .I3(\template_crc_state_reg_n_0_[3] ),
        .I4(\template_crc_state[9]_i_2_n_0 ),
        .O(\template_crc_state[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[13]_i_1 
       (.I0(\template_crc_state[24]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[29] ),
        .I2(\template_crc_state[13]_i_2_n_0 ),
        .I3(\template_crc_state[16]_i_2_n_0 ),
        .I4(\template_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[13]_i_2 
       (.I0(p_0_in1_in_0[2]),
        .I1(\template_crc_state_reg_n_0_[2] ),
        .I2(p_0_in1_in_0[1]),
        .I3(\template_crc_state_reg_n_0_[1] ),
        .O(\template_crc_state[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[14]_i_1 
       (.I0(\template_crc_state[30]_i_2_n_0 ),
        .I1(\template_crc_state[14]_i_2_n_0 ),
        .I2(\template_crc_state[14]_i_3_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[24]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[14]_i_2 
       (.I0(\template_crc_state_reg_n_0_[2] ),
        .I1(p_0_in1_in_0[2]),
        .I2(p_0_in1_in_0[3]),
        .I3(\template_crc_state_reg_n_0_[3] ),
        .I4(\template_crc_state[11]_i_2_n_0 ),
        .I5(\template_crc_state_reg_n_0_[30] ),
        .O(\template_crc_state[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[14]_i_3 
       (.I0(p_0_in1_in_0[6]),
        .I1(\template_crc_state_reg_n_0_[6] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\template_crc_state_reg_n_0_[0] ),
        .I4(\template_crc_state_reg_n_0_[5] ),
        .I5(p_0_in1_in_0[5]),
        .O(\template_crc_state[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[15]_i_1 
       (.I0(\template_crc_state[15]_i_2_n_0 ),
        .I1(\template_crc_state[25]_i_2_n_0 ),
        .I2(\template_crc_state[15]_i_3_n_0 ),
        .I3(\template_crc_state[22]_i_3_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair215" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \template_crc_state[15]_i_2 
       (.I0(\template_crc_state[27]_i_2_n_0 ),
        .I1(\template_crc_state[26]_i_2_n_0 ),
        .O(\template_crc_state[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[15]_i_3 
       (.I0(\template_crc_state[9]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[3] ),
        .I2(p_0_in1_in_0[3]),
        .I3(\template_crc_state_reg_n_0_[4] ),
        .I4(p_0_in1_in_0[4]),
        .I5(\template_crc_state_reg_n_0_[31] ),
        .O(\template_crc_state[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[16]_i_1 
       (.I0(\template_crc_state[27]_i_2_n_0 ),
        .I1(\template_crc_state[16]_i_2_n_0 ),
        .I2(\template_crc_state[16]_i_3_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[28]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[16]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\template_crc_state_reg_n_0_[4] ),
        .I2(p_0_in1_in_0[5]),
        .I3(\template_crc_state_reg_n_0_[5] ),
        .I4(\template_crc_state[23]_i_2_n_0 ),
        .O(\template_crc_state[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[16]_i_3 
       (.I0(\template_crc_state_reg_n_0_[8] ),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\template_crc_state_reg_n_0_[1] ),
        .I3(p_0_in1_in_0[1]),
        .I4(p_0_in1_in_0[0]),
        .I5(\template_crc_state_reg_n_0_[0] ),
        .O(\template_crc_state[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[17]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state[24]_i_2_n_0 ),
        .I2(\template_crc_state[17]_i_2_n_0 ),
        .I3(\template_crc_state[27]_i_2_n_0 ),
        .I4(\template_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[17]_i_2 
       (.I0(\template_crc_state[14]_i_3_n_0 ),
        .I1(\template_crc_state[11]_i_3_n_0 ),
        .I2(\template_crc_state_reg_n_0_[1] ),
        .I3(p_0_in1_in_0[1]),
        .O(\template_crc_state[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[18]_i_1 
       (.I0(\template_crc_state[26]_i_2_n_0 ),
        .I1(\template_crc_state[25]_i_2_n_0 ),
        .I2(\template_crc_state[18]_i_2_n_0 ),
        .I3(\template_crc_state[22]_i_3_n_0 ),
        .I4(\template_crc_state[18]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[18]_i_2 
       (.I0(\template_crc_state_reg_n_0_[4] ),
        .I1(p_0_in1_in_0[4]),
        .I2(\template_crc_state_reg_n_0_[2] ),
        .I3(p_0_in1_in_0[2]),
        .I4(p_0_in1_in_0[3]),
        .I5(\template_crc_state_reg_n_0_[3] ),
        .O(\template_crc_state[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair196" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \template_crc_state[18]_i_3 
       (.I0(\template_crc_state[30]_i_2_n_0 ),
        .I1(\template_crc_state[28]_i_2_n_0 ),
        .I2(\template_crc_state[29]_i_2_n_0 ),
        .O(\template_crc_state[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[19]_i_1 
       (.I0(\template_crc_state[19]_i_2_n_0 ),
        .I1(\template_crc_state[19]_i_3_n_0 ),
        .I2(\template_crc_state[19]_i_4_n_0 ),
        .I3(\template_crc_state[23]_i_2_n_0 ),
        .I4(\template_crc_state[23]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair215" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \template_crc_state[19]_i_2 
       (.I0(\template_crc_state[29]_i_2_n_0 ),
        .I1(\template_crc_state[26]_i_2_n_0 ),
        .I2(\template_crc_state[27]_i_2_n_0 ),
        .O(\template_crc_state[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[19]_i_3 
       (.I0(\template_crc_state_reg_n_0_[5] ),
        .I1(p_0_in1_in_0[5]),
        .I2(p_0_in1_in_0[4]),
        .I3(\template_crc_state_reg_n_0_[4] ),
        .I4(p_0_in1_in_0[3]),
        .I5(\template_crc_state_reg_n_0_[3] ),
        .O(\template_crc_state[19]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \template_crc_state[19]_i_4 
       (.I0(p_0_in1_in_0[2]),
        .I1(\template_crc_state_reg_n_0_[2] ),
        .I2(\template_crc_state_reg_n_0_[8] ),
        .I3(\wdata_hold_reg_n_0_[8] ),
        .O(\template_crc_state[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hD77D7DD77DD7D77D)) 
    \template_crc_state[1]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_crc_state[19]_i_4_n_0 ),
        .I2(p_0_in1_in_0[7]),
        .I3(\template_crc_state_reg_n_0_[7] ),
        .I4(\template_crc_state_reg_n_0_[17] ),
        .I5(\template_crc_state[27]_i_2_n_0 ),
        .O(template_crc_state[1]));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[20]_i_1 
       (.I0(\template_crc_state[30]_i_2_n_0 ),
        .I1(\template_crc_state[20]_i_2_n_0 ),
        .I2(\template_crc_state[27]_i_2_n_0 ),
        .I3(\template_crc_state[24]_i_2_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[20]_i_2 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[5] ),
        .I2(p_0_in1_in_0[5]),
        .I3(\template_crc_state_reg_n_0_[4] ),
        .I4(p_0_in1_in_0[4]),
        .I5(\template_crc_state[6]_i_2_n_0 ),
        .O(\template_crc_state[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[21]_i_1 
       (.I0(\template_crc_state[21]_i_2_n_0 ),
        .I1(\template_crc_state[21]_i_3_n_0 ),
        .I2(\template_crc_state[25]_i_2_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \template_crc_state[21]_i_2 
       (.I0(\template_crc_state[29]_i_2_n_0 ),
        .I1(\template_crc_state[28]_i_2_n_0 ),
        .O(\template_crc_state[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \template_crc_state[21]_i_3 
       (.I0(\template_crc_state[14]_i_3_n_0 ),
        .I1(p_0_in1_in_0[7]),
        .I2(\template_crc_state_reg_n_0_[7] ),
        .I3(\template_crc_state_reg_n_0_[1] ),
        .I4(p_0_in1_in_0[1]),
        .O(\template_crc_state[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[22]_i_1 
       (.I0(\template_crc_state[22]_i_2_n_0 ),
        .I1(\template_crc_state[22]_i_3_n_0 ),
        .I2(\template_crc_state[29]_i_2_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[27]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[22]_i_2 
       (.I0(p_0_in1_in_0[4]),
        .I1(\template_crc_state_reg_n_0_[4] ),
        .I2(p_0_in1_in_0[5]),
        .I3(\template_crc_state_reg_n_0_[5] ),
        .I4(\template_crc_state_reg_n_0_[14] ),
        .I5(\wdata_hold_reg_n_0_[14] ),
        .O(\template_crc_state[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[22]_i_3 
       (.I0(p_0_in1_in_0[6]),
        .I1(\template_crc_state_reg_n_0_[6] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\template_crc_state_reg_n_0_[0] ),
        .I4(\template_crc_state[23]_i_2_n_0 ),
        .O(\template_crc_state[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[23]_i_1 
       (.I0(\template_crc_state[24]_i_2_n_0 ),
        .I1(\template_crc_state[27]_i_2_n_0 ),
        .I2(\template_crc_state[28]_i_2_n_0 ),
        .I3(\template_crc_state[23]_i_2_n_0 ),
        .I4(\template_crc_state[23]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    \template_crc_state[23]_i_2 
       (.I0(p_0_in1_in_0[1]),
        .I1(\template_crc_state_reg_n_0_[1] ),
        .I2(\template_crc_state_reg_n_0_[7] ),
        .I3(p_0_in1_in_0[7]),
        .O(\template_crc_state[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \template_crc_state[23]_i_3 
       (.I0(\template_crc_state[31]_i_3_n_0 ),
        .I1(\template_crc_state[30]_i_2_n_0 ),
        .O(\template_crc_state[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[24]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state[29]_i_2_n_0 ),
        .I2(\template_crc_state[24]_i_2_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[24]_i_2 
       (.I0(\template_crc_state[25]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\template_crc_state_reg_n_0_[8] ),
        .I3(\template_crc_state_reg_n_0_[2] ),
        .I4(p_0_in1_in_0[2]),
        .O(\template_crc_state[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[25]_i_1 
       (.I0(\template_crc_state[25]_i_2_n_0 ),
        .I1(\template_crc_state[30]_i_2_n_0 ),
        .I2(\template_crc_state[29]_i_2_n_0 ),
        .I3(\template_crc_state[26]_i_2_n_0 ),
        .I4(\template_crc_state[27]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[25]_i_2 
       (.I0(\wdata_hold_reg_n_0_[9] ),
        .I1(\template_crc_state_reg_n_0_[9] ),
        .I2(p_0_in1_in_0[0]),
        .I3(\template_crc_state_reg_n_0_[0] ),
        .I4(\template_crc_state_reg_n_0_[3] ),
        .I5(p_0_in1_in_0[3]),
        .O(\template_crc_state[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[26]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state[26]_i_2_n_0 ),
        .I2(\template_crc_state[27]_i_2_n_0 ),
        .I3(\template_crc_state[31]_i_3_n_0 ),
        .I4(\template_crc_state[30]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[26]_i_2 
       (.I0(\template_crc_state[9]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[10] ),
        .I2(\template_crc_state_reg_n_0_[10] ),
        .I3(p_0_in1_in_0[4]),
        .I4(\template_crc_state_reg_n_0_[4] ),
        .O(\template_crc_state[26]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \template_crc_state[27]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state[29]_i_2_n_0 ),
        .I2(\template_crc_state[27]_i_2_n_0 ),
        .I3(\template_crc_state[31]_i_3_n_0 ),
        .I4(awaddr_hold[6]),
        .O(\template_crc_state[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \template_crc_state[27]_i_2 
       (.I0(\template_crc_state[13]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[11] ),
        .I2(\template_crc_state_reg_n_0_[11] ),
        .I3(p_0_in1_in_0[5]),
        .I4(\template_crc_state_reg_n_0_[5] ),
        .O(\template_crc_state[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair196" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \template_crc_state[28]_i_1 
       (.I0(\template_crc_state[29]_i_2_n_0 ),
        .I1(\template_crc_state[28]_i_2_n_0 ),
        .I2(\template_crc_state[30]_i_2_n_0 ),
        .I3(awaddr_hold[6]),
        .O(\template_crc_state[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[28]_i_2 
       (.I0(\template_crc_state[11]_i_3_n_0 ),
        .I1(\wdata_hold_reg_n_0_[12] ),
        .I2(\template_crc_state_reg_n_0_[12] ),
        .I3(\template_crc_state[11]_i_2_n_0 ),
        .I4(\template_crc_state_reg_n_0_[6] ),
        .I5(p_0_in1_in_0[6]),
        .O(\template_crc_state[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair197" *) 
  LUT4 #(
    .INIT(16'h69FF)) 
    \template_crc_state[29]_i_1 
       (.I0(\template_crc_state[30]_i_2_n_0 ),
        .I1(\template_crc_state[29]_i_2_n_0 ),
        .I2(\template_crc_state[31]_i_3_n_0 ),
        .I3(awaddr_hold[6]),
        .O(\template_crc_state[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[29]_i_2 
       (.I0(\template_crc_state_reg_n_0_[13] ),
        .I1(\wdata_hold_reg_n_0_[13] ),
        .I2(\template_crc_state_reg_n_0_[3] ),
        .I3(p_0_in1_in_0[3]),
        .I4(\template_crc_state[10]_i_2_n_0 ),
        .I5(\template_crc_state[23]_i_2_n_0 ),
        .O(\template_crc_state[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[2]_i_1 
       (.I0(\template_crc_state[25]_i_2_n_0 ),
        .I1(\wdata_hold_reg_n_0_[8] ),
        .I2(\template_crc_state_reg_n_0_[8] ),
        .I3(\template_crc_state_reg_n_0_[18] ),
        .I4(\template_crc_state[28]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair197" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \template_crc_state[30]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_crc_state[30]_i_2_n_0 ),
        .I2(\template_crc_state[31]_i_3_n_0 ),
        .O(template_crc_state[30]));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \template_crc_state[30]_i_2 
       (.I0(\wdata_hold_reg_n_0_[8] ),
        .I1(\template_crc_state_reg_n_0_[8] ),
        .I2(\template_crc_state_reg_n_0_[2] ),
        .I3(p_0_in1_in_0[2]),
        .I4(\template_crc_state[22]_i_2_n_0 ),
        .O(\template_crc_state[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0075)) 
    \template_crc_state[31]_i_1 
       (.I0(\template_addr_ptr[9]_i_6_n_0 ),
        .I1(\template_addr_ptr[9]_i_4_n_0 ),
        .I2(awaddr_hold[6]),
        .I3(\template_addr_ptr[9]_i_3_n_0 ),
        .O(\template_crc_state[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \template_crc_state[31]_i_2 
       (.I0(\template_crc_state[31]_i_3_n_0 ),
        .I1(awaddr_hold[6]),
        .O(\template_crc_state[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h9669)) 
    \template_crc_state[31]_i_3 
       (.I0(\wdata_hold_reg_n_0_[15] ),
        .I1(\template_crc_state_reg_n_0_[15] ),
        .I2(\template_crc_state[14]_i_3_n_0 ),
        .I3(\template_crc_state[25]_i_2_n_0 ),
        .O(\template_crc_state[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \template_crc_state[3]_i_1 
       (.I0(\template_crc_state[26]_i_2_n_0 ),
        .I1(\template_crc_state[3]_i_2_n_0 ),
        .I2(\template_crc_state_reg_n_0_[19] ),
        .I3(\template_crc_state[29]_i_2_n_0 ),
        .I4(awaddr_hold[6]),
        .O(\template_crc_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[3]_i_2 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\template_crc_state_reg_n_0_[9] ),
        .I3(\wdata_hold_reg_n_0_[9] ),
        .O(\template_crc_state[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hD77D7DD77DD7D77D)) 
    \template_crc_state[4]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_crc_state[15]_i_2_n_0 ),
        .I2(\template_crc_state_reg_n_0_[20] ),
        .I3(\template_crc_state[11]_i_2_n_0 ),
        .I4(\template_crc_state[10]_i_2_n_0 ),
        .I5(\template_crc_state[30]_i_2_n_0 ),
        .O(template_crc_state[4]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT5 #(
    .INIT(32'h9669FFFF)) 
    \template_crc_state[5]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state[5]_i_2_n_0 ),
        .I2(\template_crc_state[27]_i_2_n_0 ),
        .I3(\template_crc_state[31]_i_3_n_0 ),
        .I4(awaddr_hold[6]),
        .O(\template_crc_state[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[5]_i_2 
       (.I0(\template_crc_state_reg_n_0_[1] ),
        .I1(p_0_in1_in_0[1]),
        .I2(\template_crc_state[11]_i_2_n_0 ),
        .I3(p_0_in1_in_0[5]),
        .I4(\template_crc_state_reg_n_0_[5] ),
        .I5(\template_crc_state_reg_n_0_[21] ),
        .O(\template_crc_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[6]_i_1 
       (.I0(\template_crc_state[28]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[22] ),
        .I2(\template_crc_state[6]_i_2_n_0 ),
        .I3(\template_crc_state[6]_i_3_n_0 ),
        .I4(\template_crc_state[29]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[6]_i_2 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\template_crc_state_reg_n_0_[6] ),
        .I3(p_0_in1_in_0[6]),
        .O(\template_crc_state[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \template_crc_state[6]_i_3 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(\template_crc_state_reg_n_0_[1] ),
        .I3(p_0_in1_in_0[1]),
        .I4(\template_crc_state_reg_n_0_[2] ),
        .I5(p_0_in1_in_0[2]),
        .O(\template_crc_state[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[7]_i_1 
       (.I0(\template_crc_state[29]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[23] ),
        .I2(\template_crc_state[23]_i_2_n_0 ),
        .I3(\template_crc_state[7]_i_2_n_0 ),
        .I4(\template_crc_state[30]_i_2_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \template_crc_state[7]_i_2 
       (.I0(p_0_in1_in_0[1]),
        .I1(\template_crc_state_reg_n_0_[1] ),
        .I2(\template_crc_state_reg_n_0_[2] ),
        .I3(p_0_in1_in_0[2]),
        .I4(p_0_in1_in_0[3]),
        .I5(\template_crc_state_reg_n_0_[3] ),
        .O(\template_crc_state[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96696996FFFFFFFF)) 
    \template_crc_state[8]_i_1 
       (.I0(\template_crc_state[18]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[24] ),
        .I2(\template_crc_state[11]_i_2_n_0 ),
        .I3(\template_crc_state[22]_i_2_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69969669FFFFFFFF)) 
    \template_crc_state[9]_i_1 
       (.I0(\template_crc_state[25]_i_2_n_0 ),
        .I1(\template_crc_state_reg_n_0_[25] ),
        .I2(\template_crc_state[9]_i_2_n_0 ),
        .I3(\template_crc_state[19]_i_3_n_0 ),
        .I4(\template_crc_state[31]_i_3_n_0 ),
        .I5(awaddr_hold[6]),
        .O(\template_crc_state[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \template_crc_state[9]_i_2 
       (.I0(\template_crc_state_reg_n_0_[0] ),
        .I1(p_0_in1_in_0[0]),
        .I2(p_0_in1_in_0[1]),
        .I3(\template_crc_state_reg_n_0_[1] ),
        .O(\template_crc_state[9]_i_2_n_0 ));
  FDSE \template_crc_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[0]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[0] ),
        .S(SR));
  FDSE \template_crc_state_reg[10] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[10]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[10] ),
        .S(SR));
  FDSE \template_crc_state_reg[11] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[11]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[11] ),
        .S(SR));
  FDSE \template_crc_state_reg[12] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[12]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[12] ),
        .S(SR));
  FDSE \template_crc_state_reg[13] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[13]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[13] ),
        .S(SR));
  FDSE \template_crc_state_reg[14] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[14]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[14] ),
        .S(SR));
  FDSE \template_crc_state_reg[15] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[15]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[15] ),
        .S(SR));
  FDSE \template_crc_state_reg[16] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[16]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[16] ),
        .S(SR));
  FDSE \template_crc_state_reg[17] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[17]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[17] ),
        .S(SR));
  FDSE \template_crc_state_reg[18] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[18]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[18] ),
        .S(SR));
  FDSE \template_crc_state_reg[19] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[19]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[19] ),
        .S(SR));
  FDSE \template_crc_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(template_crc_state[1]),
        .Q(\template_crc_state_reg_n_0_[1] ),
        .S(SR));
  FDSE \template_crc_state_reg[20] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[20]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[20] ),
        .S(SR));
  FDSE \template_crc_state_reg[21] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[21]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[21] ),
        .S(SR));
  FDSE \template_crc_state_reg[22] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[22]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[22] ),
        .S(SR));
  FDSE \template_crc_state_reg[23] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[23]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[23] ),
        .S(SR));
  FDSE \template_crc_state_reg[24] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[24]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[24] ),
        .S(SR));
  FDSE \template_crc_state_reg[25] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[25]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[25] ),
        .S(SR));
  FDSE \template_crc_state_reg[26] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[26]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[26] ),
        .S(SR));
  FDSE \template_crc_state_reg[27] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[27]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[27] ),
        .S(SR));
  FDSE \template_crc_state_reg[28] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[28]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[28] ),
        .S(SR));
  FDSE \template_crc_state_reg[29] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[29]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[29] ),
        .S(SR));
  FDSE \template_crc_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[2]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[2] ),
        .S(SR));
  FDSE \template_crc_state_reg[30] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(template_crc_state[30]),
        .Q(\template_crc_state_reg_n_0_[30] ),
        .S(SR));
  FDSE \template_crc_state_reg[31] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[31]_i_2_n_0 ),
        .Q(\template_crc_state_reg_n_0_[31] ),
        .S(SR));
  FDSE \template_crc_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[3]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[3] ),
        .S(SR));
  FDSE \template_crc_state_reg[4] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(template_crc_state[4]),
        .Q(\template_crc_state_reg_n_0_[4] ),
        .S(SR));
  FDSE \template_crc_state_reg[5] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[5]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[5] ),
        .S(SR));
  FDSE \template_crc_state_reg[6] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[6]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[6] ),
        .S(SR));
  FDSE \template_crc_state_reg[7] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[7]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[7] ),
        .S(SR));
  FDSE \template_crc_state_reg[8] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[8]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[8] ),
        .S(SR));
  FDSE \template_crc_state_reg[9] 
       (.C(s_axi_aclk),
        .CE(\template_crc_state[31]_i_1_n_0 ),
        .D(\template_crc_state[9]_i_1_n_0 ),
        .Q(\template_crc_state_reg_n_0_[9] ),
        .S(SR));
  LUT5 #(
    .INIT(32'hF0FEF0F0)) 
    template_load_complete_i_1
       (.I0(template_load_complete_i_2_n_0),
        .I1(\template_addr_ptr[9]_i_6_n_0 ),
        .I2(template_load_complete32_out),
        .I3(template_commit_accepted),
        .I4(coeff_status_word[1]),
        .O(template_load_complete_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT5 #(
    .INIT(32'hBFFFFFFF)) 
    template_load_complete_i_2
       (.I0(\pulse_config_word[2]_i_4_n_0 ),
        .I1(awaddr_hold[5]),
        .I2(awaddr_hold[3]),
        .I3(awaddr_hold[4]),
        .I4(awaddr_hold[2]),
        .O(template_load_complete_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    template_load_complete_i_3
       (.I0(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .I1(template_load_complete_i_4_n_0),
        .I2(\template_addr_ptr[8]_i_2_n_0 ),
        .I3(\template_addr_ptr_reg_n_0_[8] ),
        .I4(\template_addr_ptr_reg_n_0_[9] ),
        .I5(\template_addr_ptr_reg_n_0_[7] ),
        .O(template_load_complete32_out));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    template_load_complete_i_4
       (.I0(\template_write_count_reg_n_0_[6] ),
        .I1(\template_write_count[9]_i_2_n_0 ),
        .I2(\template_write_count_reg_n_0_[10] ),
        .I3(\template_write_count_reg_n_0_[9] ),
        .I4(\template_write_count_reg_n_0_[7] ),
        .I5(\template_write_count_reg_n_0_[8] ),
        .O(template_load_complete_i_4_n_0));
  FDRE template_load_complete_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_load_complete_i_1_n_0),
        .Q(coeff_status_word[1]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFEEEEE00022222)) 
    template_sequence_valid_i_1
       (.I0(template_sequence_valid),
        .I1(\template_addr_ptr[9]_i_3_n_0 ),
        .I2(template_sequence_valid_i_3_n_0),
        .I3(\template_write_count[10]_i_3_n_0 ),
        .I4(\template_addr_ptr[9]_i_6_n_0 ),
        .I5(template_sequence_valid_reg_n_0),
        .O(template_sequence_valid_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    template_sequence_valid_i_2
       (.I0(pn_enable_i_6_n_0),
        .I1(data0[9]),
        .I2(data0[8]),
        .I3(result_capture_pending_i_2_n_0),
        .I4(\result_select_addr[0]_i_1_n_0 ),
        .I5(awaddr_hold[6]),
        .O(template_sequence_valid));
  LUT6 #(
    .INIT(64'hFFFFFF7FFFFFFFFF)) 
    template_sequence_valid_i_3
       (.I0(p_0_in),
        .I1(\wstrb_hold_reg_n_0_[0] ),
        .I2(template_sequence_valid_reg_n_0),
        .I3(coeff_status_word[1]),
        .I4(busy),
        .I5(awaddr_hold[6]),
        .O(template_sequence_valid_i_3_n_0));
  FDRE template_sequence_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_sequence_valid_i_1_n_0),
        .Q(template_sequence_valid_reg_n_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \template_shadow_wr_addr[9]_i_1 
       (.I0(template_shadow_wr_en_i_1_n_0),
        .I1(s_axi_bvalid_reg_0),
        .I2(aw_pending_reg_n_0),
        .I3(w_pending_reg_n_0),
        .I4(average_capture_pending_reg_n_0),
        .I5(result_capture_pending_reg_n_0),
        .O(\template_shadow_wr_addr[9]_i_1_n_0 ));
  FDRE \template_shadow_wr_addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[0] ),
        .Q(template_shadow_wr_addr[0]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[1] ),
        .Q(template_shadow_wr_addr[1]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[2] ),
        .Q(template_shadow_wr_addr[2]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[3] ),
        .Q(template_shadow_wr_addr[3]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[4] ),
        .Q(template_shadow_wr_addr[4]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[5] ),
        .Q(template_shadow_wr_addr[5]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[6] ),
        .Q(template_shadow_wr_addr[6]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[7] ),
        .Q(template_shadow_wr_addr[7]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[8] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[8] ),
        .Q(template_shadow_wr_addr[8]),
        .R(SR));
  FDRE \template_shadow_wr_addr_reg[9] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\template_addr_ptr_reg_n_0_[9] ),
        .Q(template_shadow_wr_addr[9]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[0] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[0]),
        .Q(template_shadow_wr_data_q14[0]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[10] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[10] ),
        .Q(template_shadow_wr_data_q14[10]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[11] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[11] ),
        .Q(template_shadow_wr_data_q14[11]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[12] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[12] ),
        .Q(template_shadow_wr_data_q14[12]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[13] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[13] ),
        .Q(template_shadow_wr_data_q14[13]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[14] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[14] ),
        .Q(template_shadow_wr_data_q14[14]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[15] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[15] ),
        .Q(template_shadow_wr_data_q14[15]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[1] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[1]),
        .Q(template_shadow_wr_data_q14[1]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[2] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[2]),
        .Q(template_shadow_wr_data_q14[2]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[3] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[3]),
        .Q(template_shadow_wr_data_q14[3]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[4] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[4]),
        .Q(template_shadow_wr_data_q14[4]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[5] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[5]),
        .Q(template_shadow_wr_data_q14[5]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[6] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[6]),
        .Q(template_shadow_wr_data_q14[6]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[7] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(p_0_in1_in_0[7]),
        .Q(template_shadow_wr_data_q14[7]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[8] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[8] ),
        .Q(template_shadow_wr_data_q14[8]),
        .R(SR));
  FDRE \template_shadow_wr_data_q14_reg[9] 
       (.C(s_axi_aclk),
        .CE(\template_shadow_wr_addr[9]_i_1_n_0 ),
        .D(\wdata_hold_reg_n_0_[9] ),
        .Q(template_shadow_wr_data_q14[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    template_shadow_wr_en_i_1
       (.I0(\last_error[0]_i_2_n_0 ),
        .I1(clear_status_pulse_i_3_n_0),
        .I2(awaddr_hold[4]),
        .I3(awaddr_hold[6]),
        .I4(awaddr_hold[5]),
        .I5(\template_addr_ptr[9]_i_4_n_0 ),
        .O(template_shadow_wr_en_i_1_n_0));
  FDRE template_shadow_wr_en_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_shadow_wr_en_i_1_n_0),
        .Q(template_shadow_wr_en),
        .R(clear_status_pulse_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair224" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \template_write_count[0]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[0] ),
        .O(template_write_count[0]));
  LUT5 #(
    .INIT(32'h04005555)) 
    \template_write_count[10]_i_1 
       (.I0(\template_addr_ptr[9]_i_3_n_0 ),
        .I1(awaddr_hold[6]),
        .I2(\template_addr_ptr[9]_i_4_n_0 ),
        .I3(\template_write_count[10]_i_3_n_0 ),
        .I4(\template_addr_ptr[9]_i_6_n_0 ),
        .O(\template_write_count[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA2AAA00008000)) 
    \template_write_count[10]_i_2 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[9] ),
        .I2(\template_write_count_reg_n_0_[8] ),
        .I3(\template_write_count_reg_n_0_[7] ),
        .I4(\template_write_count[10]_i_4_n_0 ),
        .I5(\template_write_count_reg_n_0_[10] ),
        .O(template_write_count[10]));
  LUT6 #(
    .INIT(64'hEFEFEFFFEFEFEFEF)) 
    \template_write_count[10]_i_3 
       (.I0(\template_write_count[10]_i_5_n_0 ),
        .I1(\template_addr_ptr[7]_i_2_n_0 ),
        .I2(\template_addr_ptr_reg_n_0_[6] ),
        .I3(\template_write_count[10]_i_6_n_0 ),
        .I4(\template_write_count[9]_i_2_n_0 ),
        .I5(\template_write_count_reg_n_0_[6] ),
        .O(\template_write_count[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair221" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \template_write_count[10]_i_4 
       (.I0(\template_write_count[9]_i_2_n_0 ),
        .I1(\template_write_count_reg_n_0_[6] ),
        .O(\template_write_count[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \template_write_count[10]_i_5 
       (.I0(\template_addr_ptr_reg_n_0_[7] ),
        .I1(\template_addr_ptr_reg_n_0_[9] ),
        .I2(\template_addr_ptr_reg_n_0_[8] ),
        .O(\template_write_count[10]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \template_write_count[10]_i_6 
       (.I0(\template_write_count_reg_n_0_[8] ),
        .I1(\template_write_count_reg_n_0_[7] ),
        .I2(\template_write_count_reg_n_0_[9] ),
        .I3(\template_write_count_reg_n_0_[10] ),
        .O(\template_write_count[10]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair224" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \template_write_count[1]_i_1 
       (.I0(\template_write_count_reg_n_0_[1] ),
        .I1(\template_write_count_reg_n_0_[0] ),
        .I2(awaddr_hold[6]),
        .O(\template_write_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \template_write_count[2]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[0] ),
        .I2(\template_write_count_reg_n_0_[1] ),
        .I3(\template_write_count_reg_n_0_[2] ),
        .O(template_write_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \template_write_count[3]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[1] ),
        .I2(\template_write_count_reg_n_0_[0] ),
        .I3(\template_write_count_reg_n_0_[2] ),
        .I4(\template_write_count_reg_n_0_[3] ),
        .O(template_write_count[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \template_write_count[4]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[2] ),
        .I2(\template_write_count_reg_n_0_[0] ),
        .I3(\template_write_count_reg_n_0_[1] ),
        .I4(\template_write_count_reg_n_0_[3] ),
        .I5(\template_write_count_reg_n_0_[4] ),
        .O(template_write_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair223" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \template_write_count[5]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count[5]_i_2_n_0 ),
        .I2(\template_write_count_reg_n_0_[5] ),
        .O(template_write_count[5]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \template_write_count[5]_i_2 
       (.I0(\template_write_count_reg_n_0_[3] ),
        .I1(\template_write_count_reg_n_0_[1] ),
        .I2(\template_write_count_reg_n_0_[0] ),
        .I3(\template_write_count_reg_n_0_[2] ),
        .I4(\template_write_count_reg_n_0_[4] ),
        .O(\template_write_count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair221" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \template_write_count[6]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count[9]_i_2_n_0 ),
        .I2(\template_write_count_reg_n_0_[6] ),
        .O(template_write_count[6]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT4 #(
    .INIT(16'h8A20)) 
    \template_write_count[7]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count[9]_i_2_n_0 ),
        .I2(\template_write_count_reg_n_0_[6] ),
        .I3(\template_write_count_reg_n_0_[7] ),
        .O(template_write_count[7]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT5 #(
    .INIT(32'hAA2A0080)) 
    \template_write_count[8]_i_1 
       (.I0(awaddr_hold[6]),
        .I1(\template_write_count_reg_n_0_[7] ),
        .I2(\template_write_count_reg_n_0_[6] ),
        .I3(\template_write_count[9]_i_2_n_0 ),
        .I4(\template_write_count_reg_n_0_[8] ),
        .O(template_write_count[8]));
  LUT6 #(
    .INIT(64'hBFFF400000000000)) 
    \template_write_count[9]_i_1 
       (.I0(\template_write_count[9]_i_2_n_0 ),
        .I1(\template_write_count_reg_n_0_[6] ),
        .I2(\template_write_count_reg_n_0_[7] ),
        .I3(\template_write_count_reg_n_0_[8] ),
        .I4(\template_write_count_reg_n_0_[9] ),
        .I5(awaddr_hold[6]),
        .O(\template_write_count[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \template_write_count[9]_i_2 
       (.I0(\template_write_count_reg_n_0_[4] ),
        .I1(\template_write_count_reg_n_0_[2] ),
        .I2(\template_write_count_reg_n_0_[0] ),
        .I3(\template_write_count_reg_n_0_[1] ),
        .I4(\template_write_count_reg_n_0_[3] ),
        .I5(\template_write_count_reg_n_0_[5] ),
        .O(\template_write_count[9]_i_2_n_0 ));
  FDRE \template_write_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[0]),
        .Q(\template_write_count_reg_n_0_[0] ),
        .R(SR));
  FDRE \template_write_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[10]),
        .Q(\template_write_count_reg_n_0_[10] ),
        .R(SR));
  FDRE \template_write_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(\template_write_count[1]_i_1_n_0 ),
        .Q(\template_write_count_reg_n_0_[1] ),
        .R(SR));
  FDRE \template_write_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[2]),
        .Q(\template_write_count_reg_n_0_[2] ),
        .R(SR));
  FDRE \template_write_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[3]),
        .Q(\template_write_count_reg_n_0_[3] ),
        .R(SR));
  FDRE \template_write_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[4]),
        .Q(\template_write_count_reg_n_0_[4] ),
        .R(SR));
  FDRE \template_write_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[5]),
        .Q(\template_write_count_reg_n_0_[5] ),
        .R(SR));
  FDRE \template_write_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[6]),
        .Q(\template_write_count_reg_n_0_[6] ),
        .R(SR));
  FDRE \template_write_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[7]),
        .Q(\template_write_count_reg_n_0_[7] ),
        .R(SR));
  FDRE \template_write_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(template_write_count[8]),
        .Q(\template_write_count_reg_n_0_[8] ),
        .R(SR));
  FDRE \template_write_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(\template_write_count[10]_i_1_n_0 ),
        .D(\template_write_count[9]_i_1_n_0 ),
        .Q(\template_write_count_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair208" *) 
  LUT4 #(
    .INIT(16'hAEAA)) 
    w_pending_i_1
       (.I0(w_pending48_out),
        .I1(s_axi_aresetn),
        .I2(pn_enable_i_3_n_0),
        .I3(w_pending_reg_n_0),
        .O(w_pending_i_1_n_0));
  FDRE w_pending_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(w_pending_i_1_n_0),
        .Q(w_pending_reg_n_0),
        .R(1'b0));
  FDRE \wdata_hold_reg[0] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[0]),
        .Q(p_0_in1_in_0[0]),
        .R(SR));
  FDRE \wdata_hold_reg[10] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[10]),
        .Q(\wdata_hold_reg_n_0_[10] ),
        .R(SR));
  FDRE \wdata_hold_reg[11] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[11]),
        .Q(\wdata_hold_reg_n_0_[11] ),
        .R(SR));
  FDRE \wdata_hold_reg[12] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[12]),
        .Q(\wdata_hold_reg_n_0_[12] ),
        .R(SR));
  FDRE \wdata_hold_reg[13] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[13]),
        .Q(\wdata_hold_reg_n_0_[13] ),
        .R(SR));
  FDRE \wdata_hold_reg[14] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[14]),
        .Q(\wdata_hold_reg_n_0_[14] ),
        .R(SR));
  FDRE \wdata_hold_reg[15] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[15]),
        .Q(\wdata_hold_reg_n_0_[15] ),
        .R(SR));
  FDRE \wdata_hold_reg[16] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[16]),
        .Q(p_2_in[0]),
        .R(SR));
  FDRE \wdata_hold_reg[17] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[17]),
        .Q(p_2_in[1]),
        .R(SR));
  FDRE \wdata_hold_reg[18] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[18]),
        .Q(p_2_in[2]),
        .R(SR));
  FDRE \wdata_hold_reg[19] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[19]),
        .Q(p_2_in[3]),
        .R(SR));
  FDRE \wdata_hold_reg[1] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[1]),
        .Q(p_0_in1_in_0[1]),
        .R(SR));
  FDRE \wdata_hold_reg[20] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[20]),
        .Q(p_2_in[4]),
        .R(SR));
  FDRE \wdata_hold_reg[21] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[21]),
        .Q(p_2_in[5]),
        .R(SR));
  FDRE \wdata_hold_reg[22] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[22]),
        .Q(p_2_in[6]),
        .R(SR));
  FDRE \wdata_hold_reg[23] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[23]),
        .Q(p_2_in[7]),
        .R(SR));
  FDRE \wdata_hold_reg[24] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[24]),
        .Q(\wdata_hold_reg_n_0_[24] ),
        .R(SR));
  FDRE \wdata_hold_reg[25] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[25]),
        .Q(\wdata_hold_reg_n_0_[25] ),
        .R(SR));
  FDRE \wdata_hold_reg[26] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[26]),
        .Q(\wdata_hold_reg_n_0_[26] ),
        .R(SR));
  FDRE \wdata_hold_reg[27] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[27]),
        .Q(\wdata_hold_reg_n_0_[27] ),
        .R(SR));
  FDRE \wdata_hold_reg[28] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[28]),
        .Q(\wdata_hold_reg_n_0_[28] ),
        .R(SR));
  FDRE \wdata_hold_reg[29] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[29]),
        .Q(\wdata_hold_reg_n_0_[29] ),
        .R(SR));
  FDRE \wdata_hold_reg[2] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[2]),
        .Q(p_0_in1_in_0[2]),
        .R(SR));
  FDRE \wdata_hold_reg[30] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[30]),
        .Q(\wdata_hold_reg_n_0_[30] ),
        .R(SR));
  FDRE \wdata_hold_reg[31] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[31]),
        .Q(\wdata_hold_reg_n_0_[31] ),
        .R(SR));
  FDRE \wdata_hold_reg[3] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[3]),
        .Q(p_0_in1_in_0[3]),
        .R(SR));
  FDRE \wdata_hold_reg[4] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[4]),
        .Q(p_0_in1_in_0[4]),
        .R(SR));
  FDRE \wdata_hold_reg[5] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[5]),
        .Q(p_0_in1_in_0[5]),
        .R(SR));
  FDRE \wdata_hold_reg[6] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[6]),
        .Q(p_0_in1_in_0[6]),
        .R(SR));
  FDRE \wdata_hold_reg[7] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[7]),
        .Q(p_0_in1_in_0[7]),
        .R(SR));
  FDRE \wdata_hold_reg[8] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[8]),
        .Q(\wdata_hold_reg_n_0_[8] ),
        .R(SR));
  FDRE \wdata_hold_reg[9] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wdata[9]),
        .Q(\wdata_hold_reg_n_0_[9] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \wstrb_hold[3]_i_1 
       (.I0(s_axi_wvalid),
        .I1(result_capture_pending_reg_n_0),
        .I2(average_capture_pending_reg_n_0),
        .I3(s_axi_aresetn),
        .I4(s_axi_bvalid_reg_0),
        .I5(w_pending_reg_n_0),
        .O(w_pending48_out));
  FDRE \wstrb_hold_reg[0] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wstrb[0]),
        .Q(\wstrb_hold_reg_n_0_[0] ),
        .R(SR));
  FDRE \wstrb_hold_reg[1] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wstrb[1]),
        .Q(p_0_in),
        .R(SR));
  FDRE \wstrb_hold_reg[2] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wstrb[2]),
        .Q(data00),
        .R(SR));
  FDRE \wstrb_hold_reg[3] 
       (.C(s_axi_aclk),
        .CE(w_pending48_out),
        .D(s_axi_wstrb[3]),
        .Q(\wstrb_hold_reg_n_0_[3] ),
        .R(SR));
endmodule

(* C_S_AXI_ADDR_WIDTH = "8" *) (* C_S_AXI_DATA_WIDTH = "32" *) (* K = "256" *) 
(* K_ADDR_W = "8" *) (* L = "640" *) (* LAG_MIN = "0" *) 
(* L_ADDR_W = "10" *) (* M = "32" *) (* N = "1024" *) 
(* N_ADDR_W = "10" *) (* ORIG_REF_NAME = "echo_pipeline_axi_control_phase2" *) (* SAMPLE_RATE_HZ = "200000000" *) 
module system_echo_pipeline_0_0_echo_pipeline_axi_control_phase2
   (clk_acq,
    rst_acq,
    adc_ready_acq,
    pair_valid,
    sample_rise_u14,
    sample_fall_u14,
    sample_clip,
    pulse_ready_acq,
    tx_marker,
    frame_meta,
    pulse_start_acq,
    pulse_mode,
    pulse_width,
    pn_enable,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    irq_f2p);
  input clk_acq;
  input rst_acq;
  input adc_ready_acq;
  input pair_valid;
  input [13:0]sample_rise_u14;
  input [13:0]sample_fall_u14;
  input sample_clip;
  input pulse_ready_acq;
  input tx_marker;
  input [31:0]frame_meta;
  output pulse_start_acq;
  output [2:0]pulse_mode;
  output [5:0]pulse_width;
  output pn_enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, PROTOCOL AXI4LITE, DATA_WIDTH 32, ADDR_WIDTH 8, FREQ_HZ 100000000, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1" *) input [7:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [7:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 irq_f2p INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME irq_f2p, SENSITIVITY LEVEL_HIGH" *) output irq_f2p;

  wire \<const0> ;
  wire acq_busy_acq;
  (* async_reg = "true" *) wire [1:0]acq_busy_proc_sync;
  wire adc_ready_acq;
  (* async_reg = "true" *) wire [1:0]adc_ready_proc_sync;
  wire average_frame_available_proc;
  wire [31:0]average_overflow_count;
  wire [9:0]average_select_addr;
  wire baseline_active_bank;
  wire baseline_coeff_valid;
  wire baseline_coeff_valid_i_1_n_0;
  wire baseline_commit_accepted;
  wire baseline_commit_pulse;
  wire baseline_commit_rejected;
  wire [9:0]baseline_shadow_wr_addr;
  wire [15:0]baseline_shadow_wr_data_q2;
  wire baseline_shadow_wr_en;
  wire bridge_i_n_0;
  wire bridge_i_n_2;
  wire bridge_i_n_3;
  wire bridge_i_n_6;
  wire clear_status_pulse;
  wire clip_flag_snapshot;
  wire clk_acq;
  wire [31:0]correlation_overflow_count;
  wire done_pulse;
  wire done_sticky;
  wire frame_error_sticky_proc;
  wire [31:0]frame_meta;
  wire [5:0]frames_seen_proc;
  wire irq_f2p;
  wire pair_valid;
  wire pn_enable;
  wire [2:0]pulse_mode;
  wire pulse_ready_acq;
  (* async_reg = "true" *) wire [1:0]pulse_ready_proc_sync;
  wire pulse_start_acq;
  wire [5:0]pulse_width;
  wire [8:0]result_count;
  wire [7:0]result_select_addr;
  wire rst_acq;
  wire s_axi_aclk;
  wire [7:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [7:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire sample_clip;
  wire [13:0]sample_fall_u14;
  wire [13:0]sample_rise_u14;
  wire [15:0]selected_average_q2;
  wire [63:0]selected_result_q16;
  wire start_accepted;
  wire start_accepted_sticky;
  wire start_command_pulse;
  wire start_rejected_not_ready;
  wire start_rejected_sticky_reg_n_0;
  wire template_active_bank;
  wire template_coeff_valid;
  wire template_coeff_valid_i_1_n_0;
  wire template_commit_accepted;
  wire template_commit_pulse;
  wire template_commit_rejected;
  wire [9:0]template_shadow_wr_addr;
  wire [15:0]template_shadow_wr_data_q14;
  wire template_shadow_wr_en;
  wire transaction_busy;
  wire \transaction_count[0]_i_2_n_0 ;
  wire [31:0]transaction_count_reg;
  wire \transaction_count_reg[0]_i_1_n_0 ;
  wire \transaction_count_reg[0]_i_1_n_1 ;
  wire \transaction_count_reg[0]_i_1_n_2 ;
  wire \transaction_count_reg[0]_i_1_n_3 ;
  wire \transaction_count_reg[0]_i_1_n_4 ;
  wire \transaction_count_reg[0]_i_1_n_5 ;
  wire \transaction_count_reg[0]_i_1_n_6 ;
  wire \transaction_count_reg[0]_i_1_n_7 ;
  wire \transaction_count_reg[12]_i_1_n_0 ;
  wire \transaction_count_reg[12]_i_1_n_1 ;
  wire \transaction_count_reg[12]_i_1_n_2 ;
  wire \transaction_count_reg[12]_i_1_n_3 ;
  wire \transaction_count_reg[12]_i_1_n_4 ;
  wire \transaction_count_reg[12]_i_1_n_5 ;
  wire \transaction_count_reg[12]_i_1_n_6 ;
  wire \transaction_count_reg[12]_i_1_n_7 ;
  wire \transaction_count_reg[16]_i_1_n_0 ;
  wire \transaction_count_reg[16]_i_1_n_1 ;
  wire \transaction_count_reg[16]_i_1_n_2 ;
  wire \transaction_count_reg[16]_i_1_n_3 ;
  wire \transaction_count_reg[16]_i_1_n_4 ;
  wire \transaction_count_reg[16]_i_1_n_5 ;
  wire \transaction_count_reg[16]_i_1_n_6 ;
  wire \transaction_count_reg[16]_i_1_n_7 ;
  wire \transaction_count_reg[20]_i_1_n_0 ;
  wire \transaction_count_reg[20]_i_1_n_1 ;
  wire \transaction_count_reg[20]_i_1_n_2 ;
  wire \transaction_count_reg[20]_i_1_n_3 ;
  wire \transaction_count_reg[20]_i_1_n_4 ;
  wire \transaction_count_reg[20]_i_1_n_5 ;
  wire \transaction_count_reg[20]_i_1_n_6 ;
  wire \transaction_count_reg[20]_i_1_n_7 ;
  wire \transaction_count_reg[24]_i_1_n_0 ;
  wire \transaction_count_reg[24]_i_1_n_1 ;
  wire \transaction_count_reg[24]_i_1_n_2 ;
  wire \transaction_count_reg[24]_i_1_n_3 ;
  wire \transaction_count_reg[24]_i_1_n_4 ;
  wire \transaction_count_reg[24]_i_1_n_5 ;
  wire \transaction_count_reg[24]_i_1_n_6 ;
  wire \transaction_count_reg[24]_i_1_n_7 ;
  wire \transaction_count_reg[28]_i_1_n_1 ;
  wire \transaction_count_reg[28]_i_1_n_2 ;
  wire \transaction_count_reg[28]_i_1_n_3 ;
  wire \transaction_count_reg[28]_i_1_n_4 ;
  wire \transaction_count_reg[28]_i_1_n_5 ;
  wire \transaction_count_reg[28]_i_1_n_6 ;
  wire \transaction_count_reg[28]_i_1_n_7 ;
  wire \transaction_count_reg[4]_i_1_n_0 ;
  wire \transaction_count_reg[4]_i_1_n_1 ;
  wire \transaction_count_reg[4]_i_1_n_2 ;
  wire \transaction_count_reg[4]_i_1_n_3 ;
  wire \transaction_count_reg[4]_i_1_n_4 ;
  wire \transaction_count_reg[4]_i_1_n_5 ;
  wire \transaction_count_reg[4]_i_1_n_6 ;
  wire \transaction_count_reg[4]_i_1_n_7 ;
  wire \transaction_count_reg[8]_i_1_n_0 ;
  wire \transaction_count_reg[8]_i_1_n_1 ;
  wire \transaction_count_reg[8]_i_1_n_2 ;
  wire \transaction_count_reg[8]_i_1_n_3 ;
  wire \transaction_count_reg[8]_i_1_n_4 ;
  wire \transaction_count_reg[8]_i_1_n_5 ;
  wire \transaction_count_reg[8]_i_1_n_6 ;
  wire \transaction_count_reg[8]_i_1_n_7 ;
  wire tx_marker;
  wire [3:3]\NLW_transaction_count_reg[28]_i_1_CO_UNCONNECTED ;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \acq_busy_proc_sync_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(acq_busy_acq),
        .Q(acq_busy_proc_sync[0]),
        .R(bridge_i_n_6));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \acq_busy_proc_sync_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(acq_busy_proc_sync[0]),
        .Q(acq_busy_proc_sync[1]),
        .R(bridge_i_n_6));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \adc_ready_proc_sync_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(adc_ready_acq),
        .Q(adc_ready_proc_sync[0]),
        .R(bridge_i_n_6));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \adc_ready_proc_sync_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(adc_ready_proc_sync[0]),
        .Q(adc_ready_proc_sync[1]),
        .R(bridge_i_n_6));
  LUT2 #(
    .INIT(4'hE)) 
    baseline_coeff_valid_i_1
       (.I0(baseline_commit_accepted),
        .I1(baseline_coeff_valid),
        .O(baseline_coeff_valid_i_1_n_0));
  FDRE baseline_coeff_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(baseline_coeff_valid_i_1_n_0),
        .Q(baseline_coeff_valid),
        .R(bridge_i_n_6));
  system_echo_pipeline_0_0_echo_pipeline_axi_bridge_phase2 bridge_i
       (.D({clip_flag_snapshot,done_sticky}),
        .SR(bridge_i_n_6),
        .average_frame_available_proc(average_frame_available_proc),
        .average_overflow_count(average_overflow_count),
        .average_select_addr(average_select_addr),
        .baseline_active_bank(baseline_active_bank),
        .baseline_coeff_valid(baseline_coeff_valid),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_commit_rejected(baseline_commit_rejected),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .busy(transaction_busy),
        .clear_status_pulse(clear_status_pulse),
        .correlation_overflow_count(correlation_overflow_count),
        .frame_error_sticky_proc(frame_error_sticky_proc),
        .frames_seen_proc(frames_seen_proc),
        .irq_f2p(irq_f2p),
        .out(transaction_count_reg),
        .pn_enable_reg_0(pn_enable),
        .pulse_mode(pulse_mode),
        .pulse_width(pulse_width),
        .result_count(result_count),
        .result_select_addr(result_select_addr),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid_reg_0(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .\s_axi_rdata[1]_i_4_0 (pulse_ready_proc_sync[1]),
        .\s_axi_rdata[1]_i_4_1 (adc_ready_proc_sync[1]),
        .\s_axi_rdata_reg[5]_i_2_0 (acq_busy_proc_sync[1]),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid_reg_0(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .selected_average_q2(selected_average_q2),
        .selected_result_q16(selected_result_q16),
        .soft_reset_pulse_reg_0(bridge_i_n_3),
        .start_accepted(start_accepted),
        .start_accepted_sticky(start_accepted_sticky),
        .start_accepted_sticky_reg(bridge_i_n_0),
        .start_pulse_reg_0(start_command_pulse),
        .start_rejected_not_ready(start_rejected_not_ready),
        .start_rejected_sticky_reg(bridge_i_n_2),
        .\status_word_d_reg[3]_0 (start_rejected_sticky_reg_n_0),
        .template_active_bank(template_active_bank),
        .template_coeff_valid(template_coeff_valid),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_pulse(template_commit_pulse),
        .template_commit_rejected(template_commit_rejected),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .template_shadow_wr_en(template_shadow_wr_en));
  FDRE done_sticky_reg
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(1'b1),
        .Q(done_sticky),
        .R(bridge_i_n_3));
  (* K = "256" *) 
  (* KEEP_HIERARCHY = "SOFT" *) 
  (* K_ADDR_W = "8" *) 
  (* L = "640" *) 
  (* LAG_MIN = "0" *) 
  (* L_ADDR_W = "10" *) 
  (* M = "32" *) 
  (* N = "1024" *) 
  (* N_ADDR_W = "10" *) 
  (* PAIRS = "512" *) 
  (* PAIR_W = "9" *) 
  system_echo_pipeline_0_0_pulse_pair_echo_pipeline pipeline_i
       (.acq_busy(acq_busy_acq),
        .adc_ready_acq(adc_ready_acq),
        .average_debug_rd_addr(average_select_addr),
        .average_debug_rd_data_q2(selected_average_q2),
        .average_frame_available_proc(average_frame_available_proc),
        .average_overflow_count(average_overflow_count),
        .baseline_active_bank(baseline_active_bank),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_commit_rejected(baseline_commit_rejected),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .busy(transaction_busy),
        .clear_error_proc(clear_status_pulse),
        .clip_flag_snapshot(clip_flag_snapshot),
        .clk_acq(clk_acq),
        .clk_proc(s_axi_aclk),
        .correlation_overflow_count(correlation_overflow_count),
        .done_pulse(done_pulse),
        .frame_error_sticky_proc(frame_error_sticky_proc),
        .frame_meta(frame_meta),
        .frames_seen_proc(frames_seen_proc),
        .pair_valid(pair_valid),
        .pulse_ready_acq(pulse_ready_acq),
        .pulse_start_acq(pulse_start_acq),
        .result_count(result_count),
        .result_rd_addr(result_select_addr),
        .result_rd_data_q16(selected_result_q16),
        .result_rd_en(1'b1),
        .rst_acq(rst_acq),
        .rst_proc(bridge_i_n_6),
        .sample_clip(sample_clip),
        .sample_fall_u14(sample_fall_u14),
        .sample_rise_u14(sample_rise_u14),
        .start_accepted(start_accepted),
        .start_pulse(start_command_pulse),
        .start_rejected_not_ready(start_rejected_not_ready),
        .template_active_bank(template_active_bank),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_pulse(template_commit_pulse),
        .template_commit_rejected(template_commit_rejected),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .template_shadow_wr_en(template_shadow_wr_en),
        .tx_marker(tx_marker));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \pulse_ready_proc_sync_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pulse_ready_acq),
        .Q(pulse_ready_proc_sync[0]),
        .R(bridge_i_n_6));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \pulse_ready_proc_sync_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(pulse_ready_proc_sync[0]),
        .Q(pulse_ready_proc_sync[1]),
        .R(bridge_i_n_6));
  FDRE start_accepted_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bridge_i_n_0),
        .Q(start_accepted_sticky),
        .R(1'b0));
  FDRE start_rejected_sticky_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bridge_i_n_2),
        .Q(start_rejected_sticky_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    template_coeff_valid_i_1
       (.I0(template_commit_accepted),
        .I1(template_coeff_valid),
        .O(template_coeff_valid_i_1_n_0));
  FDRE template_coeff_valid_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(template_coeff_valid_i_1_n_0),
        .Q(template_coeff_valid),
        .R(bridge_i_n_6));
  LUT1 #(
    .INIT(2'h1)) 
    \transaction_count[0]_i_2 
       (.I0(transaction_count_reg[0]),
        .O(\transaction_count[0]_i_2_n_0 ));
  FDRE \transaction_count_reg[0] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[0]_i_1_n_7 ),
        .Q(transaction_count_reg[0]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\transaction_count_reg[0]_i_1_n_0 ,\transaction_count_reg[0]_i_1_n_1 ,\transaction_count_reg[0]_i_1_n_2 ,\transaction_count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\transaction_count_reg[0]_i_1_n_4 ,\transaction_count_reg[0]_i_1_n_5 ,\transaction_count_reg[0]_i_1_n_6 ,\transaction_count_reg[0]_i_1_n_7 }),
        .S({transaction_count_reg[3:1],\transaction_count[0]_i_2_n_0 }));
  FDRE \transaction_count_reg[10] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[8]_i_1_n_5 ),
        .Q(transaction_count_reg[10]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[11] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[8]_i_1_n_4 ),
        .Q(transaction_count_reg[11]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[12] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[12]_i_1_n_7 ),
        .Q(transaction_count_reg[12]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[12]_i_1 
       (.CI(\transaction_count_reg[8]_i_1_n_0 ),
        .CO({\transaction_count_reg[12]_i_1_n_0 ,\transaction_count_reg[12]_i_1_n_1 ,\transaction_count_reg[12]_i_1_n_2 ,\transaction_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[12]_i_1_n_4 ,\transaction_count_reg[12]_i_1_n_5 ,\transaction_count_reg[12]_i_1_n_6 ,\transaction_count_reg[12]_i_1_n_7 }),
        .S(transaction_count_reg[15:12]));
  FDRE \transaction_count_reg[13] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[12]_i_1_n_6 ),
        .Q(transaction_count_reg[13]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[14] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[12]_i_1_n_5 ),
        .Q(transaction_count_reg[14]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[15] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[12]_i_1_n_4 ),
        .Q(transaction_count_reg[15]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[16] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[16]_i_1_n_7 ),
        .Q(transaction_count_reg[16]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[16]_i_1 
       (.CI(\transaction_count_reg[12]_i_1_n_0 ),
        .CO({\transaction_count_reg[16]_i_1_n_0 ,\transaction_count_reg[16]_i_1_n_1 ,\transaction_count_reg[16]_i_1_n_2 ,\transaction_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[16]_i_1_n_4 ,\transaction_count_reg[16]_i_1_n_5 ,\transaction_count_reg[16]_i_1_n_6 ,\transaction_count_reg[16]_i_1_n_7 }),
        .S(transaction_count_reg[19:16]));
  FDRE \transaction_count_reg[17] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[16]_i_1_n_6 ),
        .Q(transaction_count_reg[17]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[18] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[16]_i_1_n_5 ),
        .Q(transaction_count_reg[18]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[19] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[16]_i_1_n_4 ),
        .Q(transaction_count_reg[19]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[1] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[0]_i_1_n_6 ),
        .Q(transaction_count_reg[1]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[20] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[20]_i_1_n_7 ),
        .Q(transaction_count_reg[20]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[20]_i_1 
       (.CI(\transaction_count_reg[16]_i_1_n_0 ),
        .CO({\transaction_count_reg[20]_i_1_n_0 ,\transaction_count_reg[20]_i_1_n_1 ,\transaction_count_reg[20]_i_1_n_2 ,\transaction_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[20]_i_1_n_4 ,\transaction_count_reg[20]_i_1_n_5 ,\transaction_count_reg[20]_i_1_n_6 ,\transaction_count_reg[20]_i_1_n_7 }),
        .S(transaction_count_reg[23:20]));
  FDRE \transaction_count_reg[21] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[20]_i_1_n_6 ),
        .Q(transaction_count_reg[21]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[22] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[20]_i_1_n_5 ),
        .Q(transaction_count_reg[22]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[23] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[20]_i_1_n_4 ),
        .Q(transaction_count_reg[23]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[24] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[24]_i_1_n_7 ),
        .Q(transaction_count_reg[24]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[24]_i_1 
       (.CI(\transaction_count_reg[20]_i_1_n_0 ),
        .CO({\transaction_count_reg[24]_i_1_n_0 ,\transaction_count_reg[24]_i_1_n_1 ,\transaction_count_reg[24]_i_1_n_2 ,\transaction_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[24]_i_1_n_4 ,\transaction_count_reg[24]_i_1_n_5 ,\transaction_count_reg[24]_i_1_n_6 ,\transaction_count_reg[24]_i_1_n_7 }),
        .S(transaction_count_reg[27:24]));
  FDRE \transaction_count_reg[25] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[24]_i_1_n_6 ),
        .Q(transaction_count_reg[25]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[26] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[24]_i_1_n_5 ),
        .Q(transaction_count_reg[26]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[27] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[24]_i_1_n_4 ),
        .Q(transaction_count_reg[27]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[28] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[28]_i_1_n_7 ),
        .Q(transaction_count_reg[28]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[28]_i_1 
       (.CI(\transaction_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_transaction_count_reg[28]_i_1_CO_UNCONNECTED [3],\transaction_count_reg[28]_i_1_n_1 ,\transaction_count_reg[28]_i_1_n_2 ,\transaction_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[28]_i_1_n_4 ,\transaction_count_reg[28]_i_1_n_5 ,\transaction_count_reg[28]_i_1_n_6 ,\transaction_count_reg[28]_i_1_n_7 }),
        .S(transaction_count_reg[31:28]));
  FDRE \transaction_count_reg[29] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[28]_i_1_n_6 ),
        .Q(transaction_count_reg[29]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[2] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[0]_i_1_n_5 ),
        .Q(transaction_count_reg[2]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[30] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[28]_i_1_n_5 ),
        .Q(transaction_count_reg[30]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[31] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[28]_i_1_n_4 ),
        .Q(transaction_count_reg[31]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[3] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[0]_i_1_n_4 ),
        .Q(transaction_count_reg[3]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[4] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[4]_i_1_n_7 ),
        .Q(transaction_count_reg[4]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[4]_i_1 
       (.CI(\transaction_count_reg[0]_i_1_n_0 ),
        .CO({\transaction_count_reg[4]_i_1_n_0 ,\transaction_count_reg[4]_i_1_n_1 ,\transaction_count_reg[4]_i_1_n_2 ,\transaction_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[4]_i_1_n_4 ,\transaction_count_reg[4]_i_1_n_5 ,\transaction_count_reg[4]_i_1_n_6 ,\transaction_count_reg[4]_i_1_n_7 }),
        .S(transaction_count_reg[7:4]));
  FDRE \transaction_count_reg[5] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[4]_i_1_n_6 ),
        .Q(transaction_count_reg[5]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[6] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[4]_i_1_n_5 ),
        .Q(transaction_count_reg[6]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[7] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[4]_i_1_n_4 ),
        .Q(transaction_count_reg[7]),
        .R(bridge_i_n_3));
  FDRE \transaction_count_reg[8] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[8]_i_1_n_7 ),
        .Q(transaction_count_reg[8]),
        .R(bridge_i_n_3));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \transaction_count_reg[8]_i_1 
       (.CI(\transaction_count_reg[4]_i_1_n_0 ),
        .CO({\transaction_count_reg[8]_i_1_n_0 ,\transaction_count_reg[8]_i_1_n_1 ,\transaction_count_reg[8]_i_1_n_2 ,\transaction_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\transaction_count_reg[8]_i_1_n_4 ,\transaction_count_reg[8]_i_1_n_5 ,\transaction_count_reg[8]_i_1_n_6 ,\transaction_count_reg[8]_i_1_n_7 }),
        .S(transaction_count_reg[11:8]));
  FDRE \transaction_count_reg[9] 
       (.C(s_axi_aclk),
        .CE(done_pulse),
        .D(\transaction_count_reg[8]_i_1_n_6 ),
        .Q(transaction_count_reg[9]),
        .R(bridge_i_n_3));
endmodule

(* ORIG_REF_NAME = "frame_average_bram" *) 
module system_echo_pipeline_0_0_frame_average_bram
   (fall_wr_en,
    Q,
    fall_clip,
    dst_pulse_reg,
    elapsed_cycles_reg_14_sp_1,
    frame_meta_11_sp_1,
    frame_meta_8_sp_1,
    \frames_seen_reg[5] ,
    frame_open_reg,
    frame_open_reg_0,
    frame_meta_1_sp_1,
    \frames_seen_reg[4] ,
    frame_meta_2_sp_1,
    frame_meta_6_sp_1,
    \frame_meta[1]_0 ,
    elapsed_cycles_reg_27_sp_1,
    elapsed_cycles_reg_8_sp_1,
    S,
    \frames_seen_reg[3] ,
    fall_wr_addr,
    fall_wr_data_q2,
    clk_acq,
    SR,
    start_pulse,
    busy_reg_0,
    rst_acq,
    frame_meta,
    \first_mode_reg[0] ,
    tx_marker,
    pair_valid,
    mem_reg,
    mem_reg_0,
    mem_reg_i_6,
    mem_reg_i_6_0,
    mem_reg_i_6_1,
    rise_done,
    elapsed_cycles_reg,
    sample_fall_u14,
    mem_reg_i_24,
    mem_reg_i_14,
    \average_overflow_count_reg[31] ,
    sample_clip);
  output fall_wr_en;
  output [30:0]Q;
  output fall_clip;
  output dst_pulse_reg;
  output elapsed_cycles_reg_14_sp_1;
  output frame_meta_11_sp_1;
  output frame_meta_8_sp_1;
  output \frames_seen_reg[5] ;
  output frame_open_reg;
  output frame_open_reg_0;
  output frame_meta_1_sp_1;
  output \frames_seen_reg[4] ;
  output frame_meta_2_sp_1;
  output frame_meta_6_sp_1;
  output \frame_meta[1]_0 ;
  output elapsed_cycles_reg_27_sp_1;
  output elapsed_cycles_reg_8_sp_1;
  output [0:0]S;
  output \frames_seen_reg[3] ;
  output [8:0]fall_wr_addr;
  output [15:0]fall_wr_data_q2;
  input clk_acq;
  input [0:0]SR;
  input start_pulse;
  input busy_reg_0;
  input rst_acq;
  input [30:0]frame_meta;
  input [5:0]\first_mode_reg[0] ;
  input tx_marker;
  input pair_valid;
  input mem_reg;
  input mem_reg_0;
  input mem_reg_i_6;
  input mem_reg_i_6_0;
  input mem_reg_i_6_1;
  input rise_done;
  input [27:0]elapsed_cycles_reg;
  input [13:0]sample_fall_u14;
  input [15:0]mem_reg_i_24;
  input [8:0]mem_reg_i_14;
  input [0:0]\average_overflow_count_reg[31] ;
  input sample_clip;

  wire [30:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire [20:0]acc_rd_data;
  wire acc_rd_en;
  wire [8:0]acc_wr_addr;
  wire [21:0]acc_wr_data;
  wire acc_wr_en;
  wire accum_ram_n_31;
  wire accum_ram_n_32;
  wire accum_ram_n_33;
  wire accum_ram_n_34;
  wire accum_ram_n_35;
  wire accum_ram_n_36;
  wire accum_ram_n_37;
  wire accum_ram_n_38;
  wire [0:0]\average_overflow_count_reg[31] ;
  wire \avg_wr_data_q2[3]_i_2__0_n_0 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_0 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_1 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_2 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_3 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_4 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_5 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_6 ;
  wire \avg_wr_data_q2_reg[11]_i_1__0_n_7 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_1 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_2 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_3 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_4 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_5 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_6 ;
  wire \avg_wr_data_q2_reg[15]_i_1__0_n_7 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_0 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_1 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_2 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_3 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_4 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_5 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_6 ;
  wire \avg_wr_data_q2_reg[3]_i_1__0_n_7 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_0 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_1 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_2 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_3 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_4 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_5 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_6 ;
  wire \avg_wr_data_q2_reg[7]_i_1__0_n_7 ;
  wire avg_wr_en_i_1__0_n_0;
  wire busy0;
  wire busy19_out;
  wire busy_i_10_n_0;
  wire busy_i_1__1_n_0;
  wire busy_i_3_n_0;
  wire busy_i_5_n_0;
  wire busy_i_8_n_0;
  wire busy_i_9_n_0;
  wire busy_reg_0;
  wire busy_reg_n_0;
  wire clip_flag_snapshot_i_1__0_n_0;
  wire clip_flag_work;
  wire clip_flag_work0;
  wire clip_flag_work_i_2__0_n_0;
  wire clip_flag_work_i_3__0_n_0;
  wire clip_flag_work_i_4__0_n_0;
  wire clip_flag_work_i_5__0_n_0;
  wire clip_flag_work_i_6__0_n_0;
  wire clip_flag_work_i_7__0_n_0;
  wire clk_acq;
  wire dst_pulse_reg;
  wire [27:0]elapsed_cycles_reg;
  wire elapsed_cycles_reg_14_sn_1;
  wire elapsed_cycles_reg_27_sn_1;
  wire elapsed_cycles_reg_8_sn_1;
  wire fall_clip;
  wire fall_done;
  wire [8:0]fall_wr_addr;
  wire [15:0]fall_wr_data_q2;
  wire fall_wr_en;
  wire finish_pending_i_1__0_n_0;
  wire finish_pending_i_2__0_n_0;
  wire finish_pending_i_3__0_n_0;
  wire finish_pending_i_4__0_n_0;
  wire finish_pending_reg_n_0;
  wire [5:0]\first_mode_reg[0] ;
  wire [30:0]frame_meta;
  wire \frame_meta[1]_0 ;
  wire frame_meta_11_sn_1;
  wire frame_meta_1_sn_1;
  wire frame_meta_2_sn_1;
  wire frame_meta_6_sn_1;
  wire frame_meta_8_sn_1;
  wire frame_open_reg;
  wire frame_open_reg_0;
  wire \frames_seen_reg[3] ;
  wire \frames_seen_reg[4] ;
  wire \frames_seen_reg[5] ;
  wire group_done_pulse_i_2_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire \input_addr[5]_i_1__0_n_0 ;
  wire \input_addr[8]_i_1__0_n_0 ;
  wire \input_addr[8]_i_3__0_n_0 ;
  wire \input_addr_reg_n_0_[0] ;
  wire \input_addr_reg_n_0_[1] ;
  wire \input_addr_reg_n_0_[2] ;
  wire \input_addr_reg_n_0_[3] ;
  wire \input_addr_reg_n_0_[4] ;
  wire \input_addr_reg_n_0_[5] ;
  wire \input_addr_reg_n_0_[6] ;
  wire \input_addr_reg_n_0_[7] ;
  wire \input_addr_reg_n_0_[8] ;
  wire input_complete_i_1_n_0;
  wire input_complete_reg_n_0;
  wire \input_frame[0]_i_1__0_n_0 ;
  wire \input_frame[1]_i_1__0_n_0 ;
  wire \input_frame[2]_i_1__0_n_0 ;
  wire \input_frame[3]_i_1__0_n_0 ;
  wire \input_frame[3]_i_2__0_n_0 ;
  wire \input_frame[4]_i_1__0_n_0 ;
  wire \input_frame[4]_i_2__0_n_0 ;
  wire \input_frame[4]_i_3__0_n_0 ;
  wire \input_frame[4]_i_4__0_n_0 ;
  wire \input_frame[4]_i_5__0_n_0 ;
  wire \input_frame_reg_n_0_[0] ;
  wire \input_frame_reg_n_0_[1] ;
  wire \input_frame_reg_n_0_[2] ;
  wire \input_frame_reg_n_0_[3] ;
  wire \input_frame_reg_n_0_[4] ;
  wire mem_reg;
  wire mem_reg_0;
  wire [8:0]mem_reg_i_14;
  wire [15:0]mem_reg_i_24;
  wire mem_reg_i_6;
  wire mem_reg_i_6_0;
  wire mem_reg_i_6_1;
  wire overflow_count0_carry__0_n_0;
  wire overflow_count0_carry__0_n_1;
  wire overflow_count0_carry__0_n_2;
  wire overflow_count0_carry__0_n_3;
  wire overflow_count0_carry__0_n_4;
  wire overflow_count0_carry__0_n_5;
  wire overflow_count0_carry__0_n_6;
  wire overflow_count0_carry__0_n_7;
  wire overflow_count0_carry__1_n_0;
  wire overflow_count0_carry__1_n_1;
  wire overflow_count0_carry__1_n_2;
  wire overflow_count0_carry__1_n_3;
  wire overflow_count0_carry__1_n_4;
  wire overflow_count0_carry__1_n_5;
  wire overflow_count0_carry__1_n_6;
  wire overflow_count0_carry__1_n_7;
  wire overflow_count0_carry__2_n_0;
  wire overflow_count0_carry__2_n_1;
  wire overflow_count0_carry__2_n_2;
  wire overflow_count0_carry__2_n_3;
  wire overflow_count0_carry__2_n_4;
  wire overflow_count0_carry__2_n_5;
  wire overflow_count0_carry__2_n_6;
  wire overflow_count0_carry__2_n_7;
  wire overflow_count0_carry__3_n_0;
  wire overflow_count0_carry__3_n_1;
  wire overflow_count0_carry__3_n_2;
  wire overflow_count0_carry__3_n_3;
  wire overflow_count0_carry__3_n_4;
  wire overflow_count0_carry__3_n_5;
  wire overflow_count0_carry__3_n_6;
  wire overflow_count0_carry__3_n_7;
  wire overflow_count0_carry__4_n_0;
  wire overflow_count0_carry__4_n_1;
  wire overflow_count0_carry__4_n_2;
  wire overflow_count0_carry__4_n_3;
  wire overflow_count0_carry__4_n_4;
  wire overflow_count0_carry__4_n_5;
  wire overflow_count0_carry__4_n_6;
  wire overflow_count0_carry__4_n_7;
  wire overflow_count0_carry__5_n_0;
  wire overflow_count0_carry__5_n_1;
  wire overflow_count0_carry__5_n_2;
  wire overflow_count0_carry__5_n_3;
  wire overflow_count0_carry__5_n_4;
  wire overflow_count0_carry__5_n_5;
  wire overflow_count0_carry__5_n_6;
  wire overflow_count0_carry__5_n_7;
  wire overflow_count0_carry__6_n_2;
  wire overflow_count0_carry__6_n_3;
  wire overflow_count0_carry__6_n_5;
  wire overflow_count0_carry__6_n_6;
  wire overflow_count0_carry__6_n_7;
  wire overflow_count0_carry_n_0;
  wire overflow_count0_carry_n_1;
  wire overflow_count0_carry_n_2;
  wire overflow_count0_carry_n_3;
  wire overflow_count0_carry_n_4;
  wire overflow_count0_carry_n_5;
  wire overflow_count0_carry_n_6;
  wire overflow_count0_carry_n_7;
  wire \overflow_count[0]_i_1__0_n_0 ;
  wire \overflow_count[10]_i_1__0_n_0 ;
  wire \overflow_count[11]_i_1__0_n_0 ;
  wire \overflow_count[12]_i_1__0_n_0 ;
  wire \overflow_count[13]_i_1__0_n_0 ;
  wire \overflow_count[14]_i_1__0_n_0 ;
  wire \overflow_count[15]_i_1__0_n_0 ;
  wire \overflow_count[16]_i_1__0_n_0 ;
  wire \overflow_count[17]_i_1__0_n_0 ;
  wire \overflow_count[18]_i_1__0_n_0 ;
  wire \overflow_count[19]_i_1__0_n_0 ;
  wire \overflow_count[1]_i_1__0_n_0 ;
  wire \overflow_count[20]_i_1__0_n_0 ;
  wire \overflow_count[21]_i_1__0_n_0 ;
  wire \overflow_count[22]_i_1__0_n_0 ;
  wire \overflow_count[23]_i_1__0_n_0 ;
  wire \overflow_count[24]_i_1__0_n_0 ;
  wire \overflow_count[25]_i_1__0_n_0 ;
  wire \overflow_count[26]_i_1__0_n_0 ;
  wire \overflow_count[27]_i_1__0_n_0 ;
  wire \overflow_count[28]_i_1__0_n_0 ;
  wire \overflow_count[29]_i_1__0_n_0 ;
  wire \overflow_count[2]_i_1__0_n_0 ;
  wire \overflow_count[30]_i_1__0_n_0 ;
  wire \overflow_count[31]_i_1__0_n_0 ;
  wire \overflow_count[31]_i_2__0_n_0 ;
  wire \overflow_count[3]_i_1__0_n_0 ;
  wire \overflow_count[4]_i_1__0_n_0 ;
  wire \overflow_count[5]_i_1__0_n_0 ;
  wire \overflow_count[6]_i_1__0_n_0 ;
  wire \overflow_count[7]_i_1__0_n_0 ;
  wire \overflow_count[8]_i_1__0_n_0 ;
  wire \overflow_count[9]_i_1__0_n_0 ;
  wire \overflow_count_reg_n_0_[31] ;
  wire [15:1]p_0_in8_in__0;
  wire [8:0]p_1_in;
  wire pair_valid;
  wire \pipe_addr_reg_n_0_[0] ;
  wire \pipe_addr_reg_n_0_[1] ;
  wire \pipe_addr_reg_n_0_[2] ;
  wire \pipe_addr_reg_n_0_[3] ;
  wire \pipe_addr_reg_n_0_[4] ;
  wire \pipe_addr_reg_n_0_[5] ;
  wire \pipe_addr_reg_n_0_[6] ;
  wire \pipe_addr_reg_n_0_[7] ;
  wire \pipe_addr_reg_n_0_[8] ;
  wire [4:0]pipe_frame;
  wire \pipe_sample_s14[13]_i_1__0_n_0 ;
  wire \pipe_sample_s14_reg_n_0_[0] ;
  wire \pipe_sample_s14_reg_n_0_[10] ;
  wire \pipe_sample_s14_reg_n_0_[11] ;
  wire \pipe_sample_s14_reg_n_0_[12] ;
  wire \pipe_sample_s14_reg_n_0_[13] ;
  wire \pipe_sample_s14_reg_n_0_[1] ;
  wire \pipe_sample_s14_reg_n_0_[2] ;
  wire \pipe_sample_s14_reg_n_0_[3] ;
  wire \pipe_sample_s14_reg_n_0_[4] ;
  wire \pipe_sample_s14_reg_n_0_[5] ;
  wire \pipe_sample_s14_reg_n_0_[6] ;
  wire \pipe_sample_s14_reg_n_0_[7] ;
  wire \pipe_sample_s14_reg_n_0_[8] ;
  wire \pipe_sample_s14_reg_n_0_[9] ;
  wire pipe_valid;
  wire \raw_sum_addr_reg_n_0_[0] ;
  wire \raw_sum_addr_reg_n_0_[1] ;
  wire \raw_sum_addr_reg_n_0_[2] ;
  wire \raw_sum_addr_reg_n_0_[3] ;
  wire \raw_sum_addr_reg_n_0_[4] ;
  wire \raw_sum_addr_reg_n_0_[5] ;
  wire \raw_sum_addr_reg_n_0_[6] ;
  wire \raw_sum_addr_reg_n_0_[7] ;
  wire \raw_sum_addr_reg_n_0_[8] ;
  wire \raw_sum_ext[11]_i_2_n_0 ;
  wire \raw_sum_ext[11]_i_3_n_0 ;
  wire \raw_sum_ext[11]_i_4_n_0 ;
  wire \raw_sum_ext[11]_i_5_n_0 ;
  wire \raw_sum_ext[15]_i_2_n_0 ;
  wire \raw_sum_ext[15]_i_5_n_0 ;
  wire \raw_sum_ext[15]_i_6_n_0 ;
  wire \raw_sum_ext[3]_i_2_n_0 ;
  wire \raw_sum_ext[3]_i_3_n_0 ;
  wire \raw_sum_ext[3]_i_4_n_0 ;
  wire \raw_sum_ext[3]_i_5_n_0 ;
  wire \raw_sum_ext[7]_i_2_n_0 ;
  wire \raw_sum_ext[7]_i_3_n_0 ;
  wire \raw_sum_ext[7]_i_4_n_0 ;
  wire \raw_sum_ext[7]_i_5_n_0 ;
  wire \raw_sum_ext_reg[11]_i_1_n_0 ;
  wire \raw_sum_ext_reg[11]_i_1_n_1 ;
  wire \raw_sum_ext_reg[11]_i_1_n_2 ;
  wire \raw_sum_ext_reg[11]_i_1_n_3 ;
  wire \raw_sum_ext_reg[11]_i_1_n_4 ;
  wire \raw_sum_ext_reg[11]_i_1_n_5 ;
  wire \raw_sum_ext_reg[11]_i_1_n_6 ;
  wire \raw_sum_ext_reg[11]_i_1_n_7 ;
  wire \raw_sum_ext_reg[15]_i_1_n_0 ;
  wire \raw_sum_ext_reg[15]_i_1_n_1 ;
  wire \raw_sum_ext_reg[15]_i_1_n_2 ;
  wire \raw_sum_ext_reg[15]_i_1_n_3 ;
  wire \raw_sum_ext_reg[15]_i_1_n_4 ;
  wire \raw_sum_ext_reg[15]_i_1_n_5 ;
  wire \raw_sum_ext_reg[15]_i_1_n_6 ;
  wire \raw_sum_ext_reg[15]_i_1_n_7 ;
  wire \raw_sum_ext_reg[19]_i_1_n_0 ;
  wire \raw_sum_ext_reg[19]_i_1_n_1 ;
  wire \raw_sum_ext_reg[19]_i_1_n_2 ;
  wire \raw_sum_ext_reg[19]_i_1_n_3 ;
  wire \raw_sum_ext_reg[19]_i_1_n_4 ;
  wire \raw_sum_ext_reg[19]_i_1_n_5 ;
  wire \raw_sum_ext_reg[19]_i_1_n_6 ;
  wire \raw_sum_ext_reg[19]_i_1_n_7 ;
  wire \raw_sum_ext_reg[22]_i_1_n_2 ;
  wire \raw_sum_ext_reg[22]_i_1_n_3 ;
  wire \raw_sum_ext_reg[22]_i_1_n_5 ;
  wire \raw_sum_ext_reg[22]_i_1_n_6 ;
  wire \raw_sum_ext_reg[22]_i_1_n_7 ;
  wire \raw_sum_ext_reg[3]_i_1_n_0 ;
  wire \raw_sum_ext_reg[3]_i_1_n_1 ;
  wire \raw_sum_ext_reg[3]_i_1_n_2 ;
  wire \raw_sum_ext_reg[3]_i_1_n_3 ;
  wire \raw_sum_ext_reg[3]_i_1_n_4 ;
  wire \raw_sum_ext_reg[3]_i_1_n_5 ;
  wire \raw_sum_ext_reg[3]_i_1_n_6 ;
  wire \raw_sum_ext_reg[3]_i_1_n_7 ;
  wire \raw_sum_ext_reg[7]_i_1_n_0 ;
  wire \raw_sum_ext_reg[7]_i_1_n_1 ;
  wire \raw_sum_ext_reg[7]_i_1_n_2 ;
  wire \raw_sum_ext_reg[7]_i_1_n_3 ;
  wire \raw_sum_ext_reg[7]_i_1_n_4 ;
  wire \raw_sum_ext_reg[7]_i_1_n_5 ;
  wire \raw_sum_ext_reg[7]_i_1_n_6 ;
  wire \raw_sum_ext_reg[7]_i_1_n_7 ;
  wire \raw_sum_ext_reg_n_0_[0] ;
  wire \raw_sum_ext_reg_n_0_[10] ;
  wire \raw_sum_ext_reg_n_0_[11] ;
  wire \raw_sum_ext_reg_n_0_[12] ;
  wire \raw_sum_ext_reg_n_0_[13] ;
  wire \raw_sum_ext_reg_n_0_[14] ;
  wire \raw_sum_ext_reg_n_0_[15] ;
  wire \raw_sum_ext_reg_n_0_[16] ;
  wire \raw_sum_ext_reg_n_0_[17] ;
  wire \raw_sum_ext_reg_n_0_[18] ;
  wire \raw_sum_ext_reg_n_0_[19] ;
  wire \raw_sum_ext_reg_n_0_[1] ;
  wire \raw_sum_ext_reg_n_0_[20] ;
  wire \raw_sum_ext_reg_n_0_[21] ;
  wire \raw_sum_ext_reg_n_0_[22] ;
  wire \raw_sum_ext_reg_n_0_[2] ;
  wire \raw_sum_ext_reg_n_0_[3] ;
  wire \raw_sum_ext_reg_n_0_[4] ;
  wire \raw_sum_ext_reg_n_0_[5] ;
  wire \raw_sum_ext_reg_n_0_[6] ;
  wire \raw_sum_ext_reg_n_0_[7] ;
  wire \raw_sum_ext_reg_n_0_[8] ;
  wire \raw_sum_ext_reg_n_0_[9] ;
  wire \raw_sum_frame_reg_n_0_[0] ;
  wire \raw_sum_frame_reg_n_0_[1] ;
  wire \raw_sum_frame_reg_n_0_[2] ;
  wire \raw_sum_frame_reg_n_0_[3] ;
  wire \raw_sum_frame_reg_n_0_[4] ;
  wire raw_sum_valid;
  wire \read_addr_reg_n_0_[0] ;
  wire \read_addr_reg_n_0_[1] ;
  wire \read_addr_reg_n_0_[2] ;
  wire \read_addr_reg_n_0_[3] ;
  wire \read_addr_reg_n_0_[4] ;
  wire \read_addr_reg_n_0_[5] ;
  wire \read_addr_reg_n_0_[6] ;
  wire \read_addr_reg_n_0_[7] ;
  wire \read_addr_reg_n_0_[8] ;
  wire \read_frame_reg_n_0_[0] ;
  wire \read_frame_reg_n_0_[1] ;
  wire \read_frame_reg_n_0_[2] ;
  wire \read_frame_reg_n_0_[3] ;
  wire \read_frame_reg_n_0_[4] ;
  wire \read_sample_s14_reg_n_0_[0] ;
  wire \read_sample_s14_reg_n_0_[10] ;
  wire \read_sample_s14_reg_n_0_[11] ;
  wire \read_sample_s14_reg_n_0_[12] ;
  wire \read_sample_s14_reg_n_0_[13] ;
  wire \read_sample_s14_reg_n_0_[1] ;
  wire \read_sample_s14_reg_n_0_[2] ;
  wire \read_sample_s14_reg_n_0_[3] ;
  wire \read_sample_s14_reg_n_0_[4] ;
  wire \read_sample_s14_reg_n_0_[5] ;
  wire \read_sample_s14_reg_n_0_[6] ;
  wire \read_sample_s14_reg_n_0_[7] ;
  wire \read_sample_s14_reg_n_0_[8] ;
  wire \read_sample_s14_reg_n_0_[9] ;
  wire read_valid_reg_n_0;
  wire rise_done;
  wire rst_acq;
  wire sample_clip;
  wire [13:0]sample_fall_u14;
  wire start_pulse;
  wire [8:0]sum_addr;
  wire [3:0]sum_data_s22;
  wire \sum_data_s22[0]_i_1__0_n_0 ;
  wire \sum_data_s22[10]_i_1__0_n_0 ;
  wire \sum_data_s22[11]_i_1__0_n_0 ;
  wire \sum_data_s22[12]_i_1__0_n_0 ;
  wire \sum_data_s22[13]_i_1__0_n_0 ;
  wire \sum_data_s22[14]_i_1__0_n_0 ;
  wire \sum_data_s22[15]_i_1__0_n_0 ;
  wire \sum_data_s22[16]_i_1__0_n_0 ;
  wire \sum_data_s22[17]_i_1__0_n_0 ;
  wire \sum_data_s22[18]_i_1__0_n_0 ;
  wire \sum_data_s22[19]_i_1__0_n_0 ;
  wire \sum_data_s22[1]_i_1__0_n_0 ;
  wire \sum_data_s22[20]_i_1__0_n_0 ;
  wire \sum_data_s22[21]_i_1_n_0 ;
  wire \sum_data_s22[21]_i_2__0_n_0 ;
  wire \sum_data_s22[21]_i_3__0_n_0 ;
  wire \sum_data_s22[2]_i_1__0_n_0 ;
  wire \sum_data_s22[3]_i_1__0_n_0 ;
  wire \sum_data_s22[4]_i_1__0_n_0 ;
  wire \sum_data_s22[5]_i_1__0_n_0 ;
  wire \sum_data_s22[6]_i_1__0_n_0 ;
  wire \sum_data_s22[7]_i_1__0_n_0 ;
  wire \sum_data_s22[8]_i_1__0_n_0 ;
  wire \sum_data_s22[9]_i_1__0_n_0 ;
  wire \sum_data_s22_reg_n_0_[19] ;
  wire \sum_data_s22_reg_n_0_[20] ;
  wire \sum_data_s22_reg_n_0_[21] ;
  wire [4:0]sum_frame;
  wire sum_overflow_reg_i_1_n_0;
  wire sum_overflow_reg_reg_n_0;
  wire sum_s221;
  wire sum_s221_carry_i_1__0_n_0;
  wire sum_s221_carry_i_2__0_n_0;
  wire sum_s221_carry_n_3;
  wire \sum_s221_inferred__0/i__carry_n_2 ;
  wire \sum_s221_inferred__0/i__carry_n_3 ;
  wire sum_valid;
  wire tx_marker;
  wire [3:3]\NLW_avg_wr_data_q2_reg[15]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]NLW_overflow_count0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_overflow_count0_carry__6_O_UNCONNECTED;
  wire [3:2]\NLW_raw_sum_ext_reg[22]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_raw_sum_ext_reg[22]_i_1_O_UNCONNECTED ;
  wire [3:2]NLW_sum_s221_carry_CO_UNCONNECTED;
  wire [3:0]NLW_sum_s221_carry_O_UNCONNECTED;
  wire [3:2]\NLW_sum_s221_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_s221_inferred__0/i__carry_O_UNCONNECTED ;

  assign elapsed_cycles_reg_14_sp_1 = elapsed_cycles_reg_14_sn_1;
  assign elapsed_cycles_reg_27_sp_1 = elapsed_cycles_reg_27_sn_1;
  assign elapsed_cycles_reg_8_sp_1 = elapsed_cycles_reg_8_sn_1;
  assign frame_meta_11_sp_1 = frame_meta_11_sn_1;
  assign frame_meta_1_sp_1 = frame_meta_1_sn_1;
  assign frame_meta_2_sp_1 = frame_meta_2_sn_1;
  assign frame_meta_6_sp_1 = frame_meta_6_sn_1;
  assign frame_meta_8_sp_1 = frame_meta_8_sn_1;
  FDRE \acc_wr_addr_reg[0] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[0]),
        .Q(acc_wr_addr[0]),
        .R(SR));
  FDRE \acc_wr_addr_reg[1] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[1]),
        .Q(acc_wr_addr[1]),
        .R(SR));
  FDRE \acc_wr_addr_reg[2] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[2]),
        .Q(acc_wr_addr[2]),
        .R(SR));
  FDRE \acc_wr_addr_reg[3] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[3]),
        .Q(acc_wr_addr[3]),
        .R(SR));
  FDRE \acc_wr_addr_reg[4] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[4]),
        .Q(acc_wr_addr[4]),
        .R(SR));
  FDRE \acc_wr_addr_reg[5] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[5]),
        .Q(acc_wr_addr[5]),
        .R(SR));
  FDRE \acc_wr_addr_reg[6] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[6]),
        .Q(acc_wr_addr[6]),
        .R(SR));
  FDRE \acc_wr_addr_reg[7] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[7]),
        .Q(acc_wr_addr[7]),
        .R(SR));
  FDRE \acc_wr_addr_reg[8] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[8]),
        .Q(acc_wr_addr[8]),
        .R(SR));
  FDRE \acc_wr_data_reg[0] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[0]),
        .Q(acc_wr_data[0]),
        .R(SR));
  FDRE \acc_wr_data_reg[10] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[7]),
        .Q(acc_wr_data[10]),
        .R(SR));
  FDRE \acc_wr_data_reg[11] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[8]),
        .Q(acc_wr_data[11]),
        .R(SR));
  FDRE \acc_wr_data_reg[12] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[9]),
        .Q(acc_wr_data[12]),
        .R(SR));
  FDRE \acc_wr_data_reg[13] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[10]),
        .Q(acc_wr_data[13]),
        .R(SR));
  FDRE \acc_wr_data_reg[14] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[11]),
        .Q(acc_wr_data[14]),
        .R(SR));
  FDRE \acc_wr_data_reg[15] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[12]),
        .Q(acc_wr_data[15]),
        .R(SR));
  FDRE \acc_wr_data_reg[16] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[13]),
        .Q(acc_wr_data[16]),
        .R(SR));
  FDRE \acc_wr_data_reg[17] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[14]),
        .Q(acc_wr_data[17]),
        .R(SR));
  FDRE \acc_wr_data_reg[18] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[15]),
        .Q(acc_wr_data[18]),
        .R(SR));
  FDRE \acc_wr_data_reg[19] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[19] ),
        .Q(acc_wr_data[19]),
        .R(SR));
  FDRE \acc_wr_data_reg[1] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[1]),
        .Q(acc_wr_data[1]),
        .R(SR));
  FDRE \acc_wr_data_reg[20] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[20] ),
        .Q(acc_wr_data[20]),
        .R(SR));
  FDRE \acc_wr_data_reg[21] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[21] ),
        .Q(acc_wr_data[21]),
        .R(SR));
  FDRE \acc_wr_data_reg[2] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[2]),
        .Q(acc_wr_data[2]),
        .R(SR));
  FDRE \acc_wr_data_reg[3] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[3]),
        .Q(acc_wr_data[3]),
        .R(SR));
  FDRE \acc_wr_data_reg[4] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[1]),
        .Q(acc_wr_data[4]),
        .R(SR));
  FDRE \acc_wr_data_reg[5] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[2]),
        .Q(acc_wr_data[5]),
        .R(SR));
  FDRE \acc_wr_data_reg[6] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[3]),
        .Q(acc_wr_data[6]),
        .R(SR));
  FDRE \acc_wr_data_reg[7] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[4]),
        .Q(acc_wr_data[7]),
        .R(SR));
  FDRE \acc_wr_data_reg[8] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[5]),
        .Q(acc_wr_data[8]),
        .R(SR));
  FDRE \acc_wr_data_reg[9] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in__0[6]),
        .Q(acc_wr_data[9]),
        .R(SR));
  FDRE acc_wr_en_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(sum_valid),
        .Q(acc_wr_en),
        .R(SR));
  system_echo_pipeline_0_0_accum_tdp_bram_4 accum_ram
       (.E(pipe_valid),
        .Q({\input_addr_reg_n_0_[8] ,\input_addr_reg_n_0_[7] ,\input_addr_reg_n_0_[6] ,\input_addr_reg_n_0_[5] ,\input_addr_reg_n_0_[4] ,\input_addr_reg_n_0_[3] ,\input_addr_reg_n_0_[2] ,\input_addr_reg_n_0_[1] ,\input_addr_reg_n_0_[0] }),
        .S({accum_ram_n_31,accum_ram_n_32}),
        .WEBWE(acc_wr_en),
        .acc_rd_en(acc_rd_en),
        .clk_acq(clk_acq),
        .\first_mode_reg[0] (\first_mode_reg[0] ),
        .frame_meta(frame_meta),
        .\frame_meta[1]_0 (\frame_meta[1]_0 ),
        .frame_meta_1_sp_1(frame_meta_1_sn_1),
        .frame_meta_2_sp_1(frame_meta_2_sn_1),
        .frame_meta_6_sp_1(frame_meta_6_sn_1),
        .frame_meta_8_sp_1(frame_meta_8_sn_1),
        .frame_open_reg(frame_open_reg),
        .frame_open_reg_0(frame_open_reg_0),
        .\frames_seen_reg[4] (\frames_seen_reg[4] ),
        .\frames_seen_reg[5] (\frames_seen_reg[5] ),
        .mem_reg_0(acc_rd_data),
        .mem_reg_1({accum_ram_n_33,accum_ram_n_34,accum_ram_n_35,accum_ram_n_36}),
        .mem_reg_2({accum_ram_n_37,accum_ram_n_38}),
        .mem_reg_3(acc_wr_addr),
        .mem_reg_4(acc_wr_data),
        .mem_reg_5(mem_reg),
        .mem_reg_6(mem_reg_0),
        .mem_reg_7(input_complete_reg_n_0),
        .mem_reg_8(busy_reg_n_0),
        .mem_reg_9(pipe_frame),
        .mem_reg_i_14_0(mem_reg_i_14),
        .mem_reg_i_24_0(mem_reg_i_24),
        .mem_reg_i_4_0(busy_reg_0),
        .mem_reg_i_6_0(mem_reg_i_6),
        .mem_reg_i_6_1(mem_reg_i_6_0),
        .mem_reg_i_6_2(mem_reg_i_6_1),
        .pair_valid(pair_valid),
        .\raw_sum_ext_reg[15] (\read_sample_s14_reg_n_0_[13] ),
        .rst_acq(rst_acq),
        .start_pulse(start_pulse),
        .tx_marker(tx_marker));
  FDRE \avg_wr_addr_reg[0] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[0]),
        .Q(fall_wr_addr[0]),
        .R(SR));
  FDRE \avg_wr_addr_reg[1] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[1]),
        .Q(fall_wr_addr[1]),
        .R(SR));
  FDRE \avg_wr_addr_reg[2] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[2]),
        .Q(fall_wr_addr[2]),
        .R(SR));
  FDRE \avg_wr_addr_reg[3] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[3]),
        .Q(fall_wr_addr[3]),
        .R(SR));
  FDRE \avg_wr_addr_reg[4] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[4]),
        .Q(fall_wr_addr[4]),
        .R(SR));
  FDRE \avg_wr_addr_reg[5] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[5]),
        .Q(fall_wr_addr[5]),
        .R(SR));
  FDRE \avg_wr_addr_reg[6] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[6]),
        .Q(fall_wr_addr[6]),
        .R(SR));
  FDRE \avg_wr_addr_reg[7] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[7]),
        .Q(fall_wr_addr[7]),
        .R(SR));
  FDRE \avg_wr_addr_reg[8] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(sum_addr[8]),
        .Q(fall_wr_addr[8]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0FE0)) 
    \avg_wr_data_q2[3]_i_2__0 
       (.I0(sum_data_s22[1]),
        .I1(sum_data_s22[0]),
        .I2(sum_data_s22[2]),
        .I3(sum_data_s22[3]),
        .O(\avg_wr_data_q2[3]_i_2__0_n_0 ));
  FDRE \avg_wr_data_q2_reg[0] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[3]_i_1__0_n_7 ),
        .Q(fall_wr_data_q2[0]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[10] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[11]_i_1__0_n_5 ),
        .Q(fall_wr_data_q2[10]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[11] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[11]_i_1__0_n_4 ),
        .Q(fall_wr_data_q2[11]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[11]_i_1__0 
       (.CI(\avg_wr_data_q2_reg[7]_i_1__0_n_0 ),
        .CO({\avg_wr_data_q2_reg[11]_i_1__0_n_0 ,\avg_wr_data_q2_reg[11]_i_1__0_n_1 ,\avg_wr_data_q2_reg[11]_i_1__0_n_2 ,\avg_wr_data_q2_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\avg_wr_data_q2_reg[11]_i_1__0_n_4 ,\avg_wr_data_q2_reg[11]_i_1__0_n_5 ,\avg_wr_data_q2_reg[11]_i_1__0_n_6 ,\avg_wr_data_q2_reg[11]_i_1__0_n_7 }),
        .S(p_0_in8_in__0[11:8]));
  FDRE \avg_wr_data_q2_reg[12] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[15]_i_1__0_n_7 ),
        .Q(fall_wr_data_q2[12]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[13] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[15]_i_1__0_n_6 ),
        .Q(fall_wr_data_q2[13]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[14] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[15]_i_1__0_n_5 ),
        .Q(fall_wr_data_q2[14]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[15] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[15]_i_1__0_n_4 ),
        .Q(fall_wr_data_q2[15]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[15]_i_1__0 
       (.CI(\avg_wr_data_q2_reg[11]_i_1__0_n_0 ),
        .CO({\NLW_avg_wr_data_q2_reg[15]_i_1__0_CO_UNCONNECTED [3],\avg_wr_data_q2_reg[15]_i_1__0_n_1 ,\avg_wr_data_q2_reg[15]_i_1__0_n_2 ,\avg_wr_data_q2_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\avg_wr_data_q2_reg[15]_i_1__0_n_4 ,\avg_wr_data_q2_reg[15]_i_1__0_n_5 ,\avg_wr_data_q2_reg[15]_i_1__0_n_6 ,\avg_wr_data_q2_reg[15]_i_1__0_n_7 }),
        .S(p_0_in8_in__0[15:12]));
  FDRE \avg_wr_data_q2_reg[1] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[3]_i_1__0_n_6 ),
        .Q(fall_wr_data_q2[1]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[2] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[3]_i_1__0_n_5 ),
        .Q(fall_wr_data_q2[2]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[3] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[3]_i_1__0_n_4 ),
        .Q(fall_wr_data_q2[3]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[3]_i_1__0 
       (.CI(1'b0),
        .CO({\avg_wr_data_q2_reg[3]_i_1__0_n_0 ,\avg_wr_data_q2_reg[3]_i_1__0_n_1 ,\avg_wr_data_q2_reg[3]_i_1__0_n_2 ,\avg_wr_data_q2_reg[3]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sum_data_s22[3]}),
        .O({\avg_wr_data_q2_reg[3]_i_1__0_n_4 ,\avg_wr_data_q2_reg[3]_i_1__0_n_5 ,\avg_wr_data_q2_reg[3]_i_1__0_n_6 ,\avg_wr_data_q2_reg[3]_i_1__0_n_7 }),
        .S({p_0_in8_in__0[3:1],\avg_wr_data_q2[3]_i_2__0_n_0 }));
  FDRE \avg_wr_data_q2_reg[4] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[7]_i_1__0_n_7 ),
        .Q(fall_wr_data_q2[4]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[5] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[7]_i_1__0_n_6 ),
        .Q(fall_wr_data_q2[5]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[6] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[7]_i_1__0_n_5 ),
        .Q(fall_wr_data_q2[6]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[7] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[7]_i_1__0_n_4 ),
        .Q(fall_wr_data_q2[7]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[7]_i_1__0 
       (.CI(\avg_wr_data_q2_reg[3]_i_1__0_n_0 ),
        .CO({\avg_wr_data_q2_reg[7]_i_1__0_n_0 ,\avg_wr_data_q2_reg[7]_i_1__0_n_1 ,\avg_wr_data_q2_reg[7]_i_1__0_n_2 ,\avg_wr_data_q2_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\avg_wr_data_q2_reg[7]_i_1__0_n_4 ,\avg_wr_data_q2_reg[7]_i_1__0_n_5 ,\avg_wr_data_q2_reg[7]_i_1__0_n_6 ,\avg_wr_data_q2_reg[7]_i_1__0_n_7 }),
        .S(p_0_in8_in__0[7:4]));
  FDRE \avg_wr_data_q2_reg[8] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[11]_i_1__0_n_7 ),
        .Q(fall_wr_data_q2[8]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[9] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_1__0_n_0),
        .D(\avg_wr_data_q2_reg[11]_i_1__0_n_6 ),
        .Q(fall_wr_data_q2[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    avg_wr_en_i_1__0
       (.I0(sum_valid),
        .I1(sum_frame[2]),
        .I2(sum_frame[3]),
        .I3(sum_frame[4]),
        .I4(sum_frame[0]),
        .I5(sum_frame[1]),
        .O(avg_wr_en_i_1__0_n_0));
  FDRE avg_wr_en_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(avg_wr_en_i_1__0_n_0),
        .Q(fall_wr_en),
        .R(SR));
  LUT6 #(
    .INIT(64'h000000002222222E)) 
    busy_i_1
       (.I0(start_pulse),
        .I1(busy_reg_0),
        .I2(elapsed_cycles_reg_14_sn_1),
        .I3(busy_i_3_n_0),
        .I4(busy19_out),
        .I5(rst_acq),
        .O(dst_pulse_reg));
  LUT4 #(
    .INIT(16'hFFFE)) 
    busy_i_10
       (.I0(elapsed_cycles_reg[13]),
        .I1(elapsed_cycles_reg[19]),
        .I2(elapsed_cycles_reg[22]),
        .I3(elapsed_cycles_reg[25]),
        .O(busy_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00003130)) 
    busy_i_1__1
       (.I0(mem_reg),
        .I1(rst_acq),
        .I2(start_pulse),
        .I3(busy_reg_n_0),
        .I4(finish_pending_reg_n_0),
        .O(busy_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFD0000)) 
    busy_i_2
       (.I0(busy_i_5_n_0),
        .I1(elapsed_cycles_reg[10]),
        .I2(elapsed_cycles_reg[9]),
        .I3(elapsed_cycles_reg[11]),
        .I4(elapsed_cycles_reg[12]),
        .I5(elapsed_cycles_reg_27_sn_1),
        .O(elapsed_cycles_reg_14_sn_1));
  LUT6 #(
    .INIT(64'hAA28AA28AAAAAA28)) 
    busy_i_3
       (.I0(frame_meta_11_sn_1),
        .I1(frame_meta_8_sn_1),
        .I2(frame_meta[11]),
        .I3(\frames_seen_reg[5] ),
        .I4(frame_open_reg),
        .I5(frame_open_reg_0),
        .O(busy_i_3_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    busy_i_4
       (.I0(\first_mode_reg[0] [4]),
        .I1(\first_mode_reg[0] [2]),
        .I2(\first_mode_reg[0] [3]),
        .I3(group_done_pulse_i_2_n_0),
        .O(busy19_out));
  LUT5 #(
    .INIT(32'h5555555D)) 
    busy_i_5
       (.I0(elapsed_cycles_reg[8]),
        .I1(elapsed_cycles_reg_8_sn_1),
        .I2(elapsed_cycles_reg[7]),
        .I3(elapsed_cycles_reg[5]),
        .I4(elapsed_cycles_reg[6]),
        .O(busy_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    busy_i_6
       (.I0(busy_i_8_n_0),
        .I1(busy_i_9_n_0),
        .I2(busy_i_10_n_0),
        .I3(elapsed_cycles_reg[23]),
        .I4(elapsed_cycles_reg[21]),
        .I5(elapsed_cycles_reg[26]),
        .O(elapsed_cycles_reg_27_sn_1));
  LUT5 #(
    .INIT(32'h55557FFF)) 
    busy_i_7
       (.I0(elapsed_cycles_reg[4]),
        .I1(elapsed_cycles_reg[2]),
        .I2(elapsed_cycles_reg[0]),
        .I3(elapsed_cycles_reg[1]),
        .I4(elapsed_cycles_reg[3]),
        .O(elapsed_cycles_reg_8_sn_1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    busy_i_8
       (.I0(elapsed_cycles_reg[15]),
        .I1(elapsed_cycles_reg[16]),
        .I2(elapsed_cycles_reg[18]),
        .I3(elapsed_cycles_reg[27]),
        .O(busy_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    busy_i_9
       (.I0(elapsed_cycles_reg[14]),
        .I1(elapsed_cycles_reg[24]),
        .I2(elapsed_cycles_reg[17]),
        .I3(elapsed_cycles_reg[20]),
        .O(busy_i_9_n_0));
  FDRE busy_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(busy_i_1__1_n_0),
        .Q(busy_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hCFAA00AA)) 
    clip_flag_snapshot_i_1__0
       (.I0(clip_flag_work),
        .I1(busy_reg_n_0),
        .I2(start_pulse),
        .I3(finish_pending_i_2__0_n_0),
        .I4(fall_clip),
        .O(clip_flag_snapshot_i_1__0_n_0));
  FDRE clip_flag_snapshot_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(clip_flag_snapshot_i_1__0_n_0),
        .Q(fall_clip),
        .R(SR));
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_flag_work_i_1__0
       (.I0(clip_flag_work),
        .I1(sample_clip),
        .I2(clip_flag_work_i_2__0_n_0),
        .I3(clip_flag_work_i_3__0_n_0),
        .O(clip_flag_work0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    clip_flag_work_i_2__0
       (.I0(clip_flag_work_i_4__0_n_0),
        .I1(clip_flag_work_i_5__0_n_0),
        .I2(sample_fall_u14[1]),
        .I3(sample_fall_u14[0]),
        .I4(sample_fall_u14[3]),
        .I5(sample_fall_u14[2]),
        .O(clip_flag_work_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    clip_flag_work_i_3__0
       (.I0(clip_flag_work_i_6__0_n_0),
        .I1(clip_flag_work_i_7__0_n_0),
        .I2(sample_fall_u14[2]),
        .I3(sample_fall_u14[1]),
        .I4(sample_fall_u14[3]),
        .I5(sample_fall_u14[0]),
        .O(clip_flag_work_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    clip_flag_work_i_4__0
       (.I0(sample_fall_u14[10]),
        .I1(sample_fall_u14[9]),
        .I2(sample_fall_u14[8]),
        .I3(sample_fall_u14[11]),
        .I4(sample_fall_u14[13]),
        .I5(sample_fall_u14[12]),
        .O(clip_flag_work_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    clip_flag_work_i_5__0
       (.I0(sample_fall_u14[5]),
        .I1(sample_fall_u14[4]),
        .I2(sample_fall_u14[7]),
        .I3(sample_fall_u14[6]),
        .O(clip_flag_work_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clip_flag_work_i_6__0
       (.I0(sample_fall_u14[10]),
        .I1(sample_fall_u14[9]),
        .I2(sample_fall_u14[8]),
        .I3(sample_fall_u14[11]),
        .I4(sample_fall_u14[13]),
        .I5(sample_fall_u14[12]),
        .O(clip_flag_work_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_flag_work_i_7__0
       (.I0(sample_fall_u14[5]),
        .I1(sample_fall_u14[4]),
        .I2(sample_fall_u14[7]),
        .I3(sample_fall_u14[6]),
        .O(clip_flag_work_i_7__0_n_0));
  FDRE clip_flag_work_reg
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(clip_flag_work0),
        .Q(clip_flag_work),
        .R(\input_addr[8]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    finish_pending_i_1__0
       (.I0(finish_pending_reg_n_0),
        .I1(finish_pending_i_2__0_n_0),
        .O(finish_pending_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    finish_pending_i_2__0
       (.I0(finish_pending_i_3__0_n_0),
        .I1(finish_pending_i_4__0_n_0),
        .I2(sum_addr[7]),
        .I3(sum_valid),
        .I4(sum_addr[5]),
        .I5(sum_addr[1]),
        .O(finish_pending_i_2__0_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    finish_pending_i_3__0
       (.I0(sum_frame[1]),
        .I1(sum_frame[0]),
        .I2(sum_frame[4]),
        .I3(sum_frame[3]),
        .I4(sum_frame[2]),
        .O(finish_pending_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    finish_pending_i_4__0
       (.I0(sum_addr[8]),
        .I1(sum_addr[3]),
        .I2(sum_addr[2]),
        .I3(sum_addr[4]),
        .I4(sum_addr[0]),
        .I5(sum_addr[6]),
        .O(finish_pending_i_4__0_n_0));
  FDRE finish_pending_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(finish_pending_i_1__0_n_0),
        .Q(finish_pending_reg_n_0),
        .R(SR));
  LUT3 #(
    .INIT(8'hFE)) 
    frame_error_sticky_i_2
       (.I0(frame_meta[11]),
        .I1(frame_meta[9]),
        .I2(frame_meta[10]),
        .O(frame_meta_11_sn_1));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    group_done_pulse_i_1
       (.I0(group_done_pulse_i_2_n_0),
        .I1(\first_mode_reg[0] [3]),
        .I2(\first_mode_reg[0] [2]),
        .I3(\first_mode_reg[0] [4]),
        .I4(busy_reg_0),
        .I5(rst_acq),
        .O(\frames_seen_reg[3] ));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    group_done_pulse_i_2
       (.I0(\first_mode_reg[0] [1]),
        .I1(\first_mode_reg[0] [0]),
        .I2(mem_reg),
        .I3(\first_mode_reg[0] [5]),
        .I4(fall_done),
        .I5(rise_done),
        .O(group_done_pulse_i_2_n_0));
  FDRE group_done_pulse_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(finish_pending_reg_n_0),
        .Q(fall_done),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(\raw_sum_ext_reg_n_0_[21] ),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_2__0
       (.I0(\raw_sum_ext_reg_n_0_[21] ),
        .I1(\raw_sum_ext_reg_n_0_[20] ),
        .O(i__carry_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \input_addr[0]_i_1__0 
       (.I0(\input_addr_reg_n_0_[0] ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \input_addr[1]_i_1__0 
       (.I0(\input_addr_reg_n_0_[0] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \input_addr[2]_i_1__0 
       (.I0(\input_addr_reg_n_0_[2] ),
        .I1(\input_addr_reg_n_0_[0] ),
        .I2(\input_addr_reg_n_0_[1] ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \input_addr[3]_i_1__0 
       (.I0(\input_addr_reg_n_0_[3] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[2] ),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \input_addr[4]_i_1__0 
       (.I0(\input_addr_reg_n_0_[4] ),
        .I1(\input_addr_reg_n_0_[2] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[1] ),
        .I4(\input_addr_reg_n_0_[3] ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \input_addr[5]_i_1__0 
       (.I0(\input_addr_reg_n_0_[5] ),
        .I1(\input_addr_reg_n_0_[4] ),
        .I2(\input_addr_reg_n_0_[2] ),
        .I3(\input_addr_reg_n_0_[0] ),
        .I4(\input_addr_reg_n_0_[1] ),
        .I5(\input_addr_reg_n_0_[3] ),
        .O(\input_addr[5]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \input_addr[6]_i_1__0 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3__0_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \input_addr[7]_i_1__0 
       (.I0(\input_addr_reg_n_0_[7] ),
        .I1(\input_addr_reg_n_0_[5] ),
        .I2(\input_addr[8]_i_3__0_n_0 ),
        .I3(\input_addr_reg_n_0_[6] ),
        .O(p_1_in[7]));
  LUT4 #(
    .INIT(16'hFF5C)) 
    \input_addr[8]_i_1__0 
       (.I0(busy_reg_n_0),
        .I1(mem_reg),
        .I2(start_pulse),
        .I3(rst_acq),
        .O(\input_addr[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hDFFF2000)) 
    \input_addr[8]_i_2__0 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3__0_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr_reg_n_0_[7] ),
        .I4(\input_addr_reg_n_0_[8] ),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \input_addr[8]_i_3__0 
       (.I0(\input_addr_reg_n_0_[3] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[2] ),
        .I4(\input_addr_reg_n_0_[4] ),
        .O(\input_addr[8]_i_3__0_n_0 ));
  FDRE \input_addr_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[0]),
        .Q(\input_addr_reg_n_0_[0] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[1]),
        .Q(\input_addr_reg_n_0_[1] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[2]),
        .Q(\input_addr_reg_n_0_[2] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[3]),
        .Q(\input_addr_reg_n_0_[3] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[4]),
        .Q(\input_addr_reg_n_0_[4] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr[5]_i_1__0_n_0 ),
        .Q(\input_addr_reg_n_0_[5] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[6]),
        .Q(\input_addr_reg_n_0_[6] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[7]),
        .Q(\input_addr_reg_n_0_[7] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  FDRE \input_addr_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[8]),
        .Q(\input_addr_reg_n_0_[8] ),
        .R(\input_addr[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7555555530000000)) 
    input_complete_i_1
       (.I0(busy0),
        .I1(\input_frame[4]_i_3__0_n_0 ),
        .I2(\input_addr_reg_n_0_[8] ),
        .I3(acc_rd_en),
        .I4(\input_frame[4]_i_4__0_n_0 ),
        .I5(input_complete_reg_n_0),
        .O(input_complete_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    input_complete_i_2__0
       (.I0(start_pulse),
        .I1(busy_reg_n_0),
        .O(busy0));
  FDRE input_complete_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(input_complete_i_1_n_0),
        .Q(input_complete_reg_n_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000040)) 
    \input_frame[0]_i_1__0 
       (.I0(\input_frame[4]_i_3__0_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_4__0_n_0 ),
        .I4(\input_frame_reg_n_0_[0] ),
        .O(\input_frame[0]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000400000)) 
    \input_frame[1]_i_1__0 
       (.I0(\input_frame[4]_i_3__0_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_4__0_n_0 ),
        .I4(\input_frame_reg_n_0_[1] ),
        .I5(\input_frame_reg_n_0_[0] ),
        .O(\input_frame[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0008080808000000)) 
    \input_frame[2]_i_1__0 
       (.I0(acc_rd_en),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(\input_frame[4]_i_3__0_n_0 ),
        .I3(\input_frame_reg_n_0_[0] ),
        .I4(\input_frame_reg_n_0_[1] ),
        .I5(\input_frame_reg_n_0_[2] ),
        .O(\input_frame[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0888888880000000)) 
    \input_frame[3]_i_1__0 
       (.I0(acc_rd_en),
        .I1(\input_frame[3]_i_2__0_n_0 ),
        .I2(\input_frame_reg_n_0_[1] ),
        .I3(\input_frame_reg_n_0_[0] ),
        .I4(\input_frame_reg_n_0_[2] ),
        .I5(\input_frame_reg_n_0_[3] ),
        .O(\input_frame[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \input_frame[3]_i_2__0 
       (.I0(\input_addr_reg_n_0_[8] ),
        .I1(\input_addr_reg_n_0_[7] ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr[8]_i_3__0_n_0 ),
        .I4(\input_addr_reg_n_0_[6] ),
        .O(\input_frame[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h444444444F444444)) 
    \input_frame[4]_i_1__0 
       (.I0(busy_reg_n_0),
        .I1(start_pulse),
        .I2(\input_frame[4]_i_3__0_n_0 ),
        .I3(\input_addr_reg_n_0_[8] ),
        .I4(acc_rd_en),
        .I5(\input_frame[4]_i_4__0_n_0 ),
        .O(\input_frame[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h00404000)) 
    \input_frame[4]_i_2__0 
       (.I0(\input_frame[4]_i_3__0_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_5__0_n_0 ),
        .I4(\input_frame_reg_n_0_[4] ),
        .O(\input_frame[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \input_frame[4]_i_3__0 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3__0_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr_reg_n_0_[7] ),
        .O(\input_frame[4]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \input_frame[4]_i_4__0 
       (.I0(\input_frame_reg_n_0_[3] ),
        .I1(\input_frame_reg_n_0_[1] ),
        .I2(\input_frame_reg_n_0_[0] ),
        .I3(\input_frame_reg_n_0_[2] ),
        .I4(\input_frame_reg_n_0_[4] ),
        .O(\input_frame[4]_i_4__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \input_frame[4]_i_5__0 
       (.I0(\input_frame_reg_n_0_[2] ),
        .I1(\input_frame_reg_n_0_[0] ),
        .I2(\input_frame_reg_n_0_[1] ),
        .I3(\input_frame_reg_n_0_[3] ),
        .O(\input_frame[4]_i_5__0_n_0 ));
  FDRE \input_frame_reg[0] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1__0_n_0 ),
        .D(\input_frame[0]_i_1__0_n_0 ),
        .Q(\input_frame_reg_n_0_[0] ),
        .R(SR));
  FDRE \input_frame_reg[1] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1__0_n_0 ),
        .D(\input_frame[1]_i_1__0_n_0 ),
        .Q(\input_frame_reg_n_0_[1] ),
        .R(SR));
  FDRE \input_frame_reg[2] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1__0_n_0 ),
        .D(\input_frame[2]_i_1__0_n_0 ),
        .Q(\input_frame_reg_n_0_[2] ),
        .R(SR));
  FDRE \input_frame_reg[3] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1__0_n_0 ),
        .D(\input_frame[3]_i_1__0_n_0 ),
        .Q(\input_frame_reg_n_0_[3] ),
        .R(SR));
  FDRE \input_frame_reg[4] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1__0_n_0 ),
        .D(\input_frame[4]_i_2__0_n_0 ),
        .Q(\input_frame_reg_n_0_[4] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry
       (.CI(1'b0),
        .CO({overflow_count0_carry_n_0,overflow_count0_carry_n_1,overflow_count0_carry_n_2,overflow_count0_carry_n_3}),
        .CYINIT(Q[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry_n_4,overflow_count0_carry_n_5,overflow_count0_carry_n_6,overflow_count0_carry_n_7}),
        .S(Q[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__0
       (.CI(overflow_count0_carry_n_0),
        .CO({overflow_count0_carry__0_n_0,overflow_count0_carry__0_n_1,overflow_count0_carry__0_n_2,overflow_count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__0_n_4,overflow_count0_carry__0_n_5,overflow_count0_carry__0_n_6,overflow_count0_carry__0_n_7}),
        .S(Q[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__1
       (.CI(overflow_count0_carry__0_n_0),
        .CO({overflow_count0_carry__1_n_0,overflow_count0_carry__1_n_1,overflow_count0_carry__1_n_2,overflow_count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__1_n_4,overflow_count0_carry__1_n_5,overflow_count0_carry__1_n_6,overflow_count0_carry__1_n_7}),
        .S(Q[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__2
       (.CI(overflow_count0_carry__1_n_0),
        .CO({overflow_count0_carry__2_n_0,overflow_count0_carry__2_n_1,overflow_count0_carry__2_n_2,overflow_count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__2_n_4,overflow_count0_carry__2_n_5,overflow_count0_carry__2_n_6,overflow_count0_carry__2_n_7}),
        .S(Q[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__3
       (.CI(overflow_count0_carry__2_n_0),
        .CO({overflow_count0_carry__3_n_0,overflow_count0_carry__3_n_1,overflow_count0_carry__3_n_2,overflow_count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__3_n_4,overflow_count0_carry__3_n_5,overflow_count0_carry__3_n_6,overflow_count0_carry__3_n_7}),
        .S(Q[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__4
       (.CI(overflow_count0_carry__3_n_0),
        .CO({overflow_count0_carry__4_n_0,overflow_count0_carry__4_n_1,overflow_count0_carry__4_n_2,overflow_count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__4_n_4,overflow_count0_carry__4_n_5,overflow_count0_carry__4_n_6,overflow_count0_carry__4_n_7}),
        .S(Q[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__5
       (.CI(overflow_count0_carry__4_n_0),
        .CO({overflow_count0_carry__5_n_0,overflow_count0_carry__5_n_1,overflow_count0_carry__5_n_2,overflow_count0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({overflow_count0_carry__5_n_4,overflow_count0_carry__5_n_5,overflow_count0_carry__5_n_6,overflow_count0_carry__5_n_7}),
        .S(Q[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__6
       (.CI(overflow_count0_carry__5_n_0),
        .CO({NLW_overflow_count0_carry__6_CO_UNCONNECTED[3:2],overflow_count0_carry__6_n_2,overflow_count0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_overflow_count0_carry__6_O_UNCONNECTED[3],overflow_count0_carry__6_n_5,overflow_count0_carry__6_n_6,overflow_count0_carry__6_n_7}),
        .S({1'b0,\overflow_count_reg_n_0_[31] ,Q[30:29]}));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \overflow_count[0]_i_1__0 
       (.I0(sum_overflow_reg_reg_n_0),
        .I1(sum_valid),
        .I2(Q[0]),
        .O(\overflow_count[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[10]_i_1__0 
       (.I0(overflow_count0_carry__1_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[11]_i_1__0 
       (.I0(overflow_count0_carry__1_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[12]_i_1__0 
       (.I0(overflow_count0_carry__1_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[13]_i_1__0 
       (.I0(overflow_count0_carry__2_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[13]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[14]_i_1__0 
       (.I0(overflow_count0_carry__2_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[15]_i_1__0 
       (.I0(overflow_count0_carry__2_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[15]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[16]_i_1__0 
       (.I0(overflow_count0_carry__2_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[16]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[17]_i_1__0 
       (.I0(overflow_count0_carry__3_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[17]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[18]_i_1__0 
       (.I0(overflow_count0_carry__3_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[18]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[19]_i_1__0 
       (.I0(overflow_count0_carry__3_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[19]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[1]_i_1__0 
       (.I0(overflow_count0_carry_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[20]_i_1__0 
       (.I0(overflow_count0_carry__3_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[20]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[21]_i_1__0 
       (.I0(overflow_count0_carry__4_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[21]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[22]_i_1__0 
       (.I0(overflow_count0_carry__4_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[22]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[23]_i_1__0 
       (.I0(overflow_count0_carry__4_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[23]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[24]_i_1__0 
       (.I0(overflow_count0_carry__4_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[24]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[25]_i_1__0 
       (.I0(overflow_count0_carry__5_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[25]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[26]_i_1__0 
       (.I0(overflow_count0_carry__5_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[26]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[27]_i_1__0 
       (.I0(overflow_count0_carry__5_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[27]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[28]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[31] ),
        .I1(\average_overflow_count_reg[31] ),
        .O(S));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[28]_i_1__0 
       (.I0(overflow_count0_carry__5_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[29]_i_1__0 
       (.I0(overflow_count0_carry__6_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[29]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[2]_i_1__0 
       (.I0(overflow_count0_carry_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[30]_i_1__0 
       (.I0(overflow_count0_carry__6_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[30]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \overflow_count[31]_i_1__0 
       (.I0(busy_reg_n_0),
        .I1(start_pulse),
        .I2(sum_overflow_reg_reg_n_0),
        .I3(sum_valid),
        .O(\overflow_count[31]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[31]_i_2__0 
       (.I0(overflow_count0_carry__6_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[31]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[3]_i_1__0 
       (.I0(overflow_count0_carry_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[4]_i_1__0 
       (.I0(overflow_count0_carry_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[5]_i_1__0 
       (.I0(overflow_count0_carry__0_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[6]_i_1__0 
       (.I0(overflow_count0_carry__0_n_6),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[7]_i_1__0 
       (.I0(overflow_count0_carry__0_n_5),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[8]_i_1__0 
       (.I0(overflow_count0_carry__0_n_4),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[9]_i_1__0 
       (.I0(overflow_count0_carry__1_n_7),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(\overflow_count[9]_i_1__0_n_0 ));
  FDRE \overflow_count_reg[0] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[0]_i_1__0_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE \overflow_count_reg[10] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[10]_i_1__0_n_0 ),
        .Q(Q[10]),
        .R(SR));
  FDRE \overflow_count_reg[11] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[11]_i_1__0_n_0 ),
        .Q(Q[11]),
        .R(SR));
  FDRE \overflow_count_reg[12] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[12]_i_1__0_n_0 ),
        .Q(Q[12]),
        .R(SR));
  FDRE \overflow_count_reg[13] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[13]_i_1__0_n_0 ),
        .Q(Q[13]),
        .R(SR));
  FDRE \overflow_count_reg[14] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[14]_i_1__0_n_0 ),
        .Q(Q[14]),
        .R(SR));
  FDRE \overflow_count_reg[15] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[15]_i_1__0_n_0 ),
        .Q(Q[15]),
        .R(SR));
  FDRE \overflow_count_reg[16] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[16]_i_1__0_n_0 ),
        .Q(Q[16]),
        .R(SR));
  FDRE \overflow_count_reg[17] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[17]_i_1__0_n_0 ),
        .Q(Q[17]),
        .R(SR));
  FDRE \overflow_count_reg[18] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[18]_i_1__0_n_0 ),
        .Q(Q[18]),
        .R(SR));
  FDRE \overflow_count_reg[19] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[19]_i_1__0_n_0 ),
        .Q(Q[19]),
        .R(SR));
  FDRE \overflow_count_reg[1] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE \overflow_count_reg[20] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[20]_i_1__0_n_0 ),
        .Q(Q[20]),
        .R(SR));
  FDRE \overflow_count_reg[21] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[21]_i_1__0_n_0 ),
        .Q(Q[21]),
        .R(SR));
  FDRE \overflow_count_reg[22] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[22]_i_1__0_n_0 ),
        .Q(Q[22]),
        .R(SR));
  FDRE \overflow_count_reg[23] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[23]_i_1__0_n_0 ),
        .Q(Q[23]),
        .R(SR));
  FDRE \overflow_count_reg[24] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[24]_i_1__0_n_0 ),
        .Q(Q[24]),
        .R(SR));
  FDRE \overflow_count_reg[25] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[25]_i_1__0_n_0 ),
        .Q(Q[25]),
        .R(SR));
  FDRE \overflow_count_reg[26] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[26]_i_1__0_n_0 ),
        .Q(Q[26]),
        .R(SR));
  FDRE \overflow_count_reg[27] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[27]_i_1__0_n_0 ),
        .Q(Q[27]),
        .R(SR));
  FDRE \overflow_count_reg[28] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[28]_i_1__0_n_0 ),
        .Q(Q[28]),
        .R(SR));
  FDRE \overflow_count_reg[29] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[29]_i_1__0_n_0 ),
        .Q(Q[29]),
        .R(SR));
  FDRE \overflow_count_reg[2] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE \overflow_count_reg[30] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[30]_i_1__0_n_0 ),
        .Q(Q[30]),
        .R(SR));
  FDRE \overflow_count_reg[31] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[31]_i_2__0_n_0 ),
        .Q(\overflow_count_reg_n_0_[31] ),
        .R(SR));
  FDRE \overflow_count_reg[3] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDRE \overflow_count_reg[4] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(SR));
  FDRE \overflow_count_reg[5] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(SR));
  FDRE \overflow_count_reg[6] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(SR));
  FDRE \overflow_count_reg[7] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[7]_i_1__0_n_0 ),
        .Q(Q[7]),
        .R(SR));
  FDRE \overflow_count_reg[8] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[8]_i_1__0_n_0 ),
        .Q(Q[8]),
        .R(SR));
  FDRE \overflow_count_reg[9] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1__0_n_0 ),
        .D(\overflow_count[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .R(SR));
  FDRE \pipe_addr_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[0] ),
        .Q(\pipe_addr_reg_n_0_[0] ),
        .R(SR));
  FDRE \pipe_addr_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[1] ),
        .Q(\pipe_addr_reg_n_0_[1] ),
        .R(SR));
  FDRE \pipe_addr_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[2] ),
        .Q(\pipe_addr_reg_n_0_[2] ),
        .R(SR));
  FDRE \pipe_addr_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[3] ),
        .Q(\pipe_addr_reg_n_0_[3] ),
        .R(SR));
  FDRE \pipe_addr_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[4] ),
        .Q(\pipe_addr_reg_n_0_[4] ),
        .R(SR));
  FDRE \pipe_addr_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[5] ),
        .Q(\pipe_addr_reg_n_0_[5] ),
        .R(SR));
  FDRE \pipe_addr_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[6] ),
        .Q(\pipe_addr_reg_n_0_[6] ),
        .R(SR));
  FDRE \pipe_addr_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[7] ),
        .Q(\pipe_addr_reg_n_0_[7] ),
        .R(SR));
  FDRE \pipe_addr_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[8] ),
        .Q(\pipe_addr_reg_n_0_[8] ),
        .R(SR));
  FDRE \pipe_frame_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[0] ),
        .Q(pipe_frame[0]),
        .R(SR));
  FDRE \pipe_frame_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[1] ),
        .Q(pipe_frame[1]),
        .R(SR));
  FDRE \pipe_frame_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[2] ),
        .Q(pipe_frame[2]),
        .R(SR));
  FDRE \pipe_frame_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[3] ),
        .Q(pipe_frame[3]),
        .R(SR));
  FDRE \pipe_frame_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[4] ),
        .Q(pipe_frame[4]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \pipe_sample_s14[13]_i_1__0 
       (.I0(sample_fall_u14[13]),
        .O(\pipe_sample_s14[13]_i_1__0_n_0 ));
  FDRE \pipe_sample_s14_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[0]),
        .Q(\pipe_sample_s14_reg_n_0_[0] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[10] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[10]),
        .Q(\pipe_sample_s14_reg_n_0_[10] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[11] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[11]),
        .Q(\pipe_sample_s14_reg_n_0_[11] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[12] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[12]),
        .Q(\pipe_sample_s14_reg_n_0_[12] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[13] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\pipe_sample_s14[13]_i_1__0_n_0 ),
        .Q(\pipe_sample_s14_reg_n_0_[13] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[1]),
        .Q(\pipe_sample_s14_reg_n_0_[1] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[2]),
        .Q(\pipe_sample_s14_reg_n_0_[2] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[3]),
        .Q(\pipe_sample_s14_reg_n_0_[3] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[4]),
        .Q(\pipe_sample_s14_reg_n_0_[4] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[5]),
        .Q(\pipe_sample_s14_reg_n_0_[5] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[6]),
        .Q(\pipe_sample_s14_reg_n_0_[6] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[7]),
        .Q(\pipe_sample_s14_reg_n_0_[7] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[8]),
        .Q(\pipe_sample_s14_reg_n_0_[8] ),
        .R(SR));
  FDRE \pipe_sample_s14_reg[9] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_fall_u14[9]),
        .Q(\pipe_sample_s14_reg_n_0_[9] ),
        .R(SR));
  FDRE pipe_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(acc_rd_en),
        .Q(pipe_valid),
        .R(SR));
  FDRE \raw_sum_addr_reg[0] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[0] ),
        .Q(\raw_sum_addr_reg_n_0_[0] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[1] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[1] ),
        .Q(\raw_sum_addr_reg_n_0_[1] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[2] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[2] ),
        .Q(\raw_sum_addr_reg_n_0_[2] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[3] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[3] ),
        .Q(\raw_sum_addr_reg_n_0_[3] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[4] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[4] ),
        .Q(\raw_sum_addr_reg_n_0_[4] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[5] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[5] ),
        .Q(\raw_sum_addr_reg_n_0_[5] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[6] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[6] ),
        .Q(\raw_sum_addr_reg_n_0_[6] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[7] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[7] ),
        .Q(\raw_sum_addr_reg_n_0_[7] ),
        .R(SR));
  FDRE \raw_sum_addr_reg[8] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_addr_reg_n_0_[8] ),
        .Q(\raw_sum_addr_reg_n_0_[8] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_2 
       (.I0(acc_rd_data[11]),
        .I1(\read_sample_s14_reg_n_0_[11] ),
        .O(\raw_sum_ext[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_3 
       (.I0(acc_rd_data[10]),
        .I1(\read_sample_s14_reg_n_0_[10] ),
        .O(\raw_sum_ext[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_4 
       (.I0(acc_rd_data[9]),
        .I1(\read_sample_s14_reg_n_0_[9] ),
        .O(\raw_sum_ext[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_5 
       (.I0(acc_rd_data[8]),
        .I1(\read_sample_s14_reg_n_0_[8] ),
        .O(\raw_sum_ext[11]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \raw_sum_ext[15]_i_2 
       (.I0(\read_sample_s14_reg_n_0_[13] ),
        .O(\raw_sum_ext[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_5 
       (.I0(\read_sample_s14_reg_n_0_[13] ),
        .I1(acc_rd_data[13]),
        .O(\raw_sum_ext[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_6 
       (.I0(acc_rd_data[12]),
        .I1(\read_sample_s14_reg_n_0_[12] ),
        .O(\raw_sum_ext[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_2 
       (.I0(acc_rd_data[3]),
        .I1(\read_sample_s14_reg_n_0_[3] ),
        .O(\raw_sum_ext[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_3 
       (.I0(acc_rd_data[2]),
        .I1(\read_sample_s14_reg_n_0_[2] ),
        .O(\raw_sum_ext[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_4 
       (.I0(acc_rd_data[1]),
        .I1(\read_sample_s14_reg_n_0_[1] ),
        .O(\raw_sum_ext[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_5 
       (.I0(acc_rd_data[0]),
        .I1(\read_sample_s14_reg_n_0_[0] ),
        .O(\raw_sum_ext[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_2 
       (.I0(acc_rd_data[7]),
        .I1(\read_sample_s14_reg_n_0_[7] ),
        .O(\raw_sum_ext[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_3 
       (.I0(acc_rd_data[6]),
        .I1(\read_sample_s14_reg_n_0_[6] ),
        .O(\raw_sum_ext[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_4 
       (.I0(acc_rd_data[5]),
        .I1(\read_sample_s14_reg_n_0_[5] ),
        .O(\raw_sum_ext[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_5 
       (.I0(acc_rd_data[4]),
        .I1(\read_sample_s14_reg_n_0_[4] ),
        .O(\raw_sum_ext[7]_i_5_n_0 ));
  FDRE \raw_sum_ext_reg[0] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[3]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[0] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[10] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[11]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[10] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[11] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[11]_i_1_n_4 ),
        .Q(\raw_sum_ext_reg_n_0_[11] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[11]_i_1 
       (.CI(\raw_sum_ext_reg[7]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[11]_i_1_n_0 ,\raw_sum_ext_reg[11]_i_1_n_1 ,\raw_sum_ext_reg[11]_i_1_n_2 ,\raw_sum_ext_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc_rd_data[11:8]),
        .O({\raw_sum_ext_reg[11]_i_1_n_4 ,\raw_sum_ext_reg[11]_i_1_n_5 ,\raw_sum_ext_reg[11]_i_1_n_6 ,\raw_sum_ext_reg[11]_i_1_n_7 }),
        .S({\raw_sum_ext[11]_i_2_n_0 ,\raw_sum_ext[11]_i_3_n_0 ,\raw_sum_ext[11]_i_4_n_0 ,\raw_sum_ext[11]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[12] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[15]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[12] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[13] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[15]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[13] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[14] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[15]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[14] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[15] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[15]_i_1_n_4 ),
        .Q(\raw_sum_ext_reg_n_0_[15] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[15]_i_1 
       (.CI(\raw_sum_ext_reg[11]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[15]_i_1_n_0 ,\raw_sum_ext_reg[15]_i_1_n_1 ,\raw_sum_ext_reg[15]_i_1_n_2 ,\raw_sum_ext_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({acc_rd_data[14],\raw_sum_ext[15]_i_2_n_0 ,\read_sample_s14_reg_n_0_[13] ,acc_rd_data[12]}),
        .O({\raw_sum_ext_reg[15]_i_1_n_4 ,\raw_sum_ext_reg[15]_i_1_n_5 ,\raw_sum_ext_reg[15]_i_1_n_6 ,\raw_sum_ext_reg[15]_i_1_n_7 }),
        .S({accum_ram_n_31,accum_ram_n_32,\raw_sum_ext[15]_i_5_n_0 ,\raw_sum_ext[15]_i_6_n_0 }));
  FDRE \raw_sum_ext_reg[16] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[19]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[16] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[17] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[19]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[17] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[18] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[19]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[18] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[19] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[19]_i_1_n_4 ),
        .Q(\raw_sum_ext_reg_n_0_[19] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[19]_i_1 
       (.CI(\raw_sum_ext_reg[15]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[19]_i_1_n_0 ,\raw_sum_ext_reg[19]_i_1_n_1 ,\raw_sum_ext_reg[19]_i_1_n_2 ,\raw_sum_ext_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc_rd_data[18:15]),
        .O({\raw_sum_ext_reg[19]_i_1_n_4 ,\raw_sum_ext_reg[19]_i_1_n_5 ,\raw_sum_ext_reg[19]_i_1_n_6 ,\raw_sum_ext_reg[19]_i_1_n_7 }),
        .S({accum_ram_n_33,accum_ram_n_34,accum_ram_n_35,accum_ram_n_36}));
  FDRE \raw_sum_ext_reg[1] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[3]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[1] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[20] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[22]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[20] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[21] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[22]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[21] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[22] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[22]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[22] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[22]_i_1 
       (.CI(\raw_sum_ext_reg[19]_i_1_n_0 ),
        .CO({\NLW_raw_sum_ext_reg[22]_i_1_CO_UNCONNECTED [3:2],\raw_sum_ext_reg[22]_i_1_n_2 ,\raw_sum_ext_reg[22]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,acc_rd_data[20:19]}),
        .O({\NLW_raw_sum_ext_reg[22]_i_1_O_UNCONNECTED [3],\raw_sum_ext_reg[22]_i_1_n_5 ,\raw_sum_ext_reg[22]_i_1_n_6 ,\raw_sum_ext_reg[22]_i_1_n_7 }),
        .S({1'b0,1'b1,accum_ram_n_37,accum_ram_n_38}));
  FDRE \raw_sum_ext_reg[2] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[3]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[2] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[3] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[3]_i_1_n_4 ),
        .Q(\raw_sum_ext_reg_n_0_[3] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\raw_sum_ext_reg[3]_i_1_n_0 ,\raw_sum_ext_reg[3]_i_1_n_1 ,\raw_sum_ext_reg[3]_i_1_n_2 ,\raw_sum_ext_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc_rd_data[3:0]),
        .O({\raw_sum_ext_reg[3]_i_1_n_4 ,\raw_sum_ext_reg[3]_i_1_n_5 ,\raw_sum_ext_reg[3]_i_1_n_6 ,\raw_sum_ext_reg[3]_i_1_n_7 }),
        .S({\raw_sum_ext[3]_i_2_n_0 ,\raw_sum_ext[3]_i_3_n_0 ,\raw_sum_ext[3]_i_4_n_0 ,\raw_sum_ext[3]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[4] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[7]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[4] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[5] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[7]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[5] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[6] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[7]_i_1_n_5 ),
        .Q(\raw_sum_ext_reg_n_0_[6] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[7] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[7]_i_1_n_4 ),
        .Q(\raw_sum_ext_reg_n_0_[7] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[7]_i_1 
       (.CI(\raw_sum_ext_reg[3]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[7]_i_1_n_0 ,\raw_sum_ext_reg[7]_i_1_n_1 ,\raw_sum_ext_reg[7]_i_1_n_2 ,\raw_sum_ext_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(acc_rd_data[7:4]),
        .O({\raw_sum_ext_reg[7]_i_1_n_4 ,\raw_sum_ext_reg[7]_i_1_n_5 ,\raw_sum_ext_reg[7]_i_1_n_6 ,\raw_sum_ext_reg[7]_i_1_n_7 }),
        .S({\raw_sum_ext[7]_i_2_n_0 ,\raw_sum_ext[7]_i_3_n_0 ,\raw_sum_ext[7]_i_4_n_0 ,\raw_sum_ext[7]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[8] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[11]_i_1_n_7 ),
        .Q(\raw_sum_ext_reg_n_0_[8] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[9] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\raw_sum_ext_reg[11]_i_1_n_6 ),
        .Q(\raw_sum_ext_reg_n_0_[9] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[0] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_frame_reg_n_0_[0] ),
        .Q(\raw_sum_frame_reg_n_0_[0] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[1] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_frame_reg_n_0_[1] ),
        .Q(\raw_sum_frame_reg_n_0_[1] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[2] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_frame_reg_n_0_[2] ),
        .Q(\raw_sum_frame_reg_n_0_[2] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[3] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_frame_reg_n_0_[3] ),
        .Q(\raw_sum_frame_reg_n_0_[3] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[4] 
       (.C(clk_acq),
        .CE(read_valid_reg_n_0),
        .D(\read_frame_reg_n_0_[4] ),
        .Q(\raw_sum_frame_reg_n_0_[4] ),
        .R(SR));
  FDRE raw_sum_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(read_valid_reg_n_0),
        .Q(raw_sum_valid),
        .R(SR));
  FDRE \read_addr_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[0] ),
        .Q(\read_addr_reg_n_0_[0] ),
        .R(SR));
  FDRE \read_addr_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[1] ),
        .Q(\read_addr_reg_n_0_[1] ),
        .R(SR));
  FDRE \read_addr_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[2] ),
        .Q(\read_addr_reg_n_0_[2] ),
        .R(SR));
  FDRE \read_addr_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[3] ),
        .Q(\read_addr_reg_n_0_[3] ),
        .R(SR));
  FDRE \read_addr_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[4] ),
        .Q(\read_addr_reg_n_0_[4] ),
        .R(SR));
  FDRE \read_addr_reg[5] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[5] ),
        .Q(\read_addr_reg_n_0_[5] ),
        .R(SR));
  FDRE \read_addr_reg[6] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[6] ),
        .Q(\read_addr_reg_n_0_[6] ),
        .R(SR));
  FDRE \read_addr_reg[7] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[7] ),
        .Q(\read_addr_reg_n_0_[7] ),
        .R(SR));
  FDRE \read_addr_reg[8] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_addr_reg_n_0_[8] ),
        .Q(\read_addr_reg_n_0_[8] ),
        .R(SR));
  FDRE \read_frame_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[0]),
        .Q(\read_frame_reg_n_0_[0] ),
        .R(SR));
  FDRE \read_frame_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[1]),
        .Q(\read_frame_reg_n_0_[1] ),
        .R(SR));
  FDRE \read_frame_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[2]),
        .Q(\read_frame_reg_n_0_[2] ),
        .R(SR));
  FDRE \read_frame_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[3]),
        .Q(\read_frame_reg_n_0_[3] ),
        .R(SR));
  FDRE \read_frame_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[4]),
        .Q(\read_frame_reg_n_0_[4] ),
        .R(SR));
  FDRE \read_sample_s14_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[0] ),
        .Q(\read_sample_s14_reg_n_0_[0] ),
        .R(SR));
  FDRE \read_sample_s14_reg[10] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[10] ),
        .Q(\read_sample_s14_reg_n_0_[10] ),
        .R(SR));
  FDRE \read_sample_s14_reg[11] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[11] ),
        .Q(\read_sample_s14_reg_n_0_[11] ),
        .R(SR));
  FDRE \read_sample_s14_reg[12] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[12] ),
        .Q(\read_sample_s14_reg_n_0_[12] ),
        .R(SR));
  FDRE \read_sample_s14_reg[13] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[13] ),
        .Q(\read_sample_s14_reg_n_0_[13] ),
        .R(SR));
  FDRE \read_sample_s14_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[1] ),
        .Q(\read_sample_s14_reg_n_0_[1] ),
        .R(SR));
  FDRE \read_sample_s14_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[2] ),
        .Q(\read_sample_s14_reg_n_0_[2] ),
        .R(SR));
  FDRE \read_sample_s14_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[3] ),
        .Q(\read_sample_s14_reg_n_0_[3] ),
        .R(SR));
  FDRE \read_sample_s14_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[4] ),
        .Q(\read_sample_s14_reg_n_0_[4] ),
        .R(SR));
  FDRE \read_sample_s14_reg[5] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[5] ),
        .Q(\read_sample_s14_reg_n_0_[5] ),
        .R(SR));
  FDRE \read_sample_s14_reg[6] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[6] ),
        .Q(\read_sample_s14_reg_n_0_[6] ),
        .R(SR));
  FDRE \read_sample_s14_reg[7] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[7] ),
        .Q(\read_sample_s14_reg_n_0_[7] ),
        .R(SR));
  FDRE \read_sample_s14_reg[8] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[8] ),
        .Q(\read_sample_s14_reg_n_0_[8] ),
        .R(SR));
  FDRE \read_sample_s14_reg[9] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(\pipe_sample_s14_reg_n_0_[9] ),
        .Q(\read_sample_s14_reg_n_0_[9] ),
        .R(SR));
  FDRE read_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(pipe_valid),
        .Q(read_valid_reg_n_0),
        .R(SR));
  FDRE \sum_addr_reg[0] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[0] ),
        .Q(sum_addr[0]),
        .R(SR));
  FDRE \sum_addr_reg[1] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[1] ),
        .Q(sum_addr[1]),
        .R(SR));
  FDRE \sum_addr_reg[2] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[2] ),
        .Q(sum_addr[2]),
        .R(SR));
  FDRE \sum_addr_reg[3] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[3] ),
        .Q(sum_addr[3]),
        .R(SR));
  FDRE \sum_addr_reg[4] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[4] ),
        .Q(sum_addr[4]),
        .R(SR));
  FDRE \sum_addr_reg[5] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[5] ),
        .Q(sum_addr[5]),
        .R(SR));
  FDRE \sum_addr_reg[6] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[6] ),
        .Q(sum_addr[6]),
        .R(SR));
  FDRE \sum_addr_reg[7] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[7] ),
        .Q(sum_addr[7]),
        .R(SR));
  FDRE \sum_addr_reg[8] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_addr_reg_n_0_[8] ),
        .Q(sum_addr[8]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[0]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[0] ),
        .O(\sum_data_s22[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[10]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[10] ),
        .O(\sum_data_s22[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[11]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[11] ),
        .O(\sum_data_s22[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[12]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[12] ),
        .O(\sum_data_s22[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[13]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[13] ),
        .O(\sum_data_s22[13]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[14]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[14] ),
        .O(\sum_data_s22[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[15]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[15] ),
        .O(\sum_data_s22[15]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[16]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[16] ),
        .O(\sum_data_s22[16]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[17]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[17] ),
        .O(\sum_data_s22[17]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[18]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[18] ),
        .O(\sum_data_s22[18]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[19]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[19] ),
        .O(\sum_data_s22[19]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[1]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[1] ),
        .O(\sum_data_s22[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[20]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[20] ),
        .O(\sum_data_s22[20]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hF2)) 
    \sum_data_s22[21]_i_1 
       (.I0(mem_reg),
        .I1(start_pulse),
        .I2(rst_acq),
        .O(\sum_data_s22[21]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAE)) 
    \sum_data_s22[21]_i_2__0 
       (.I0(raw_sum_valid),
        .I1(mem_reg),
        .I2(start_pulse),
        .O(\sum_data_s22[21]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \sum_data_s22[21]_i_3__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[21] ),
        .O(\sum_data_s22[21]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[2]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[2] ),
        .O(\sum_data_s22[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[3]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[3] ),
        .O(\sum_data_s22[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[4]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[4] ),
        .O(\sum_data_s22[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[5]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[5] ),
        .O(\sum_data_s22[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[6]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[6] ),
        .O(\sum_data_s22[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[7]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[7] ),
        .O(\sum_data_s22[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[8]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[8] ),
        .O(\sum_data_s22[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[9]_i_1__0 
       (.I0(sum_s221),
        .I1(\sum_s221_inferred__0/i__carry_n_2 ),
        .I2(\raw_sum_ext_reg_n_0_[9] ),
        .O(\sum_data_s22[9]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[0] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[0]_i_1__0_n_0 ),
        .Q(sum_data_s22[0]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[10] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[10]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[7]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[11] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[11]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[8]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[12] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[12]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[9]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[13] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[13]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[10]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[14] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[14]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[11]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[15] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[15]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[12]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[16] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[16]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[13]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[17] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[17]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[14]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[18] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[18]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[15]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[19] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[19]_i_1__0_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[19] ),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[1] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[1]_i_1__0_n_0 ),
        .Q(sum_data_s22[1]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[20] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[20]_i_1__0_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[20] ),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[21] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[21]_i_3__0_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[21] ),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[2] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[2]_i_1__0_n_0 ),
        .Q(sum_data_s22[2]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[3] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[3]_i_1__0_n_0 ),
        .Q(sum_data_s22[3]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[4] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[4]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[1]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[5] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[5]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[2]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[6] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[6]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[3]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[7] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[7]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[4]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[8] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[8]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[5]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[9] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2__0_n_0 ),
        .D(\sum_data_s22[9]_i_1__0_n_0 ),
        .Q(p_0_in8_in__0[6]),
        .R(\sum_data_s22[21]_i_1_n_0 ));
  FDRE \sum_frame_reg[0] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_frame_reg_n_0_[0] ),
        .Q(sum_frame[0]),
        .R(SR));
  FDRE \sum_frame_reg[1] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_frame_reg_n_0_[1] ),
        .Q(sum_frame[1]),
        .R(SR));
  FDRE \sum_frame_reg[2] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_frame_reg_n_0_[2] ),
        .Q(sum_frame[2]),
        .R(SR));
  FDRE \sum_frame_reg[3] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_frame_reg_n_0_[3] ),
        .Q(sum_frame[3]),
        .R(SR));
  FDRE \sum_frame_reg[4] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(\raw_sum_frame_reg_n_0_[4] ),
        .Q(sum_frame[4]),
        .R(SR));
  LUT4 #(
    .INIT(16'hFBC8)) 
    sum_overflow_reg_i_1
       (.I0(\sum_s221_inferred__0/i__carry_n_2 ),
        .I1(raw_sum_valid),
        .I2(sum_s221),
        .I3(sum_overflow_reg_reg_n_0),
        .O(sum_overflow_reg_i_1_n_0));
  FDRE sum_overflow_reg_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(sum_overflow_reg_i_1_n_0),
        .Q(sum_overflow_reg_reg_n_0),
        .R(SR));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 sum_s221_carry
       (.CI(1'b0),
        .CO({NLW_sum_s221_carry_CO_UNCONNECTED[3:2],sum_s221,sum_s221_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\raw_sum_ext_reg_n_0_[21] }),
        .O(NLW_sum_s221_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,sum_s221_carry_i_1__0_n_0,sum_s221_carry_i_2__0_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    sum_s221_carry_i_1__0
       (.I0(\raw_sum_ext_reg_n_0_[22] ),
        .O(sum_s221_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sum_s221_carry_i_2__0
       (.I0(\raw_sum_ext_reg_n_0_[20] ),
        .I1(\raw_sum_ext_reg_n_0_[21] ),
        .O(sum_s221_carry_i_2__0_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \sum_s221_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\NLW_sum_s221_inferred__0/i__carry_CO_UNCONNECTED [3:2],\sum_s221_inferred__0/i__carry_n_2 ,\sum_s221_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i__carry_i_1__0_n_0}),
        .O(\NLW_sum_s221_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\raw_sum_ext_reg_n_0_[22] ,i__carry_i_2__0_n_0}));
  FDRE sum_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(raw_sum_valid),
        .Q(sum_valid),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "frame_average_bram" *) 
module system_echo_pipeline_0_0_frame_average_bram_3
   (SR,
    rise_done,
    rise_wr_en,
    Q,
    overflow_count,
    clip_flag_snapshot,
    rise_wr_addr,
    rise_wr_data_q2,
    clk_acq,
    mem_reg,
    start_pulse,
    rst_acq,
    mem_reg_0,
    frame_meta,
    mem_reg_1,
    mem_reg_2,
    mem_reg_3,
    sample_rise_u14,
    sample_clip,
    S,
    \average_overflow_count_reg[31] ,
    fall_clip);
  output [0:0]SR;
  output rise_done;
  output rise_wr_en;
  output [0:0]Q;
  output [31:0]overflow_count;
  output clip_flag_snapshot;
  output [8:0]rise_wr_addr;
  output [15:0]rise_wr_data_q2;
  input clk_acq;
  input mem_reg;
  input start_pulse;
  input rst_acq;
  input mem_reg_0;
  input [0:0]frame_meta;
  input mem_reg_1;
  input mem_reg_2;
  input mem_reg_3;
  input [13:0]sample_rise_u14;
  input sample_clip;
  input [0:0]S;
  input [30:0]\average_overflow_count_reg[31] ;
  input fall_clip;

  wire [0:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire acc_rd_en;
  wire [8:0]acc_wr_addr;
  wire [21:0]acc_wr_data;
  wire acc_wr_en;
  wire accum_ram_n_22;
  wire accum_ram_n_23;
  wire accum_ram_n_24;
  wire accum_ram_n_25;
  wire accum_ram_n_26;
  wire accum_ram_n_27;
  wire accum_ram_n_28;
  wire accum_ram_n_29;
  wire [30:0]\average_overflow_count_reg[31] ;
  wire [15:0]average_q2_ties_even_return;
  wire \avg_wr_data_q2[3]_i_2_n_0 ;
  wire \avg_wr_data_q2_reg[11]_i_1_n_0 ;
  wire \avg_wr_data_q2_reg[11]_i_1_n_1 ;
  wire \avg_wr_data_q2_reg[11]_i_1_n_2 ;
  wire \avg_wr_data_q2_reg[11]_i_1_n_3 ;
  wire \avg_wr_data_q2_reg[15]_i_1_n_1 ;
  wire \avg_wr_data_q2_reg[15]_i_1_n_2 ;
  wire \avg_wr_data_q2_reg[15]_i_1_n_3 ;
  wire \avg_wr_data_q2_reg[3]_i_1_n_0 ;
  wire \avg_wr_data_q2_reg[3]_i_1_n_1 ;
  wire \avg_wr_data_q2_reg[3]_i_1_n_2 ;
  wire \avg_wr_data_q2_reg[3]_i_1_n_3 ;
  wire \avg_wr_data_q2_reg[7]_i_1_n_0 ;
  wire \avg_wr_data_q2_reg[7]_i_1_n_1 ;
  wire \avg_wr_data_q2_reg[7]_i_1_n_2 ;
  wire \avg_wr_data_q2_reg[7]_i_1_n_3 ;
  wire avg_wr_en_i_2_n_0;
  wire busy0;
  wire busy_i_1__0_n_0;
  wire busy_reg_n_0;
  wire clip_flag_snapshot;
  wire clip_flag_snapshot_i_1_n_0;
  wire clip_flag_work;
  wire clip_flag_work0;
  wire clip_flag_work_i_2_n_0;
  wire clip_flag_work_i_3_n_0;
  wire clip_flag_work_i_4_n_0;
  wire clip_flag_work_i_5_n_0;
  wire clip_flag_work_i_6_n_0;
  wire clip_flag_work_i_7_n_0;
  wire clk_acq;
  wire fall_clip;
  wire finish_pending_i_1_n_0;
  wire finish_pending_i_2_n_0;
  wire finish_pending_i_3_n_0;
  wire finish_pending_i_4_n_0;
  wire finish_pending_reg_n_0;
  wire [0:0]frame_meta;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire \input_addr[5]_i_1_n_0 ;
  wire \input_addr[8]_i_1_n_0 ;
  wire \input_addr[8]_i_3_n_0 ;
  wire \input_addr_reg_n_0_[0] ;
  wire \input_addr_reg_n_0_[1] ;
  wire \input_addr_reg_n_0_[2] ;
  wire \input_addr_reg_n_0_[3] ;
  wire \input_addr_reg_n_0_[4] ;
  wire \input_addr_reg_n_0_[5] ;
  wire \input_addr_reg_n_0_[6] ;
  wire \input_addr_reg_n_0_[7] ;
  wire \input_addr_reg_n_0_[8] ;
  wire input_complete_i_1_n_0;
  wire input_complete_reg_n_0;
  wire \input_frame[0]_i_1_n_0 ;
  wire \input_frame[1]_i_1_n_0 ;
  wire \input_frame[2]_i_1_n_0 ;
  wire \input_frame[3]_i_1_n_0 ;
  wire \input_frame[3]_i_2_n_0 ;
  wire \input_frame[4]_i_1_n_0 ;
  wire \input_frame[4]_i_2_n_0 ;
  wire \input_frame[4]_i_3_n_0 ;
  wire \input_frame[4]_i_4_n_0 ;
  wire \input_frame[4]_i_5_n_0 ;
  wire \input_frame_reg_n_0_[0] ;
  wire \input_frame_reg_n_0_[1] ;
  wire \input_frame_reg_n_0_[2] ;
  wire \input_frame_reg_n_0_[3] ;
  wire \input_frame_reg_n_0_[4] ;
  wire mem_reg;
  wire mem_reg_0;
  wire mem_reg_1;
  wire mem_reg_2;
  wire mem_reg_3;
  wire [31:0]overflow_count;
  wire [31:1]overflow_count0;
  wire overflow_count0_carry__0_n_0;
  wire overflow_count0_carry__0_n_1;
  wire overflow_count0_carry__0_n_2;
  wire overflow_count0_carry__0_n_3;
  wire overflow_count0_carry__1_n_0;
  wire overflow_count0_carry__1_n_1;
  wire overflow_count0_carry__1_n_2;
  wire overflow_count0_carry__1_n_3;
  wire overflow_count0_carry__2_n_0;
  wire overflow_count0_carry__2_n_1;
  wire overflow_count0_carry__2_n_2;
  wire overflow_count0_carry__2_n_3;
  wire overflow_count0_carry__3_n_0;
  wire overflow_count0_carry__3_n_1;
  wire overflow_count0_carry__3_n_2;
  wire overflow_count0_carry__3_n_3;
  wire overflow_count0_carry__4_n_0;
  wire overflow_count0_carry__4_n_1;
  wire overflow_count0_carry__4_n_2;
  wire overflow_count0_carry__4_n_3;
  wire overflow_count0_carry__5_n_0;
  wire overflow_count0_carry__5_n_1;
  wire overflow_count0_carry__5_n_2;
  wire overflow_count0_carry__5_n_3;
  wire overflow_count0_carry__6_n_2;
  wire overflow_count0_carry__6_n_3;
  wire overflow_count0_carry_n_0;
  wire overflow_count0_carry_n_1;
  wire overflow_count0_carry_n_2;
  wire overflow_count0_carry_n_3;
  wire \overflow_count[0]_INST_0_i_1_n_0 ;
  wire \overflow_count[0]_INST_0_i_2_n_0 ;
  wire \overflow_count[0]_INST_0_i_3_n_0 ;
  wire \overflow_count[0]_INST_0_i_4_n_0 ;
  wire \overflow_count[0]_INST_0_n_0 ;
  wire \overflow_count[0]_INST_0_n_1 ;
  wire \overflow_count[0]_INST_0_n_2 ;
  wire \overflow_count[0]_INST_0_n_3 ;
  wire \overflow_count[12]_INST_0_i_1_n_0 ;
  wire \overflow_count[12]_INST_0_i_2_n_0 ;
  wire \overflow_count[12]_INST_0_i_3_n_0 ;
  wire \overflow_count[12]_INST_0_i_4_n_0 ;
  wire \overflow_count[12]_INST_0_n_0 ;
  wire \overflow_count[12]_INST_0_n_1 ;
  wire \overflow_count[12]_INST_0_n_2 ;
  wire \overflow_count[12]_INST_0_n_3 ;
  wire \overflow_count[16]_INST_0_i_1_n_0 ;
  wire \overflow_count[16]_INST_0_i_2_n_0 ;
  wire \overflow_count[16]_INST_0_i_3_n_0 ;
  wire \overflow_count[16]_INST_0_i_4_n_0 ;
  wire \overflow_count[16]_INST_0_n_0 ;
  wire \overflow_count[16]_INST_0_n_1 ;
  wire \overflow_count[16]_INST_0_n_2 ;
  wire \overflow_count[16]_INST_0_n_3 ;
  wire \overflow_count[20]_INST_0_i_1_n_0 ;
  wire \overflow_count[20]_INST_0_i_2_n_0 ;
  wire \overflow_count[20]_INST_0_i_3_n_0 ;
  wire \overflow_count[20]_INST_0_i_4_n_0 ;
  wire \overflow_count[20]_INST_0_n_0 ;
  wire \overflow_count[20]_INST_0_n_1 ;
  wire \overflow_count[20]_INST_0_n_2 ;
  wire \overflow_count[20]_INST_0_n_3 ;
  wire \overflow_count[24]_INST_0_i_1_n_0 ;
  wire \overflow_count[24]_INST_0_i_2_n_0 ;
  wire \overflow_count[24]_INST_0_i_3_n_0 ;
  wire \overflow_count[24]_INST_0_i_4_n_0 ;
  wire \overflow_count[24]_INST_0_n_0 ;
  wire \overflow_count[24]_INST_0_n_1 ;
  wire \overflow_count[24]_INST_0_n_2 ;
  wire \overflow_count[24]_INST_0_n_3 ;
  wire \overflow_count[28]_INST_0_i_2_n_0 ;
  wire \overflow_count[28]_INST_0_i_3_n_0 ;
  wire \overflow_count[28]_INST_0_i_4_n_0 ;
  wire \overflow_count[28]_INST_0_n_1 ;
  wire \overflow_count[28]_INST_0_n_2 ;
  wire \overflow_count[28]_INST_0_n_3 ;
  wire \overflow_count[31]_i_1_n_0 ;
  wire \overflow_count[4]_INST_0_i_1_n_0 ;
  wire \overflow_count[4]_INST_0_i_2_n_0 ;
  wire \overflow_count[4]_INST_0_i_3_n_0 ;
  wire \overflow_count[4]_INST_0_i_4_n_0 ;
  wire \overflow_count[4]_INST_0_n_0 ;
  wire \overflow_count[4]_INST_0_n_1 ;
  wire \overflow_count[4]_INST_0_n_2 ;
  wire \overflow_count[4]_INST_0_n_3 ;
  wire \overflow_count[8]_INST_0_i_1_n_0 ;
  wire \overflow_count[8]_INST_0_i_2_n_0 ;
  wire \overflow_count[8]_INST_0_i_3_n_0 ;
  wire \overflow_count[8]_INST_0_i_4_n_0 ;
  wire \overflow_count[8]_INST_0_n_0 ;
  wire \overflow_count[8]_INST_0_n_1 ;
  wire \overflow_count[8]_INST_0_n_2 ;
  wire \overflow_count[8]_INST_0_n_3 ;
  wire \overflow_count_reg_n_0_[0] ;
  wire \overflow_count_reg_n_0_[10] ;
  wire \overflow_count_reg_n_0_[11] ;
  wire \overflow_count_reg_n_0_[12] ;
  wire \overflow_count_reg_n_0_[13] ;
  wire \overflow_count_reg_n_0_[14] ;
  wire \overflow_count_reg_n_0_[15] ;
  wire \overflow_count_reg_n_0_[16] ;
  wire \overflow_count_reg_n_0_[17] ;
  wire \overflow_count_reg_n_0_[18] ;
  wire \overflow_count_reg_n_0_[19] ;
  wire \overflow_count_reg_n_0_[1] ;
  wire \overflow_count_reg_n_0_[20] ;
  wire \overflow_count_reg_n_0_[21] ;
  wire \overflow_count_reg_n_0_[22] ;
  wire \overflow_count_reg_n_0_[23] ;
  wire \overflow_count_reg_n_0_[24] ;
  wire \overflow_count_reg_n_0_[25] ;
  wire \overflow_count_reg_n_0_[26] ;
  wire \overflow_count_reg_n_0_[27] ;
  wire \overflow_count_reg_n_0_[28] ;
  wire \overflow_count_reg_n_0_[29] ;
  wire \overflow_count_reg_n_0_[2] ;
  wire \overflow_count_reg_n_0_[30] ;
  wire \overflow_count_reg_n_0_[3] ;
  wire \overflow_count_reg_n_0_[4] ;
  wire \overflow_count_reg_n_0_[5] ;
  wire \overflow_count_reg_n_0_[6] ;
  wire \overflow_count_reg_n_0_[7] ;
  wire \overflow_count_reg_n_0_[8] ;
  wire \overflow_count_reg_n_0_[9] ;
  wire [22:0]p_0_in;
  wire [15:1]p_0_in8_in;
  wire [8:0]p_1_in;
  wire [31:0]p_1_in__0;
  wire [8:0]pipe_addr;
  wire [4:0]pipe_frame;
  wire [13:0]pipe_sample_s14;
  wire pipe_valid;
  wire [8:0]raw_sum_addr;
  wire \raw_sum_ext[11]_i_2_n_0 ;
  wire \raw_sum_ext[11]_i_3_n_0 ;
  wire \raw_sum_ext[11]_i_4_n_0 ;
  wire \raw_sum_ext[11]_i_5_n_0 ;
  wire \raw_sum_ext[15]_i_2_n_0 ;
  wire \raw_sum_ext[15]_i_5_n_0 ;
  wire \raw_sum_ext[15]_i_6_n_0 ;
  wire \raw_sum_ext[3]_i_2_n_0 ;
  wire \raw_sum_ext[3]_i_3_n_0 ;
  wire \raw_sum_ext[3]_i_4_n_0 ;
  wire \raw_sum_ext[3]_i_5_n_0 ;
  wire \raw_sum_ext[7]_i_2_n_0 ;
  wire \raw_sum_ext[7]_i_3_n_0 ;
  wire \raw_sum_ext[7]_i_4_n_0 ;
  wire \raw_sum_ext[7]_i_5_n_0 ;
  wire \raw_sum_ext_reg[11]_i_1_n_0 ;
  wire \raw_sum_ext_reg[11]_i_1_n_1 ;
  wire \raw_sum_ext_reg[11]_i_1_n_2 ;
  wire \raw_sum_ext_reg[11]_i_1_n_3 ;
  wire \raw_sum_ext_reg[15]_i_1_n_0 ;
  wire \raw_sum_ext_reg[15]_i_1_n_1 ;
  wire \raw_sum_ext_reg[15]_i_1_n_2 ;
  wire \raw_sum_ext_reg[15]_i_1_n_3 ;
  wire \raw_sum_ext_reg[19]_i_1_n_0 ;
  wire \raw_sum_ext_reg[19]_i_1_n_1 ;
  wire \raw_sum_ext_reg[19]_i_1_n_2 ;
  wire \raw_sum_ext_reg[19]_i_1_n_3 ;
  wire \raw_sum_ext_reg[22]_i_1_n_2 ;
  wire \raw_sum_ext_reg[22]_i_1_n_3 ;
  wire \raw_sum_ext_reg[3]_i_1_n_0 ;
  wire \raw_sum_ext_reg[3]_i_1_n_1 ;
  wire \raw_sum_ext_reg[3]_i_1_n_2 ;
  wire \raw_sum_ext_reg[3]_i_1_n_3 ;
  wire \raw_sum_ext_reg[7]_i_1_n_0 ;
  wire \raw_sum_ext_reg[7]_i_1_n_1 ;
  wire \raw_sum_ext_reg[7]_i_1_n_2 ;
  wire \raw_sum_ext_reg[7]_i_1_n_3 ;
  wire \raw_sum_ext_reg_n_0_[0] ;
  wire \raw_sum_ext_reg_n_0_[10] ;
  wire \raw_sum_ext_reg_n_0_[11] ;
  wire \raw_sum_ext_reg_n_0_[12] ;
  wire \raw_sum_ext_reg_n_0_[13] ;
  wire \raw_sum_ext_reg_n_0_[14] ;
  wire \raw_sum_ext_reg_n_0_[15] ;
  wire \raw_sum_ext_reg_n_0_[16] ;
  wire \raw_sum_ext_reg_n_0_[17] ;
  wire \raw_sum_ext_reg_n_0_[18] ;
  wire \raw_sum_ext_reg_n_0_[19] ;
  wire \raw_sum_ext_reg_n_0_[1] ;
  wire \raw_sum_ext_reg_n_0_[20] ;
  wire \raw_sum_ext_reg_n_0_[21] ;
  wire \raw_sum_ext_reg_n_0_[22] ;
  wire \raw_sum_ext_reg_n_0_[2] ;
  wire \raw_sum_ext_reg_n_0_[3] ;
  wire \raw_sum_ext_reg_n_0_[4] ;
  wire \raw_sum_ext_reg_n_0_[5] ;
  wire \raw_sum_ext_reg_n_0_[6] ;
  wire \raw_sum_ext_reg_n_0_[7] ;
  wire \raw_sum_ext_reg_n_0_[8] ;
  wire \raw_sum_ext_reg_n_0_[9] ;
  wire [4:0]raw_sum_frame;
  wire raw_sum_valid;
  wire [20:0]read_accum_s22;
  wire [8:0]read_addr;
  wire [4:0]read_frame;
  wire [13:0]read_sample_s14;
  wire read_valid;
  wire rise_clip;
  wire rise_done;
  wire [8:0]rise_wr_addr;
  wire [15:0]rise_wr_data_q2;
  wire rise_wr_en;
  wire rst_acq;
  wire sample_clip;
  wire [13:0]sample_rise_u14;
  wire [13:13]sample_s14;
  wire start_pulse;
  wire [8:0]sum_addr;
  wire [3:0]sum_data_s22;
  wire \sum_data_s22[0]_i_1_n_0 ;
  wire \sum_data_s22[10]_i_1_n_0 ;
  wire \sum_data_s22[11]_i_1_n_0 ;
  wire \sum_data_s22[12]_i_1_n_0 ;
  wire \sum_data_s22[13]_i_1_n_0 ;
  wire \sum_data_s22[14]_i_1_n_0 ;
  wire \sum_data_s22[15]_i_1_n_0 ;
  wire \sum_data_s22[16]_i_1_n_0 ;
  wire \sum_data_s22[17]_i_1_n_0 ;
  wire \sum_data_s22[18]_i_1_n_0 ;
  wire \sum_data_s22[19]_i_1_n_0 ;
  wire \sum_data_s22[1]_i_1_n_0 ;
  wire \sum_data_s22[20]_i_1_n_0 ;
  wire \sum_data_s22[21]_i_1__0_n_0 ;
  wire \sum_data_s22[21]_i_2_n_0 ;
  wire \sum_data_s22[21]_i_3_n_0 ;
  wire \sum_data_s22[2]_i_1_n_0 ;
  wire \sum_data_s22[3]_i_1_n_0 ;
  wire \sum_data_s22[4]_i_1_n_0 ;
  wire \sum_data_s22[5]_i_1_n_0 ;
  wire \sum_data_s22[6]_i_1_n_0 ;
  wire \sum_data_s22[7]_i_1_n_0 ;
  wire \sum_data_s22[8]_i_1_n_0 ;
  wire \sum_data_s22[9]_i_1_n_0 ;
  wire \sum_data_s22_reg_n_0_[19] ;
  wire \sum_data_s22_reg_n_0_[20] ;
  wire \sum_data_s22_reg_n_0_[21] ;
  wire [4:0]sum_frame;
  wire sum_overflow_reg_i_1_n_0;
  wire sum_overflow_reg_reg_n_0;
  wire sum_s221;
  wire sum_s221_0;
  wire sum_s221_carry_i_1_n_0;
  wire sum_s221_carry_i_2_n_0;
  wire sum_s221_carry_n_3;
  wire \sum_s221_inferred__0/i__carry_n_3 ;
  wire sum_valid;
  wire [3:3]\NLW_avg_wr_data_q2_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:2]NLW_overflow_count0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_overflow_count0_carry__6_O_UNCONNECTED;
  wire [3:3]\NLW_overflow_count[28]_INST_0_CO_UNCONNECTED ;
  wire [3:2]\NLW_raw_sum_ext_reg[22]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_raw_sum_ext_reg[22]_i_1_O_UNCONNECTED ;
  wire [3:2]NLW_sum_s221_carry_CO_UNCONNECTED;
  wire [3:0]NLW_sum_s221_carry_O_UNCONNECTED;
  wire [3:2]\NLW_sum_s221_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_sum_s221_inferred__0/i__carry_O_UNCONNECTED ;

  FDRE \acc_wr_addr_reg[0] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[0]),
        .Q(acc_wr_addr[0]),
        .R(SR));
  FDRE \acc_wr_addr_reg[1] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[1]),
        .Q(acc_wr_addr[1]),
        .R(SR));
  FDRE \acc_wr_addr_reg[2] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[2]),
        .Q(acc_wr_addr[2]),
        .R(SR));
  FDRE \acc_wr_addr_reg[3] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[3]),
        .Q(acc_wr_addr[3]),
        .R(SR));
  FDRE \acc_wr_addr_reg[4] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[4]),
        .Q(acc_wr_addr[4]),
        .R(SR));
  FDRE \acc_wr_addr_reg[5] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[5]),
        .Q(acc_wr_addr[5]),
        .R(SR));
  FDRE \acc_wr_addr_reg[6] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[6]),
        .Q(acc_wr_addr[6]),
        .R(SR));
  FDRE \acc_wr_addr_reg[7] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[7]),
        .Q(acc_wr_addr[7]),
        .R(SR));
  FDRE \acc_wr_addr_reg[8] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_addr[8]),
        .Q(acc_wr_addr[8]),
        .R(SR));
  FDRE \acc_wr_data_reg[0] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[0]),
        .Q(acc_wr_data[0]),
        .R(SR));
  FDRE \acc_wr_data_reg[10] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[7]),
        .Q(acc_wr_data[10]),
        .R(SR));
  FDRE \acc_wr_data_reg[11] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[8]),
        .Q(acc_wr_data[11]),
        .R(SR));
  FDRE \acc_wr_data_reg[12] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[9]),
        .Q(acc_wr_data[12]),
        .R(SR));
  FDRE \acc_wr_data_reg[13] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[10]),
        .Q(acc_wr_data[13]),
        .R(SR));
  FDRE \acc_wr_data_reg[14] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[11]),
        .Q(acc_wr_data[14]),
        .R(SR));
  FDRE \acc_wr_data_reg[15] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[12]),
        .Q(acc_wr_data[15]),
        .R(SR));
  FDRE \acc_wr_data_reg[16] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[13]),
        .Q(acc_wr_data[16]),
        .R(SR));
  FDRE \acc_wr_data_reg[17] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[14]),
        .Q(acc_wr_data[17]),
        .R(SR));
  FDRE \acc_wr_data_reg[18] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[15]),
        .Q(acc_wr_data[18]),
        .R(SR));
  FDRE \acc_wr_data_reg[19] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[19] ),
        .Q(acc_wr_data[19]),
        .R(SR));
  FDRE \acc_wr_data_reg[1] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[1]),
        .Q(acc_wr_data[1]),
        .R(SR));
  FDRE \acc_wr_data_reg[20] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[20] ),
        .Q(acc_wr_data[20]),
        .R(SR));
  FDRE \acc_wr_data_reg[21] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(\sum_data_s22_reg_n_0_[21] ),
        .Q(acc_wr_data[21]),
        .R(SR));
  FDRE \acc_wr_data_reg[2] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[2]),
        .Q(acc_wr_data[2]),
        .R(SR));
  FDRE \acc_wr_data_reg[3] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(sum_data_s22[3]),
        .Q(acc_wr_data[3]),
        .R(SR));
  FDRE \acc_wr_data_reg[4] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[1]),
        .Q(acc_wr_data[4]),
        .R(SR));
  FDRE \acc_wr_data_reg[5] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[2]),
        .Q(acc_wr_data[5]),
        .R(SR));
  FDRE \acc_wr_data_reg[6] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[3]),
        .Q(acc_wr_data[6]),
        .R(SR));
  FDRE \acc_wr_data_reg[7] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[4]),
        .Q(acc_wr_data[7]),
        .R(SR));
  FDRE \acc_wr_data_reg[8] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[5]),
        .Q(acc_wr_data[8]),
        .R(SR));
  FDRE \acc_wr_data_reg[9] 
       (.C(clk_acq),
        .CE(sum_valid),
        .D(p_0_in8_in[6]),
        .Q(acc_wr_data[9]),
        .R(SR));
  FDRE acc_wr_en_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(sum_valid),
        .Q(acc_wr_en),
        .R(SR));
  system_echo_pipeline_0_0_accum_tdp_bram accum_ram
       (.E(pipe_valid),
        .Q({\input_addr_reg_n_0_[8] ,\input_addr_reg_n_0_[7] ,\input_addr_reg_n_0_[6] ,\input_addr_reg_n_0_[5] ,\input_addr_reg_n_0_[4] ,\input_addr_reg_n_0_[3] ,\input_addr_reg_n_0_[2] ,\input_addr_reg_n_0_[1] ,\input_addr_reg_n_0_[0] }),
        .S({accum_ram_n_22,accum_ram_n_23}),
        .WEBWE(acc_wr_en),
        .acc_rd_en(acc_rd_en),
        .clk_acq(clk_acq),
        .frame_meta(frame_meta),
        .mem_reg_0(read_accum_s22),
        .mem_reg_1({accum_ram_n_24,accum_ram_n_25,accum_ram_n_26,accum_ram_n_27}),
        .mem_reg_10(busy_reg_n_0),
        .mem_reg_11(mem_reg),
        .mem_reg_12(pipe_frame),
        .mem_reg_2({accum_ram_n_28,accum_ram_n_29}),
        .mem_reg_3(acc_wr_addr),
        .mem_reg_4(acc_wr_data),
        .mem_reg_5(mem_reg_0),
        .mem_reg_6(mem_reg_1),
        .mem_reg_7(mem_reg_2),
        .mem_reg_8(mem_reg_3),
        .mem_reg_9(input_complete_reg_n_0),
        .\raw_sum_ext_reg[15] (read_sample_s14[13]),
        .rst_acq(rst_acq),
        .start_pulse(start_pulse));
  FDRE \avg_wr_addr_reg[0] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[0]),
        .Q(rise_wr_addr[0]),
        .R(SR));
  FDRE \avg_wr_addr_reg[1] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[1]),
        .Q(rise_wr_addr[1]),
        .R(SR));
  FDRE \avg_wr_addr_reg[2] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[2]),
        .Q(rise_wr_addr[2]),
        .R(SR));
  FDRE \avg_wr_addr_reg[3] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[3]),
        .Q(rise_wr_addr[3]),
        .R(SR));
  FDRE \avg_wr_addr_reg[4] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[4]),
        .Q(rise_wr_addr[4]),
        .R(SR));
  FDRE \avg_wr_addr_reg[5] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[5]),
        .Q(rise_wr_addr[5]),
        .R(SR));
  FDRE \avg_wr_addr_reg[6] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[6]),
        .Q(rise_wr_addr[6]),
        .R(SR));
  FDRE \avg_wr_addr_reg[7] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[7]),
        .Q(rise_wr_addr[7]),
        .R(SR));
  FDRE \avg_wr_addr_reg[8] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(sum_addr[8]),
        .Q(rise_wr_addr[8]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0FE0)) 
    \avg_wr_data_q2[3]_i_2 
       (.I0(sum_data_s22[1]),
        .I1(sum_data_s22[0]),
        .I2(sum_data_s22[2]),
        .I3(sum_data_s22[3]),
        .O(\avg_wr_data_q2[3]_i_2_n_0 ));
  FDRE \avg_wr_data_q2_reg[0] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[0]),
        .Q(rise_wr_data_q2[0]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[10] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[10]),
        .Q(rise_wr_data_q2[10]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[11] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[11]),
        .Q(rise_wr_data_q2[11]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[11]_i_1 
       (.CI(\avg_wr_data_q2_reg[7]_i_1_n_0 ),
        .CO({\avg_wr_data_q2_reg[11]_i_1_n_0 ,\avg_wr_data_q2_reg[11]_i_1_n_1 ,\avg_wr_data_q2_reg[11]_i_1_n_2 ,\avg_wr_data_q2_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(average_q2_ties_even_return[11:8]),
        .S(p_0_in8_in[11:8]));
  FDRE \avg_wr_data_q2_reg[12] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[12]),
        .Q(rise_wr_data_q2[12]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[13] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[13]),
        .Q(rise_wr_data_q2[13]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[14] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[14]),
        .Q(rise_wr_data_q2[14]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[15] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[15]),
        .Q(rise_wr_data_q2[15]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[15]_i_1 
       (.CI(\avg_wr_data_q2_reg[11]_i_1_n_0 ),
        .CO({\NLW_avg_wr_data_q2_reg[15]_i_1_CO_UNCONNECTED [3],\avg_wr_data_q2_reg[15]_i_1_n_1 ,\avg_wr_data_q2_reg[15]_i_1_n_2 ,\avg_wr_data_q2_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(average_q2_ties_even_return[15:12]),
        .S(p_0_in8_in[15:12]));
  FDRE \avg_wr_data_q2_reg[1] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[1]),
        .Q(rise_wr_data_q2[1]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[2] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[2]),
        .Q(rise_wr_data_q2[2]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[3] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[3]),
        .Q(rise_wr_data_q2[3]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\avg_wr_data_q2_reg[3]_i_1_n_0 ,\avg_wr_data_q2_reg[3]_i_1_n_1 ,\avg_wr_data_q2_reg[3]_i_1_n_2 ,\avg_wr_data_q2_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,sum_data_s22[3]}),
        .O(average_q2_ties_even_return[3:0]),
        .S({p_0_in8_in[3:1],\avg_wr_data_q2[3]_i_2_n_0 }));
  FDRE \avg_wr_data_q2_reg[4] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[4]),
        .Q(rise_wr_data_q2[4]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[5] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[5]),
        .Q(rise_wr_data_q2[5]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[6] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[6]),
        .Q(rise_wr_data_q2[6]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[7] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[7]),
        .Q(rise_wr_data_q2[7]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \avg_wr_data_q2_reg[7]_i_1 
       (.CI(\avg_wr_data_q2_reg[3]_i_1_n_0 ),
        .CO({\avg_wr_data_q2_reg[7]_i_1_n_0 ,\avg_wr_data_q2_reg[7]_i_1_n_1 ,\avg_wr_data_q2_reg[7]_i_1_n_2 ,\avg_wr_data_q2_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(average_q2_ties_even_return[7:4]),
        .S(p_0_in8_in[7:4]));
  FDRE \avg_wr_data_q2_reg[8] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[8]),
        .Q(rise_wr_data_q2[8]),
        .R(SR));
  FDRE \avg_wr_data_q2_reg[9] 
       (.C(clk_acq),
        .CE(avg_wr_en_i_2_n_0),
        .D(average_q2_ties_even_return[9]),
        .Q(rise_wr_data_q2[9]),
        .R(SR));
  LUT3 #(
    .INIT(8'hF2)) 
    avg_wr_en_i_1
       (.I0(mem_reg),
        .I1(start_pulse),
        .I2(rst_acq),
        .O(SR));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    avg_wr_en_i_2
       (.I0(sum_valid),
        .I1(sum_frame[2]),
        .I2(sum_frame[3]),
        .I3(sum_frame[4]),
        .I4(sum_frame[0]),
        .I5(sum_frame[1]),
        .O(avg_wr_en_i_2_n_0));
  FDRE avg_wr_en_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(avg_wr_en_i_2_n_0),
        .Q(rise_wr_en),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h00003130)) 
    busy_i_1__0
       (.I0(mem_reg),
        .I1(rst_acq),
        .I2(start_pulse),
        .I3(busy_reg_n_0),
        .I4(finish_pending_reg_n_0),
        .O(busy_i_1__0_n_0));
  FDRE busy_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(busy_i_1__0_n_0),
        .Q(busy_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    clip_flag_snapshot_INST_0
       (.I0(rise_clip),
        .I1(fall_clip),
        .O(clip_flag_snapshot));
  LUT5 #(
    .INIT(32'hCFAA00AA)) 
    clip_flag_snapshot_i_1
       (.I0(clip_flag_work),
        .I1(busy_reg_n_0),
        .I2(start_pulse),
        .I3(finish_pending_i_2_n_0),
        .I4(rise_clip),
        .O(clip_flag_snapshot_i_1_n_0));
  FDRE clip_flag_snapshot_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(clip_flag_snapshot_i_1_n_0),
        .Q(rise_clip),
        .R(SR));
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_flag_work_i_1
       (.I0(clip_flag_work_i_2_n_0),
        .I1(sample_clip),
        .I2(clip_flag_work),
        .I3(clip_flag_work_i_3_n_0),
        .O(clip_flag_work0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    clip_flag_work_i_2
       (.I0(clip_flag_work_i_4_n_0),
        .I1(clip_flag_work_i_5_n_0),
        .I2(sample_rise_u14[1]),
        .I3(sample_rise_u14[0]),
        .I4(sample_rise_u14[11]),
        .I5(sample_rise_u14[5]),
        .O(clip_flag_work_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    clip_flag_work_i_3
       (.I0(clip_flag_work_i_6_n_0),
        .I1(clip_flag_work_i_7_n_0),
        .I2(sample_rise_u14[12]),
        .I3(sample_rise_u14[13]),
        .I4(sample_rise_u14[6]),
        .I5(sample_rise_u14[4]),
        .O(clip_flag_work_i_3_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    clip_flag_work_i_4
       (.I0(sample_rise_u14[9]),
        .I1(sample_rise_u14[7]),
        .I2(sample_rise_u14[2]),
        .I3(sample_rise_u14[6]),
        .I4(sample_rise_u14[3]),
        .I5(sample_rise_u14[8]),
        .O(clip_flag_work_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    clip_flag_work_i_5
       (.I0(sample_rise_u14[4]),
        .I1(sample_rise_u14[13]),
        .I2(sample_rise_u14[12]),
        .I3(sample_rise_u14[10]),
        .O(clip_flag_work_i_5_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    clip_flag_work_i_6
       (.I0(sample_rise_u14[1]),
        .I1(sample_rise_u14[2]),
        .I2(sample_rise_u14[0]),
        .I3(sample_rise_u14[3]),
        .I4(sample_rise_u14[11]),
        .I5(sample_rise_u14[5]),
        .O(clip_flag_work_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    clip_flag_work_i_7
       (.I0(sample_rise_u14[9]),
        .I1(sample_rise_u14[7]),
        .I2(sample_rise_u14[10]),
        .I3(sample_rise_u14[8]),
        .O(clip_flag_work_i_7_n_0));
  FDRE clip_flag_work_reg
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(clip_flag_work0),
        .Q(clip_flag_work),
        .R(\input_addr[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    finish_pending_i_1
       (.I0(finish_pending_reg_n_0),
        .I1(finish_pending_i_2_n_0),
        .O(finish_pending_i_1_n_0));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFFFFFFF)) 
    finish_pending_i_2
       (.I0(finish_pending_i_3_n_0),
        .I1(finish_pending_i_4_n_0),
        .I2(sum_addr[7]),
        .I3(sum_valid),
        .I4(sum_addr[5]),
        .I5(sum_addr[1]),
        .O(finish_pending_i_2_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    finish_pending_i_3
       (.I0(sum_frame[1]),
        .I1(sum_frame[0]),
        .I2(sum_frame[4]),
        .I3(sum_frame[3]),
        .I4(sum_frame[2]),
        .O(finish_pending_i_3_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    finish_pending_i_4
       (.I0(sum_addr[8]),
        .I1(sum_addr[3]),
        .I2(sum_addr[2]),
        .I3(sum_addr[4]),
        .I4(sum_addr[0]),
        .I5(sum_addr[6]),
        .O(finish_pending_i_4_n_0));
  FDRE finish_pending_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(finish_pending_i_1_n_0),
        .Q(finish_pending_reg_n_0),
        .R(SR));
  FDRE group_done_pulse_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(finish_pending_reg_n_0),
        .Q(rise_done),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1
       (.I0(\raw_sum_ext_reg_n_0_[21] ),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_2
       (.I0(\raw_sum_ext_reg_n_0_[21] ),
        .I1(\raw_sum_ext_reg_n_0_[20] ),
        .O(i__carry_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \input_addr[0]_i_1 
       (.I0(\input_addr_reg_n_0_[0] ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \input_addr[1]_i_1 
       (.I0(\input_addr_reg_n_0_[0] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \input_addr[2]_i_1 
       (.I0(\input_addr_reg_n_0_[2] ),
        .I1(\input_addr_reg_n_0_[0] ),
        .I2(\input_addr_reg_n_0_[1] ),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \input_addr[3]_i_1 
       (.I0(\input_addr_reg_n_0_[3] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[2] ),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \input_addr[4]_i_1 
       (.I0(\input_addr_reg_n_0_[4] ),
        .I1(\input_addr_reg_n_0_[2] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[1] ),
        .I4(\input_addr_reg_n_0_[3] ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \input_addr[5]_i_1 
       (.I0(\input_addr_reg_n_0_[5] ),
        .I1(\input_addr_reg_n_0_[4] ),
        .I2(\input_addr_reg_n_0_[2] ),
        .I3(\input_addr_reg_n_0_[0] ),
        .I4(\input_addr_reg_n_0_[1] ),
        .I5(\input_addr_reg_n_0_[3] ),
        .O(\input_addr[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \input_addr[6]_i_1 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \input_addr[7]_i_1 
       (.I0(\input_addr_reg_n_0_[7] ),
        .I1(\input_addr_reg_n_0_[5] ),
        .I2(\input_addr[8]_i_3_n_0 ),
        .I3(\input_addr_reg_n_0_[6] ),
        .O(p_1_in[7]));
  LUT4 #(
    .INIT(16'hFF5C)) 
    \input_addr[8]_i_1 
       (.I0(busy_reg_n_0),
        .I1(mem_reg),
        .I2(start_pulse),
        .I3(rst_acq),
        .O(\input_addr[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hDFFF2000)) 
    \input_addr[8]_i_2 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr_reg_n_0_[7] ),
        .I4(\input_addr_reg_n_0_[8] ),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \input_addr[8]_i_3 
       (.I0(\input_addr_reg_n_0_[3] ),
        .I1(\input_addr_reg_n_0_[1] ),
        .I2(\input_addr_reg_n_0_[0] ),
        .I3(\input_addr_reg_n_0_[2] ),
        .I4(\input_addr_reg_n_0_[4] ),
        .O(\input_addr[8]_i_3_n_0 ));
  FDRE \input_addr_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[0]),
        .Q(\input_addr_reg_n_0_[0] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[1]),
        .Q(\input_addr_reg_n_0_[1] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[2]),
        .Q(\input_addr_reg_n_0_[2] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[3]),
        .Q(\input_addr_reg_n_0_[3] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[4]),
        .Q(\input_addr_reg_n_0_[4] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr[5]_i_1_n_0 ),
        .Q(\input_addr_reg_n_0_[5] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[6]),
        .Q(\input_addr_reg_n_0_[6] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[7]),
        .Q(\input_addr_reg_n_0_[7] ),
        .R(\input_addr[8]_i_1_n_0 ));
  FDRE \input_addr_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(p_1_in[8]),
        .Q(\input_addr_reg_n_0_[8] ),
        .R(\input_addr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7555555530000000)) 
    input_complete_i_1
       (.I0(busy0),
        .I1(\input_frame[4]_i_3_n_0 ),
        .I2(\input_addr_reg_n_0_[8] ),
        .I3(acc_rd_en),
        .I4(\input_frame[4]_i_4_n_0 ),
        .I5(input_complete_reg_n_0),
        .O(input_complete_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    input_complete_i_2
       (.I0(start_pulse),
        .I1(busy_reg_n_0),
        .O(busy0));
  FDRE input_complete_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(input_complete_i_1_n_0),
        .Q(input_complete_reg_n_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h00000040)) 
    \input_frame[0]_i_1 
       (.I0(\input_frame[4]_i_3_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_4_n_0 ),
        .I4(\input_frame_reg_n_0_[0] ),
        .O(\input_frame[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000400000)) 
    \input_frame[1]_i_1 
       (.I0(\input_frame[4]_i_3_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_4_n_0 ),
        .I4(\input_frame_reg_n_0_[1] ),
        .I5(\input_frame_reg_n_0_[0] ),
        .O(\input_frame[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008080808000000)) 
    \input_frame[2]_i_1 
       (.I0(acc_rd_en),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(\input_frame[4]_i_3_n_0 ),
        .I3(\input_frame_reg_n_0_[0] ),
        .I4(\input_frame_reg_n_0_[1] ),
        .I5(\input_frame_reg_n_0_[2] ),
        .O(\input_frame[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0888888880000000)) 
    \input_frame[3]_i_1 
       (.I0(acc_rd_en),
        .I1(\input_frame[3]_i_2_n_0 ),
        .I2(\input_frame_reg_n_0_[1] ),
        .I3(\input_frame_reg_n_0_[0] ),
        .I4(\input_frame_reg_n_0_[2] ),
        .I5(\input_frame_reg_n_0_[3] ),
        .O(\input_frame[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \input_frame[3]_i_2 
       (.I0(\input_addr_reg_n_0_[8] ),
        .I1(\input_addr_reg_n_0_[7] ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr[8]_i_3_n_0 ),
        .I4(\input_addr_reg_n_0_[6] ),
        .O(\input_frame[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h444444444F444444)) 
    \input_frame[4]_i_1 
       (.I0(busy_reg_n_0),
        .I1(start_pulse),
        .I2(\input_frame[4]_i_3_n_0 ),
        .I3(\input_addr_reg_n_0_[8] ),
        .I4(acc_rd_en),
        .I5(\input_frame[4]_i_4_n_0 ),
        .O(\input_frame[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00404000)) 
    \input_frame[4]_i_2 
       (.I0(\input_frame[4]_i_3_n_0 ),
        .I1(\input_addr_reg_n_0_[8] ),
        .I2(acc_rd_en),
        .I3(\input_frame[4]_i_5_n_0 ),
        .I4(\input_frame_reg_n_0_[4] ),
        .O(\input_frame[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \input_frame[4]_i_3 
       (.I0(\input_addr_reg_n_0_[6] ),
        .I1(\input_addr[8]_i_3_n_0 ),
        .I2(\input_addr_reg_n_0_[5] ),
        .I3(\input_addr_reg_n_0_[7] ),
        .O(\input_frame[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \input_frame[4]_i_4 
       (.I0(\input_frame_reg_n_0_[3] ),
        .I1(\input_frame_reg_n_0_[1] ),
        .I2(\input_frame_reg_n_0_[0] ),
        .I3(\input_frame_reg_n_0_[2] ),
        .I4(\input_frame_reg_n_0_[4] ),
        .O(\input_frame[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \input_frame[4]_i_5 
       (.I0(\input_frame_reg_n_0_[2] ),
        .I1(\input_frame_reg_n_0_[0] ),
        .I2(\input_frame_reg_n_0_[1] ),
        .I3(\input_frame_reg_n_0_[3] ),
        .O(\input_frame[4]_i_5_n_0 ));
  FDRE \input_frame_reg[0] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1_n_0 ),
        .D(\input_frame[0]_i_1_n_0 ),
        .Q(\input_frame_reg_n_0_[0] ),
        .R(SR));
  FDRE \input_frame_reg[1] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1_n_0 ),
        .D(\input_frame[1]_i_1_n_0 ),
        .Q(\input_frame_reg_n_0_[1] ),
        .R(SR));
  FDRE \input_frame_reg[2] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1_n_0 ),
        .D(\input_frame[2]_i_1_n_0 ),
        .Q(\input_frame_reg_n_0_[2] ),
        .R(SR));
  FDRE \input_frame_reg[3] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1_n_0 ),
        .D(\input_frame[3]_i_1_n_0 ),
        .Q(\input_frame_reg_n_0_[3] ),
        .R(SR));
  FDRE \input_frame_reg[4] 
       (.C(clk_acq),
        .CE(\input_frame[4]_i_1_n_0 ),
        .D(\input_frame[4]_i_2_n_0 ),
        .Q(\input_frame_reg_n_0_[4] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry
       (.CI(1'b0),
        .CO({overflow_count0_carry_n_0,overflow_count0_carry_n_1,overflow_count0_carry_n_2,overflow_count0_carry_n_3}),
        .CYINIT(\overflow_count_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[4:1]),
        .S({\overflow_count_reg_n_0_[4] ,\overflow_count_reg_n_0_[3] ,\overflow_count_reg_n_0_[2] ,\overflow_count_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__0
       (.CI(overflow_count0_carry_n_0),
        .CO({overflow_count0_carry__0_n_0,overflow_count0_carry__0_n_1,overflow_count0_carry__0_n_2,overflow_count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[8:5]),
        .S({\overflow_count_reg_n_0_[8] ,\overflow_count_reg_n_0_[7] ,\overflow_count_reg_n_0_[6] ,\overflow_count_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__1
       (.CI(overflow_count0_carry__0_n_0),
        .CO({overflow_count0_carry__1_n_0,overflow_count0_carry__1_n_1,overflow_count0_carry__1_n_2,overflow_count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[12:9]),
        .S({\overflow_count_reg_n_0_[12] ,\overflow_count_reg_n_0_[11] ,\overflow_count_reg_n_0_[10] ,\overflow_count_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__2
       (.CI(overflow_count0_carry__1_n_0),
        .CO({overflow_count0_carry__2_n_0,overflow_count0_carry__2_n_1,overflow_count0_carry__2_n_2,overflow_count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[16:13]),
        .S({\overflow_count_reg_n_0_[16] ,\overflow_count_reg_n_0_[15] ,\overflow_count_reg_n_0_[14] ,\overflow_count_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__3
       (.CI(overflow_count0_carry__2_n_0),
        .CO({overflow_count0_carry__3_n_0,overflow_count0_carry__3_n_1,overflow_count0_carry__3_n_2,overflow_count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[20:17]),
        .S({\overflow_count_reg_n_0_[20] ,\overflow_count_reg_n_0_[19] ,\overflow_count_reg_n_0_[18] ,\overflow_count_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__4
       (.CI(overflow_count0_carry__3_n_0),
        .CO({overflow_count0_carry__4_n_0,overflow_count0_carry__4_n_1,overflow_count0_carry__4_n_2,overflow_count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[24:21]),
        .S({\overflow_count_reg_n_0_[24] ,\overflow_count_reg_n_0_[23] ,\overflow_count_reg_n_0_[22] ,\overflow_count_reg_n_0_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__5
       (.CI(overflow_count0_carry__4_n_0),
        .CO({overflow_count0_carry__5_n_0,overflow_count0_carry__5_n_1,overflow_count0_carry__5_n_2,overflow_count0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(overflow_count0[28:25]),
        .S({\overflow_count_reg_n_0_[28] ,\overflow_count_reg_n_0_[27] ,\overflow_count_reg_n_0_[26] ,\overflow_count_reg_n_0_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_count0_carry__6
       (.CI(overflow_count0_carry__5_n_0),
        .CO({NLW_overflow_count0_carry__6_CO_UNCONNECTED[3:2],overflow_count0_carry__6_n_2,overflow_count0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_overflow_count0_carry__6_O_UNCONNECTED[3],overflow_count0[31:29]}),
        .S({1'b0,Q,\overflow_count_reg_n_0_[30] ,\overflow_count_reg_n_0_[29] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[0]_INST_0 
       (.CI(1'b0),
        .CO({\overflow_count[0]_INST_0_n_0 ,\overflow_count[0]_INST_0_n_1 ,\overflow_count[0]_INST_0_n_2 ,\overflow_count[0]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[3] ,\overflow_count_reg_n_0_[2] ,\overflow_count_reg_n_0_[1] ,\overflow_count_reg_n_0_[0] }),
        .O(overflow_count[3:0]),
        .S({\overflow_count[0]_INST_0_i_1_n_0 ,\overflow_count[0]_INST_0_i_2_n_0 ,\overflow_count[0]_INST_0_i_3_n_0 ,\overflow_count[0]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[0]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[3] ),
        .I1(\average_overflow_count_reg[31] [3]),
        .O(\overflow_count[0]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[0]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[2] ),
        .I1(\average_overflow_count_reg[31] [2]),
        .O(\overflow_count[0]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[0]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[1] ),
        .I1(\average_overflow_count_reg[31] [1]),
        .O(\overflow_count[0]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[0]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[0] ),
        .I1(\average_overflow_count_reg[31] [0]),
        .O(\overflow_count[0]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \overflow_count[0]_i_1 
       (.I0(sum_overflow_reg_reg_n_0),
        .I1(sum_valid),
        .I2(\overflow_count_reg_n_0_[0] ),
        .O(p_1_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[10]_i_1 
       (.I0(overflow_count0[10]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[10]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[11]_i_1 
       (.I0(overflow_count0[11]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[12]_INST_0 
       (.CI(\overflow_count[8]_INST_0_n_0 ),
        .CO({\overflow_count[12]_INST_0_n_0 ,\overflow_count[12]_INST_0_n_1 ,\overflow_count[12]_INST_0_n_2 ,\overflow_count[12]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[15] ,\overflow_count_reg_n_0_[14] ,\overflow_count_reg_n_0_[13] ,\overflow_count_reg_n_0_[12] }),
        .O(overflow_count[15:12]),
        .S({\overflow_count[12]_INST_0_i_1_n_0 ,\overflow_count[12]_INST_0_i_2_n_0 ,\overflow_count[12]_INST_0_i_3_n_0 ,\overflow_count[12]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[12]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[15] ),
        .I1(\average_overflow_count_reg[31] [15]),
        .O(\overflow_count[12]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[12]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[14] ),
        .I1(\average_overflow_count_reg[31] [14]),
        .O(\overflow_count[12]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[12]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[13] ),
        .I1(\average_overflow_count_reg[31] [13]),
        .O(\overflow_count[12]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[12]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[12] ),
        .I1(\average_overflow_count_reg[31] [12]),
        .O(\overflow_count[12]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[12]_i_1 
       (.I0(overflow_count0[12]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[12]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[13]_i_1 
       (.I0(overflow_count0[13]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[13]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[14]_i_1 
       (.I0(overflow_count0[14]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[14]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[15]_i_1 
       (.I0(overflow_count0[15]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[16]_INST_0 
       (.CI(\overflow_count[12]_INST_0_n_0 ),
        .CO({\overflow_count[16]_INST_0_n_0 ,\overflow_count[16]_INST_0_n_1 ,\overflow_count[16]_INST_0_n_2 ,\overflow_count[16]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[19] ,\overflow_count_reg_n_0_[18] ,\overflow_count_reg_n_0_[17] ,\overflow_count_reg_n_0_[16] }),
        .O(overflow_count[19:16]),
        .S({\overflow_count[16]_INST_0_i_1_n_0 ,\overflow_count[16]_INST_0_i_2_n_0 ,\overflow_count[16]_INST_0_i_3_n_0 ,\overflow_count[16]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[16]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[19] ),
        .I1(\average_overflow_count_reg[31] [19]),
        .O(\overflow_count[16]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[16]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[18] ),
        .I1(\average_overflow_count_reg[31] [18]),
        .O(\overflow_count[16]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[16]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[17] ),
        .I1(\average_overflow_count_reg[31] [17]),
        .O(\overflow_count[16]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[16]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[16] ),
        .I1(\average_overflow_count_reg[31] [16]),
        .O(\overflow_count[16]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[16]_i_1 
       (.I0(overflow_count0[16]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[16]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[17]_i_1 
       (.I0(overflow_count0[17]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[17]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[18]_i_1 
       (.I0(overflow_count0[18]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[18]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[19]_i_1 
       (.I0(overflow_count0[19]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[19]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[1]_i_1 
       (.I0(overflow_count0[1]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[20]_INST_0 
       (.CI(\overflow_count[16]_INST_0_n_0 ),
        .CO({\overflow_count[20]_INST_0_n_0 ,\overflow_count[20]_INST_0_n_1 ,\overflow_count[20]_INST_0_n_2 ,\overflow_count[20]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[23] ,\overflow_count_reg_n_0_[22] ,\overflow_count_reg_n_0_[21] ,\overflow_count_reg_n_0_[20] }),
        .O(overflow_count[23:20]),
        .S({\overflow_count[20]_INST_0_i_1_n_0 ,\overflow_count[20]_INST_0_i_2_n_0 ,\overflow_count[20]_INST_0_i_3_n_0 ,\overflow_count[20]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[20]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[23] ),
        .I1(\average_overflow_count_reg[31] [23]),
        .O(\overflow_count[20]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[20]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[22] ),
        .I1(\average_overflow_count_reg[31] [22]),
        .O(\overflow_count[20]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[20]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[21] ),
        .I1(\average_overflow_count_reg[31] [21]),
        .O(\overflow_count[20]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[20]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[20] ),
        .I1(\average_overflow_count_reg[31] [20]),
        .O(\overflow_count[20]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[20]_i_1 
       (.I0(overflow_count0[20]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[20]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[21]_i_1 
       (.I0(overflow_count0[21]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[21]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[22]_i_1 
       (.I0(overflow_count0[22]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[22]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[23]_i_1 
       (.I0(overflow_count0[23]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[23]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[24]_INST_0 
       (.CI(\overflow_count[20]_INST_0_n_0 ),
        .CO({\overflow_count[24]_INST_0_n_0 ,\overflow_count[24]_INST_0_n_1 ,\overflow_count[24]_INST_0_n_2 ,\overflow_count[24]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[27] ,\overflow_count_reg_n_0_[26] ,\overflow_count_reg_n_0_[25] ,\overflow_count_reg_n_0_[24] }),
        .O(overflow_count[27:24]),
        .S({\overflow_count[24]_INST_0_i_1_n_0 ,\overflow_count[24]_INST_0_i_2_n_0 ,\overflow_count[24]_INST_0_i_3_n_0 ,\overflow_count[24]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[24]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[27] ),
        .I1(\average_overflow_count_reg[31] [27]),
        .O(\overflow_count[24]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[24]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[26] ),
        .I1(\average_overflow_count_reg[31] [26]),
        .O(\overflow_count[24]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[24]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[25] ),
        .I1(\average_overflow_count_reg[31] [25]),
        .O(\overflow_count[24]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[24]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[24] ),
        .I1(\average_overflow_count_reg[31] [24]),
        .O(\overflow_count[24]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[24]_i_1 
       (.I0(overflow_count0[24]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[24]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[25]_i_1 
       (.I0(overflow_count0[25]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[25]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[26]_i_1 
       (.I0(overflow_count0[26]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[26]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[27]_i_1 
       (.I0(overflow_count0[27]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[27]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[28]_INST_0 
       (.CI(\overflow_count[24]_INST_0_n_0 ),
        .CO({\NLW_overflow_count[28]_INST_0_CO_UNCONNECTED [3],\overflow_count[28]_INST_0_n_1 ,\overflow_count[28]_INST_0_n_2 ,\overflow_count[28]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\overflow_count_reg_n_0_[30] ,\overflow_count_reg_n_0_[29] ,\overflow_count_reg_n_0_[28] }),
        .O(overflow_count[31:28]),
        .S({S,\overflow_count[28]_INST_0_i_2_n_0 ,\overflow_count[28]_INST_0_i_3_n_0 ,\overflow_count[28]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[28]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[30] ),
        .I1(\average_overflow_count_reg[31] [30]),
        .O(\overflow_count[28]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[28]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[29] ),
        .I1(\average_overflow_count_reg[31] [29]),
        .O(\overflow_count[28]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[28]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[28] ),
        .I1(\average_overflow_count_reg[31] [28]),
        .O(\overflow_count[28]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[28]_i_1 
       (.I0(overflow_count0[28]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[28]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[29]_i_1 
       (.I0(overflow_count0[29]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[29]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[2]_i_1 
       (.I0(overflow_count0[2]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[30]_i_1 
       (.I0(overflow_count0[30]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[30]));
  LUT4 #(
    .INIT(16'hF444)) 
    \overflow_count[31]_i_1 
       (.I0(busy_reg_n_0),
        .I1(start_pulse),
        .I2(sum_overflow_reg_reg_n_0),
        .I3(sum_valid),
        .O(\overflow_count[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[31]_i_2 
       (.I0(overflow_count0[31]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[31]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[3]_i_1 
       (.I0(overflow_count0[3]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[4]_INST_0 
       (.CI(\overflow_count[0]_INST_0_n_0 ),
        .CO({\overflow_count[4]_INST_0_n_0 ,\overflow_count[4]_INST_0_n_1 ,\overflow_count[4]_INST_0_n_2 ,\overflow_count[4]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[7] ,\overflow_count_reg_n_0_[6] ,\overflow_count_reg_n_0_[5] ,\overflow_count_reg_n_0_[4] }),
        .O(overflow_count[7:4]),
        .S({\overflow_count[4]_INST_0_i_1_n_0 ,\overflow_count[4]_INST_0_i_2_n_0 ,\overflow_count[4]_INST_0_i_3_n_0 ,\overflow_count[4]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[4]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[7] ),
        .I1(\average_overflow_count_reg[31] [7]),
        .O(\overflow_count[4]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[4]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[6] ),
        .I1(\average_overflow_count_reg[31] [6]),
        .O(\overflow_count[4]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[4]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[5] ),
        .I1(\average_overflow_count_reg[31] [5]),
        .O(\overflow_count[4]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[4]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[4] ),
        .I1(\average_overflow_count_reg[31] [4]),
        .O(\overflow_count[4]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[4]_i_1 
       (.I0(overflow_count0[4]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[5]_i_1 
       (.I0(overflow_count0[5]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[6]_i_1 
       (.I0(overflow_count0[6]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[7]_i_1 
       (.I0(overflow_count0[7]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \overflow_count[8]_INST_0 
       (.CI(\overflow_count[4]_INST_0_n_0 ),
        .CO({\overflow_count[8]_INST_0_n_0 ,\overflow_count[8]_INST_0_n_1 ,\overflow_count[8]_INST_0_n_2 ,\overflow_count[8]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({\overflow_count_reg_n_0_[11] ,\overflow_count_reg_n_0_[10] ,\overflow_count_reg_n_0_[9] ,\overflow_count_reg_n_0_[8] }),
        .O(overflow_count[11:8]),
        .S({\overflow_count[8]_INST_0_i_1_n_0 ,\overflow_count[8]_INST_0_i_2_n_0 ,\overflow_count[8]_INST_0_i_3_n_0 ,\overflow_count[8]_INST_0_i_4_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[8]_INST_0_i_1 
       (.I0(\overflow_count_reg_n_0_[11] ),
        .I1(\average_overflow_count_reg[31] [11]),
        .O(\overflow_count[8]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[8]_INST_0_i_2 
       (.I0(\overflow_count_reg_n_0_[10] ),
        .I1(\average_overflow_count_reg[31] [10]),
        .O(\overflow_count[8]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[8]_INST_0_i_3 
       (.I0(\overflow_count_reg_n_0_[9] ),
        .I1(\average_overflow_count_reg[31] [9]),
        .O(\overflow_count[8]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \overflow_count[8]_INST_0_i_4 
       (.I0(\overflow_count_reg_n_0_[8] ),
        .I1(\average_overflow_count_reg[31] [8]),
        .O(\overflow_count[8]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[8]_i_1 
       (.I0(overflow_count0[8]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \overflow_count[9]_i_1 
       (.I0(overflow_count0[9]),
        .I1(sum_overflow_reg_reg_n_0),
        .I2(sum_valid),
        .O(p_1_in__0[9]));
  FDRE \overflow_count_reg[0] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[0]),
        .Q(\overflow_count_reg_n_0_[0] ),
        .R(SR));
  FDRE \overflow_count_reg[10] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[10]),
        .Q(\overflow_count_reg_n_0_[10] ),
        .R(SR));
  FDRE \overflow_count_reg[11] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[11]),
        .Q(\overflow_count_reg_n_0_[11] ),
        .R(SR));
  FDRE \overflow_count_reg[12] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[12]),
        .Q(\overflow_count_reg_n_0_[12] ),
        .R(SR));
  FDRE \overflow_count_reg[13] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[13]),
        .Q(\overflow_count_reg_n_0_[13] ),
        .R(SR));
  FDRE \overflow_count_reg[14] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[14]),
        .Q(\overflow_count_reg_n_0_[14] ),
        .R(SR));
  FDRE \overflow_count_reg[15] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[15]),
        .Q(\overflow_count_reg_n_0_[15] ),
        .R(SR));
  FDRE \overflow_count_reg[16] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[16]),
        .Q(\overflow_count_reg_n_0_[16] ),
        .R(SR));
  FDRE \overflow_count_reg[17] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[17]),
        .Q(\overflow_count_reg_n_0_[17] ),
        .R(SR));
  FDRE \overflow_count_reg[18] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[18]),
        .Q(\overflow_count_reg_n_0_[18] ),
        .R(SR));
  FDRE \overflow_count_reg[19] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[19]),
        .Q(\overflow_count_reg_n_0_[19] ),
        .R(SR));
  FDRE \overflow_count_reg[1] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[1]),
        .Q(\overflow_count_reg_n_0_[1] ),
        .R(SR));
  FDRE \overflow_count_reg[20] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[20]),
        .Q(\overflow_count_reg_n_0_[20] ),
        .R(SR));
  FDRE \overflow_count_reg[21] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[21]),
        .Q(\overflow_count_reg_n_0_[21] ),
        .R(SR));
  FDRE \overflow_count_reg[22] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[22]),
        .Q(\overflow_count_reg_n_0_[22] ),
        .R(SR));
  FDRE \overflow_count_reg[23] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[23]),
        .Q(\overflow_count_reg_n_0_[23] ),
        .R(SR));
  FDRE \overflow_count_reg[24] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[24]),
        .Q(\overflow_count_reg_n_0_[24] ),
        .R(SR));
  FDRE \overflow_count_reg[25] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[25]),
        .Q(\overflow_count_reg_n_0_[25] ),
        .R(SR));
  FDRE \overflow_count_reg[26] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[26]),
        .Q(\overflow_count_reg_n_0_[26] ),
        .R(SR));
  FDRE \overflow_count_reg[27] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[27]),
        .Q(\overflow_count_reg_n_0_[27] ),
        .R(SR));
  FDRE \overflow_count_reg[28] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[28]),
        .Q(\overflow_count_reg_n_0_[28] ),
        .R(SR));
  FDRE \overflow_count_reg[29] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[29]),
        .Q(\overflow_count_reg_n_0_[29] ),
        .R(SR));
  FDRE \overflow_count_reg[2] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[2]),
        .Q(\overflow_count_reg_n_0_[2] ),
        .R(SR));
  FDRE \overflow_count_reg[30] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[30]),
        .Q(\overflow_count_reg_n_0_[30] ),
        .R(SR));
  FDRE \overflow_count_reg[31] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[31]),
        .Q(Q),
        .R(SR));
  FDRE \overflow_count_reg[3] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[3]),
        .Q(\overflow_count_reg_n_0_[3] ),
        .R(SR));
  FDRE \overflow_count_reg[4] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[4]),
        .Q(\overflow_count_reg_n_0_[4] ),
        .R(SR));
  FDRE \overflow_count_reg[5] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[5]),
        .Q(\overflow_count_reg_n_0_[5] ),
        .R(SR));
  FDRE \overflow_count_reg[6] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[6]),
        .Q(\overflow_count_reg_n_0_[6] ),
        .R(SR));
  FDRE \overflow_count_reg[7] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[7]),
        .Q(\overflow_count_reg_n_0_[7] ),
        .R(SR));
  FDRE \overflow_count_reg[8] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[8]),
        .Q(\overflow_count_reg_n_0_[8] ),
        .R(SR));
  FDRE \overflow_count_reg[9] 
       (.C(clk_acq),
        .CE(\overflow_count[31]_i_1_n_0 ),
        .D(p_1_in__0[9]),
        .Q(\overflow_count_reg_n_0_[9] ),
        .R(SR));
  FDRE \pipe_addr_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[0] ),
        .Q(pipe_addr[0]),
        .R(SR));
  FDRE \pipe_addr_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[1] ),
        .Q(pipe_addr[1]),
        .R(SR));
  FDRE \pipe_addr_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[2] ),
        .Q(pipe_addr[2]),
        .R(SR));
  FDRE \pipe_addr_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[3] ),
        .Q(pipe_addr[3]),
        .R(SR));
  FDRE \pipe_addr_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[4] ),
        .Q(pipe_addr[4]),
        .R(SR));
  FDRE \pipe_addr_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[5] ),
        .Q(pipe_addr[5]),
        .R(SR));
  FDRE \pipe_addr_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[6] ),
        .Q(pipe_addr[6]),
        .R(SR));
  FDRE \pipe_addr_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[7] ),
        .Q(pipe_addr[7]),
        .R(SR));
  FDRE \pipe_addr_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_addr_reg_n_0_[8] ),
        .Q(pipe_addr[8]),
        .R(SR));
  FDRE \pipe_frame_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[0] ),
        .Q(pipe_frame[0]),
        .R(SR));
  FDRE \pipe_frame_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[1] ),
        .Q(pipe_frame[1]),
        .R(SR));
  FDRE \pipe_frame_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[2] ),
        .Q(pipe_frame[2]),
        .R(SR));
  FDRE \pipe_frame_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[3] ),
        .Q(pipe_frame[3]),
        .R(SR));
  FDRE \pipe_frame_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(\input_frame_reg_n_0_[4] ),
        .Q(pipe_frame[4]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \pipe_sample_s14[13]_i_1 
       (.I0(sample_rise_u14[13]),
        .O(sample_s14));
  FDRE \pipe_sample_s14_reg[0] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[0]),
        .Q(pipe_sample_s14[0]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[10] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[10]),
        .Q(pipe_sample_s14[10]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[11] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[11]),
        .Q(pipe_sample_s14[11]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[12] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[12]),
        .Q(pipe_sample_s14[12]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[13] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_s14),
        .Q(pipe_sample_s14[13]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[1] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[1]),
        .Q(pipe_sample_s14[1]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[2] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[2]),
        .Q(pipe_sample_s14[2]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[3] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[3]),
        .Q(pipe_sample_s14[3]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[4] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[4]),
        .Q(pipe_sample_s14[4]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[5] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[5]),
        .Q(pipe_sample_s14[5]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[6] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[6]),
        .Q(pipe_sample_s14[6]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[7] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[7]),
        .Q(pipe_sample_s14[7]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[8] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[8]),
        .Q(pipe_sample_s14[8]),
        .R(SR));
  FDRE \pipe_sample_s14_reg[9] 
       (.C(clk_acq),
        .CE(acc_rd_en),
        .D(sample_rise_u14[9]),
        .Q(pipe_sample_s14[9]),
        .R(SR));
  FDRE pipe_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(acc_rd_en),
        .Q(pipe_valid),
        .R(SR));
  FDRE \raw_sum_addr_reg[0] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[0]),
        .Q(raw_sum_addr[0]),
        .R(SR));
  FDRE \raw_sum_addr_reg[1] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[1]),
        .Q(raw_sum_addr[1]),
        .R(SR));
  FDRE \raw_sum_addr_reg[2] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[2]),
        .Q(raw_sum_addr[2]),
        .R(SR));
  FDRE \raw_sum_addr_reg[3] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[3]),
        .Q(raw_sum_addr[3]),
        .R(SR));
  FDRE \raw_sum_addr_reg[4] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[4]),
        .Q(raw_sum_addr[4]),
        .R(SR));
  FDRE \raw_sum_addr_reg[5] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[5]),
        .Q(raw_sum_addr[5]),
        .R(SR));
  FDRE \raw_sum_addr_reg[6] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[6]),
        .Q(raw_sum_addr[6]),
        .R(SR));
  FDRE \raw_sum_addr_reg[7] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[7]),
        .Q(raw_sum_addr[7]),
        .R(SR));
  FDRE \raw_sum_addr_reg[8] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_addr[8]),
        .Q(raw_sum_addr[8]),
        .R(SR));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_2 
       (.I0(read_accum_s22[11]),
        .I1(read_sample_s14[11]),
        .O(\raw_sum_ext[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_3 
       (.I0(read_accum_s22[10]),
        .I1(read_sample_s14[10]),
        .O(\raw_sum_ext[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_4 
       (.I0(read_accum_s22[9]),
        .I1(read_sample_s14[9]),
        .O(\raw_sum_ext[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[11]_i_5 
       (.I0(read_accum_s22[8]),
        .I1(read_sample_s14[8]),
        .O(\raw_sum_ext[11]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \raw_sum_ext[15]_i_2 
       (.I0(read_sample_s14[13]),
        .O(\raw_sum_ext[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_5 
       (.I0(read_sample_s14[13]),
        .I1(read_accum_s22[13]),
        .O(\raw_sum_ext[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[15]_i_6 
       (.I0(read_accum_s22[12]),
        .I1(read_sample_s14[12]),
        .O(\raw_sum_ext[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_2 
       (.I0(read_accum_s22[3]),
        .I1(read_sample_s14[3]),
        .O(\raw_sum_ext[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_3 
       (.I0(read_accum_s22[2]),
        .I1(read_sample_s14[2]),
        .O(\raw_sum_ext[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_4 
       (.I0(read_accum_s22[1]),
        .I1(read_sample_s14[1]),
        .O(\raw_sum_ext[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[3]_i_5 
       (.I0(read_accum_s22[0]),
        .I1(read_sample_s14[0]),
        .O(\raw_sum_ext[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_2 
       (.I0(read_accum_s22[7]),
        .I1(read_sample_s14[7]),
        .O(\raw_sum_ext[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_3 
       (.I0(read_accum_s22[6]),
        .I1(read_sample_s14[6]),
        .O(\raw_sum_ext[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_4 
       (.I0(read_accum_s22[5]),
        .I1(read_sample_s14[5]),
        .O(\raw_sum_ext[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \raw_sum_ext[7]_i_5 
       (.I0(read_accum_s22[4]),
        .I1(read_sample_s14[4]),
        .O(\raw_sum_ext[7]_i_5_n_0 ));
  FDRE \raw_sum_ext_reg[0] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[0]),
        .Q(\raw_sum_ext_reg_n_0_[0] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[10] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[10]),
        .Q(\raw_sum_ext_reg_n_0_[10] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[11] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[11]),
        .Q(\raw_sum_ext_reg_n_0_[11] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[11]_i_1 
       (.CI(\raw_sum_ext_reg[7]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[11]_i_1_n_0 ,\raw_sum_ext_reg[11]_i_1_n_1 ,\raw_sum_ext_reg[11]_i_1_n_2 ,\raw_sum_ext_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(read_accum_s22[11:8]),
        .O(p_0_in[11:8]),
        .S({\raw_sum_ext[11]_i_2_n_0 ,\raw_sum_ext[11]_i_3_n_0 ,\raw_sum_ext[11]_i_4_n_0 ,\raw_sum_ext[11]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[12] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[12]),
        .Q(\raw_sum_ext_reg_n_0_[12] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[13] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[13]),
        .Q(\raw_sum_ext_reg_n_0_[13] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[14] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[14]),
        .Q(\raw_sum_ext_reg_n_0_[14] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[15] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[15]),
        .Q(\raw_sum_ext_reg_n_0_[15] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[15]_i_1 
       (.CI(\raw_sum_ext_reg[11]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[15]_i_1_n_0 ,\raw_sum_ext_reg[15]_i_1_n_1 ,\raw_sum_ext_reg[15]_i_1_n_2 ,\raw_sum_ext_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({read_accum_s22[14],\raw_sum_ext[15]_i_2_n_0 ,read_sample_s14[13],read_accum_s22[12]}),
        .O(p_0_in[15:12]),
        .S({accum_ram_n_22,accum_ram_n_23,\raw_sum_ext[15]_i_5_n_0 ,\raw_sum_ext[15]_i_6_n_0 }));
  FDRE \raw_sum_ext_reg[16] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[16]),
        .Q(\raw_sum_ext_reg_n_0_[16] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[17] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[17]),
        .Q(\raw_sum_ext_reg_n_0_[17] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[18] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[18]),
        .Q(\raw_sum_ext_reg_n_0_[18] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[19] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[19]),
        .Q(\raw_sum_ext_reg_n_0_[19] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[19]_i_1 
       (.CI(\raw_sum_ext_reg[15]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[19]_i_1_n_0 ,\raw_sum_ext_reg[19]_i_1_n_1 ,\raw_sum_ext_reg[19]_i_1_n_2 ,\raw_sum_ext_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(read_accum_s22[18:15]),
        .O(p_0_in[19:16]),
        .S({accum_ram_n_24,accum_ram_n_25,accum_ram_n_26,accum_ram_n_27}));
  FDRE \raw_sum_ext_reg[1] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[1]),
        .Q(\raw_sum_ext_reg_n_0_[1] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[20] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[20]),
        .Q(\raw_sum_ext_reg_n_0_[20] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[21] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[21]),
        .Q(\raw_sum_ext_reg_n_0_[21] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[22] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[22]),
        .Q(\raw_sum_ext_reg_n_0_[22] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[22]_i_1 
       (.CI(\raw_sum_ext_reg[19]_i_1_n_0 ),
        .CO({\NLW_raw_sum_ext_reg[22]_i_1_CO_UNCONNECTED [3:2],\raw_sum_ext_reg[22]_i_1_n_2 ,\raw_sum_ext_reg[22]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,read_accum_s22[20:19]}),
        .O({\NLW_raw_sum_ext_reg[22]_i_1_O_UNCONNECTED [3],p_0_in[22:20]}),
        .S({1'b0,1'b1,accum_ram_n_28,accum_ram_n_29}));
  FDRE \raw_sum_ext_reg[2] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[2]),
        .Q(\raw_sum_ext_reg_n_0_[2] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[3] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[3]),
        .Q(\raw_sum_ext_reg_n_0_[3] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\raw_sum_ext_reg[3]_i_1_n_0 ,\raw_sum_ext_reg[3]_i_1_n_1 ,\raw_sum_ext_reg[3]_i_1_n_2 ,\raw_sum_ext_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(read_accum_s22[3:0]),
        .O(p_0_in[3:0]),
        .S({\raw_sum_ext[3]_i_2_n_0 ,\raw_sum_ext[3]_i_3_n_0 ,\raw_sum_ext[3]_i_4_n_0 ,\raw_sum_ext[3]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[4] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[4]),
        .Q(\raw_sum_ext_reg_n_0_[4] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[5] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[5]),
        .Q(\raw_sum_ext_reg_n_0_[5] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[6] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[6]),
        .Q(\raw_sum_ext_reg_n_0_[6] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[7] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[7]),
        .Q(\raw_sum_ext_reg_n_0_[7] ),
        .R(SR));
  CARRY4 \raw_sum_ext_reg[7]_i_1 
       (.CI(\raw_sum_ext_reg[3]_i_1_n_0 ),
        .CO({\raw_sum_ext_reg[7]_i_1_n_0 ,\raw_sum_ext_reg[7]_i_1_n_1 ,\raw_sum_ext_reg[7]_i_1_n_2 ,\raw_sum_ext_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(read_accum_s22[7:4]),
        .O(p_0_in[7:4]),
        .S({\raw_sum_ext[7]_i_2_n_0 ,\raw_sum_ext[7]_i_3_n_0 ,\raw_sum_ext[7]_i_4_n_0 ,\raw_sum_ext[7]_i_5_n_0 }));
  FDRE \raw_sum_ext_reg[8] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[8]),
        .Q(\raw_sum_ext_reg_n_0_[8] ),
        .R(SR));
  FDRE \raw_sum_ext_reg[9] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(p_0_in[9]),
        .Q(\raw_sum_ext_reg_n_0_[9] ),
        .R(SR));
  FDRE \raw_sum_frame_reg[0] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_frame[0]),
        .Q(raw_sum_frame[0]),
        .R(SR));
  FDRE \raw_sum_frame_reg[1] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_frame[1]),
        .Q(raw_sum_frame[1]),
        .R(SR));
  FDRE \raw_sum_frame_reg[2] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_frame[2]),
        .Q(raw_sum_frame[2]),
        .R(SR));
  FDRE \raw_sum_frame_reg[3] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_frame[3]),
        .Q(raw_sum_frame[3]),
        .R(SR));
  FDRE \raw_sum_frame_reg[4] 
       (.C(clk_acq),
        .CE(read_valid),
        .D(read_frame[4]),
        .Q(raw_sum_frame[4]),
        .R(SR));
  FDRE raw_sum_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(read_valid),
        .Q(raw_sum_valid),
        .R(SR));
  FDRE \read_addr_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[0]),
        .Q(read_addr[0]),
        .R(SR));
  FDRE \read_addr_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[1]),
        .Q(read_addr[1]),
        .R(SR));
  FDRE \read_addr_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[2]),
        .Q(read_addr[2]),
        .R(SR));
  FDRE \read_addr_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[3]),
        .Q(read_addr[3]),
        .R(SR));
  FDRE \read_addr_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[4]),
        .Q(read_addr[4]),
        .R(SR));
  FDRE \read_addr_reg[5] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[5]),
        .Q(read_addr[5]),
        .R(SR));
  FDRE \read_addr_reg[6] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[6]),
        .Q(read_addr[6]),
        .R(SR));
  FDRE \read_addr_reg[7] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[7]),
        .Q(read_addr[7]),
        .R(SR));
  FDRE \read_addr_reg[8] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_addr[8]),
        .Q(read_addr[8]),
        .R(SR));
  FDRE \read_frame_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[0]),
        .Q(read_frame[0]),
        .R(SR));
  FDRE \read_frame_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[1]),
        .Q(read_frame[1]),
        .R(SR));
  FDRE \read_frame_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[2]),
        .Q(read_frame[2]),
        .R(SR));
  FDRE \read_frame_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[3]),
        .Q(read_frame[3]),
        .R(SR));
  FDRE \read_frame_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_frame[4]),
        .Q(read_frame[4]),
        .R(SR));
  FDRE \read_sample_s14_reg[0] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[0]),
        .Q(read_sample_s14[0]),
        .R(SR));
  FDRE \read_sample_s14_reg[10] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[10]),
        .Q(read_sample_s14[10]),
        .R(SR));
  FDRE \read_sample_s14_reg[11] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[11]),
        .Q(read_sample_s14[11]),
        .R(SR));
  FDRE \read_sample_s14_reg[12] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[12]),
        .Q(read_sample_s14[12]),
        .R(SR));
  FDRE \read_sample_s14_reg[13] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[13]),
        .Q(read_sample_s14[13]),
        .R(SR));
  FDRE \read_sample_s14_reg[1] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[1]),
        .Q(read_sample_s14[1]),
        .R(SR));
  FDRE \read_sample_s14_reg[2] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[2]),
        .Q(read_sample_s14[2]),
        .R(SR));
  FDRE \read_sample_s14_reg[3] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[3]),
        .Q(read_sample_s14[3]),
        .R(SR));
  FDRE \read_sample_s14_reg[4] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[4]),
        .Q(read_sample_s14[4]),
        .R(SR));
  FDRE \read_sample_s14_reg[5] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[5]),
        .Q(read_sample_s14[5]),
        .R(SR));
  FDRE \read_sample_s14_reg[6] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[6]),
        .Q(read_sample_s14[6]),
        .R(SR));
  FDRE \read_sample_s14_reg[7] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[7]),
        .Q(read_sample_s14[7]),
        .R(SR));
  FDRE \read_sample_s14_reg[8] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[8]),
        .Q(read_sample_s14[8]),
        .R(SR));
  FDRE \read_sample_s14_reg[9] 
       (.C(clk_acq),
        .CE(pipe_valid),
        .D(pipe_sample_s14[9]),
        .Q(read_sample_s14[9]),
        .R(SR));
  FDRE read_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(pipe_valid),
        .Q(read_valid),
        .R(SR));
  FDRE \sum_addr_reg[0] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[0]),
        .Q(sum_addr[0]),
        .R(SR));
  FDRE \sum_addr_reg[1] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[1]),
        .Q(sum_addr[1]),
        .R(SR));
  FDRE \sum_addr_reg[2] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[2]),
        .Q(sum_addr[2]),
        .R(SR));
  FDRE \sum_addr_reg[3] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[3]),
        .Q(sum_addr[3]),
        .R(SR));
  FDRE \sum_addr_reg[4] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[4]),
        .Q(sum_addr[4]),
        .R(SR));
  FDRE \sum_addr_reg[5] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[5]),
        .Q(sum_addr[5]),
        .R(SR));
  FDRE \sum_addr_reg[6] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[6]),
        .Q(sum_addr[6]),
        .R(SR));
  FDRE \sum_addr_reg[7] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[7]),
        .Q(sum_addr[7]),
        .R(SR));
  FDRE \sum_addr_reg[8] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_addr[8]),
        .Q(sum_addr[8]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[0]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[0] ),
        .O(\sum_data_s22[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[10]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[10] ),
        .O(\sum_data_s22[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[11]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[11] ),
        .O(\sum_data_s22[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[12]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[12] ),
        .O(\sum_data_s22[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[13]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[13] ),
        .O(\sum_data_s22[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[14]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[14] ),
        .O(\sum_data_s22[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[15]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[15] ),
        .O(\sum_data_s22[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[16]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[16] ),
        .O(\sum_data_s22[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[17]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[17] ),
        .O(\sum_data_s22[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[18]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[18] ),
        .O(\sum_data_s22[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[19]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[19] ),
        .O(\sum_data_s22[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[1]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[1] ),
        .O(\sum_data_s22[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[20]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[20] ),
        .O(\sum_data_s22[20]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF2)) 
    \sum_data_s22[21]_i_1__0 
       (.I0(mem_reg),
        .I1(start_pulse),
        .I2(rst_acq),
        .O(\sum_data_s22[21]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hAE)) 
    \sum_data_s22[21]_i_2 
       (.I0(raw_sum_valid),
        .I1(mem_reg),
        .I2(start_pulse),
        .O(\sum_data_s22[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \sum_data_s22[21]_i_3 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[21] ),
        .O(\sum_data_s22[21]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[2]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[2] ),
        .O(\sum_data_s22[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[3]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[3] ),
        .O(\sum_data_s22[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[4]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[4] ),
        .O(\sum_data_s22[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[5]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[5] ),
        .O(\sum_data_s22[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[6]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[6] ),
        .O(\sum_data_s22[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[7]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[7] ),
        .O(\sum_data_s22[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[8]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[8] ),
        .O(\sum_data_s22[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sum_data_s22[9]_i_1 
       (.I0(sum_s221_0),
        .I1(sum_s221),
        .I2(\raw_sum_ext_reg_n_0_[9] ),
        .O(\sum_data_s22[9]_i_1_n_0 ));
  FDRE \sum_data_s22_reg[0] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[0]_i_1_n_0 ),
        .Q(sum_data_s22[0]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[10] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[10]_i_1_n_0 ),
        .Q(p_0_in8_in[7]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[11] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[11]_i_1_n_0 ),
        .Q(p_0_in8_in[8]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[12] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[12]_i_1_n_0 ),
        .Q(p_0_in8_in[9]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[13] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[13]_i_1_n_0 ),
        .Q(p_0_in8_in[10]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[14] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[14]_i_1_n_0 ),
        .Q(p_0_in8_in[11]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[15] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[15]_i_1_n_0 ),
        .Q(p_0_in8_in[12]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[16] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[16]_i_1_n_0 ),
        .Q(p_0_in8_in[13]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[17] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[17]_i_1_n_0 ),
        .Q(p_0_in8_in[14]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[18] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[18]_i_1_n_0 ),
        .Q(p_0_in8_in[15]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[19] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[19]_i_1_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[19] ),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[1] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[1]_i_1_n_0 ),
        .Q(sum_data_s22[1]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[20] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[20]_i_1_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[20] ),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[21] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[21]_i_3_n_0 ),
        .Q(\sum_data_s22_reg_n_0_[21] ),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[2] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[2]_i_1_n_0 ),
        .Q(sum_data_s22[2]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[3] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[3]_i_1_n_0 ),
        .Q(sum_data_s22[3]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[4] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[4]_i_1_n_0 ),
        .Q(p_0_in8_in[1]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[5] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[5]_i_1_n_0 ),
        .Q(p_0_in8_in[2]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[6] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[6]_i_1_n_0 ),
        .Q(p_0_in8_in[3]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[7] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[7]_i_1_n_0 ),
        .Q(p_0_in8_in[4]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[8] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[8]_i_1_n_0 ),
        .Q(p_0_in8_in[5]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_data_s22_reg[9] 
       (.C(clk_acq),
        .CE(\sum_data_s22[21]_i_2_n_0 ),
        .D(\sum_data_s22[9]_i_1_n_0 ),
        .Q(p_0_in8_in[6]),
        .R(\sum_data_s22[21]_i_1__0_n_0 ));
  FDRE \sum_frame_reg[0] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_frame[0]),
        .Q(sum_frame[0]),
        .R(SR));
  FDRE \sum_frame_reg[1] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_frame[1]),
        .Q(sum_frame[1]),
        .R(SR));
  FDRE \sum_frame_reg[2] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_frame[2]),
        .Q(sum_frame[2]),
        .R(SR));
  FDRE \sum_frame_reg[3] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_frame[3]),
        .Q(sum_frame[3]),
        .R(SR));
  FDRE \sum_frame_reg[4] 
       (.C(clk_acq),
        .CE(raw_sum_valid),
        .D(raw_sum_frame[4]),
        .Q(sum_frame[4]),
        .R(SR));
  LUT4 #(
    .INIT(16'hFBC8)) 
    sum_overflow_reg_i_1
       (.I0(sum_s221),
        .I1(raw_sum_valid),
        .I2(sum_s221_0),
        .I3(sum_overflow_reg_reg_n_0),
        .O(sum_overflow_reg_i_1_n_0));
  FDRE sum_overflow_reg_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(sum_overflow_reg_i_1_n_0),
        .Q(sum_overflow_reg_reg_n_0),
        .R(SR));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 sum_s221_carry
       (.CI(1'b0),
        .CO({NLW_sum_s221_carry_CO_UNCONNECTED[3:2],sum_s221_0,sum_s221_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\raw_sum_ext_reg_n_0_[21] }),
        .O(NLW_sum_s221_carry_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,sum_s221_carry_i_1_n_0,sum_s221_carry_i_2_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    sum_s221_carry_i_1
       (.I0(\raw_sum_ext_reg_n_0_[22] ),
        .O(sum_s221_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    sum_s221_carry_i_2
       (.I0(\raw_sum_ext_reg_n_0_[20] ),
        .I1(\raw_sum_ext_reg_n_0_[21] ),
        .O(sum_s221_carry_i_2_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \sum_s221_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\NLW_sum_s221_inferred__0/i__carry_CO_UNCONNECTED [3:2],sum_s221,\sum_s221_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i__carry_i_1_n_0}),
        .O(\NLW_sum_s221_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\raw_sum_ext_reg_n_0_[22] ,i__carry_i_2_n_0}));
  FDRE sum_valid_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(raw_sum_valid),
        .Q(sum_valid),
        .R(SR));
endmodule

(* FRAME_W = "6" *) (* INDEX_W = "9" *) (* M = "32" *) 
(* MAX_TRANSACTION_CYCLES = "70000" *) (* ORIG_REF_NAME = "frame_average_pair_bram" *) (* PAIRS = "512" *) 
(* PRETRIGGER_PAIRS = "64" *) 
module system_echo_pipeline_0_0_frame_average_pair_bram
   (clk_acq,
    rst_acq,
    start_pulse,
    sample_rise_u14,
    sample_fall_u14,
    pair_valid,
    sample_clip,
    tx_marker,
    frame_meta,
    busy,
    group_done_pulse,
    frame_error_pulse,
    frame_error_sticky,
    frames_seen,
    clip_flag_snapshot,
    overflow_count,
    rise_wr_en,
    rise_wr_addr,
    rise_wr_data_q2,
    fall_wr_en,
    fall_wr_addr,
    fall_wr_data_q2);
  input clk_acq;
  input rst_acq;
  input start_pulse;
  input [13:0]sample_rise_u14;
  input [13:0]sample_fall_u14;
  input pair_valid;
  input sample_clip;
  input tx_marker;
  input [31:0]frame_meta;
  output busy;
  output group_done_pulse;
  output frame_error_pulse;
  output frame_error_sticky;
  output [5:0]frames_seen;
  output clip_flag_snapshot;
  output [31:0]overflow_count;
  output rise_wr_en;
  output [8:0]rise_wr_addr;
  output [15:0]rise_wr_data_q2;
  output fall_wr_en;
  output [8:0]fall_wr_addr;
  output [15:0]fall_wr_data_q2;

  wire busy;
  wire clip_flag_snapshot;
  wire clk_acq;
  wire [0:0]elapsed_cycles;
  wire \elapsed_cycles[0]_i_2_n_0 ;
  wire [31:4]elapsed_cycles_reg;
  wire \elapsed_cycles_reg[0]_i_1_n_0 ;
  wire \elapsed_cycles_reg[0]_i_1_n_1 ;
  wire \elapsed_cycles_reg[0]_i_1_n_2 ;
  wire \elapsed_cycles_reg[0]_i_1_n_3 ;
  wire \elapsed_cycles_reg[0]_i_1_n_4 ;
  wire \elapsed_cycles_reg[0]_i_1_n_5 ;
  wire \elapsed_cycles_reg[0]_i_1_n_6 ;
  wire \elapsed_cycles_reg[0]_i_1_n_7 ;
  wire \elapsed_cycles_reg[12]_i_1_n_0 ;
  wire \elapsed_cycles_reg[12]_i_1_n_1 ;
  wire \elapsed_cycles_reg[12]_i_1_n_2 ;
  wire \elapsed_cycles_reg[12]_i_1_n_3 ;
  wire \elapsed_cycles_reg[12]_i_1_n_4 ;
  wire \elapsed_cycles_reg[12]_i_1_n_5 ;
  wire \elapsed_cycles_reg[12]_i_1_n_6 ;
  wire \elapsed_cycles_reg[12]_i_1_n_7 ;
  wire \elapsed_cycles_reg[16]_i_1_n_0 ;
  wire \elapsed_cycles_reg[16]_i_1_n_1 ;
  wire \elapsed_cycles_reg[16]_i_1_n_2 ;
  wire \elapsed_cycles_reg[16]_i_1_n_3 ;
  wire \elapsed_cycles_reg[16]_i_1_n_4 ;
  wire \elapsed_cycles_reg[16]_i_1_n_5 ;
  wire \elapsed_cycles_reg[16]_i_1_n_6 ;
  wire \elapsed_cycles_reg[16]_i_1_n_7 ;
  wire \elapsed_cycles_reg[20]_i_1_n_0 ;
  wire \elapsed_cycles_reg[20]_i_1_n_1 ;
  wire \elapsed_cycles_reg[20]_i_1_n_2 ;
  wire \elapsed_cycles_reg[20]_i_1_n_3 ;
  wire \elapsed_cycles_reg[20]_i_1_n_4 ;
  wire \elapsed_cycles_reg[20]_i_1_n_5 ;
  wire \elapsed_cycles_reg[20]_i_1_n_6 ;
  wire \elapsed_cycles_reg[20]_i_1_n_7 ;
  wire \elapsed_cycles_reg[24]_i_1_n_0 ;
  wire \elapsed_cycles_reg[24]_i_1_n_1 ;
  wire \elapsed_cycles_reg[24]_i_1_n_2 ;
  wire \elapsed_cycles_reg[24]_i_1_n_3 ;
  wire \elapsed_cycles_reg[24]_i_1_n_4 ;
  wire \elapsed_cycles_reg[24]_i_1_n_5 ;
  wire \elapsed_cycles_reg[24]_i_1_n_6 ;
  wire \elapsed_cycles_reg[24]_i_1_n_7 ;
  wire \elapsed_cycles_reg[28]_i_1_n_1 ;
  wire \elapsed_cycles_reg[28]_i_1_n_2 ;
  wire \elapsed_cycles_reg[28]_i_1_n_3 ;
  wire \elapsed_cycles_reg[28]_i_1_n_4 ;
  wire \elapsed_cycles_reg[28]_i_1_n_5 ;
  wire \elapsed_cycles_reg[28]_i_1_n_6 ;
  wire \elapsed_cycles_reg[28]_i_1_n_7 ;
  wire \elapsed_cycles_reg[4]_i_1_n_0 ;
  wire \elapsed_cycles_reg[4]_i_1_n_1 ;
  wire \elapsed_cycles_reg[4]_i_1_n_2 ;
  wire \elapsed_cycles_reg[4]_i_1_n_3 ;
  wire \elapsed_cycles_reg[4]_i_1_n_4 ;
  wire \elapsed_cycles_reg[4]_i_1_n_5 ;
  wire \elapsed_cycles_reg[4]_i_1_n_6 ;
  wire \elapsed_cycles_reg[4]_i_1_n_7 ;
  wire \elapsed_cycles_reg[8]_i_1_n_0 ;
  wire \elapsed_cycles_reg[8]_i_1_n_1 ;
  wire \elapsed_cycles_reg[8]_i_1_n_2 ;
  wire \elapsed_cycles_reg[8]_i_1_n_3 ;
  wire \elapsed_cycles_reg[8]_i_1_n_4 ;
  wire \elapsed_cycles_reg[8]_i_1_n_5 ;
  wire \elapsed_cycles_reg[8]_i_1_n_6 ;
  wire \elapsed_cycles_reg[8]_i_1_n_7 ;
  wire \elapsed_cycles_reg_n_0_[0] ;
  wire \elapsed_cycles_reg_n_0_[1] ;
  wire \elapsed_cycles_reg_n_0_[2] ;
  wire \elapsed_cycles_reg_n_0_[3] ;
  wire [0:0]expected_index;
  wire \expected_index[0]_i_1_n_0 ;
  wire \expected_index[1]_i_1_n_0 ;
  wire \expected_index[2]_i_1_n_0 ;
  wire \expected_index[3]_i_1_n_0 ;
  wire \expected_index[4]_i_1_n_0 ;
  wire \expected_index[5]_i_1_n_0 ;
  wire \expected_index[6]_i_1_n_0 ;
  wire \expected_index[7]_i_1_n_0 ;
  wire \expected_index[8]_i_2_n_0 ;
  wire \expected_index_reg_n_0_[0] ;
  wire \expected_index_reg_n_0_[1] ;
  wire \expected_index_reg_n_0_[2] ;
  wire \expected_index_reg_n_0_[3] ;
  wire \expected_index_reg_n_0_[4] ;
  wire \expected_index_reg_n_0_[5] ;
  wire \expected_index_reg_n_0_[6] ;
  wire \expected_index_reg_n_0_[7] ;
  wire \expected_index_reg_n_0_[8] ;
  wire fall_average_i_n_1;
  wire fall_average_i_n_10;
  wire fall_average_i_n_11;
  wire fall_average_i_n_12;
  wire fall_average_i_n_13;
  wire fall_average_i_n_14;
  wire fall_average_i_n_15;
  wire fall_average_i_n_16;
  wire fall_average_i_n_17;
  wire fall_average_i_n_18;
  wire fall_average_i_n_19;
  wire fall_average_i_n_2;
  wire fall_average_i_n_20;
  wire fall_average_i_n_21;
  wire fall_average_i_n_22;
  wire fall_average_i_n_23;
  wire fall_average_i_n_24;
  wire fall_average_i_n_25;
  wire fall_average_i_n_26;
  wire fall_average_i_n_27;
  wire fall_average_i_n_28;
  wire fall_average_i_n_29;
  wire fall_average_i_n_3;
  wire fall_average_i_n_30;
  wire fall_average_i_n_31;
  wire fall_average_i_n_33;
  wire fall_average_i_n_34;
  wire fall_average_i_n_35;
  wire fall_average_i_n_36;
  wire fall_average_i_n_37;
  wire fall_average_i_n_38;
  wire fall_average_i_n_39;
  wire fall_average_i_n_4;
  wire fall_average_i_n_40;
  wire fall_average_i_n_41;
  wire fall_average_i_n_42;
  wire fall_average_i_n_43;
  wire fall_average_i_n_44;
  wire fall_average_i_n_45;
  wire fall_average_i_n_46;
  wire fall_average_i_n_47;
  wire fall_average_i_n_48;
  wire fall_average_i_n_5;
  wire fall_average_i_n_6;
  wire fall_average_i_n_7;
  wire fall_average_i_n_8;
  wire fall_average_i_n_9;
  wire fall_clip;
  wire [8:0]fall_wr_addr;
  wire [15:0]fall_wr_data_q2;
  wire fall_wr_en;
  wire \first_mode[0]_i_1_n_0 ;
  wire \first_mode[1]_i_1_n_0 ;
  wire \first_mode[2]_i_1_n_0 ;
  wire \first_mode[2]_i_2_n_0 ;
  wire \first_mode[2]_i_4_n_0 ;
  wire \first_mode[2]_i_5_n_0 ;
  wire \first_mode[2]_i_6_n_0 ;
  wire \first_mode_reg_n_0_[0] ;
  wire \first_mode_reg_n_0_[1] ;
  wire \first_mode_reg_n_0_[2] ;
  wire frame_error_pulse;
  wire frame_error_pulse_i_1_n_0;
  wire frame_error_pulse_i_2_n_0;
  wire frame_error_pulse_i_3_n_0;
  wire frame_error_pulse_i_4_n_0;
  wire frame_error_pulse_i_5_n_0;
  wire frame_error_sticky;
  wire frame_error_sticky_i_1_n_0;
  wire [31:0]frame_meta;
  wire frame_open5_out;
  wire frame_open_i_1_n_0;
  wire frame_open_reg_n_0;
  wire [5:0]frames_seen;
  wire \frames_seen[5]_i_2_n_0 ;
  wire group_done_pulse;
  wire \last_frame_id_reg_n_0_[0] ;
  wire \last_frame_id_reg_n_0_[10] ;
  wire \last_frame_id_reg_n_0_[11] ;
  wire \last_frame_id_reg_n_0_[12] ;
  wire \last_frame_id_reg_n_0_[13] ;
  wire \last_frame_id_reg_n_0_[14] ;
  wire \last_frame_id_reg_n_0_[15] ;
  wire \last_frame_id_reg_n_0_[1] ;
  wire \last_frame_id_reg_n_0_[2] ;
  wire \last_frame_id_reg_n_0_[3] ;
  wire \last_frame_id_reg_n_0_[4] ;
  wire \last_frame_id_reg_n_0_[5] ;
  wire \last_frame_id_reg_n_0_[6] ;
  wire \last_frame_id_reg_n_0_[7] ;
  wire \last_frame_id_reg_n_0_[8] ;
  wire \last_frame_id_reg_n_0_[9] ;
  wire [31:0]overflow_count;
  wire [5:0]p_0_in;
  wire pair_valid;
  wire rise_average_i_n_3;
  wire rise_done;
  wire [8:0]rise_wr_addr;
  wire [15:0]rise_wr_data_q2;
  wire rise_wr_en;
  wire rst_acq;
  wire rst_acq0;
  wire sample_clip;
  wire [13:0]sample_fall_u14;
  wire [13:0]sample_rise_u14;
  wire start_pulse;
  wire tx_marker;
  wire [3:3]\NLW_elapsed_cycles_reg[28]_i_1_CO_UNCONNECTED ;

  FDRE busy_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(fall_average_i_n_33),
        .Q(busy),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \elapsed_cycles[0]_i_2 
       (.I0(\elapsed_cycles_reg_n_0_[0] ),
        .O(\elapsed_cycles[0]_i_2_n_0 ));
  FDRE \elapsed_cycles_reg[0] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[0]_i_1_n_7 ),
        .Q(\elapsed_cycles_reg_n_0_[0] ),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\elapsed_cycles_reg[0]_i_1_n_0 ,\elapsed_cycles_reg[0]_i_1_n_1 ,\elapsed_cycles_reg[0]_i_1_n_2 ,\elapsed_cycles_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\elapsed_cycles_reg[0]_i_1_n_4 ,\elapsed_cycles_reg[0]_i_1_n_5 ,\elapsed_cycles_reg[0]_i_1_n_6 ,\elapsed_cycles_reg[0]_i_1_n_7 }),
        .S({\elapsed_cycles_reg_n_0_[3] ,\elapsed_cycles_reg_n_0_[2] ,\elapsed_cycles_reg_n_0_[1] ,\elapsed_cycles[0]_i_2_n_0 }));
  FDRE \elapsed_cycles_reg[10] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[8]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[10]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[11] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[8]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[11]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[12] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[12]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[12]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[12]_i_1 
       (.CI(\elapsed_cycles_reg[8]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[12]_i_1_n_0 ,\elapsed_cycles_reg[12]_i_1_n_1 ,\elapsed_cycles_reg[12]_i_1_n_2 ,\elapsed_cycles_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[12]_i_1_n_4 ,\elapsed_cycles_reg[12]_i_1_n_5 ,\elapsed_cycles_reg[12]_i_1_n_6 ,\elapsed_cycles_reg[12]_i_1_n_7 }),
        .S(elapsed_cycles_reg[15:12]));
  FDRE \elapsed_cycles_reg[13] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[12]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[13]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[14] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[12]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[14]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[15] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[12]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[15]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[16] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[16]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[16]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[16]_i_1 
       (.CI(\elapsed_cycles_reg[12]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[16]_i_1_n_0 ,\elapsed_cycles_reg[16]_i_1_n_1 ,\elapsed_cycles_reg[16]_i_1_n_2 ,\elapsed_cycles_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[16]_i_1_n_4 ,\elapsed_cycles_reg[16]_i_1_n_5 ,\elapsed_cycles_reg[16]_i_1_n_6 ,\elapsed_cycles_reg[16]_i_1_n_7 }),
        .S(elapsed_cycles_reg[19:16]));
  FDRE \elapsed_cycles_reg[17] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[16]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[17]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[18] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[16]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[18]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[19] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[16]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[19]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[1] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[0]_i_1_n_6 ),
        .Q(\elapsed_cycles_reg_n_0_[1] ),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[20] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[20]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[20]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[20]_i_1 
       (.CI(\elapsed_cycles_reg[16]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[20]_i_1_n_0 ,\elapsed_cycles_reg[20]_i_1_n_1 ,\elapsed_cycles_reg[20]_i_1_n_2 ,\elapsed_cycles_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[20]_i_1_n_4 ,\elapsed_cycles_reg[20]_i_1_n_5 ,\elapsed_cycles_reg[20]_i_1_n_6 ,\elapsed_cycles_reg[20]_i_1_n_7 }),
        .S(elapsed_cycles_reg[23:20]));
  FDRE \elapsed_cycles_reg[21] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[20]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[21]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[22] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[20]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[22]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[23] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[20]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[23]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[24] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[24]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[24]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[24]_i_1 
       (.CI(\elapsed_cycles_reg[20]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[24]_i_1_n_0 ,\elapsed_cycles_reg[24]_i_1_n_1 ,\elapsed_cycles_reg[24]_i_1_n_2 ,\elapsed_cycles_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[24]_i_1_n_4 ,\elapsed_cycles_reg[24]_i_1_n_5 ,\elapsed_cycles_reg[24]_i_1_n_6 ,\elapsed_cycles_reg[24]_i_1_n_7 }),
        .S(elapsed_cycles_reg[27:24]));
  FDRE \elapsed_cycles_reg[25] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[24]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[25]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[26] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[24]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[26]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[27] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[24]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[27]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[28] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[28]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[28]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[28]_i_1 
       (.CI(\elapsed_cycles_reg[24]_i_1_n_0 ),
        .CO({\NLW_elapsed_cycles_reg[28]_i_1_CO_UNCONNECTED [3],\elapsed_cycles_reg[28]_i_1_n_1 ,\elapsed_cycles_reg[28]_i_1_n_2 ,\elapsed_cycles_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[28]_i_1_n_4 ,\elapsed_cycles_reg[28]_i_1_n_5 ,\elapsed_cycles_reg[28]_i_1_n_6 ,\elapsed_cycles_reg[28]_i_1_n_7 }),
        .S(elapsed_cycles_reg[31:28]));
  FDRE \elapsed_cycles_reg[29] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[28]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[29]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[2] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[0]_i_1_n_5 ),
        .Q(\elapsed_cycles_reg_n_0_[2] ),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[30] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[28]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[30]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[31] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[28]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[31]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[3] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[0]_i_1_n_4 ),
        .Q(\elapsed_cycles_reg_n_0_[3] ),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[4] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[4]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[4]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[4]_i_1 
       (.CI(\elapsed_cycles_reg[0]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[4]_i_1_n_0 ,\elapsed_cycles_reg[4]_i_1_n_1 ,\elapsed_cycles_reg[4]_i_1_n_2 ,\elapsed_cycles_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[4]_i_1_n_4 ,\elapsed_cycles_reg[4]_i_1_n_5 ,\elapsed_cycles_reg[4]_i_1_n_6 ,\elapsed_cycles_reg[4]_i_1_n_7 }),
        .S(elapsed_cycles_reg[7:4]));
  FDRE \elapsed_cycles_reg[5] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[4]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[5]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[6] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[4]_i_1_n_5 ),
        .Q(elapsed_cycles_reg[6]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[7] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[4]_i_1_n_4 ),
        .Q(elapsed_cycles_reg[7]),
        .R(elapsed_cycles));
  FDRE \elapsed_cycles_reg[8] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[8]_i_1_n_7 ),
        .Q(elapsed_cycles_reg[8]),
        .R(elapsed_cycles));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \elapsed_cycles_reg[8]_i_1 
       (.CI(\elapsed_cycles_reg[4]_i_1_n_0 ),
        .CO({\elapsed_cycles_reg[8]_i_1_n_0 ,\elapsed_cycles_reg[8]_i_1_n_1 ,\elapsed_cycles_reg[8]_i_1_n_2 ,\elapsed_cycles_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\elapsed_cycles_reg[8]_i_1_n_4 ,\elapsed_cycles_reg[8]_i_1_n_5 ,\elapsed_cycles_reg[8]_i_1_n_6 ,\elapsed_cycles_reg[8]_i_1_n_7 }),
        .S(elapsed_cycles_reg[11:8]));
  FDRE \elapsed_cycles_reg[9] 
       (.C(clk_acq),
        .CE(busy),
        .D(\elapsed_cycles_reg[8]_i_1_n_6 ),
        .Q(elapsed_cycles_reg[9]),
        .R(elapsed_cycles));
  LUT1 #(
    .INIT(2'h1)) 
    \expected_index[0]_i_1 
       (.I0(frame_meta[0]),
        .O(\expected_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \expected_index[1]_i_1 
       (.I0(frame_meta[0]),
        .I1(frame_meta[1]),
        .O(\expected_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \expected_index[2]_i_1 
       (.I0(frame_meta[2]),
        .I1(frame_meta[1]),
        .I2(frame_meta[0]),
        .O(\expected_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \expected_index[3]_i_1 
       (.I0(frame_meta[1]),
        .I1(frame_meta[0]),
        .I2(frame_meta[2]),
        .I3(frame_meta[3]),
        .O(\expected_index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \expected_index[4]_i_1 
       (.I0(frame_meta[4]),
        .I1(frame_meta[1]),
        .I2(frame_meta[0]),
        .I3(frame_meta[2]),
        .I4(frame_meta[3]),
        .O(\expected_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \expected_index[5]_i_1 
       (.I0(frame_meta[5]),
        .I1(frame_meta[3]),
        .I2(frame_meta[4]),
        .I3(frame_meta[1]),
        .I4(frame_meta[0]),
        .I5(frame_meta[2]),
        .O(\expected_index[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA6AAAAAA)) 
    \expected_index[6]_i_1 
       (.I0(frame_meta[6]),
        .I1(frame_meta[5]),
        .I2(fall_average_i_n_44),
        .I3(frame_meta[4]),
        .I4(frame_meta[3]),
        .O(\expected_index[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \expected_index[7]_i_1 
       (.I0(frame_meta[7]),
        .I1(frame_meta[5]),
        .I2(fall_average_i_n_44),
        .I3(frame_meta[4]),
        .I4(frame_meta[3]),
        .I5(frame_meta[6]),
        .O(\expected_index[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \expected_index[8]_i_1 
       (.I0(busy),
        .I1(fall_average_i_n_34),
        .I2(frame_error_pulse_i_2_n_0),
        .O(expected_index));
  LUT2 #(
    .INIT(4'h9)) 
    \expected_index[8]_i_2 
       (.I0(frame_meta[8]),
        .I1(fall_average_i_n_43),
        .O(\expected_index[8]_i_2_n_0 ));
  FDRE \expected_index_reg[0] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[0]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[0] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[1] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[1]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[1] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[2] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[2]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[2] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[3] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[3]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[3] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[4] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[4]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[4] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[5] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[5]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[5] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[6] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[6]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[6] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[7] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[7]_i_1_n_0 ),
        .Q(\expected_index_reg_n_0_[7] ),
        .R(elapsed_cycles));
  FDRE \expected_index_reg[8] 
       (.C(clk_acq),
        .CE(expected_index),
        .D(\expected_index[8]_i_2_n_0 ),
        .Q(\expected_index_reg_n_0_[8] ),
        .R(elapsed_cycles));
  system_echo_pipeline_0_0_frame_average_bram fall_average_i
       (.Q({fall_average_i_n_1,fall_average_i_n_2,fall_average_i_n_3,fall_average_i_n_4,fall_average_i_n_5,fall_average_i_n_6,fall_average_i_n_7,fall_average_i_n_8,fall_average_i_n_9,fall_average_i_n_10,fall_average_i_n_11,fall_average_i_n_12,fall_average_i_n_13,fall_average_i_n_14,fall_average_i_n_15,fall_average_i_n_16,fall_average_i_n_17,fall_average_i_n_18,fall_average_i_n_19,fall_average_i_n_20,fall_average_i_n_21,fall_average_i_n_22,fall_average_i_n_23,fall_average_i_n_24,fall_average_i_n_25,fall_average_i_n_26,fall_average_i_n_27,fall_average_i_n_28,fall_average_i_n_29,fall_average_i_n_30,fall_average_i_n_31}),
        .S(fall_average_i_n_47),
        .SR(rst_acq0),
        .\average_overflow_count_reg[31] (rise_average_i_n_3),
        .busy_reg_0(busy),
        .clk_acq(clk_acq),
        .dst_pulse_reg(fall_average_i_n_33),
        .elapsed_cycles_reg(elapsed_cycles_reg),
        .elapsed_cycles_reg_14_sp_1(fall_average_i_n_34),
        .elapsed_cycles_reg_27_sp_1(fall_average_i_n_45),
        .elapsed_cycles_reg_8_sp_1(fall_average_i_n_46),
        .fall_clip(fall_clip),
        .fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data_q2),
        .fall_wr_en(fall_wr_en),
        .\first_mode_reg[0] (frames_seen),
        .frame_meta({frame_meta[31:13],frame_meta[11:0]}),
        .\frame_meta[1]_0 (fall_average_i_n_44),
        .frame_meta_11_sp_1(fall_average_i_n_35),
        .frame_meta_1_sp_1(fall_average_i_n_40),
        .frame_meta_2_sp_1(fall_average_i_n_42),
        .frame_meta_6_sp_1(fall_average_i_n_43),
        .frame_meta_8_sp_1(fall_average_i_n_36),
        .frame_open_reg(fall_average_i_n_38),
        .frame_open_reg_0(fall_average_i_n_39),
        .\frames_seen_reg[3] (fall_average_i_n_48),
        .\frames_seen_reg[4] (fall_average_i_n_41),
        .\frames_seen_reg[5] (fall_average_i_n_37),
        .mem_reg(frame_error_sticky),
        .mem_reg_0(frame_open_reg_n_0),
        .mem_reg_i_14({\expected_index_reg_n_0_[8] ,\expected_index_reg_n_0_[7] ,\expected_index_reg_n_0_[6] ,\expected_index_reg_n_0_[5] ,\expected_index_reg_n_0_[4] ,\expected_index_reg_n_0_[3] ,\expected_index_reg_n_0_[2] ,\expected_index_reg_n_0_[1] ,\expected_index_reg_n_0_[0] }),
        .mem_reg_i_24({\last_frame_id_reg_n_0_[15] ,\last_frame_id_reg_n_0_[14] ,\last_frame_id_reg_n_0_[13] ,\last_frame_id_reg_n_0_[12] ,\last_frame_id_reg_n_0_[11] ,\last_frame_id_reg_n_0_[10] ,\last_frame_id_reg_n_0_[9] ,\last_frame_id_reg_n_0_[8] ,\last_frame_id_reg_n_0_[7] ,\last_frame_id_reg_n_0_[6] ,\last_frame_id_reg_n_0_[5] ,\last_frame_id_reg_n_0_[4] ,\last_frame_id_reg_n_0_[3] ,\last_frame_id_reg_n_0_[2] ,\last_frame_id_reg_n_0_[1] ,\last_frame_id_reg_n_0_[0] }),
        .mem_reg_i_6(\first_mode_reg_n_0_[2] ),
        .mem_reg_i_6_0(\first_mode_reg_n_0_[0] ),
        .mem_reg_i_6_1(\first_mode_reg_n_0_[1] ),
        .pair_valid(pair_valid),
        .rise_done(rise_done),
        .rst_acq(rst_acq),
        .sample_clip(sample_clip),
        .sample_fall_u14(sample_fall_u14),
        .start_pulse(start_pulse),
        .tx_marker(tx_marker));
  LUT6 #(
    .INIT(64'h00000000ABAAA8AA)) 
    \first_mode[0]_i_1 
       (.I0(\first_mode_reg_n_0_[0] ),
        .I1(fall_average_i_n_42),
        .I2(\first_mode[2]_i_2_n_0 ),
        .I3(fall_average_i_n_41),
        .I4(frame_meta[13]),
        .I5(elapsed_cycles),
        .O(\first_mode[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000ABAAA8AA)) 
    \first_mode[1]_i_1 
       (.I0(\first_mode_reg_n_0_[1] ),
        .I1(fall_average_i_n_42),
        .I2(\first_mode[2]_i_2_n_0 ),
        .I3(fall_average_i_n_41),
        .I4(frame_meta[14]),
        .I5(elapsed_cycles),
        .O(\first_mode[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000ABAAA8AA)) 
    \first_mode[2]_i_1 
       (.I0(\first_mode_reg_n_0_[2] ),
        .I1(fall_average_i_n_42),
        .I2(\first_mode[2]_i_2_n_0 ),
        .I3(fall_average_i_n_41),
        .I4(frame_meta[15]),
        .I5(elapsed_cycles),
        .O(\first_mode[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF6F6FFF6FFFFFFFF)) 
    \first_mode[2]_i_2 
       (.I0(fall_average_i_n_36),
        .I1(frame_meta[11]),
        .I2(fall_average_i_n_37),
        .I3(fall_average_i_n_38),
        .I4(fall_average_i_n_39),
        .I5(\first_mode[2]_i_4_n_0 ),
        .O(\first_mode[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h2202)) 
    \first_mode[2]_i_4 
       (.I0(busy),
        .I1(fall_average_i_n_45),
        .I2(elapsed_cycles_reg[16]),
        .I3(\first_mode[2]_i_5_n_0 ),
        .O(\first_mode[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000000100FFFF)) 
    \first_mode[2]_i_5 
       (.I0(elapsed_cycles_reg[10]),
        .I1(elapsed_cycles_reg[9]),
        .I2(elapsed_cycles_reg[11]),
        .I3(fall_average_i_n_46),
        .I4(elapsed_cycles_reg[12]),
        .I5(\first_mode[2]_i_6_n_0 ),
        .O(\first_mode[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \first_mode[2]_i_6 
       (.I0(elapsed_cycles_reg[15]),
        .I1(elapsed_cycles_reg[13]),
        .I2(elapsed_cycles_reg[14]),
        .O(\first_mode[2]_i_6_n_0 ));
  FDRE \first_mode_reg[0] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(\first_mode[0]_i_1_n_0 ),
        .Q(\first_mode_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \first_mode_reg[1] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(\first_mode[1]_i_1_n_0 ),
        .Q(\first_mode_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \first_mode_reg[2] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(\first_mode[2]_i_1_n_0 ),
        .Q(\first_mode_reg_n_0_[2] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FFFF00FE)) 
    frame_error_pulse_i_1
       (.I0(frame_meta[10]),
        .I1(frame_meta[9]),
        .I2(frame_meta[11]),
        .I3(frame_error_pulse_i_2_n_0),
        .I4(fall_average_i_n_34),
        .I5(frame_error_pulse_i_3_n_0),
        .O(frame_error_pulse_i_1_n_0));
  LUT6 #(
    .INIT(64'h000B00000000000B)) 
    frame_error_pulse_i_2
       (.I0(fall_average_i_n_39),
        .I1(fall_average_i_n_38),
        .I2(frame_error_pulse_i_4_n_0),
        .I3(frames_seen[5]),
        .I4(frame_meta[11]),
        .I5(fall_average_i_n_36),
        .O(frame_error_pulse_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'hB)) 
    frame_error_pulse_i_3
       (.I0(rst_acq),
        .I1(busy),
        .O(frame_error_pulse_i_3_n_0));
  LUT6 #(
    .INIT(64'hF6FFFFFFFFFFFFFF)) 
    frame_error_pulse_i_4
       (.I0(frame_error_pulse_i_5_n_0),
        .I1(tx_marker),
        .I2(frame_error_sticky),
        .I3(frame_meta[9]),
        .I4(busy),
        .I5(pair_valid),
        .O(frame_error_pulse_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    frame_error_pulse_i_5
       (.I0(frame_meta[7]),
        .I1(frame_meta[8]),
        .I2(frame_meta[4]),
        .I3(frame_meta[5]),
        .I4(frame_meta[6]),
        .I5(fall_average_i_n_40),
        .O(frame_error_pulse_i_5_n_0));
  FDRE frame_error_pulse_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(frame_error_pulse_i_1_n_0),
        .Q(frame_error_pulse),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FFAEAAAA)) 
    frame_error_sticky_i_1
       (.I0(frame_error_sticky),
        .I1(fall_average_i_n_35),
        .I2(frame_error_pulse_i_2_n_0),
        .I3(fall_average_i_n_34),
        .I4(busy),
        .I5(elapsed_cycles),
        .O(frame_error_sticky_i_1_n_0));
  FDRE frame_error_sticky_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(frame_error_sticky_i_1_n_0),
        .Q(frame_error_sticky),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h50005051)) 
    frame_open_i_1
       (.I0(elapsed_cycles),
        .I1(fall_average_i_n_42),
        .I2(frame_open_reg_n_0),
        .I3(\first_mode[2]_i_2_n_0 ),
        .I4(frame_meta[11]),
        .O(frame_open_i_1_n_0));
  FDRE frame_open_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(frame_open_i_1_n_0),
        .Q(frame_open_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \frames_seen[0]_i_1 
       (.I0(frames_seen[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \frames_seen[1]_i_1 
       (.I0(frames_seen[0]),
        .I1(frames_seen[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \frames_seen[2]_i_1 
       (.I0(frames_seen[2]),
        .I1(frames_seen[1]),
        .I2(frames_seen[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \frames_seen[3]_i_1 
       (.I0(frames_seen[3]),
        .I1(frames_seen[0]),
        .I2(frames_seen[1]),
        .I3(frames_seen[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \frames_seen[4]_i_1 
       (.I0(frames_seen[4]),
        .I1(frames_seen[2]),
        .I2(frames_seen[1]),
        .I3(frames_seen[0]),
        .I4(frames_seen[3]),
        .O(p_0_in[4]));
  LUT3 #(
    .INIT(8'hBA)) 
    \frames_seen[5]_i_1 
       (.I0(rst_acq),
        .I1(busy),
        .I2(start_pulse),
        .O(elapsed_cycles));
  LUT4 #(
    .INIT(16'h0800)) 
    \frames_seen[5]_i_2 
       (.I0(frame_meta[11]),
        .I1(busy),
        .I2(fall_average_i_n_34),
        .I3(frame_error_pulse_i_2_n_0),
        .O(\frames_seen[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \frames_seen[5]_i_3 
       (.I0(frames_seen[5]),
        .I1(frames_seen[3]),
        .I2(frames_seen[0]),
        .I3(frames_seen[1]),
        .I4(frames_seen[2]),
        .I5(frames_seen[4]),
        .O(p_0_in[5]));
  FDRE \frames_seen_reg[0] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(frames_seen[0]),
        .R(elapsed_cycles));
  FDRE \frames_seen_reg[1] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(frames_seen[1]),
        .R(elapsed_cycles));
  FDRE \frames_seen_reg[2] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(frames_seen[2]),
        .R(elapsed_cycles));
  FDRE \frames_seen_reg[3] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(frames_seen[3]),
        .R(elapsed_cycles));
  FDRE \frames_seen_reg[4] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(frames_seen[4]),
        .R(elapsed_cycles));
  FDRE \frames_seen_reg[5] 
       (.C(clk_acq),
        .CE(\frames_seen[5]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(frames_seen[5]),
        .R(elapsed_cycles));
  FDRE group_done_pulse_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(fall_average_i_n_48),
        .Q(group_done_pulse),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0400)) 
    \last_frame_id[15]_i_1 
       (.I0(fall_average_i_n_42),
        .I1(busy),
        .I2(fall_average_i_n_34),
        .I3(frame_error_pulse_i_2_n_0),
        .O(frame_open5_out));
  FDRE \last_frame_id_reg[0] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[16]),
        .Q(\last_frame_id_reg_n_0_[0] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[10] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[26]),
        .Q(\last_frame_id_reg_n_0_[10] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[11] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[27]),
        .Q(\last_frame_id_reg_n_0_[11] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[12] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[28]),
        .Q(\last_frame_id_reg_n_0_[12] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[13] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[29]),
        .Q(\last_frame_id_reg_n_0_[13] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[14] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[30]),
        .Q(\last_frame_id_reg_n_0_[14] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[15] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[31]),
        .Q(\last_frame_id_reg_n_0_[15] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[1] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[17]),
        .Q(\last_frame_id_reg_n_0_[1] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[2] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[18]),
        .Q(\last_frame_id_reg_n_0_[2] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[3] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[19]),
        .Q(\last_frame_id_reg_n_0_[3] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[4] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[20]),
        .Q(\last_frame_id_reg_n_0_[4] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[5] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[21]),
        .Q(\last_frame_id_reg_n_0_[5] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[6] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[22]),
        .Q(\last_frame_id_reg_n_0_[6] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[7] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[23]),
        .Q(\last_frame_id_reg_n_0_[7] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[8] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[24]),
        .Q(\last_frame_id_reg_n_0_[8] ),
        .R(elapsed_cycles));
  FDRE \last_frame_id_reg[9] 
       (.C(clk_acq),
        .CE(frame_open5_out),
        .D(frame_meta[25]),
        .Q(\last_frame_id_reg_n_0_[9] ),
        .R(elapsed_cycles));
  system_echo_pipeline_0_0_frame_average_bram_3 rise_average_i
       (.Q(rise_average_i_n_3),
        .S(fall_average_i_n_47),
        .SR(rst_acq0),
        .\average_overflow_count_reg[31] ({fall_average_i_n_1,fall_average_i_n_2,fall_average_i_n_3,fall_average_i_n_4,fall_average_i_n_5,fall_average_i_n_6,fall_average_i_n_7,fall_average_i_n_8,fall_average_i_n_9,fall_average_i_n_10,fall_average_i_n_11,fall_average_i_n_12,fall_average_i_n_13,fall_average_i_n_14,fall_average_i_n_15,fall_average_i_n_16,fall_average_i_n_17,fall_average_i_n_18,fall_average_i_n_19,fall_average_i_n_20,fall_average_i_n_21,fall_average_i_n_22,fall_average_i_n_23,fall_average_i_n_24,fall_average_i_n_25,fall_average_i_n_26,fall_average_i_n_27,fall_average_i_n_28,fall_average_i_n_29,fall_average_i_n_30,fall_average_i_n_31}),
        .clip_flag_snapshot(clip_flag_snapshot),
        .clk_acq(clk_acq),
        .fall_clip(fall_clip),
        .frame_meta(frame_meta[11]),
        .mem_reg(frame_error_sticky),
        .mem_reg_0(fall_average_i_n_36),
        .mem_reg_1(fall_average_i_n_37),
        .mem_reg_2(fall_average_i_n_38),
        .mem_reg_3(fall_average_i_n_39),
        .overflow_count(overflow_count),
        .rise_done(rise_done),
        .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data_q2),
        .rise_wr_en(rise_wr_en),
        .rst_acq(rst_acq),
        .sample_clip(sample_clip),
        .sample_rise_u14(sample_rise_u14),
        .start_pulse(start_pulse));
endmodule

(* CHECK_LICENSE_TYPE = "ila_echo_200,ila,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "ila_echo_200" *) 
(* X_CORE_INFO = "ila,Vivado 2026.1" *) 
module system_echo_pipeline_0_0_ila_echo_200
   (clk,
    probe0,
    probe1,
    probe2,
    probe3,
    probe4);
  (* syn_isclock = "1" *) input clk;
  input [13:0]probe0;
  input [13:0]probe1;
  input [31:0]probe2;
  input [10:0]probe3;
  input [49:0]probe4;


endmodule

(* ORIG_REF_NAME = "processing_chain" *) 
module system_echo_pipeline_0_0_processing_chain
   (active_bank_reg,
    active_bank_reg_0,
    result_rd_data_q16,
    baseline_commit_accepted,
    template_commit_accepted,
    processing_done,
    correlation_overflow_count,
    baseline_commit_rejected,
    template_commit_rejected,
    Q,
    busy1,
    rd_addr,
    rd_en,
    clk_proc,
    baseline_shadow_wr_en,
    baseline_shadow_wr_addr,
    baseline_shadow_wr_data_q2,
    template_shadow_wr_en,
    template_shadow_wr_addr,
    template_shadow_wr_data_q14,
    rst_proc,
    result_rd_addr,
    average_debug_rd_data_q2,
    baseline_commit_pulse,
    commit_rejected_reg,
    template_commit_pulse,
    acq_done_proc_pulse,
    average_debug_rd_addr);
  output active_bank_reg;
  output active_bank_reg_0;
  output [63:0]result_rd_data_q16;
  output baseline_commit_accepted;
  output template_commit_accepted;
  output processing_done;
  output [31:0]correlation_overflow_count;
  output baseline_commit_rejected;
  output template_commit_rejected;
  output [8:0]Q;
  output busy1;
  output [9:0]rd_addr;
  output rd_en;
  input clk_proc;
  input baseline_shadow_wr_en;
  input [9:0]baseline_shadow_wr_addr;
  input [15:0]baseline_shadow_wr_data_q2;
  input template_shadow_wr_en;
  input [9:0]template_shadow_wr_addr;
  input [15:0]template_shadow_wr_data_q14;
  input rst_proc;
  input [7:0]result_rd_addr;
  input [15:0]average_debug_rd_data_q2;
  input baseline_commit_pulse;
  input commit_rejected_reg;
  input template_commit_pulse;
  input acq_done_proc_pulse;
  input [9:0]average_debug_rd_addr;

  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire \FSM_sequential_state[2]_i_7_n_0 ;
  wire \FSM_sequential_state[2]_i_8_n_0 ;
  wire [8:0]Q;
  wire acq_done_proc_pulse;
  wire active_bank_reg;
  wire active_bank_reg_0;
  wire [9:0]average_debug_rd_addr;
  wire [15:0]average_debug_rd_data_q2;
  wire [9:0]avg_rd_addr;
  wire [0:0]base_req_addr;
  wire \base_req_addr[1]_i_1_n_0 ;
  wire \base_req_addr[2]_i_1_n_0 ;
  wire \base_req_addr[3]_i_1_n_0 ;
  wire \base_req_addr[4]_i_1_n_0 ;
  wire \base_req_addr[5]_i_1_n_0 ;
  wire \base_req_addr[5]_i_2_n_0 ;
  wire \base_req_addr[6]_i_1_n_0 ;
  wire \base_req_addr[7]_i_1_n_0 ;
  wire \base_req_addr[8]_i_1_n_0 ;
  wire \base_req_addr[9]_i_1_n_0 ;
  wire \base_req_addr[9]_i_2_n_0 ;
  wire \base_req_addr[9]_i_3_n_0 ;
  wire \base_req_addr[9]_i_4_n_0 ;
  wire [9:0]base_rsp_addr;
  wire base_rsp_valid;
  wire base_rsp_valid_i_1_n_0;
  wire baseline_bank_n_10;
  wire baseline_bank_n_11;
  wire baseline_bank_n_12;
  wire baseline_bank_n_13;
  wire baseline_bank_n_14;
  wire baseline_bank_n_15;
  wire baseline_bank_n_16;
  wire baseline_bank_n_17;
  wire baseline_bank_n_18;
  wire baseline_bank_n_3;
  wire baseline_bank_n_4;
  wire baseline_bank_n_5;
  wire baseline_bank_n_6;
  wire baseline_bank_n_7;
  wire baseline_bank_n_8;
  wire baseline_bank_n_9;
  wire baseline_commit_accepted;
  wire baseline_commit_pulse;
  wire baseline_commit_rejected;
  wire [9:0]baseline_shadow_wr_addr;
  wire [15:0]baseline_shadow_wr_data_q2;
  wire baseline_shadow_wr_en;
  wire baseline_sub_i_n_12;
  wire baseline_sub_i_n_13;
  wire baseline_sub_i_n_14;
  wire busy1;
  wire clk_proc;
  wire commit_rejected_reg;
  wire corr_mac_i_n_33;
  wire corr_mac_i_n_34;
  wire corr_mac_i_n_35;
  wire [7:0]corr_result_lag;
  wire [47:0]corr_result_q16;
  wire corr_result_valid;
  wire [31:0]correlation_overflow_count;
  wire [9:0]diff_addr;
  wire [16:0]diff_data_q2;
  wire diff_valid;
  wire processing_done;
  wire [9:0]rd_addr;
  wire rd_en;
  wire \result_count[0]_i_1_n_0 ;
  wire \result_count[1]_i_1_n_0 ;
  wire \result_count[2]_i_1_n_0 ;
  wire \result_count[3]_i_1_n_0 ;
  wire \result_count[4]_i_1_n_0 ;
  wire \result_count[5]_i_1_n_0 ;
  wire \result_count[5]_i_2_n_0 ;
  wire \result_count[6]_i_1_n_0 ;
  wire \result_count[7]_i_1_n_0 ;
  wire \result_count[8]_i_2_n_0 ;
  wire \result_count[8]_i_3_n_0 ;
  wire \result_count[8]_i_4_n_0 ;
  wire [7:0]result_rd_addr;
  wire [63:0]result_rd_data_q16;
  wire rst_proc;
  wire [2:0]state;
  wire template_commit_accepted;
  wire template_commit_pulse;
  wire template_commit_rejected;
  wire [15:0]template_rd_data_q14;
  wire template_rd_en;
  wire [9:0]template_req_addr;
  wire \template_req_addr[2]_i_1_n_0 ;
  wire \template_req_addr[3]_i_1_n_0 ;
  wire \template_req_addr[4]_i_1_n_0 ;
  wire \template_req_addr[5]_i_1_n_0 ;
  wire \template_req_addr[5]_i_2_n_0 ;
  wire \template_req_addr[7]_i_1_n_0 ;
  wire \template_req_addr[8]_i_1_n_0 ;
  wire \template_req_addr[9]_i_3_n_0 ;
  wire \template_req_addr[9]_i_5_n_0 ;
  wire [0:0]template_req_addr_0;
  wire \template_req_addr_reg_n_0_[0] ;
  wire \template_req_addr_reg_n_0_[1] ;
  wire \template_req_addr_reg_n_0_[2] ;
  wire \template_req_addr_reg_n_0_[3] ;
  wire \template_req_addr_reg_n_0_[4] ;
  wire \template_req_addr_reg_n_0_[5] ;
  wire \template_req_addr_reg_n_0_[6] ;
  wire \template_req_addr_reg_n_0_[7] ;
  wire \template_req_addr_reg_n_0_[8] ;
  wire \template_req_addr_reg_n_0_[9] ;
  wire \template_rsp_addr_reg_n_0_[0] ;
  wire \template_rsp_addr_reg_n_0_[1] ;
  wire \template_rsp_addr_reg_n_0_[2] ;
  wire \template_rsp_addr_reg_n_0_[3] ;
  wire \template_rsp_addr_reg_n_0_[4] ;
  wire \template_rsp_addr_reg_n_0_[5] ;
  wire \template_rsp_addr_reg_n_0_[6] ;
  wire \template_rsp_addr_reg_n_0_[7] ;
  wire \template_rsp_addr_reg_n_0_[8] ;
  wire \template_rsp_addr_reg_n_0_[9] ;
  wire template_rsp_valid;
  wire [9:0]template_shadow_wr_addr;
  wire [15:0]template_shadow_wr_data_q14;
  wire template_shadow_wr_en;

  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(state[2]),
        .I1(state[1]),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hD0)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(\template_rsp_addr_reg_n_0_[6] ),
        .I1(\template_rsp_addr_reg_n_0_[4] ),
        .I2(\template_rsp_addr_reg_n_0_[3] ),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \FSM_sequential_state[2]_i_7 
       (.I0(\template_rsp_addr_reg_n_0_[2] ),
        .I1(\template_rsp_addr_reg_n_0_[8] ),
        .I2(template_rsp_valid),
        .I3(\template_rsp_addr_reg_n_0_[1] ),
        .O(\FSM_sequential_state[2]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \FSM_sequential_state[2]_i_8 
       (.I0(\template_rsp_addr_reg_n_0_[0] ),
        .I1(\template_rsp_addr_reg_n_0_[7] ),
        .I2(\template_rsp_addr_reg_n_0_[9] ),
        .I3(\template_rsp_addr_reg_n_0_[5] ),
        .O(\FSM_sequential_state[2]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "S_IDLE:000,S_BASE_READ:110,S_BASE_DRAIN:101,S_TEMPLATE_READ:100,S_TEMPLATE_DRAIN:011,S_CORR_START:010,S_CORR_RUN:001," *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(baseline_sub_i_n_14),
        .Q(state[0]),
        .R(rst_proc));
  (* FSM_ENCODED_STATES = "S_IDLE:000,S_BASE_READ:110,S_BASE_DRAIN:101,S_TEMPLATE_READ:100,S_TEMPLATE_DRAIN:011,S_CORR_START:010,S_CORR_RUN:001," *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(baseline_sub_i_n_13),
        .Q(state[1]),
        .R(rst_proc));
  (* FSM_ENCODED_STATES = "S_IDLE:000,S_BASE_READ:110,S_BASE_DRAIN:101,S_TEMPLATE_READ:100,S_TEMPLATE_DRAIN:011,S_CORR_START:010,S_CORR_RUN:001," *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(baseline_sub_i_n_12),
        .Q(state[2]),
        .R(rst_proc));
  LUT4 #(
    .INIT(16'h08FF)) 
    average_store_i_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(commit_rejected_reg),
        .O(rd_en));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_10
       (.I0(avg_rd_addr[1]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[1]),
        .O(rd_addr[1]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_11
       (.I0(avg_rd_addr[0]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[0]),
        .O(rd_addr[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_2
       (.I0(avg_rd_addr[9]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[9]),
        .O(rd_addr[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_3
       (.I0(avg_rd_addr[8]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[8]),
        .O(rd_addr[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_4
       (.I0(avg_rd_addr[7]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[7]),
        .O(rd_addr[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_5
       (.I0(avg_rd_addr[6]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[6]),
        .O(rd_addr[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_6
       (.I0(avg_rd_addr[5]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[5]),
        .O(rd_addr[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_7
       (.I0(avg_rd_addr[4]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[4]),
        .O(rd_addr[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_8
       (.I0(avg_rd_addr[3]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[3]),
        .O(rd_addr[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    average_store_i_i_9
       (.I0(avg_rd_addr[2]),
        .I1(commit_rejected_reg),
        .I2(average_debug_rd_addr[2]),
        .O(rd_addr[2]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \base_req_addr[0]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[0]),
        .O(base_req_addr));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \base_req_addr[1]_i_1 
       (.I0(avg_rd_addr[1]),
        .I1(avg_rd_addr[0]),
        .I2(state[2]),
        .O(\base_req_addr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \base_req_addr[2]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[2]),
        .I2(avg_rd_addr[0]),
        .I3(avg_rd_addr[1]),
        .O(\base_req_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \base_req_addr[3]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[3]),
        .I2(avg_rd_addr[2]),
        .I3(avg_rd_addr[1]),
        .I4(avg_rd_addr[0]),
        .O(\base_req_addr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h8828)) 
    \base_req_addr[4]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[4]),
        .I2(avg_rd_addr[3]),
        .I3(\base_req_addr[5]_i_2_n_0 ),
        .O(\base_req_addr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT5 #(
    .INIT(32'h88288888)) 
    \base_req_addr[5]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[5]),
        .I2(avg_rd_addr[4]),
        .I3(\base_req_addr[5]_i_2_n_0 ),
        .I4(avg_rd_addr[3]),
        .O(\base_req_addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \base_req_addr[5]_i_2 
       (.I0(avg_rd_addr[0]),
        .I1(avg_rd_addr[1]),
        .I2(avg_rd_addr[2]),
        .O(\base_req_addr[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \base_req_addr[6]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[6]),
        .I2(\base_req_addr[9]_i_4_n_0 ),
        .O(\base_req_addr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT4 #(
    .INIT(16'h6A00)) 
    \base_req_addr[7]_i_1 
       (.I0(avg_rd_addr[7]),
        .I1(avg_rd_addr[6]),
        .I2(\base_req_addr[9]_i_4_n_0 ),
        .I3(state[2]),
        .O(\base_req_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \base_req_addr[8]_i_1 
       (.I0(state[2]),
        .I1(avg_rd_addr[8]),
        .I2(\base_req_addr[9]_i_4_n_0 ),
        .I3(avg_rd_addr[6]),
        .I4(avg_rd_addr[7]),
        .O(\base_req_addr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5500004000000040)) 
    \base_req_addr[9]_i_1 
       (.I0(state[0]),
        .I1(commit_rejected_reg),
        .I2(acq_done_proc_pulse),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\base_req_addr[9]_i_3_n_0 ),
        .O(\base_req_addr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F008000FF000000)) 
    \base_req_addr[9]_i_2 
       (.I0(avg_rd_addr[7]),
        .I1(avg_rd_addr[6]),
        .I2(\base_req_addr[9]_i_4_n_0 ),
        .I3(state[2]),
        .I4(avg_rd_addr[9]),
        .I5(avg_rd_addr[8]),
        .O(\base_req_addr[9]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \base_req_addr[9]_i_3 
       (.I0(avg_rd_addr[7]),
        .I1(avg_rd_addr[8]),
        .I2(\base_req_addr[9]_i_4_n_0 ),
        .I3(avg_rd_addr[6]),
        .I4(avg_rd_addr[9]),
        .O(\base_req_addr[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \base_req_addr[9]_i_4 
       (.I0(avg_rd_addr[3]),
        .I1(avg_rd_addr[0]),
        .I2(avg_rd_addr[1]),
        .I3(avg_rd_addr[2]),
        .I4(avg_rd_addr[5]),
        .I5(avg_rd_addr[4]),
        .O(\base_req_addr[9]_i_4_n_0 ));
  FDRE \base_req_addr_reg[0] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(base_req_addr),
        .Q(avg_rd_addr[0]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[1] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[1]_i_1_n_0 ),
        .Q(avg_rd_addr[1]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[2] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[2]_i_1_n_0 ),
        .Q(avg_rd_addr[2]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[3] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[3]_i_1_n_0 ),
        .Q(avg_rd_addr[3]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[4] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[4]_i_1_n_0 ),
        .Q(avg_rd_addr[4]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[5] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[5]_i_1_n_0 ),
        .Q(avg_rd_addr[5]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[6] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[6]_i_1_n_0 ),
        .Q(avg_rd_addr[6]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[7] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[7]_i_1_n_0 ),
        .Q(avg_rd_addr[7]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[8] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[8]_i_1_n_0 ),
        .Q(avg_rd_addr[8]),
        .R(rst_proc));
  FDRE \base_req_addr_reg[9] 
       (.C(clk_proc),
        .CE(\base_req_addr[9]_i_1_n_0 ),
        .D(\base_req_addr[9]_i_2_n_0 ),
        .Q(avg_rd_addr[9]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[0] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[0]),
        .Q(base_rsp_addr[0]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[1] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[1]),
        .Q(base_rsp_addr[1]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[2] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[2]),
        .Q(base_rsp_addr[2]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[3] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[3]),
        .Q(base_rsp_addr[3]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[4] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[4]),
        .Q(base_rsp_addr[4]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[5] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[5]),
        .Q(base_rsp_addr[5]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[6] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[6]),
        .Q(base_rsp_addr[6]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[7] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[7]),
        .Q(base_rsp_addr[7]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[8] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[8]),
        .Q(base_rsp_addr[8]),
        .R(rst_proc));
  FDRE \base_rsp_addr_reg[9] 
       (.C(clk_proc),
        .CE(base_rsp_valid_i_1_n_0),
        .D(avg_rd_addr[9]),
        .Q(base_rsp_addr[9]),
        .R(rst_proc));
  LUT3 #(
    .INIT(8'h40)) 
    base_rsp_valid_i_1
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .O(base_rsp_valid_i_1_n_0));
  FDRE base_rsp_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(base_rsp_valid_i_1_n_0),
        .Q(base_rsp_valid),
        .R(rst_proc));
  system_echo_pipeline_0_0_coeff_shadow_bank baseline_bank
       (.Q(avg_rd_addr),
        .S({baseline_bank_n_3,baseline_bank_n_4,baseline_bank_n_5,baseline_bank_n_6}),
        .WEA(active_bank_reg),
        .average_debug_rd_data_q2(average_debug_rd_data_q2),
        .bank_0_reg_0({baseline_bank_n_7,baseline_bank_n_8,baseline_bank_n_9,baseline_bank_n_10}),
        .bank_0_reg_1({baseline_bank_n_11,baseline_bank_n_12,baseline_bank_n_13,baseline_bank_n_14}),
        .bank_0_reg_2({baseline_bank_n_15,baseline_bank_n_16,baseline_bank_n_17,baseline_bank_n_18}),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_commit_rejected(baseline_commit_rejected),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .clk_proc(clk_proc),
        .commit_rejected_reg_0(commit_rejected_reg),
        .rst_proc(rst_proc),
        .state(state));
  system_echo_pipeline_0_0_baseline_sub baseline_sub_i
       (.E(base_rsp_valid),
        .\FSM_sequential_state_reg[0] (baseline_sub_i_n_12),
        .\FSM_sequential_state_reg[0]_0 (baseline_sub_i_n_13),
        .\FSM_sequential_state_reg[0]_1 (\FSM_sequential_state[2]_i_3_n_0 ),
        .\FSM_sequential_state_reg[0]_2 (corr_mac_i_n_34),
        .\FSM_sequential_state_reg[0]_3 (\base_req_addr[9]_i_3_n_0 ),
        .\FSM_sequential_state_reg[0]_4 (\FSM_sequential_state[2]_i_5_n_0 ),
        .\FSM_sequential_state_reg[1] (template_req_addr_0),
        .\FSM_sequential_state_reg[1]_0 (baseline_sub_i_n_14),
        .Q(diff_addr),
        .S({baseline_bank_n_3,baseline_bank_n_4,baseline_bank_n_5,baseline_bank_n_6}),
        .average_debug_rd_data_q2(average_debug_rd_data_q2),
        .clk_proc(clk_proc),
        .diff_valid(diff_valid),
        .\difference_q2_reg[11]_0 ({baseline_bank_n_11,baseline_bank_n_12,baseline_bank_n_13,baseline_bank_n_14}),
        .\difference_q2_reg[15]_0 ({baseline_bank_n_15,baseline_bank_n_16,baseline_bank_n_17,baseline_bank_n_18}),
        .\difference_q2_reg[16]_0 (diff_data_q2),
        .\difference_q2_reg[7]_0 ({baseline_bank_n_7,baseline_bank_n_8,baseline_bank_n_9,baseline_bank_n_10}),
        .\out_addr_reg[9]_0 (base_rsp_addr),
        .rst_proc(rst_proc),
        .state(state),
        .\template_req_addr_reg[0] (\template_req_addr[9]_i_3_n_0 ));
  system_echo_pipeline_0_0_corr_mac corr_mac_i
       (.DIADI(template_rd_data_q14),
        .E(corr_mac_i_n_33),
        .\FSM_sequential_state[2]_i_2 (\FSM_sequential_state[2]_i_6_n_0 ),
        .\FSM_sequential_state[2]_i_2_0 (\FSM_sequential_state[2]_i_7_n_0 ),
        .\FSM_sequential_state[2]_i_2_1 (\FSM_sequential_state[2]_i_8_n_0 ),
        .\FSM_sequential_state_reg[1] (corr_mac_i_n_34),
        .\FSM_sequential_state_reg[1]_0 (corr_mac_i_n_35),
        .Q(diff_addr),
        .WEBWE(corr_result_valid),
        .acq_done_proc_pulse(acq_done_proc_pulse),
        .clk_proc(clk_proc),
        .correlation_overflow_count(correlation_overflow_count),
        .diff_valid(diff_valid),
        .difference_mem_reg_0(diff_data_q2),
        .\result_count_reg[0] (commit_rejected_reg),
        .\result_lag_reg[7]_0 (corr_result_lag),
        .\result_q16_reg[47]_0 (corr_result_q16),
        .rst_proc(rst_proc),
        .state(state),
        .template_mem_reg_0({\template_rsp_addr_reg_n_0_[9] ,\template_rsp_addr_reg_n_0_[8] ,\template_rsp_addr_reg_n_0_[7] ,\template_rsp_addr_reg_n_0_[6] ,\template_rsp_addr_reg_n_0_[5] ,\template_rsp_addr_reg_n_0_[4] ,\template_rsp_addr_reg_n_0_[3] ,\template_rsp_addr_reg_n_0_[2] ,\template_rsp_addr_reg_n_0_[1] ,\template_rsp_addr_reg_n_0_[0] }),
        .template_rsp_valid(template_rsp_valid));
  LUT2 #(
    .INIT(4'h8)) 
    done_pulse_i_1
       (.I0(commit_rejected_reg),
        .I1(processing_done),
        .O(busy1));
  FDRE done_pulse_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(corr_mac_i_n_35),
        .Q(processing_done),
        .R(rst_proc));
  LUT6 #(
    .INIT(64'h000000007E7F7F7F)) 
    \result_count[0]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(acq_done_proc_pulse),
        .I4(commit_rejected_reg),
        .I5(Q[0]),
        .O(\result_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \result_count[1]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\result_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \result_count[2]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(\result_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \result_count[3]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(\result_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \result_count[4]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\result_count[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h82)) 
    \result_count[5]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(\result_count[5]_i_2_n_0 ),
        .I2(Q[5]),
        .O(\result_count[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \result_count[5]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .O(\result_count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \result_count[6]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(\result_count[8]_i_4_n_0 ),
        .I2(Q[6]),
        .O(\result_count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT4 #(
    .INIT(16'hA208)) 
    \result_count[7]_i_1 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[6]),
        .I2(\result_count[8]_i_4_n_0 ),
        .I3(Q[7]),
        .O(\result_count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \result_count[8]_i_2 
       (.I0(\result_count[8]_i_3_n_0 ),
        .I1(Q[6]),
        .I2(\result_count[8]_i_4_n_0 ),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\result_count[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT5 #(
    .INIT(32'h0FFFFFF7)) 
    \result_count[8]_i_3 
       (.I0(commit_rejected_reg),
        .I1(acq_done_proc_pulse),
        .I2(state[1]),
        .I3(state[0]),
        .I4(state[2]),
        .O(\result_count[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \result_count[8]_i_4 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\result_count[8]_i_4_n_0 ));
  FDRE \result_count_reg[0] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(rst_proc));
  FDRE \result_count_reg[1] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(rst_proc));
  FDRE \result_count_reg[2] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(rst_proc));
  FDRE \result_count_reg[3] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(rst_proc));
  FDRE \result_count_reg[4] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(rst_proc));
  FDRE \result_count_reg[5] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(rst_proc));
  FDRE \result_count_reg[6] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(rst_proc));
  FDRE \result_count_reg[7] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(rst_proc));
  FDRE \result_count_reg[8] 
       (.C(clk_proc),
        .CE(corr_mac_i_n_33),
        .D(\result_count[8]_i_2_n_0 ),
        .Q(Q[8]),
        .R(rst_proc));
  system_echo_pipeline_0_0_result_bram result_store
       (.WEBWE(corr_result_valid),
        .clk_proc(clk_proc),
        .mem_reg_0(corr_result_lag),
        .mem_reg_1(corr_result_q16),
        .result_rd_addr(result_rd_addr),
        .result_rd_data_q16(result_rd_data_q16));
  system_echo_pipeline_0_0_coeff_shadow_bank__parameterized0 template_bank
       (.DIADI(template_rd_data_q14),
        .Q({\template_req_addr_reg_n_0_[9] ,\template_req_addr_reg_n_0_[8] ,\template_req_addr_reg_n_0_[7] ,\template_req_addr_reg_n_0_[6] ,\template_req_addr_reg_n_0_[5] ,\template_req_addr_reg_n_0_[4] ,\template_req_addr_reg_n_0_[3] ,\template_req_addr_reg_n_0_[2] ,\template_req_addr_reg_n_0_[1] ,\template_req_addr_reg_n_0_[0] }),
        .WEA(active_bank_reg_0),
        .clk_proc(clk_proc),
        .commit_rejected_reg_0(commit_rejected_reg),
        .rst_proc(rst_proc),
        .state(state),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_pulse(template_commit_pulse),
        .template_commit_rejected(template_commit_rejected),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .template_shadow_wr_en(template_shadow_wr_en));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \template_req_addr[0]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[0] ),
        .O(template_req_addr[0]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \template_req_addr[1]_i_1 
       (.I0(\template_req_addr_reg_n_0_[0] ),
        .I1(\template_req_addr_reg_n_0_[1] ),
        .I2(state[0]),
        .O(template_req_addr[1]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \template_req_addr[2]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[1] ),
        .I2(\template_req_addr_reg_n_0_[0] ),
        .I3(\template_req_addr_reg_n_0_[2] ),
        .O(\template_req_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \template_req_addr[3]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[0] ),
        .I2(\template_req_addr_reg_n_0_[1] ),
        .I3(\template_req_addr_reg_n_0_[2] ),
        .I4(\template_req_addr_reg_n_0_[3] ),
        .O(\template_req_addr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000)) 
    \template_req_addr[4]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[2] ),
        .I2(\template_req_addr_reg_n_0_[1] ),
        .I3(\template_req_addr_reg_n_0_[0] ),
        .I4(\template_req_addr_reg_n_0_[3] ),
        .I5(\template_req_addr_reg_n_0_[4] ),
        .O(\template_req_addr[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h51550400)) 
    \template_req_addr[5]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[3] ),
        .I2(\template_req_addr[5]_i_2_n_0 ),
        .I3(\template_req_addr_reg_n_0_[4] ),
        .I4(\template_req_addr_reg_n_0_[5] ),
        .O(\template_req_addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \template_req_addr[5]_i_2 
       (.I0(\template_req_addr_reg_n_0_[0] ),
        .I1(\template_req_addr_reg_n_0_[1] ),
        .I2(\template_req_addr_reg_n_0_[2] ),
        .O(\template_req_addr[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \template_req_addr[6]_i_1 
       (.I0(\template_req_addr[9]_i_5_n_0 ),
        .I1(\template_req_addr_reg_n_0_[6] ),
        .I2(state[0]),
        .O(template_req_addr[6]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \template_req_addr[7]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[6] ),
        .I2(\template_req_addr[9]_i_5_n_0 ),
        .I3(\template_req_addr_reg_n_0_[7] ),
        .O(\template_req_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \template_req_addr[8]_i_1 
       (.I0(state[0]),
        .I1(\template_req_addr_reg_n_0_[7] ),
        .I2(\template_req_addr[9]_i_5_n_0 ),
        .I3(\template_req_addr_reg_n_0_[6] ),
        .I4(\template_req_addr_reg_n_0_[8] ),
        .O(\template_req_addr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \template_req_addr[9]_i_2 
       (.I0(\template_req_addr_reg_n_0_[6] ),
        .I1(\template_req_addr[9]_i_5_n_0 ),
        .I2(\template_req_addr_reg_n_0_[7] ),
        .I3(\template_req_addr_reg_n_0_[8] ),
        .I4(\template_req_addr_reg_n_0_[9] ),
        .I5(state[0]),
        .O(template_req_addr[9]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \template_req_addr[9]_i_3 
       (.I0(\template_req_addr_reg_n_0_[9] ),
        .I1(\template_req_addr_reg_n_0_[7] ),
        .I2(\template_req_addr_reg_n_0_[8] ),
        .I3(\template_req_addr[9]_i_5_n_0 ),
        .I4(\template_req_addr_reg_n_0_[6] ),
        .O(\template_req_addr[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \template_req_addr[9]_i_5 
       (.I0(\template_req_addr_reg_n_0_[3] ),
        .I1(\template_req_addr_reg_n_0_[0] ),
        .I2(\template_req_addr_reg_n_0_[1] ),
        .I3(\template_req_addr_reg_n_0_[2] ),
        .I4(\template_req_addr_reg_n_0_[5] ),
        .I5(\template_req_addr_reg_n_0_[4] ),
        .O(\template_req_addr[9]_i_5_n_0 ));
  FDRE \template_req_addr_reg[0] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(template_req_addr[0]),
        .Q(\template_req_addr_reg_n_0_[0] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[1] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(template_req_addr[1]),
        .Q(\template_req_addr_reg_n_0_[1] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[2] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[2]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[2] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[3] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[3]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[3] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[4] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[4]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[4] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[5] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[5]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[5] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[6] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(template_req_addr[6]),
        .Q(\template_req_addr_reg_n_0_[6] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[7] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[7]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[7] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[8] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(\template_req_addr[8]_i_1_n_0 ),
        .Q(\template_req_addr_reg_n_0_[8] ),
        .R(rst_proc));
  FDRE \template_req_addr_reg[9] 
       (.C(clk_proc),
        .CE(template_req_addr_0),
        .D(template_req_addr[9]),
        .Q(\template_req_addr_reg_n_0_[9] ),
        .R(rst_proc));
  LUT3 #(
    .INIT(8'h04)) 
    \template_rsp_addr[9]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .O(template_rd_en));
  FDRE \template_rsp_addr_reg[0] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[0] ),
        .Q(\template_rsp_addr_reg_n_0_[0] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[1] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[1] ),
        .Q(\template_rsp_addr_reg_n_0_[1] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[2] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[2] ),
        .Q(\template_rsp_addr_reg_n_0_[2] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[3] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[3] ),
        .Q(\template_rsp_addr_reg_n_0_[3] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[4] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[4] ),
        .Q(\template_rsp_addr_reg_n_0_[4] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[5] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[5] ),
        .Q(\template_rsp_addr_reg_n_0_[5] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[6] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[6] ),
        .Q(\template_rsp_addr_reg_n_0_[6] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[7] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[7] ),
        .Q(\template_rsp_addr_reg_n_0_[7] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[8] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[8] ),
        .Q(\template_rsp_addr_reg_n_0_[8] ),
        .R(rst_proc));
  FDRE \template_rsp_addr_reg[9] 
       (.C(clk_proc),
        .CE(template_rd_en),
        .D(\template_req_addr_reg_n_0_[9] ),
        .Q(\template_rsp_addr_reg_n_0_[9] ),
        .R(rst_proc));
  FDRE template_rsp_valid_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(template_rd_en),
        .Q(template_rsp_valid),
        .R(rst_proc));
endmodule

(* K = "256" *) (* K_ADDR_W = "8" *) (* L = "640" *) 
(* LAG_MIN = "0" *) (* L_ADDR_W = "10" *) (* M = "32" *) 
(* N = "1024" *) (* N_ADDR_W = "10" *) (* ORIG_REF_NAME = "pulse_pair_echo_pipeline" *) 
(* PAIRS = "512" *) (* PAIR_W = "9" *) (* keep_hierarchy = "soft" *) 
module system_echo_pipeline_0_0_pulse_pair_echo_pipeline
   (clk_acq,
    rst_acq,
    clk_proc,
    rst_proc,
    adc_ready_acq,
    pulse_ready_acq,
    pair_valid,
    sample_rise_u14,
    sample_fall_u14,
    sample_clip,
    tx_marker,
    frame_meta,
    pulse_start_acq,
    start_pulse,
    clear_error_proc,
    start_accepted,
    start_rejected_not_ready,
    busy,
    done_pulse,
    acq_busy,
    frame_error_sticky_proc,
    frames_seen_proc,
    average_frame_available_proc,
    baseline_shadow_wr_en,
    baseline_shadow_wr_addr,
    baseline_shadow_wr_data_q2,
    baseline_commit_pulse,
    baseline_active_bank,
    baseline_commit_accepted,
    baseline_commit_rejected,
    template_shadow_wr_en,
    template_shadow_wr_addr,
    template_shadow_wr_data_q14,
    template_commit_pulse,
    template_active_bank,
    template_commit_accepted,
    template_commit_rejected,
    result_rd_en,
    result_rd_addr,
    result_rd_data_q16,
    result_count,
    average_debug_rd_addr,
    average_debug_rd_data_q2,
    clip_flag_snapshot,
    average_overflow_count,
    correlation_overflow_count);
  input clk_acq;
  input rst_acq;
  input clk_proc;
  input rst_proc;
  input adc_ready_acq;
  input pulse_ready_acq;
  input pair_valid;
  input [13:0]sample_rise_u14;
  input [13:0]sample_fall_u14;
  input sample_clip;
  input tx_marker;
  input [31:0]frame_meta;
  output pulse_start_acq;
  input start_pulse;
  input clear_error_proc;
  output start_accepted;
  output start_rejected_not_ready;
  output busy;
  output done_pulse;
  output acq_busy;
  output frame_error_sticky_proc;
  output [5:0]frames_seen_proc;
  output average_frame_available_proc;
  input baseline_shadow_wr_en;
  input [9:0]baseline_shadow_wr_addr;
  input [15:0]baseline_shadow_wr_data_q2;
  input baseline_commit_pulse;
  output baseline_active_bank;
  output baseline_commit_accepted;
  output baseline_commit_rejected;
  input template_shadow_wr_en;
  input [9:0]template_shadow_wr_addr;
  input [15:0]template_shadow_wr_data_q14;
  input template_commit_pulse;
  output template_active_bank;
  output template_commit_accepted;
  output template_commit_rejected;
  input result_rd_en;
  input [7:0]result_rd_addr;
  output [63:0]result_rd_data_q16;
  output [8:0]result_count;
  input [9:0]average_debug_rd_addr;
  output [15:0]average_debug_rd_data_q2;
  output clip_flag_snapshot;
  output [31:0]average_overflow_count;
  output [31:0]correlation_overflow_count;

  wire acq_busy;
  wire acq_clip;
  wire acq_done_proc_pulse;
  wire acq_done_pulse;
  wire acq_error_proc_pulse;
  wire acq_error_pulse;
  (* MARK_DEBUG *) wire acq_error_sticky;
  (* MARK_DEBUG *) wire [5:0]acq_frames_seen;
  wire [31:0]acq_overflow;
  wire adc_ready_acq;
  wire [9:0]average_debug_rd_addr;
  wire [15:0]average_debug_rd_data_q2;
  wire average_frame_available_proc;
  wire [31:0]average_overflow_count;
  wire [9:0]avg_mem_rd_addr;
  wire baseline_active_bank;
  wire baseline_commit_accepted;
  wire baseline_commit_pulse;
  wire baseline_commit_rejected;
  wire [9:0]baseline_shadow_wr_addr;
  wire [15:0]baseline_shadow_wr_data_q2;
  wire baseline_shadow_wr_en;
  wire busy;
  wire busy1;
  wire busy4_out;
  wire clear_error_proc;
  wire clip_flag_snapshot;
  wire clk_acq;
  wire clk_proc;
  wire [31:0]correlation_overflow_count;
  wire done_cdc_n_1;
  wire done_pulse;
  wire error_cdc_n_1;
  wire error_cdc_n_10;
  wire error_cdc_n_3;
  wire error_cdc_n_4;
  wire error_cdc_n_5;
  wire error_cdc_n_6;
  wire error_cdc_n_7;
  wire error_cdc_n_8;
  wire error_cdc_n_9;
  (* MARK_DEBUG *) wire [8:0]fall_wr_addr;
  (* MARK_DEBUG *) wire [15:0]fall_wr_data;
  (* MARK_DEBUG *) wire fall_wr_en;
  wire frame_error_sticky_proc;
  (* MARK_DEBUG *) wire [31:0]frame_meta;
  wire [5:0]frames_seen_proc;
  (* async_reg = "true" *) wire [5:0]frames_sync_1;
  (* async_reg = "true" *) wire [5:0]frames_sync_2;
  wire [2:0]launch_delay;
  (* MARK_DEBUG *) wire pair_valid;
  wire processing_done;
  wire processing_i_n_123;
  wire pulse_ready_acq;
  (* async_reg = "true" *) wire [1:0]pulse_ready_sync;
  wire pulse_start_acq;
  (* async_reg = "true" *) wire [1:0]ready_sync;
  wire [8:0]result_count;
  wire [7:0]result_rd_addr;
  wire [63:0]result_rd_data_q16;
  (* MARK_DEBUG *) wire [8:0]rise_wr_addr;
  (* MARK_DEBUG *) wire [15:0]rise_wr_data;
  (* MARK_DEBUG *) wire rise_wr_en;
  wire rst_acq;
  wire rst_proc;
  wire sample_clip;
  (* MARK_DEBUG *) wire [13:0]sample_fall_u14;
  (* MARK_DEBUG *) wire [13:0]sample_rise_u14;
  wire start_accepted;
  wire start_acq_pulse;
  wire start_cdc_n_1;
  wire start_cdc_n_2;
  wire start_cdc_n_3;
  wire start_cdc_n_4;
  wire start_pulse;
  wire start_pulse0;
  wire start_rejected_not_ready;
  wire start_rejected_not_ready_i_1_n_0;
  wire template_active_bank;
  wire template_commit_accepted;
  wire template_commit_pulse;
  wire template_commit_rejected;
  wire [9:0]template_shadow_wr_addr;
  wire [15:0]template_shadow_wr_data_q14;
  wire template_shadow_wr_en;
  (* MARK_DEBUG *) wire tx_marker;

  FDRE average_frame_available_proc_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(done_cdc_n_1),
        .Q(average_frame_available_proc),
        .R(1'b0));
  (* FRAME_W = "6" *) 
  (* INDEX_W = "9" *) 
  (* KEEP_HIERARCHY = "SOFT" *) 
  (* M = "32" *) 
  (* MAX_TRANSACTION_CYCLES = "70000" *) 
  (* PAIRS = "512" *) 
  (* PRETRIGGER_PAIRS = "64" *) 
  system_echo_pipeline_0_0_frame_average_pair_bram average_i
       (.busy(acq_busy),
        .clip_flag_snapshot(acq_clip),
        .clk_acq(clk_acq),
        .fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data),
        .fall_wr_en(fall_wr_en),
        .frame_error_pulse(acq_error_pulse),
        .frame_error_sticky(acq_error_sticky),
        .frame_meta({frame_meta[31:13],1'b0,frame_meta[11:0]}),
        .frames_seen(acq_frames_seen),
        .group_done_pulse(acq_done_pulse),
        .overflow_count(acq_overflow),
        .pair_valid(pair_valid),
        .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data),
        .rise_wr_en(rise_wr_en),
        .rst_acq(rst_acq),
        .sample_clip(sample_clip),
        .sample_fall_u14(sample_fall_u14),
        .sample_rise_u14(sample_rise_u14),
        .start_pulse(start_acq_pulse),
        .tx_marker(tx_marker));
  FDRE \average_overflow_count_reg[0] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[0]),
        .Q(average_overflow_count[0]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[10] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[10]),
        .Q(average_overflow_count[10]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[11] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[11]),
        .Q(average_overflow_count[11]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[12] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[12]),
        .Q(average_overflow_count[12]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[13] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[13]),
        .Q(average_overflow_count[13]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[14] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[14]),
        .Q(average_overflow_count[14]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[15] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[15]),
        .Q(average_overflow_count[15]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[16] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[16]),
        .Q(average_overflow_count[16]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[17] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[17]),
        .Q(average_overflow_count[17]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[18] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[18]),
        .Q(average_overflow_count[18]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[19] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[19]),
        .Q(average_overflow_count[19]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[1] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[1]),
        .Q(average_overflow_count[1]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[20] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[20]),
        .Q(average_overflow_count[20]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[21] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[21]),
        .Q(average_overflow_count[21]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[22] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[22]),
        .Q(average_overflow_count[22]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[23] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[23]),
        .Q(average_overflow_count[23]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[24] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[24]),
        .Q(average_overflow_count[24]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[25] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[25]),
        .Q(average_overflow_count[25]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[26] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[26]),
        .Q(average_overflow_count[26]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[27] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[27]),
        .Q(average_overflow_count[27]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[28] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[28]),
        .Q(average_overflow_count[28]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[29] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[29]),
        .Q(average_overflow_count[29]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[2] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[2]),
        .Q(average_overflow_count[2]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[30] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[30]),
        .Q(average_overflow_count[30]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[31] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[31]),
        .Q(average_overflow_count[31]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[3] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[3]),
        .Q(average_overflow_count[3]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[4] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[4]),
        .Q(average_overflow_count[4]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[5] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[5]),
        .Q(average_overflow_count[5]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[6] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[6]),
        .Q(average_overflow_count[6]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[7] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[7]),
        .Q(average_overflow_count[7]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[8] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[8]),
        .Q(average_overflow_count[8]),
        .R(rst_proc));
  FDRE \average_overflow_count_reg[9] 
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_overflow[9]),
        .Q(average_overflow_count[9]),
        .R(rst_proc));
  (* KEEP_HIERARCHY = "SOFT" *) 
  (* PAIRS = "512" *) 
  (* PAIR_ADDR_W = "9" *) 
  system_echo_pipeline_0_0_avg_frame_pair_dc_bram average_store_i
       (.fall_wr_addr(fall_wr_addr),
        .fall_wr_data_q2(fall_wr_data),
        .fall_wr_en(fall_wr_en),
        .rd_addr(avg_mem_rd_addr),
        .rd_clk(clk_proc),
        .rd_data_q2(average_debug_rd_data_q2),
        .rd_en(processing_i_n_123),
        .rise_wr_addr(rise_wr_addr),
        .rise_wr_data_q2(rise_wr_data),
        .rise_wr_en(rise_wr_en),
        .wr_clk(clk_acq));
  FDRE busy_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(error_cdc_n_1),
        .Q(busy),
        .R(1'b0));
  FDRE clip_flag_snapshot_reg
       (.C(clk_proc),
        .CE(start_pulse0),
        .D(acq_clip),
        .Q(clip_flag_snapshot),
        .R(rst_proc));
  (* CHECK_LICENSE_TYPE = "ila_echo_200,ila,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "ila,Vivado 2026.1" *) 
  system_echo_pipeline_0_0_ila_echo_200 debug_i
       (.clk(clk_acq),
        .probe0(sample_rise_u14),
        .probe1(sample_fall_u14),
        .probe2(frame_meta),
        .probe3({pair_valid,tx_marker,acq_error_sticky,acq_frames_seen,rise_wr_en,fall_wr_en}),
        .probe4({rise_wr_addr,fall_wr_addr,rise_wr_data,fall_wr_data}));
  system_echo_pipeline_0_0_cdc_pulse_toggle done_cdc
       (.E(start_pulse0),
        .acq_done_proc_pulse(acq_done_proc_pulse),
        .acq_error_proc_pulse(acq_error_proc_pulse),
        .average_frame_available_proc(average_frame_available_proc),
        .average_frame_available_proc_reg(done_cdc_n_1),
        .average_frame_available_proc_reg_0(busy),
        .busy4_out(busy4_out),
        .clk_acq(clk_acq),
        .clk_proc(clk_proc),
        .group_done_pulse(acq_done_pulse),
        .rst_acq(rst_acq),
        .rst_proc(rst_proc));
  FDRE done_pulse_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(busy1),
        .Q(done_pulse),
        .R(rst_proc));
  system_echo_pipeline_0_0_cdc_pulse_toggle_0 error_cdc
       (.D({error_cdc_n_4,error_cdc_n_5,error_cdc_n_6,error_cdc_n_7,error_cdc_n_8,error_cdc_n_9}),
        .E(error_cdc_n_3),
        .acq_done_proc_pulse(acq_done_proc_pulse),
        .acq_error_proc_pulse(acq_error_proc_pulse),
        .busy4_out(busy4_out),
        .busy_reg(error_cdc_n_10),
        .busy_reg_0(busy),
        .clear_error_proc(clear_error_proc),
        .clk_acq(clk_acq),
        .clk_proc(clk_proc),
        .dst_pulse_reg_0(error_cdc_n_1),
        .frame_error_pulse(acq_error_pulse),
        .frame_error_sticky_proc(frame_error_sticky_proc),
        .\frames_seen_proc_reg[0] (pulse_ready_sync[1]),
        .\frames_seen_proc_reg[5] (frames_sync_2),
        .out(ready_sync[1]),
        .processing_done(processing_done),
        .rst_acq(rst_acq),
        .rst_proc(rst_proc),
        .start_pulse(start_pulse));
  FDRE frame_error_sticky_proc_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(error_cdc_n_10),
        .Q(frame_error_sticky_proc),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[0] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_9),
        .Q(frames_seen_proc[0]),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[1] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_8),
        .Q(frames_seen_proc[1]),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[2] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_7),
        .Q(frames_seen_proc[2]),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[3] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_6),
        .Q(frames_seen_proc[3]),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[4] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_5),
        .Q(frames_seen_proc[4]),
        .R(rst_proc));
  FDRE \frames_seen_proc_reg[5] 
       (.C(clk_proc),
        .CE(error_cdc_n_3),
        .D(error_cdc_n_4),
        .Q(frames_seen_proc[5]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[0] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[0]),
        .Q(frames_sync_1[0]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[1] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[1]),
        .Q(frames_sync_1[1]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[2] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[2]),
        .Q(frames_sync_1[2]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[3] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[3]),
        .Q(frames_sync_1[3]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[4] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[4]),
        .Q(frames_sync_1[4]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_1_reg[5] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(acq_frames_seen[5]),
        .Q(frames_sync_1[5]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[0] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[0]),
        .Q(frames_sync_2[0]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[1] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[1]),
        .Q(frames_sync_2[1]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[2] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[2]),
        .Q(frames_sync_2[2]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[3] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[3]),
        .Q(frames_sync_2[3]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[4] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[4]),
        .Q(frames_sync_2[4]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \frames_sync_2_reg[5] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(frames_sync_1[5]),
        .Q(frames_sync_2[5]),
        .R(rst_proc));
  FDRE \launch_delay_reg[0] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(start_cdc_n_3),
        .Q(launch_delay[0]),
        .R(1'b0));
  FDRE \launch_delay_reg[1] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(start_cdc_n_2),
        .Q(launch_delay[1]),
        .R(1'b0));
  FDRE \launch_delay_reg[2] 
       (.C(clk_acq),
        .CE(1'b1),
        .D(start_cdc_n_1),
        .Q(launch_delay[2]),
        .R(rst_acq));
  system_echo_pipeline_0_0_processing_chain processing_i
       (.Q(result_count),
        .acq_done_proc_pulse(acq_done_proc_pulse),
        .active_bank_reg(baseline_active_bank),
        .active_bank_reg_0(template_active_bank),
        .average_debug_rd_addr(average_debug_rd_addr),
        .average_debug_rd_data_q2(average_debug_rd_data_q2),
        .baseline_commit_accepted(baseline_commit_accepted),
        .baseline_commit_pulse(baseline_commit_pulse),
        .baseline_commit_rejected(baseline_commit_rejected),
        .baseline_shadow_wr_addr(baseline_shadow_wr_addr),
        .baseline_shadow_wr_data_q2(baseline_shadow_wr_data_q2),
        .baseline_shadow_wr_en(baseline_shadow_wr_en),
        .busy1(busy1),
        .clk_proc(clk_proc),
        .commit_rejected_reg(busy),
        .correlation_overflow_count(correlation_overflow_count),
        .processing_done(processing_done),
        .rd_addr(avg_mem_rd_addr),
        .rd_en(processing_i_n_123),
        .result_rd_addr(result_rd_addr),
        .result_rd_data_q16(result_rd_data_q16),
        .rst_proc(rst_proc),
        .template_commit_accepted(template_commit_accepted),
        .template_commit_pulse(template_commit_pulse),
        .template_commit_rejected(template_commit_rejected),
        .template_shadow_wr_addr(template_shadow_wr_addr),
        .template_shadow_wr_data_q14(template_shadow_wr_data_q14),
        .template_shadow_wr_en(template_shadow_wr_en));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \pulse_ready_sync_reg[0] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(pulse_ready_acq),
        .Q(pulse_ready_sync[0]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \pulse_ready_sync_reg[1] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(pulse_ready_sync[0]),
        .Q(pulse_ready_sync[1]),
        .R(rst_proc));
  FDRE pulse_start_acq_reg
       (.C(clk_acq),
        .CE(1'b1),
        .D(start_cdc_n_4),
        .Q(pulse_start_acq),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \ready_sync_reg[0] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(adc_ready_acq),
        .Q(ready_sync[0]),
        .R(rst_proc));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \ready_sync_reg[1] 
       (.C(clk_proc),
        .CE(1'b1),
        .D(ready_sync[0]),
        .Q(ready_sync[1]),
        .R(rst_proc));
  FDRE start_accepted_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(busy4_out),
        .Q(start_accepted),
        .R(rst_proc));
  system_echo_pipeline_0_0_cdc_pulse_toggle_1 start_cdc
       (.clk_acq(clk_acq),
        .clk_proc(clk_proc),
        .launch_delay(launch_delay),
        .\launch_delay_reg[0] (start_cdc_n_1),
        .\launch_delay_reg[0]_0 (start_cdc_n_2),
        .\launch_delay_reg[0]_1 (start_cdc_n_3),
        .\launch_delay_reg[1] (start_cdc_n_4),
        .rst_acq(rst_acq),
        .rst_proc(rst_proc),
        .start_accepted(start_accepted),
        .start_acq_pulse(start_acq_pulse));
  LUT4 #(
    .INIT(16'h0444)) 
    start_rejected_not_ready_i_1
       (.I0(rst_proc),
        .I1(start_pulse),
        .I2(ready_sync[1]),
        .I3(pulse_ready_sync[1]),
        .O(start_rejected_not_ready_i_1_n_0));
  FDRE start_rejected_not_ready_reg
       (.C(clk_proc),
        .CE(1'b1),
        .D(start_rejected_not_ready_i_1_n_0),
        .Q(start_rejected_not_ready),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "result_bram" *) 
module system_echo_pipeline_0_0_result_bram
   (result_rd_data_q16,
    clk_proc,
    result_rd_addr,
    mem_reg_0,
    mem_reg_1,
    WEBWE);
  output [63:0]result_rd_data_q16;
  input clk_proc;
  input [7:0]result_rd_addr;
  input [7:0]mem_reg_0;
  input [47:0]mem_reg_1;
  input [0:0]WEBWE;

  wire [0:0]WEBWE;
  wire clk_proc;
  wire [7:0]mem_reg_0;
  wire [47:0]mem_reg_1;
  wire [7:0]result_rd_addr;
  wire [63:0]result_rd_data_q16;
  wire NLW_mem_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_SBITERR_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d64" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "pulse_pair_echo_pipeline/processing_i/result_store/mem_reg" *) 
  (* RTL_RAM_STYLE = "block" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "256" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "63" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,result_rd_addr,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,mem_reg_0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_mem_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk_proc),
        .CLKBWRCLK(clk_proc),
        .DBITERR(NLW_mem_reg_DBITERR_UNCONNECTED),
        .DIADI(mem_reg_1[31:0]),
        .DIBDI({mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47],mem_reg_1[47:32]}),
        .DIPADIP({1'b1,1'b1,1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(result_rd_data_q16[31:0]),
        .DOBDO(result_rd_data_q16[63:32]),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_mem_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b1),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(NLW_mem_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE}));
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
