set stage_root [file normalize [file join [file dirname [info script]] ..]]
set project_root {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test}
set build_root {C:/Users/Lenovo/AppData/Local/Temp/echo_hw_validation_build}
set build_dir [file join $build_root vivado]
set report_dir [file join $build_root reports]
set output_dir [file join $build_root output]
file mkdir $report_dir
file mkdir $output_dir

create_project echo_hw_validation $build_dir -part xc7z020clg484-2 -force
set_property target_language Verilog [current_project]

add_files [glob [file join $project_root rtl *.sv]]
add_files [glob [file join $project_root rtl *.mem]]
add_files [glob [file join $project_root rtl processing *.sv]]
add_files [glob [file join $project_root rtl integration *.sv]]
add_files [file join $stage_root rtl integration echo_pipeline_hw_control.sv]
add_files [file join $stage_root rtl integration echo_pipeline_hw_probe.sv]
add_files [file join $stage_root rtl ac820_echo_hw_top.sv]
add_files -fileset constrs_1 [file join $project_root constraints ac820_adc_dac.xdc]
set_property top ac820_echo_hw_top [get_filesets sources_1]

create_ip -name vio -vendor xilinx.com -library ip -module_name vio_test_control
set_property -dict [list \
    CONFIG.C_NUM_PROBE_IN {0} \
    CONFIG.C_NUM_PROBE_OUT {1} \
    CONFIG.C_PROBE_OUT0_WIDTH {3} \
    CONFIG.C_PROBE_OUT0_INIT_VAL {0x0}] [get_ips vio_test_control]

create_ip -name vio -vendor xilinx.com -library ip -module_name vio_echo_control
set_property -dict [list \
    CONFIG.C_NUM_PROBE_IN {5} \
    CONFIG.C_NUM_PROBE_OUT {3} \
    CONFIG.C_PROBE_IN0_WIDTH {32} \
    CONFIG.C_PROBE_IN1_WIDTH {64} \
    CONFIG.C_PROBE_IN2_WIDTH {32} \
    CONFIG.C_PROBE_IN3_WIDTH {32} \
    CONFIG.C_PROBE_IN4_WIDTH {32} \
    CONFIG.C_PROBE_OUT0_WIDTH {1} \
    CONFIG.C_PROBE_OUT0_INIT_VAL {0x0} \
    CONFIG.C_PROBE_OUT1_WIDTH {8} \
    CONFIG.C_PROBE_OUT1_INIT_VAL {0x00} \
    CONFIG.C_PROBE_OUT2_WIDTH {1} \
    CONFIG.C_PROBE_OUT2_INIT_VAL {0x0}] [get_ips vio_echo_control]

create_ip -name ila -vendor xilinx.com -library ip -module_name ila_echo_pipeline
set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {5} \
    CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {64} \
    CONFIG.C_PROBE3_WIDTH {8} \
    CONFIG.C_PROBE4_WIDTH {9}] [get_ips ila_echo_pipeline]

generate_target all [get_ips]
synth_ip [get_ips]
update_compile_order -fileset sources_1

synth_design -top ac820_echo_hw_top -part xc7z020clg484-2
report_utilization -file [file join $report_dir echo_hw_synth_utilization.rpt]
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose \
    -file [file join $report_dir echo_hw_synth_timing.rpt]
report_cdc -details -file [file join $report_dir echo_hw_synth_cdc.rpt]

opt_design
place_design
phys_opt_design
route_design

report_drc -file [file join $report_dir echo_hw_route_drc.rpt]
report_utilization -file [file join $report_dir echo_hw_route_utilization.rpt]
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose \
    -file [file join $report_dir echo_hw_route_timing.rpt]
report_cdc -details -file [file join $report_dir echo_hw_route_cdc.rpt]
report_bus_skew -file [file join $report_dir echo_hw_route_bus_skew.rpt]

write_checkpoint -force [file join $output_dir ac820_echo_hw_validation.dcp]
write_bitstream -force [file join $output_dir ac820_echo_hw_validation.bit]
write_debug_probes -force [file join $output_dir ac820_echo_hw_validation.ltx]

puts "ECHO_HW_VALIDATION_BUILD_PASS"
puts "BITSTREAM: [file join $output_dir ac820_echo_hw_validation.bit]"
puts "PROBES: [file join $output_dir ac820_echo_hw_validation.ltx]"
close_project
