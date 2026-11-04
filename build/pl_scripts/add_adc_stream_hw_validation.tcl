set root {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test}
set xpr [file join $root vivado adc_dac_loopback_test.xpr]

if {![file exists $xpr]} {
    error "Vivado project not found: $xpr"
}

open_project $xpr

# Register the optional ADC-to-AXI hardware validation top without changing
# the trusted loopback top used by the existing bitstream.
foreach source [list \
    [file join $root rtl ac820_adc_stream_top.sv] \
    [file join $root rtl integration adc_stream_hw_probe.sv] \
    [file join $root rtl integration axis_async_fifo.sv]] {
    if {![file exists $source]} {
        error "Required source not found: $source"
    }
    if {[llength [get_files -quiet $source]] == 0} {
        add_files -norecurse $source
    }
}

if {[llength [get_ips -quiet vio_stream_control]] == 0} {
    create_ip -name vio -vendor xilinx.com -library ip -module_name vio_stream_control
}
set_property -dict [list \
    CONFIG.C_NUM_PROBE_IN {3} \
    CONFIG.C_NUM_PROBE_OUT {3} \
    CONFIG.C_PROBE_IN0_WIDTH {32} \
    CONFIG.C_PROBE_IN1_WIDTH {32} \
    CONFIG.C_PROBE_IN2_WIDTH {16} \
    CONFIG.C_PROBE_OUT0_WIDTH {1} \
    CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
    CONFIG.C_PROBE_OUT1_WIDTH {1} \
    CONFIG.C_PROBE_OUT1_INIT_VAL {0x1} \
    CONFIG.C_PROBE_OUT2_WIDTH {1} \
    CONFIG.C_PROBE_OUT2_INIT_VAL {0x0}] [get_ips vio_stream_control]

if {[llength [get_ips -quiet ila_adc_stream]] == 0} {
    create_ip -name ila -vendor xilinx.com -library ip -module_name ila_adc_stream
}
set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {4} \
    CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_INPUT_PIPE_STAGES {1} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {19} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32}] [get_ips ila_adc_stream]

generate_target all [get_ips vio_stream_control ila_adc_stream]
foreach ip [get_ips vio_stream_control ila_adc_stream] {
    if {[llength [get_runs -quiet ${ip}_synth_1]] == 0} {
        create_ip_run $ip
    }
}

# Preserve the current project configuration.  The operator deliberately
# selects ac820_adc_stream_top only when rebuilding the stream-validation bit.
set_property top ac820_adc_dac_top [get_filesets sources_1]
set_property top tb_dac_sine [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "ADC_STREAM_SOURCES_REGISTERED"
puts "DESIGN_TOP: [get_property top [get_filesets sources_1]]"
puts "SIM_TOP: [get_property top [get_filesets sim_1]]"
close_project
