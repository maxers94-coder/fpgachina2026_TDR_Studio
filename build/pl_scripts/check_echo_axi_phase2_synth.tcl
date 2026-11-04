set script_dir [file dirname [file normalize [info script]]]
set staging_root [file dirname $script_dir]
set project_root {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test}
file mkdir [file join $staging_root reports]

read_verilog -sv [file join $staging_root rtl integration echo_pipeline_axi_bridge_phase2.sv]
read_verilog -sv [file join $staging_root rtl integration echo_pipeline_axi_control_phase2.sv]
read_verilog -sv [file join $project_root rtl integration adc_pair_echo_pipeline.sv]
foreach source_file [glob -nocomplain [file join $project_root rtl processing *.sv]] {
    read_verilog -sv $source_file
}

# Use the production dimensions so the report reflects the real BRAM and
# arithmetic footprint, not only a reduced smoke-test configuration.
synth_design -top echo_pipeline_axi_control_phase2 -part xc7z020clg484-2

set latch_count [llength [get_cells -hier -filter {PRIMITIVE_GROUP == LATCH}]]
set blackbox_count [llength [get_cells -hier -filter {IS_BLACKBOX == 1}]]
if {$latch_count != 0} { error "Unexpected inferred latches: $latch_count" }
if {$blackbox_count != 0} { error "Unexpected black boxes: $blackbox_count" }

set report_file [file join $staging_root reports echo_axi_phase2_utilization.rpt]
report_utilization -file $report_file
set status_file [open [file join $staging_root reports echo_axi_phase2_synth_status.txt] w]
puts $status_file "PASS: echo_pipeline_axi_control_phase2 synthesized without latches or black boxes"
close $status_file
puts "PASS: echo_pipeline_axi_control_phase2 synthesized without latches or black boxes"
