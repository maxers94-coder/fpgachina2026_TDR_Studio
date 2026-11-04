set root_dir [file normalize [file join [file dirname [info script]] ..]]
open_project [file join $root_dir vivado_ps echo_ps_system.xpr]
open_run impl_1
report_cdc -details -file [file join $root_dir reports echo_ps_system_cdc_detail.rpt]
puts CDC_DETAIL_PASS
