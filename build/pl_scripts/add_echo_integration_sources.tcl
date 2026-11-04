set root [file normalize [file join [file dirname [info script]] ..]]
set project_file [file join $root vivado adc_dac_loopback_test.xpr]

open_project $project_file

set design_sources [concat \
    [glob -nocomplain [file join $root rtl processing *.sv]] \
    [glob -nocomplain [file join $root rtl integration *.sv]]]

foreach source $design_sources {
    if {[llength [get_files -quiet $source]] == 0} {
        add_files -fileset sources_1 -norecurse $source
    }
}

set integration_tb [file join $root sim tb_adc_pair_echo_pipeline.sv]
if {[file exists $integration_tb] && [llength [get_files -quiet $integration_tb]] == 0} {
    add_files -fileset sim_1 -norecurse $integration_tb
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Keep the already validated board top and DAC/ADC testbench active.  The new
# integration testbench is selected only by the standalone XSim script.
set_property top ac820_adc_dac_top [get_filesets sources_1]
set_property top tb_dac_sine [get_filesets sim_1]

puts "ECHO_INTEGRATION_SOURCES_ADDED: [llength $design_sources] design files"
close_project
