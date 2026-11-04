# Create the Zynq PS + AC820 ADC/DAC + AXI echo-processing system.
# Stage17 generates a project under D:/vivado_project/pn17_hw so Windows IP
# paths stay short. Historical vivado_ps and exported bitstreams are retained.

set script_dir [file dirname [file normalize [info script]]]
set root_dir [file normalize [file join $script_dir ..]]
# Keep generated IP/run paths short on Windows. Editable sources remain here.
set project_dir [file normalize [file join $root_dir .. .. pn17_hw]]
set project_name echo_ps_system
set part_name xc7z020clg484-2

if {[llength [get_projects -quiet]] != 0} {
    close_project
}
create_project $project_name $project_dir -part $part_name -force
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]

set rtl_files [list \
    [file join $root_dir rtl ac820_adc_dac_frontend_ps.sv] \
    [file join $root_dir rtl adc_loopback_rx.sv] \
    [file join $root_dir rtl dac_init.sv] \
    [file join $root_dir rtl dac_lvds_tx.sv] \
    [file join $root_dir rtl sync_pulse_engine.sv] \
    [file join $root_dir rtl pulse_burst_32.sv] \
    [file join $root_dir rtl spi24_master.sv] \
    [file join $root_dir rtl processing accum_tdp_bram.sv] \
    [file join $root_dir rtl processing avg_frame_dc_bram.sv] \
    [file join $root_dir rtl processing avg_frame_pair_dc_bram.sv] \
    [file join $root_dir rtl processing baseline_sub.sv] \
    [file join $root_dir rtl processing cdc_pulse_toggle.sv] \
    [file join $root_dir rtl processing coeff_shadow_bank.sv] \
    [file join $root_dir rtl processing corr_mac.sv] \
    [file join $root_dir rtl processing frame_average_bram.sv] \
    [file join $root_dir rtl processing frame_average_pair_bram.sv] \
    [file join $root_dir rtl processing processing_chain.sv] \
    [file join $root_dir rtl processing result_bram.sv] \
    [file join $root_dir rtl integration pulse_pair_echo_pipeline.sv] \
    [file join $root_dir rtl integration echo_pipeline_axi_bridge_phase2.sv] \
    [file join $root_dir rtl integration echo_pipeline_axi_control_phase2.sv] \
]

foreach f $rtl_files {
    if {![file exists $f]} { error "Missing required RTL file: $f" }
}
add_files -norecurse $rtl_files
add_files -norecurse [list \
    [file join $root_dir rtl ad9516_adc200m_dacref200m.mem] \
]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_echo_200
set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {5} CONFIG.C_DATA_DEPTH {4096} \
    CONFIG.C_INPUT_PIPE_STAGES {1} \
    CONFIG.C_PROBE0_WIDTH {14} CONFIG.C_PROBE1_WIDTH {14} \
    CONFIG.C_PROBE2_WIDTH {32} CONFIG.C_PROBE3_WIDTH {11} \
    CONFIG.C_PROBE4_WIDTH {50} \
] [get_ips ila_echo_200]
generate_target all [get_ips ila_echo_200]

# Recreate the exact PS7 DDR/MIO configuration exported from the known-good
# key_ctrl_led project for this AC820/XC7Z020 carrier.
set ps_reference_tcl [file join $root_dir tmp reference_ps_system_bd.tcl]
if {![file exists $ps_reference_tcl]} {
    error "Missing PS reference design: $ps_reference_tcl"
}
source $ps_reference_tcl
current_bd_design system

# The reference design exposed a two-bit EMIO GPIO for its LED demo.  It is
# intentionally removed here because the FMC design owns the four LED pins.
if {[llength [get_bd_intf_nets -quiet processing_system7_0_GPIO_0]]} {
    delete_bd_objs [get_bd_intf_nets processing_system7_0_GPIO_0]
}
if {[llength [get_bd_intf_ports -quiet GPIO_0_0]]} {
    delete_bd_objs [get_bd_intf_ports GPIO_0_0]
}

set ps7 [get_bd_cells processing_system7_0]
set_property -dict [list \
    CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
    CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {0} \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
    CONFIG.PCW_IRQ_F2P_INTR {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART0_UART0_IO {MIO 10 .. 11} \
    CONFIG.PCW_UART0_BAUD_RATE {115200} \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
    CONFIG.PCW_UART1_BAUD_RATE {115200} \
    CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
] $ps7

# AXI control interconnect and synchronous reset for FCLK_CLK0.
set axi_ic [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $axi_ic
set rst_ps [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_100M]
set rst_inv [create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 fclk_resetn_inv]
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] $rst_inv
set irq_concat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 irq_concat_0]
set_property -dict [list CONFIG.NUM_PORTS {1}] $irq_concat

