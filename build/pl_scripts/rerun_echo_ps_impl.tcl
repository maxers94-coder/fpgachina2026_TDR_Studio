# Re-run implementation after constraint-only changes, then refresh reports,
# bitstream and the XSA without needlessly repeating OOC synthesis.
set script_dir [file dirname [file normalize [info script]]]
set root_dir [file normalize [file join $script_dir ..]]
set xpr [file join $root_dir vivado_ps echo_ps_system.xpr]
if {![file exists $xpr]} { error "Project not found: $xpr" }

open_project $xpr
reset_run impl_1
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

set export_dir [file join $root_dir export]
file mkdir $export_dir
set impl_dir [file join $root_dir vivado_ps echo_ps_system.runs impl_1]
file copy -force [file join $impl_dir system_wrapper.bit] \
    [file join $export_dir echo_ps_system.bit]
if {[file exists [file join $impl_dir system_wrapper.ltx]]} {
    file copy -force [file join $impl_dir system_wrapper.ltx] \
        [file join $export_dir echo_ps_system.ltx]
}
set xsa_out [file join $export_dir echo_ps_system.xsa]
write_hw_platform -fixed -include_bit -force -file $xsa_out
puts "PS_SYSTEM_XSA=$xsa_out"
puts "PS_SYSTEM_IMPL_PASS"
