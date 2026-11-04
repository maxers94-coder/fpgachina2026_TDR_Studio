set script_dir [file dirname [file normalize [info script]]]
set staging_root [file dirname $script_dir]
set bridge_file [file join $staging_root rtl integration echo_pipeline_axi_bridge.sv]
set wrapper_file [file join $staging_root rtl integration echo_pipeline_axi_control.sv]
set project_root {D:/FPGA/adc_dac_loopback_test/adc_dac_loopback_test}
file mkdir [file join $staging_root reports]

read_verilog -sv $bridge_file
read_verilog -sv $wrapper_file
read_verilog -sv [file join $project_root rtl integration echo_pipeline_hw_control.sv]
read_verilog -sv [file join $project_root rtl integration adc_pair_echo_pipeline.sv]
foreach source_file [glob -nocomplain [file join $project_root rtl processing *.sv]] {
    read_verilog -sv $source_file
}

synth_design -top echo_pipeline_axi_control -part xc7z020clg484-2 \
    -generic N=16 -generic M=16 -generic L=8 -generic K=4

set latch_count [llength [get_cells -hier -filter {PRIMITIVE_GROUP == LATCH}]]
set blackbox_count [llength [get_cells -hier -filter {IS_BLACKBOX == 1}]]

if {$latch_count != 0} {
    error "Unexpected inferred latches: $latch_count"
}
if {$blackbox_count != 0} {
    error "Unexpected black boxes: $blackbox_count"
}

report_utilization -file [file join $staging_root reports echo_axi_bridge_utilization.rpt]
puts "PASS: echo_pipeline_axi_control synthesized without latches or black boxes"
