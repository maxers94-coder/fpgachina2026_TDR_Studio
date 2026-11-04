set root [file normalize [file join [file dirname [info script]] ..]]
read_verilog -sv [file join $root rtl processing adc_pair_average.sv]
read_verilog -sv [file join $root rtl integration adc_pl_stream_frontend.sv]
read_verilog -sv [file join $root rtl integration axis_async_fifo.sv]
read_verilog -sv [file join $root rtl integration adc_pl_data_path.sv]
synth_design -top adc_pl_data_path -part xc7z020clg484-2 \
    -generic FRONTEND_FIFO_DEPTH=64 \
    -generic ASYNC_FIFO_DEPTH=1024
create_clock -name clk_acq -period 20.000 [get_ports clk_acq]
create_clock -name clk_axis -period 10.000 [get_ports clk_axis]
set_clock_groups -asynchronous -group [get_clocks clk_acq] -group [get_clocks clk_axis]
report_utilization -file [file join $root reports pl_data_path_utilization.rpt]
report_timing_summary -file [file join $root reports pl_data_path_timing.rpt]
report_cdc -details -file [file join $root reports pl_data_path_cdc.rpt]

foreach clock_name {clk_acq clk_axis} {
    set paths [get_timing_paths -quiet -from [get_clocks $clock_name] \
        -to [get_clocks $clock_name] -max_paths 1]
    if {[llength $paths] == 0} {
        error "No intra-clock timing path analyzed for $clock_name"
    }
    set wns [get_property SLACK [lindex $paths 0]]
    if {$wns < 0.0} {
        error "adc_pl_data_path failed timing on $clock_name: WNS=$wns"
    }
    puts "CLOCK_PASS: $clock_name WNS=$wns"
}
puts "PASS: adc_pl_data_path synthesized with XPM asynchronous FIFO"
