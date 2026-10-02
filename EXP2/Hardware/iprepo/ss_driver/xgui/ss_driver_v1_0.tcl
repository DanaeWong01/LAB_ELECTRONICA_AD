# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "f_220" -parent ${Page_0}
  ipgui::add_param $IPINST -name "f_391" -parent ${Page_0}
  ipgui::add_param $IPINST -name "f_554" -parent ${Page_0}
  ipgui::add_param $IPINST -name "f_739" -parent ${Page_0}


}

proc update_PARAM_VALUE.f_220 { PARAM_VALUE.f_220 } {
	# Procedure called to update f_220 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.f_220 { PARAM_VALUE.f_220 } {
	# Procedure called to validate f_220
	return true
}

proc update_PARAM_VALUE.f_391 { PARAM_VALUE.f_391 } {
	# Procedure called to update f_391 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.f_391 { PARAM_VALUE.f_391 } {
	# Procedure called to validate f_391
	return true
}

proc update_PARAM_VALUE.f_554 { PARAM_VALUE.f_554 } {
	# Procedure called to update f_554 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.f_554 { PARAM_VALUE.f_554 } {
	# Procedure called to validate f_554
	return true
}

proc update_PARAM_VALUE.f_739 { PARAM_VALUE.f_739 } {
	# Procedure called to update f_739 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.f_739 { PARAM_VALUE.f_739 } {
	# Procedure called to validate f_739
	return true
}


proc update_MODELPARAM_VALUE.f_220 { MODELPARAM_VALUE.f_220 PARAM_VALUE.f_220 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.f_220}] ${MODELPARAM_VALUE.f_220}
}

proc update_MODELPARAM_VALUE.f_391 { MODELPARAM_VALUE.f_391 PARAM_VALUE.f_391 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.f_391}] ${MODELPARAM_VALUE.f_391}
}

proc update_MODELPARAM_VALUE.f_554 { MODELPARAM_VALUE.f_554 PARAM_VALUE.f_554 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.f_554}] ${MODELPARAM_VALUE.f_554}
}

proc update_MODELPARAM_VALUE.f_739 { MODELPARAM_VALUE.f_739 PARAM_VALUE.f_739 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.f_739}] ${MODELPARAM_VALUE.f_739}
}

