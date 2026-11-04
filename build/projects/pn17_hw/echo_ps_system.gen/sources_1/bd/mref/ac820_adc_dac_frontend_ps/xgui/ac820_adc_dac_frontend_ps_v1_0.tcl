# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADC_IDELAY_TAP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CLOCK_SETTLE_CYCLES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CLOCK_WAIT_CYCLES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MONITOR_WINDOW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PHASE_STEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PLL_WAIT_CYCLES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POLL_LIMIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POWERUP_CYCLES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Q_MODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SPI_HALF_PERIOD" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADC_IDELAY_TAP { PARAM_VALUE.ADC_IDELAY_TAP } {
	# Procedure called to update ADC_IDELAY_TAP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADC_IDELAY_TAP { PARAM_VALUE.ADC_IDELAY_TAP } {
	# Procedure called to validate ADC_IDELAY_TAP
	return true
}

proc update_PARAM_VALUE.CLOCK_SETTLE_CYCLES { PARAM_VALUE.CLOCK_SETTLE_CYCLES } {
	# Procedure called to update CLOCK_SETTLE_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLOCK_SETTLE_CYCLES { PARAM_VALUE.CLOCK_SETTLE_CYCLES } {
	# Procedure called to validate CLOCK_SETTLE_CYCLES
	return true
}

proc update_PARAM_VALUE.CLOCK_WAIT_CYCLES { PARAM_VALUE.CLOCK_WAIT_CYCLES } {
	# Procedure called to update CLOCK_WAIT_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLOCK_WAIT_CYCLES { PARAM_VALUE.CLOCK_WAIT_CYCLES } {
	# Procedure called to validate CLOCK_WAIT_CYCLES
	return true
}

proc update_PARAM_VALUE.MONITOR_WINDOW { PARAM_VALUE.MONITOR_WINDOW } {
	# Procedure called to update MONITOR_WINDOW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MONITOR_WINDOW { PARAM_VALUE.MONITOR_WINDOW } {
	# Procedure called to validate MONITOR_WINDOW
	return true
}

proc update_PARAM_VALUE.PHASE_STEP { PARAM_VALUE.PHASE_STEP } {
	# Procedure called to update PHASE_STEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PHASE_STEP { PARAM_VALUE.PHASE_STEP } {
	# Procedure called to validate PHASE_STEP
	return true
}

proc update_PARAM_VALUE.PLL_WAIT_CYCLES { PARAM_VALUE.PLL_WAIT_CYCLES } {
	# Procedure called to update PLL_WAIT_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PLL_WAIT_CYCLES { PARAM_VALUE.PLL_WAIT_CYCLES } {
	# Procedure called to validate PLL_WAIT_CYCLES
	return true
}

proc update_PARAM_VALUE.POLL_LIMIT { PARAM_VALUE.POLL_LIMIT } {
	# Procedure called to update POLL_LIMIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POLL_LIMIT { PARAM_VALUE.POLL_LIMIT } {
	# Procedure called to validate POLL_LIMIT
	return true
}

proc update_PARAM_VALUE.POWERUP_CYCLES { PARAM_VALUE.POWERUP_CYCLES } {
	# Procedure called to update POWERUP_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POWERUP_CYCLES { PARAM_VALUE.POWERUP_CYCLES } {
	# Procedure called to validate POWERUP_CYCLES
	return true
}

proc update_PARAM_VALUE.Q_MODE { PARAM_VALUE.Q_MODE } {
	# Procedure called to update Q_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Q_MODE { PARAM_VALUE.Q_MODE } {
	# Procedure called to validate Q_MODE
	return true
}

proc update_PARAM_VALUE.SPI_HALF_PERIOD { PARAM_VALUE.SPI_HALF_PERIOD } {
	# Procedure called to update SPI_HALF_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPI_HALF_PERIOD { PARAM_VALUE.SPI_HALF_PERIOD } {
	# Procedure called to validate SPI_HALF_PERIOD
	return true
}


proc update_MODELPARAM_VALUE.PHASE_STEP { MODELPARAM_VALUE.PHASE_STEP PARAM_VALUE.PHASE_STEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PHASE_STEP}] ${MODELPARAM_VALUE.PHASE_STEP}
}

proc update_MODELPARAM_VALUE.Q_MODE { MODELPARAM_VALUE.Q_MODE PARAM_VALUE.Q_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Q_MODE}] ${MODELPARAM_VALUE.Q_MODE}
}

proc update_MODELPARAM_VALUE.ADC_IDELAY_TAP { MODELPARAM_VALUE.ADC_IDELAY_TAP PARAM_VALUE.ADC_IDELAY_TAP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADC_IDELAY_TAP}] ${MODELPARAM_VALUE.ADC_IDELAY_TAP}
}

proc update_MODELPARAM_VALUE.POWERUP_CYCLES { MODELPARAM_VALUE.POWERUP_CYCLES PARAM_VALUE.POWERUP_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POWERUP_CYCLES}] ${MODELPARAM_VALUE.POWERUP_CYCLES}
}

proc update_MODELPARAM_VALUE.SPI_HALF_PERIOD { MODELPARAM_VALUE.SPI_HALF_PERIOD PARAM_VALUE.SPI_HALF_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPI_HALF_PERIOD}] ${MODELPARAM_VALUE.SPI_HALF_PERIOD}
}

proc update_MODELPARAM_VALUE.CLOCK_SETTLE_CYCLES { MODELPARAM_VALUE.CLOCK_SETTLE_CYCLES PARAM_VALUE.CLOCK_SETTLE_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLOCK_SETTLE_CYCLES}] ${MODELPARAM_VALUE.CLOCK_SETTLE_CYCLES}
}

proc update_MODELPARAM_VALUE.PLL_WAIT_CYCLES { MODELPARAM_VALUE.PLL_WAIT_CYCLES PARAM_VALUE.PLL_WAIT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PLL_WAIT_CYCLES}] ${MODELPARAM_VALUE.PLL_WAIT_CYCLES}
}

proc update_MODELPARAM_VALUE.POLL_LIMIT { MODELPARAM_VALUE.POLL_LIMIT PARAM_VALUE.POLL_LIMIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POLL_LIMIT}] ${MODELPARAM_VALUE.POLL_LIMIT}
}

proc update_MODELPARAM_VALUE.CLOCK_WAIT_CYCLES { MODELPARAM_VALUE.CLOCK_WAIT_CYCLES PARAM_VALUE.CLOCK_WAIT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLOCK_WAIT_CYCLES}] ${MODELPARAM_VALUE.CLOCK_WAIT_CYCLES}
}

proc update_MODELPARAM_VALUE.MONITOR_WINDOW { MODELPARAM_VALUE.MONITOR_WINDOW PARAM_VALUE.MONITOR_WINDOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MONITOR_WINDOW}] ${MODELPARAM_VALUE.MONITOR_WINDOW}
}

