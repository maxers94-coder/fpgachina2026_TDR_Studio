# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LAG_MIN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "L_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAMPLE_RATE_HZ" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.K { PARAM_VALUE.K } {
	# Procedure called to update K when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K { PARAM_VALUE.K } {
	# Procedure called to validate K
	return true
}

proc update_PARAM_VALUE.K_ADDR_W { PARAM_VALUE.K_ADDR_W } {
	# Procedure called to update K_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_ADDR_W { PARAM_VALUE.K_ADDR_W } {
	# Procedure called to validate K_ADDR_W
	return true
}

proc update_PARAM_VALUE.L { PARAM_VALUE.L } {
	# Procedure called to update L when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L { PARAM_VALUE.L } {
	# Procedure called to validate L
	return true
}

proc update_PARAM_VALUE.LAG_MIN { PARAM_VALUE.LAG_MIN } {
	# Procedure called to update LAG_MIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LAG_MIN { PARAM_VALUE.LAG_MIN } {
	# Procedure called to validate LAG_MIN
	return true
}

proc update_PARAM_VALUE.L_ADDR_W { PARAM_VALUE.L_ADDR_W } {
	# Procedure called to update L_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.L_ADDR_W { PARAM_VALUE.L_ADDR_W } {
	# Procedure called to validate L_ADDR_W
	return true
}

proc update_PARAM_VALUE.M { PARAM_VALUE.M } {
	# Procedure called to update M when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M { PARAM_VALUE.M } {
	# Procedure called to validate M
	return true
}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}

proc update_PARAM_VALUE.N_ADDR_W { PARAM_VALUE.N_ADDR_W } {
	# Procedure called to update N_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_ADDR_W { PARAM_VALUE.N_ADDR_W } {
	# Procedure called to validate N_ADDR_W
	return true
}

proc update_PARAM_VALUE.SAMPLE_RATE_HZ { PARAM_VALUE.SAMPLE_RATE_HZ } {
	# Procedure called to update SAMPLE_RATE_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAMPLE_RATE_HZ { PARAM_VALUE.SAMPLE_RATE_HZ } {
	# Procedure called to validate SAMPLE_RATE_HZ
	return true
}


proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

proc update_MODELPARAM_VALUE.M { MODELPARAM_VALUE.M PARAM_VALUE.M } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M}] ${MODELPARAM_VALUE.M}
}

proc update_MODELPARAM_VALUE.L { MODELPARAM_VALUE.L PARAM_VALUE.L } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L}] ${MODELPARAM_VALUE.L}
}

proc update_MODELPARAM_VALUE.K { MODELPARAM_VALUE.K PARAM_VALUE.K } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K}] ${MODELPARAM_VALUE.K}
}

proc update_MODELPARAM_VALUE.LAG_MIN { MODELPARAM_VALUE.LAG_MIN PARAM_VALUE.LAG_MIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LAG_MIN}] ${MODELPARAM_VALUE.LAG_MIN}
}

proc update_MODELPARAM_VALUE.SAMPLE_RATE_HZ { MODELPARAM_VALUE.SAMPLE_RATE_HZ PARAM_VALUE.SAMPLE_RATE_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAMPLE_RATE_HZ}] ${MODELPARAM_VALUE.SAMPLE_RATE_HZ}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.N_ADDR_W { MODELPARAM_VALUE.N_ADDR_W PARAM_VALUE.N_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_ADDR_W}] ${MODELPARAM_VALUE.N_ADDR_W}
}

proc update_MODELPARAM_VALUE.L_ADDR_W { MODELPARAM_VALUE.L_ADDR_W PARAM_VALUE.L_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.L_ADDR_W}] ${MODELPARAM_VALUE.L_ADDR_W}
}

proc update_MODELPARAM_VALUE.K_ADDR_W { MODELPARAM_VALUE.K_ADDR_W PARAM_VALUE.K_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_ADDR_W}] ${MODELPARAM_VALUE.K_ADDR_W}
}

