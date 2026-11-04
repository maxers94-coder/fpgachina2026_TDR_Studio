# New generated implementation, shared editable RTL, unchanged historical exports.
set pn_script_dir [file dirname [file normalize [info script]]]
set pn_root [file normalize [file join $pn_script_dir ..]]
set pn_reports [file join $pn_root reports pn_stage17]
file mkdir $pn_reports
source [file join $pn_script_dir create_echo_ps_system.tcl]
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
if {![string match "*Complete*" [get_property STATUS [get_runs impl_1]]]} {
    error "PN implementation failed: [get_property STATUS [get_runs impl_1]]"
}
open_run impl_1
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose \
    -file [file join $pn_reports timing_summary.rpt]
report_utilization -file [file join $pn_reports utilization.rpt]
report_drc -file [file join $pn_reports drc.rpt]
report_cdc -file [file join $pn_reports cdc.rpt]
report_methodology -file [file join $pn_reports methodology.rpt]
set wns [get_property SLACK [get_timing_paths -setup -max_paths 1]]
set whs [get_property SLACK [get_timing_paths -hold -max_paths 1]]
puts "PN_FINAL_WNS_NS=$wns"
puts "PN_FINAL_WHS_NS=$whs"
if {$wns < 0 || $whs < 0} { error "PN timing failed: WNS=$wns WHS=$whs" }
if {[llength [get_drc_violations -quiet -filter {SEVERITY == Error}]] != 0} {
    error "PN implementation has DRC errors"
}
set pn_out [file join $pn_root export_pn_stage17]
file mkdir $pn_out
write_debug_probes -force -file [file join $pn_out echo_pn_stage17.ltx]
file copy -force [file join $project_dir echo_ps_system.runs impl_1 system_wrapper.bit] \
    [file join $pn_out echo_pn_stage17.bit]
write_hw_platform -fixed -include_bit -force -file [file join $pn_out echo_pn_stage17.xsa]
puts "PN_STAGE17_BUILD_PASS"
close_project
