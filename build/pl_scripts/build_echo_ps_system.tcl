# Build the generated PS/PL system through bitstream and export an XSA.
set script_dir [file dirname [file normalize [info script]]]
set root_dir [file normalize [file join $script_dir ..]]
set xpr [file join $root_dir vivado_ps echo_ps_system.xpr]
if {![file exists $xpr]} { error "Project not found: $xpr" }

open_project $xpr
# Module-reference blocks are synthesized out-of-context.  Resetting only the
# top-level run can silently reuse stale DCPs after RTL changes, so reset every
# design synthesis run that feeds impl_1 before launching implementation.
foreach run_name {
    system_frontend_0_0_synth_1
    system_echo_pipeline_0_0_synth_1
    synth_1
} {
    set run_obj [get_runs -quiet $run_name]
    if {[llength $run_obj] != 0} {
        puts "RESET_SYNTH_RUN=$run_name"
        reset_run $run_obj
    }
}
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPLEMENTATION_STATUS=$impl_status"
if {![string match "*Complete*" $impl_status]} {
    error "PS system implementation did not complete: $impl_status"
}

open_run impl_1
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -max_paths 10 \
    -file [file join $root_dir reports echo_ps_system_timing_summary.rpt]
report_utilization -file [file join $root_dir reports echo_ps_system_utilization.rpt]
report_drc -file [file join $root_dir reports echo_ps_system_drc.rpt]
report_bus_skew -warn_on_violation \
    -file [file join $root_dir reports echo_ps_system_bus_skew.rpt]
report_cdc -file [file join $root_dir reports echo_ps_system_cdc.rpt]
report_methodology -file [file join $root_dir reports echo_ps_system_methodology.rpt]

# Vivado can generate a bitstream even when timing fails.  Treat non-negative
# setup and hold slack as mandatory before publishing export artifacts.
set setup_path [get_timing_paths -setup -max_paths 1 -nworst 1]
set hold_path  [get_timing_paths -hold  -max_paths 1 -nworst 1]
set wns [get_property SLACK $setup_path]
set whs [get_property SLACK $hold_path]
puts "FINAL_WNS_NS=$wns"
puts "FINAL_WHS_NS=$whs"
if {$wns < 0.0 || $whs < 0.0} {
    error "Timing signoff failed: WNS=$wns ns, WHS=$whs ns"
}

set export_dir [file join $root_dir export]
file mkdir $export_dir
write_debug_probes -force -file [file join $export_dir echo_ps_system.ltx]
set impl_dir [file join $root_dir vivado_ps echo_ps_system.runs impl_1]
file copy -force [file join $impl_dir system_wrapper.bit] \
    [file join $export_dir echo_ps_system.bit]
set xsa_out [file join $export_dir echo_ps_system.xsa]
write_hw_platform -fixed -include_bit -force -file $xsa_out
puts "PS_SYSTEM_XSA=$xsa_out"
puts "PS_SYSTEM_BUILD_PASS"
