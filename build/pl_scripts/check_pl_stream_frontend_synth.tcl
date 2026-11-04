set root [file normalize [file join [file dirname [info script]] ..]]
read_verilog -sv [file join $root rtl processing adc_pair_average.sv]
read_verilog -sv [file join $root rtl integration adc_pl_stream_frontend.sv]
synth_design -top adc_pl_stream_frontend -part xc7z020clg484-2 \
    -generic FIFO_DEPTH=64
create_clock -name clk_acq -period 20.000 [get_ports clk_acq]
report_utilization -file [file join $root reports pl_stream_frontend_utilization.rpt]
report_timing_summary -file [file join $root reports pl_stream_frontend_timing.rpt]
set timing_paths [get_timing_paths -quiet -max_paths 1]
if {[llength $timing_paths] == 0} {
    error "No timing path was analyzed for adc_pl_stream_frontend"
}
set wns [get_property SLACK [lindex $timing_paths 0]]
if {$wns < 0.0} {
    error "adc_pl_stream_frontend failed 50 MHz timing: WNS=$wns"
}
puts "PASS: adc_pl_stream_frontend synthesized and met 50 MHz timing; WNS=$wns"