# Module references keep the hardware front end and processing/control block
# as reviewable SystemVerilog instead of packaging them as opaque custom IP.
set frontend [create_bd_cell -type module -reference ac820_adc_dac_frontend_ps frontend_0]
set echo_ctrl [create_bd_cell -type module -reference echo_pipeline_axi_control_phase2 echo_pipeline_0]

# AXI4-Lite and PS clock/reset wiring.
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/M_AXI_GP0] \
                    [get_bd_intf_pins axi_interconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_0/M00_AXI] \
                    [get_bd_intf_pins echo_pipeline_0/S_AXI]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
    [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] \
    [get_bd_pins axi_interconnect_0/ACLK] \
    [get_bd_pins axi_interconnect_0/S00_ACLK] \
    [get_bd_pins axi_interconnect_0/M00_ACLK] \
    [get_bd_pins rst_ps7_0_100M/slowest_sync_clk] \
    [get_bd_pins echo_pipeline_0/s_axi_aclk]
connect_bd_net [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
               [get_bd_pins fclk_resetn_inv/Op1]
connect_bd_net [get_bd_pins fclk_resetn_inv/Res] \
               [get_bd_pins rst_ps7_0_100M/ext_reset_in]
connect_bd_net [get_bd_pins rst_ps7_0_100M/interconnect_aresetn] \
               [get_bd_pins axi_interconnect_0/ARESETN]
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] \
    [get_bd_pins axi_interconnect_0/S00_ARESETN] \
    [get_bd_pins axi_interconnect_0/M00_ARESETN] \
    [get_bd_pins echo_pipeline_0/s_axi_aresetn]

# Acquisition-domain signals remain entirely in PL and do not traverse PS.
connect_bd_net [get_bd_pins frontend_0/echo_clk_acq] \
               [get_bd_pins echo_pipeline_0/clk_acq]
connect_bd_net [get_bd_pins frontend_0/echo_rst_acq] \
               [get_bd_pins echo_pipeline_0/rst_acq]
connect_bd_net [get_bd_pins frontend_0/echo_adc_ready] \
               [get_bd_pins echo_pipeline_0/adc_ready_acq]
connect_bd_net [get_bd_pins frontend_0/echo_pair_valid] \
               [get_bd_pins echo_pipeline_0/pair_valid]
connect_bd_net [get_bd_pins frontend_0/echo_sample_rise_u14] \
               [get_bd_pins echo_pipeline_0/sample_rise_u14]
connect_bd_net [get_bd_pins frontend_0/echo_sample_fall_u14] \
               [get_bd_pins echo_pipeline_0/sample_fall_u14]
connect_bd_net [get_bd_pins frontend_0/echo_sample_clip] \
               [get_bd_pins echo_pipeline_0/sample_clip]
connect_bd_net [get_bd_pins frontend_0/echo_pulse_ready] \
               [get_bd_pins echo_pipeline_0/pulse_ready_acq]
connect_bd_net [get_bd_pins frontend_0/echo_tx_marker] \
               [get_bd_pins echo_pipeline_0/tx_marker]
connect_bd_net [get_bd_pins frontend_0/echo_frame_meta] \
               [get_bd_pins echo_pipeline_0/frame_meta]
connect_bd_net [get_bd_pins echo_pipeline_0/pulse_start_acq] \
               [get_bd_pins frontend_0/echo_pulse_start_acq]
connect_bd_net [get_bd_pins echo_pipeline_0/pulse_mode] \
               [get_bd_pins frontend_0/echo_pulse_mode]
connect_bd_net [get_bd_pins echo_pipeline_0/pulse_width] \
               [get_bd_pins frontend_0/echo_pulse_width]
connect_bd_net [get_bd_pins echo_pipeline_0/pn_enable] \
               [get_bd_pins frontend_0/echo_pn_enable]

connect_bd_net [get_bd_pins echo_pipeline_0/irq_f2p] \
               [get_bd_pins irq_concat_0/In0]
