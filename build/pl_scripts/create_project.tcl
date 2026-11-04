set root [file normalize [file join [file dirname [info script]] ..]]
cd $root
create_project adc_dac_loopback_test [file join $root vivado] -part xc7z020clg484-2 -force
set_property target_language Verilog [current_project]
add_files [glob [file join $root rtl *.sv]]
add_files [glob [file join $root rtl *.mem]]
set processing_sources [glob -nocomplain [file join $root rtl processing *.sv]]
set integration_sources [glob -nocomplain [file join $root rtl integration *.sv]]
if {[llength $processing_sources] > 0} {add_files $processing_sources}
if {[llength $integration_sources] > 0} {add_files $integration_sources}
add_files -fileset constrs_1 [file join $root constraints ac820_adc_dac.xdc]
add_files -fileset sim_1 [file join $root sim tb_dac_sine.sv]
if {[file exists [file join $root sim tb_adc_pair_echo_pipeline.sv]]} {
    add_files -fileset sim_1 [file join $root sim tb_adc_pair_echo_pipeline.sv]
}
if {[file exists [file join $root sim tb_adc_pl_stream_frontend.sv]]} {
    add_files -fileset sim_1 [file join $root sim tb_adc_pl_stream_frontend.sv]
}
if {[file exists [file join $root sim tb_echo_pipeline_hw_control.sv]]} {
    add_files -fileset sim_1 [file join $root sim tb_echo_pipeline_hw_control.sv]
}
add_files -fileset utils_1 [file join $root scripts debug_clock.tcl]
set_property top ac820_adc_dac_top [get_filesets sources_1]
set_property top tb_dac_sine [get_filesets sim_1]
set_property xsim.simulate.runtime all [get_filesets sim_1]

create_ip -name vio -vendor xilinx.com -library ip -module_name vio_test_control
set_property -dict [list CONFIG.C_NUM_PROBE_IN {0} CONFIG.C_NUM_PROBE_OUT {1} \
    CONFIG.C_PROBE_OUT0_WIDTH {3} CONFIG.C_PROBE_OUT0_INIT_VAL {0x0}] [get_ips vio_test_control]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_adc_capture
set_property -dict [list CONFIG.C_NUM_OF_PROBES {5} CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} CONFIG.C_PROBE0_WIDTH {14} CONFIG.C_PROBE1_WIDTH {14} \
    CONFIG.C_PROBE2_WIDTH {8} CONFIG.C_PROBE3_WIDTH {32} CONFIG.C_PROBE4_WIDTH {32}] [get_ips ila_adc_capture]

# Optional ADC-to-AXI hardware validation instruments.  They are generated on
# project recreation but do not affect the default ac820_adc_dac_top build.
create_ip -name vio -vendor xilinx.com -library ip -module_name vio_stream_control
set_property -dict [list CONFIG.C_NUM_PROBE_IN {3} CONFIG.C_NUM_PROBE_OUT {3} \
    CONFIG.C_PROBE_IN0_WIDTH {32} CONFIG.C_PROBE_IN1_WIDTH {32} CONFIG.C_PROBE_IN2_WIDTH {16} \
    CONFIG.C_PROBE_OUT0_WIDTH {1} CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
    CONFIG.C_PROBE_OUT1_WIDTH {1} CONFIG.C_PROBE_OUT1_INIT_VAL {0x1} \
    CONFIG.C_PROBE_OUT2_WIDTH {1} CONFIG.C_PROBE_OUT2_INIT_VAL {0x0}] [get_ips vio_stream_control]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_adc_stream
set_property -dict [list CONFIG.C_NUM_OF_PROBES {4} CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} CONFIG.C_PROBE0_WIDTH {32} CONFIG.C_PROBE1_WIDTH {19} \
    CONFIG.C_PROBE2_WIDTH {32} CONFIG.C_PROBE3_WIDTH {32}] [get_ips ila_adc_stream]

# Optional full ADC-to-echo-processing hardware validation instruments.  The
# validation top remains opt-in and does not replace ac820_adc_dac_top.
create_ip -name vio -vendor xilinx.com -library ip -module_name vio_echo_control
set_property -dict [list CONFIG.C_NUM_PROBE_IN {5} CONFIG.C_NUM_PROBE_OUT {3} \
    CONFIG.C_PROBE_IN0_WIDTH {32} CONFIG.C_PROBE_IN1_WIDTH {64} \
    CONFIG.C_PROBE_IN2_WIDTH {32} CONFIG.C_PROBE_IN3_WIDTH {32} \
    CONFIG.C_PROBE_IN4_WIDTH {32} CONFIG.C_PROBE_OUT0_WIDTH {1} \
    CONFIG.C_PROBE_OUT0_INIT_VAL {0x0} CONFIG.C_PROBE_OUT1_WIDTH {8} \
    CONFIG.C_PROBE_OUT1_INIT_VAL {0x00} CONFIG.C_PROBE_OUT2_WIDTH {1} \
    CONFIG.C_PROBE_OUT2_INIT_VAL {0x0}] [get_ips vio_echo_control]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_echo_pipeline
set_property -dict [list CONFIG.C_NUM_OF_PROBES {5} CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} CONFIG.C_PROBE0_WIDTH {32} CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {64} CONFIG.C_PROBE3_WIDTH {8} CONFIG.C_PROBE4_WIDTH {9}] \
    [get_ips ila_echo_pipeline]

generate_target all [get_ips]
foreach ip [get_ips] { create_ip_run $ip }
update_compile_order -fileset sources_1
puts "PROJECT_READY: [file join $root vivado adc_dac_loopback_test.xpr]"
close_project
