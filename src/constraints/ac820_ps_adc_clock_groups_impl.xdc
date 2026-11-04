# PS FCLK is created by the Zynq PS7 IP after top-level synthesis.
# Read this file only during implementation, after generated clocks exist.
set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks -include_generated_clocks adc_dco_clk]
