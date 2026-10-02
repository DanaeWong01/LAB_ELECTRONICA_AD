# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "N_220" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N_391" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N_554" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N_739" -parent ${Page_0}


}

proc update_PARAM_VALUE.N_220 { PARAM_VALUE.N_220 } {
	# Procedure called to update N_220 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_220 { PARAM_VALUE.N_220 } {
	# Procedure called to validate N_220
	return true
}

proc update_PARAM_VALUE.N_391 { PARAM_VALUE.N_391 } {
	# Procedure called to update N_391 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_391 { PARAM_VALUE.N_391 } {
	# Procedure called to validate N_391
	return true
}

proc update_PARAM_VALUE.N_554 { PARAM_VALUE.N_554 } {
	# Procedure called to update N_554 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_554 { PARAM_VALUE.N_554 } {
	# Procedure called to validate N_554
	return true
}

proc update_PARAM_VALUE.N_739 { PARAM_VALUE.N_739 } {
	# Procedure called to update N_739 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_739 { PARAM_VALUE.N_739 } {
	# Procedure called to validate N_739
	return true
}


proc update_MODELPARAM_VALUE.N_220 { MODELPARAM_VALUE.N_220 PARAM_VALUE.N_220 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_220}] ${MODELPARAM_VALUE.N_220}
}

proc update_MODELPARAM_VALUE.N_391 { MODELPARAM_VALUE.N_391 PARAM_VALUE.N_391 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_391}] ${MODELPARAM_VALUE.N_391}
}

proc update_MODELPARAM_VALUE.N_554 { MODELPARAM_VALUE.N_554 PARAM_VALUE.N_554 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_554}] ${MODELPARAM_VALUE.N_554}
}

proc update_MODELPARAM_VALUE.N_739 { MODELPARAM_VALUE.N_739 PARAM_VALUE.N_739 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_739}] ${MODELPARAM_VALUE.N_739}
}

