set root [file normalize [file join [file dirname [info script]] ..]]
set_param general.maxThreads 4
if {![info exists reuse_existing] || !$reuse_existing} {
    source [file join $root scripts create_project.tcl]
}
open_project [file join $root vivado adc_dac_loopback_test.xpr]
foreach mem [get_files -quiet *.mem] {
    if {![file exists $mem]} {remove_files $mem}
}
foreach mem [glob [file join $root rtl *.mem]] {
    if {[llength [get_files -quiet $mem]]==0} {add_files $mem}
}
if {[info exists reuse_existing] && $reuse_existing} {reset_run synth_1}
launch_runs synth_1 -jobs 4
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] ne "100%"} {error "Synthesis failed"}
set_property STEPS.OPT_DESIGN.TCL.PRE [file join $root scripts debug_clock.tcl] [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveFanoutOpt [get_runs impl_1]
launch_runs impl_1 -to_step route_design -jobs 4
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%"} {error "Implementation failed"}
open_run impl_1
report_timing_summary -delay_type min_max -report_unconstrained -file [file join $root reports timing.rpt]
report_utilization -file [file join $root reports utilization.rpt]
report_drc -file [file join $root reports drc.rpt]
report_cdc -details -file [file join $root reports cdc.rpt]
report_bus_skew -file [file join $root reports bus_skew.rpt]
report_clocks -file [file join $root reports clocks.rpt]
report_io -file [file join $root reports io.rpt]
report_timing -to [get_ports {dac_data_p[*]}] -delay_type min_max -max_paths 32 -file [file join $root reports dac_output_timing.rpt]
report_timing -from [get_ports {adc_data_p[*]}] -delay_type min_max -max_paths 32 -file [file join $root reports adc_input_timing.rpt]
set setup [get_timing_paths -delay_type max -max_paths 1]
set hold [get_timing_paths -delay_type min -max_paths 1]
if {[llength $setup]==0 || [llength $hold]==0} {error "Missing setup/hold timing paths"}
if {[get_property SLACK $setup] < 0 || [get_property SLACK $hold] < 0} {
    error "Timing failed; bitstream withheld. Inspect reports/timing.rpt"
}
write_checkpoint -force [file join $root reports adc_dac_loopback_routed.dcp]
write_debug_probes -force [file join $root adc_dac_loopback_test.ltx]
write_bitstream -force [file join $root adc_dac_loopback_test.bit]
puts "BITSTREAM_READY: [file join $root adc_dac_loopback_test.bit]"
close_project
