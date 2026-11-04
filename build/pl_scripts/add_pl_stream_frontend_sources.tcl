set root [file normalize [file join [file dirname [info script]] ..]]
set project_file [file join $root vivado adc_dac_loopback_test.xpr]
set opened_here 0

if {[llength [get_projects -quiet]] == 0} {
    open_project $project_file
    set opened_here 1
}

set design_files [list \
    [file join $root rtl integration adc_pl_stream_frontend.sv] \
    [file join $root rtl integration axis_async_fifo.sv] \
    [file join $root rtl integration adc_pl_data_path.sv]]
set sim_file [file join $root sim tb_adc_pl_stream_frontend.sv]

foreach design_file $design_files {
    if {[llength [get_files -quiet $design_file]] == 0} {
        add_files -fileset sources_1 -norecurse $design_file
    }
}
if {[llength [get_files -quiet $sim_file]] == 0} {
    add_files -fileset sim_1 -norecurse $sim_file
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# The validated hardware and default simulation tops must not change here.
set_property top ac820_adc_dac_top [get_filesets sources_1]
set_property top tb_dac_sine [get_filesets sim_1]

puts "PL_DATA_PATH_ADDED: $design_files"
puts "HARDWARE_TOP_UNCHANGED: [get_property top [get_filesets sources_1]]"
puts "SIM_TOP_UNCHANGED: [get_property top [get_filesets sim_1]]"

if {$opened_here} {
    close_project
}
