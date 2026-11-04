# Debug Hub must remain accessible even when the external ADC clock stops.
set hub [get_debug_cores dbg_hub]
if {[llength $hub]!=1} {error "Missing debug hub"}
set clock_net [get_nets clk_50m_IBUF_BUFG]
if {[llength $clock_net]!=1} {error "Cannot identify stable 50 MHz debug clock"}
set_property C_CLK_INPUT_FREQ_HZ 50000000 $hub
set_property C_ENABLE_CLK_DIVIDER false $hub
connect_debug_port dbg_hub/clk $clock_net
