set root [file normalize [file join [file dirname [info script]] ..]]
set bitfile [file join $root adc_dac_loopback_test.bit]
set probes [file join $root adc_dac_loopback_test.ltx]
if {![file exists $bitfile] || ![file exists $probes]} {error "Build first"}
open_hw_manager
connect_hw_server
open_hw_target
set devices [get_hw_devices -filter {PART =~ xc7z020*}]
if {[llength $devices] != 1} {error "Expected one XC7Z020; select target manually"}
set device [lindex $devices 0]
current_hw_device $device
set_property PROGRAM.FILE $bitfile $device
set_property PROBES.FILE $probes $device
program_hw_devices $device
refresh_hw_device $device
puts "READY: capture_i ILA, control_i VIO. VIO 0=10MHz 1=half 2=zero 3=5MHz 4=20MHz"
