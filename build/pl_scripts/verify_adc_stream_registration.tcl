set root {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test}
open_project [file join $root vivado adc_dac_loopback_test.xpr]

set failures 0
foreach source [list \
    [file join $root rtl ac820_adc_stream_top.sv] \
    [file join $root rtl integration adc_stream_hw_probe.sv] \
    [file join $root rtl integration axis_async_fifo.sv]] {
    if {[llength [get_files -quiet $source]] == 0} {
        puts "VERIFY_FAIL missing source: $source"
        incr failures
    } else {
        puts "VERIFY_PASS source: $source"
    }
}

foreach ip {vio_stream_control ila_adc_stream} {
    if {[llength [get_ips -quiet $ip]] == 0} {
        puts "VERIFY_FAIL missing IP: $ip"
        incr failures
    } else {
        puts "VERIFY_PASS IP: $ip"
    }
}

set design_top [get_property top [get_filesets sources_1]]
set sim_top [get_property top [get_filesets sim_1]]
puts "VERIFY_INFO design top: $design_top"
puts "VERIFY_INFO simulation top: $sim_top"
if {$design_top ne "ac820_adc_dac_top"} {
    puts "VERIFY_FAIL trusted design top changed"
    incr failures
}
if {$sim_top ne "tb_dac_sine"} {
    puts "VERIFY_FAIL trusted simulation top changed"
    incr failures
}

close_project
if {$failures != 0} {
    error "ADC stream registration verification failed: $failures item(s)"
}
puts "ADC_STREAM_REGISTRATION_VERIFY_PASS"
