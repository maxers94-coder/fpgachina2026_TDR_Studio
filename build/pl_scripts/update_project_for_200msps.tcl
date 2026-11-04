# Update the copied PS project for the 200 MSPS ADC rate profile.
set root_dir {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test_200msps}
set xpr [file join $root_dir vivado_ps echo_ps_system.xpr]
open_project $xpr

set old_mem [get_files -quiet *ad9516_adc100m_dacref200m.mem]
if {[llength $old_mem] != 0} {
    remove_files $old_mem
}
set new_mem [file join $root_dir rtl ad9516_adc200m_dacref200m.mem]
if {[llength [get_files -quiet $new_mem]] == 0} {
    add_files -norecurse $new_mem
}

open_bd_design [get_files system.bd]
set dco_port [get_bd_ports adc_dco_p]
if {[llength $dco_port] != 1} {
    error "Expected one adc_dco_p block-design port"
}
set_property CONFIG.FREQ_HZ 100000000 $dco_port
validate_bd_design
save_bd_design
generate_target all [get_files system.bd]
update_compile_order -fileset sources_1
close_project
puts {UPDATE_200MSPS_PROJECT_PASS}
