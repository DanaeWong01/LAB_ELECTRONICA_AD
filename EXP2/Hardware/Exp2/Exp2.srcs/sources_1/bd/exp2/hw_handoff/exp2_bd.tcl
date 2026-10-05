
################################################################
# This is a generated script based on design: exp2
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source exp2_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
   set_property BOARD_PART digilentinc.com:basys3:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name exp2

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set an [ create_bd_port -dir O -from 3 -to 0 an ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set dp [ create_bd_port -dir O dp ]
  set pwm [ create_bd_port -dir O pwm ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set rx [ create_bd_port -dir I rx ]
  set segments [ create_bd_port -dir O -from 6 -to 0 segments ]
  set sw_freq [ create_bd_port -dir I -from 1 -to 0 sw_freq ]
  set sw_sgnl [ create_bd_port -dir I sw_sgnl ]

  # Create instance: Comparador_0, and set properties
  set Comparador_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:Comparador:1.0 Comparador_0 ]

  # Create instance: OR_0, and set properties
  set OR_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:OR:1.0 OR_0 ]

  # Create instance: clk_mgnmnt_0, and set properties
  set clk_mgnmnt_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:clk_mgnmnt:1.0 clk_mgnmnt_0 ]

  # Create instance: counter_0, and set properties
  set counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:counter:1.0 counter_0 ]

  # Create instance: counter_1, and set properties
  set counter_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:counter:1.0 counter_1 ]

  # Create instance: display_voltaje_0, and set properties
  set display_voltaje_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:display_voltaje:1.0 display_voltaje_0 ]

  # Create instance: generador_seno_0, and set properties
  set generador_seno_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:generador_seno:1.0 generador_seno_0 ]

  # Create instance: modular_clk_div_0, and set properties
  set modular_clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:modular_clk_div:1.0 modular_clk_div_0 ]

  # Create instance: modular_clk_div_1, and set properties
  set modular_clk_div_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:modular_clk_div:1.0 modular_clk_div_1 ]
  set_property -dict [ list \
   CONFIG.N {434} \
 ] $modular_clk_div_1

  # Create instance: mux_0, and set properties
  set mux_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:mux:1.0 mux_0 ]

  # Create instance: ss_driver_0, and set properties
  set ss_driver_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ss_driver:1.0 ss_driver_0 ]

  # Create instance: uart_rx_0, and set properties
  set uart_rx_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:uart_rx:1.0 uart_rx_0 ]

  # Create port connections
  connect_bd_net -net Comparador_0_pwm [get_bd_ports pwm] [get_bd_pins Comparador_0/pwm]
  connect_bd_net -net OR_0_uart_clk_rst [get_bd_pins OR_0/uart_clk_rst] [get_bd_pins modular_clk_div_1/rst]
  connect_bd_net -net clk_0_1 [get_bd_ports clk] [get_bd_pins clk_mgnmnt_0/clk] [get_bd_pins display_voltaje_0/clk] [get_bd_pins generador_seno_0/clk] [get_bd_pins modular_clk_div_0/clk] [get_bd_pins modular_clk_div_1/clk] [get_bd_pins uart_rx_0/clk]
  connect_bd_net -net clk_mgnmnt_0_clk_div [get_bd_pins clk_mgnmnt_0/clk_div] [get_bd_pins counter_0/clk_div]
  connect_bd_net -net counter_0_addr [get_bd_pins counter_0/addr] [get_bd_pins generador_seno_0/addr]
  connect_bd_net -net counter_1_addr [get_bd_pins Comparador_0/rampa] [get_bd_pins counter_1/addr]
  connect_bd_net -net display_voltaje_0_an [get_bd_ports an] [get_bd_pins display_voltaje_0/an]
  connect_bd_net -net display_voltaje_0_dp [get_bd_ports dp] [get_bd_pins display_voltaje_0/dp]
  connect_bd_net -net display_voltaje_0_segments [get_bd_ports segments] [get_bd_pins display_voltaje_0/segments]
  connect_bd_net -net generador_seno_0_n_out [get_bd_pins generador_seno_0/n_out] [get_bd_pins mux_0/sen]
  connect_bd_net -net modular_clk_div_0_clk_div [get_bd_pins counter_1/clk_div] [get_bd_pins modular_clk_div_0/clk_div]
  connect_bd_net -net modular_clk_div_1_clk_div [get_bd_pins modular_clk_div_1/clk_div] [get_bd_pins uart_rx_0/clk_uart]
  connect_bd_net -net mux_0_sgnl [get_bd_pins Comparador_0/sgn] [get_bd_pins mux_0/sgnl]
  connect_bd_net -net rst_0_1 [get_bd_ports rst] [get_bd_pins OR_0/rst] [get_bd_pins clk_mgnmnt_0/rst] [get_bd_pins counter_0/rst] [get_bd_pins counter_1/rst] [get_bd_pins display_voltaje_0/rst] [get_bd_pins generador_seno_0/rst] [get_bd_pins modular_clk_div_0/rst] [get_bd_pins uart_rx_0/rst]
  connect_bd_net -net rx_0_1 [get_bd_ports rx] [get_bd_pins uart_rx_0/rx]
  connect_bd_net -net ss_driver_0_display [get_bd_pins display_voltaje_0/display_value] [get_bd_pins ss_driver_0/display]
  connect_bd_net -net sw_0_1 [get_bd_ports sw_freq] [get_bd_pins clk_mgnmnt_0/sw] [get_bd_pins ss_driver_0/sw]
  connect_bd_net -net sw_sgnl_0_1 [get_bd_ports sw_sgnl] [get_bd_pins mux_0/sw_sgnl]
  connect_bd_net -net uart_rx_0_msg [get_bd_pins mux_0/esp] [get_bd_pins uart_rx_0/msg]
  connect_bd_net -net uart_rx_0_rst_div [get_bd_pins OR_0/rst_uart] [get_bd_pins uart_rx_0/rst_div]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


