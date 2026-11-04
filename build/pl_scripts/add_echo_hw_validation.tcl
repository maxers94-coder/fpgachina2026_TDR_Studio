set root [file normalize [file join [file dirname [info script]] ..]]
set xpr [file join $root vivado adc_dac_loopback_test.xpr]

if {![file exists $xpr]} {
    error "Vivado project not found: $xpr"
}

open_project $xpr

set design_top_before [get_property top [get_filesets sources_1]]
set sim_top_before [get_property top [get_filesets sim_1]]

foreach source [list \
    [file join $root rtl ac820_echo_hw_top.sv] \
    [file join $root rtl integration echo_pipeline_hw_control.sv] \
    [file join $root rtl integration echo_pipeline_hw_probe.sv]] {
    if {![file exists $source]} {
        error "Required source not found: $source"
    }
    if {[llength [get_files -quiet $source]] == 0} {
        add_files -norecurse $source
    }
}

if {[llength [get_ips -quiet vio_echo_control]] == 0} {
    create_ip -name vio -vendor xilinx.com -library ip -module_name vio_echo_control
}
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

if {[llength [get_ips -quiet ila_echo_pipeline]] == 0} {
    create_ip -name ila -vendor xilinx.com -library ip -module_name ila_echo_pipeline
}
set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {5} \
    CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {64} \
    CONFIG.C_PROBE3_WIDTH {8} \
    CONFIG.C_PROBE4_WIDTH {9}] [get_ips ila_echo_pipeline]

generate_target all [get_ips vio_echo_control]
generate_target all [get_ips ila_echo_pipeline]
foreach ip [list vio_echo_control ila_echo_pipeline] {
    if {[llength [get_runs -quiet ${ip}_synth_1]] == 0} {
        create_ip_run [get_ips $ip]
    }
}

update_compile_order -fileset sources_1
set_property top $design_top_before [get_filesets sources_1]
set_property top $sim_top_before [get_filesets sim_1]

puts "ECHO_HW_SOURCES_REGISTERED"
puts "DESIGN_TOP_PRESERVED: [get_property top [get_filesets sources_1]]"
puts "SIM_TOP_PRESERVED: [get_property top [get_filesets sim_1]]"
puts "To build the validation image, temporarily set sources_1 top to ac820_echo_hw_top."
close_project
