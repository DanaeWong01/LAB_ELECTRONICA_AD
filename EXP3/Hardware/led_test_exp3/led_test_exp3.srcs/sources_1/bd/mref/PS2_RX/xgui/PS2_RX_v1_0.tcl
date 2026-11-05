# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LECT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PAR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SEND" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STOP" -parent ${Page_0}


}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}

proc update_PARAM_VALUE.LECT { PARAM_VALUE.LECT } {
	# Procedure called to update LECT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LECT { PARAM_VALUE.LECT } {
	# Procedure called to validate LECT
	return true
}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}

proc update_PARAM_VALUE.PAR { PARAM_VALUE.PAR } {
	# Procedure called to update PAR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PAR { PARAM_VALUE.PAR } {
	# Procedure called to validate PAR
	return true
}

proc update_PARAM_VALUE.SEND { PARAM_VALUE.SEND } {
	# Procedure called to update SEND when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SEND { PARAM_VALUE.SEND } {
	# Procedure called to validate SEND
	return true
}

proc update_PARAM_VALUE.STOP { PARAM_VALUE.STOP } {
	# Procedure called to update STOP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STOP { PARAM_VALUE.STOP } {
	# Procedure called to validate STOP
	return true
}


proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.LECT { MODELPARAM_VALUE.LECT PARAM_VALUE.LECT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LECT}] ${MODELPARAM_VALUE.LECT}
}

proc update_MODELPARAM_VALUE.PAR { MODELPARAM_VALUE.PAR PARAM_VALUE.PAR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PAR}] ${MODELPARAM_VALUE.PAR}
}

proc update_MODELPARAM_VALUE.STOP { MODELPARAM_VALUE.STOP PARAM_VALUE.STOP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STOP}] ${MODELPARAM_VALUE.STOP}
}

proc update_MODELPARAM_VALUE.SEND { MODELPARAM_VALUE.SEND PARAM_VALUE.SEND } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SEND}] ${MODELPARAM_VALUE.SEND}
}

proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