connect_bd_net [get_bd_pins irq_concat_0/dout] \
               [get_bd_pins processing_system7_0/IRQ_F2P]

proc connect_scalar_port {name dir pin {type ""}} {
    if {$type eq ""} {
        set p [create_bd_port -dir $dir $name]
    } elseif {$type eq "clk50"} {
        set p [create_bd_port -dir $dir -type clk -freq_hz 50000000 $name]
    } elseif {$type eq "clk100"} {
        set p [create_bd_port -dir $dir -type clk -freq_hz 100000000 $name]
    } else {
        set p [create_bd_port -dir $dir -type $type $name]
    }
    connect_bd_net $p [get_bd_pins $pin]
    return $p
}
proc connect_vector_port {name dir msb lsb pin} {
    set p [create_bd_port -dir $dir -from $msb -to $lsb $name]
    connect_bd_net $p [get_bd_pins $pin]
    return $p
}

set clk50_port [connect_scalar_port clk_50m I frontend_0/clk_50m clk50]
connect_scalar_port adc_dco_p I frontend_0/adc_dco_p clk100
connect_scalar_port adc_dco_n I frontend_0/adc_dco_n
connect_vector_port adc_data_p I 13 0 frontend_0/adc_data_p
connect_vector_port adc_data_n I 13 0 frontend_0/adc_data_n
connect_scalar_port adk_spi_sda O frontend_0/adk_spi_sda
connect_scalar_port adk_spi_sclk O frontend_0/adk_spi_sclk
connect_scalar_port adk_spi_csb O frontend_0/adk_spi_csb
connect_scalar_port dac_spi_sdio IO frontend_0/dac_spi_sdio
connect_scalar_port dac_spi_sclk O frontend_0/dac_spi_sclk
connect_scalar_port dac_spi_csb O frontend_0/dac_spi_csb
connect_scalar_port dac_dci_p O frontend_0/dac_dci_p
connect_scalar_port dac_dci_n O frontend_0/dac_dci_n
connect_vector_port dac_data_p O 15 0 frontend_0/dac_data_p
connect_vector_port dac_data_n O 15 0 frontend_0/dac_data_n
connect_scalar_port pll_done_led O frontend_0/pll_done_led
connect_scalar_port dac_done_led O frontend_0/dac_done_led
connect_scalar_port adc_ready_led O frontend_0/adc_ready_led
connect_scalar_port adc_clip_led O frontend_0/adc_clip_led

# Stable software-visible base address documented in echo_pl_regs.h.
assign_bd_address
set echo_addr_seg [get_bd_addr_segs -quiet -of_objects \
    [get_bd_addr_spaces processing_system7_0/Data] \
    -filter {NAME =~ *echo_pipeline_0*}]
if {[llength $echo_addr_seg] != 1} {
    error "Expected one PS address segment for echo_pipeline_0, found [llength $echo_addr_seg]: $echo_addr_seg"
}
set_property offset 0x43C00000 $echo_addr_seg
set_property range 64K $echo_addr_seg

validate_bd_design
save_bd_design
generate_target all [get_files system.bd]
set wrapper_files [make_wrapper -files [get_files system.bd] -top]
add_files -norecurse $wrapper_files
set_property top system_wrapper [get_filesets sources_1]

set ps_xdc [file join $root_dir constraints ac820_adc_dac_ps.xdc]
if {![file exists $ps_xdc]} { error "Missing PS-system constraints: $ps_xdc" }
add_files -fileset constrs_1 -norecurse $ps_xdc
set ps_adc_impl_xdc [file join $root_dir constraints ac820_ps_adc_clock_groups_impl.xdc]
if {![file exists $ps_adc_impl_xdc]} { error "Missing PS/ADC implementation timing constraints: $ps_adc_impl_xdc" }
add_files -fileset constrs_1 -norecurse $ps_adc_impl_xdc
set_property USED_IN_SYNTHESIS false [get_files $ps_adc_impl_xdc]
set_property USED_IN_IMPLEMENTATION true [get_files $ps_adc_impl_xdc]
set_property PROCESSING_ORDER LATE [get_files $ps_adc_impl_xdc]

update_compile_order -fileset sources_1

puts "PS_SYSTEM_PROJECT=$project_dir/$project_name.xpr"
puts "PS_SYSTEM_TOP=system_wrapper"
puts "PS_SYSTEM_AXI_BASE=0x43C00000"
puts "PS_SYSTEM_CREATE_PASS"
