
################################################################
# This is a generated script based on design: led_teclado
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
# source led_teclado_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# DB, PS2_RX, dec_notas, gen_frecuencias, led_enable, modular_clk_div, sinusoide, teclado_a_led

# Please add the sources of those modules before sourcing this Tcl script.

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
set design_name led_teclado

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
  set clk [ create_bd_port -dir I -type clk clk ]
  set leds [ create_bd_port -dir O -from 11 -to 0 leds ]
  set ps2c [ create_bd_port -dir I ps2c ]
  set ps2d [ create_bd_port -dir I ps2d ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set wave [ create_bd_port -dir O -from 7 -to 0 wave ]

  # Create instance: DB_0, and set properties
  set block_name DB
  set block_cell_name DB_0
  if { [catch {set DB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DB_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PS2_RX_0, and set properties
  set block_name PS2_RX
  set block_cell_name PS2_RX_0
  if { [catch {set PS2_RX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PS2_RX_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.Coe_File {../../../../../../coe/cuarto_sen.coe} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_ROM} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Read_Width_A {8} \
   CONFIG.Read_Width_B {8} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {128} \
   CONFIG.Write_Width_A {8} \
   CONFIG.Write_Width_B {8} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Create instance: dec_notas_0, and set properties
  set block_name dec_notas
  set block_cell_name dec_notas_0
  if { [catch {set dec_notas_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dec_notas_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: gen_frecuencias_0, and set properties
  set block_name gen_frecuencias
  set block_cell_name gen_frecuencias_0
  if { [catch {set gen_frecuencias_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gen_frecuencias_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {16384} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {4} \
   CONFIG.C_PROBE2_WIDTH {8} \
 ] $ila_0

  # Create instance: led_enable_0, and set properties
  set block_name led_enable
  set block_cell_name led_enable_0
  if { [catch {set led_enable_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $led_enable_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: modular_clk_div_0, and set properties
  set block_name modular_clk_div
  set block_cell_name modular_clk_div_0
  if { [catch {set modular_clk_div_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $modular_clk_div_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.N {12500} \
 ] $modular_clk_div_0

  # Create instance: sinusoide_0, and set properties
  set block_name sinusoide
  set block_cell_name sinusoide_0
  if { [catch {set sinusoide_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sinusoide_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: teclado_a_led_0, and set properties
  set block_name teclado_a_led
  set block_cell_name teclado_a_led_0
  if { [catch {set teclado_a_led_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $teclado_a_led_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net DB_0_ps2c_DB [get_bd_pins DB_0/ps2c_DB] [get_bd_pins PS2_RX_0/ps2c]
  connect_bd_net -net PS2_RX_0_msg [get_bd_pins PS2_RX_0/msg] [get_bd_pins teclado_a_led_0/msg]
  connect_bd_net -net PS2_RX_0_msg_ready [get_bd_pins PS2_RX_0/msg_ready] [get_bd_pins teclado_a_led_0/msg_ready]
  connect_bd_net -net blk_mem_gen_0_douta [get_bd_pins blk_mem_gen_0/douta] [get_bd_pins sinusoide_0/ROM_data]
  connect_bd_net -net clk_0_1 [get_bd_ports clk] [get_bd_pins DB_0/clk] [get_bd_pins PS2_RX_0/clk] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins gen_frecuencias_0/clk] [get_bd_pins ila_0/clk] [get_bd_pins modular_clk_div_0/clk] [get_bd_pins sinusoide_0/clk] [get_bd_pins teclado_a_led_0/clk]
  connect_bd_net -net dec_notas_0_salto_decimal [get_bd_pins dec_notas_0/salto_decimal] [get_bd_pins gen_frecuencias_0/salto_decimal]
  connect_bd_net -net dec_notas_0_salto_entero [get_bd_pins dec_notas_0/salto_entero] [get_bd_pins gen_frecuencias_0/salto_entero]
  connect_bd_net -net gen_frecuencias_0_posicion [get_bd_pins gen_frecuencias_0/posicion] [get_bd_pins sinusoide_0/posicion]
  connect_bd_net -net led_enable_0_leds_enable [get_bd_ports leds] [get_bd_pins led_enable_0/leds_enable]
  connect_bd_net -net modular_clk_div_0_clkdiv [get_bd_pins gen_frecuencias_0/clkdiv] [get_bd_pins modular_clk_div_0/clkdiv]
  connect_bd_net -net ps2c_0_1 [get_bd_ports ps2c] [get_bd_pins DB_0/ps2c] [get_bd_pins ila_0/probe0]
  connect_bd_net -net ps2d_0_1 [get_bd_ports ps2d] [get_bd_pins PS2_RX_0/ps2d] [get_bd_pins ila_0/probe1]
  connect_bd_net -net rst_0_1 [get_bd_ports rst] [get_bd_pins DB_0/rst] [get_bd_pins PS2_RX_0/rst] [get_bd_pins gen_frecuencias_0/rst] [get_bd_pins modular_clk_div_0/rst] [get_bd_pins sinusoide_0/rst] [get_bd_pins teclado_a_led_0/rst]
  connect_bd_net -net sinusoide_0_ROM_addr [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins sinusoide_0/ROM_addr]
  connect_bd_net -net sinusoide_0_wave [get_bd_ports wave] [get_bd_pins sinusoide_0/wave]
  connect_bd_net -net teclado_a_led_0_leds [get_bd_pins led_enable_0/leds] [get_bd_pins teclado_a_led_0/leds]
  connect_bd_net -net teclado_a_led_0_nota_activa [get_bd_pins ila_0/probe3] [get_bd_pins led_enable_0/enable] [get_bd_pins sinusoide_0/nota_activa] [get_bd_pins teclado_a_led_0/nota_activa]
  connect_bd_net -net teclado_a_led_0_tecla_presionada [get_bd_pins dec_notas_0/tecla_presionada] [get_bd_pins ila_0/probe2] [get_bd_pins teclado_a_led_0/tecla_presionada]

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


