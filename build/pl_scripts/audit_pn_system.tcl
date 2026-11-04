set root_dir [file normalize [file join [file dirname [info script]] ..]]
set build_dir [file normalize [file join $root_dir .. .. pn17_hw]]
open_checkpoint [file join $build_dir echo_ps_system.runs impl_1 system_wrapper_routed.dcp]
report_cdc -details -file [file join $root_dir reports pn_stage17 cdc_detail.rpt]
report_bus_skew -file [file join $root_dir reports pn_stage17 bus_skew.rpt]
close_design
