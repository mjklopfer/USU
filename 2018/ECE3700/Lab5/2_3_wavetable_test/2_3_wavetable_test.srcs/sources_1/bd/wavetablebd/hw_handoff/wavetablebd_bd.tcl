
################################################################
# This is a generated script based on design: wavetablebd
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source wavetablebd_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1
#    set_property BOARD_PART digilentinc.com:basys3:part0:1.1 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name wavetablebd

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

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set btnU [ create_bd_port -dir I btnU ]
  set gain [ create_bd_port -dir O -from 0 -to 0 gain ]
  set shutdown_l [ create_bd_port -dir O -from 0 -to 0 shutdown_l ]
  set sout [ create_bd_port -dir O sout ]
  set sw [ create_bd_port -dir I -from 15 -to 0 sw ]
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: c_counter_binary_0, and set properties
  set c_counter_binary_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0 ]
  set_property -dict [ list \
CONFIG.Output_Width {4} \
CONFIG.Sync_Threshold_Output {true} \
 ] $c_counter_binary_0

  # Create instance: c_shift_ram_0, and set properties
  set c_shift_ram_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_0 ]
  set_property -dict [ list \
CONFIG.AsyncInitVal {0} \
CONFIG.DefaultData {0} \
CONFIG.SyncInitVal {0} \
CONFIG.Width {1} \
 ] $c_shift_ram_0

  # Create instance: c_shift_ram_1, and set properties
  set c_shift_ram_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_1 ]
  set_property -dict [ list \
CONFIG.AsyncInitVal {000000000000000} \
CONFIG.CE {true} \
CONFIG.DefaultData {000000000000000} \
CONFIG.SyncInitVal {000000000000000} \
CONFIG.Width {15} \
 ] $c_shift_ram_1

  # Create instance: c_shift_ram_2, and set properties
  set c_shift_ram_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_2 ]
  set_property -dict [ list \
CONFIG.AsyncInitVal {000000000000000} \
CONFIG.CE {true} \
CONFIG.DefaultData {000000000000000} \
CONFIG.SyncInitVal {000000000000000} \
CONFIG.Width {15} \
 ] $c_shift_ram_2

  # Create instance: c_shift_ram_3, and set properties
  set c_shift_ram_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 c_shift_ram_3 ]
  set_property -dict [ list \
CONFIG.AsyncInitVal {0} \
CONFIG.DefaultData {0} \
CONFIG.SyncInitVal {0} \
CONFIG.Width {1} \
 ] $c_shift_ram_3

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {220.657} \
CONFIG.CLKOUT1_PHASE_ERROR {301.601} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {256.000} \
CONFIG.CLKOUT2_JITTER {372.827} \
CONFIG.CLKOUT2_PHASE_ERROR {301.601} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {10.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
CONFIG.MMCM_CLKFBOUT_MULT_F {48.000} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {3.750} \
CONFIG.MMCM_CLKOUT1_DIVIDE {96} \
CONFIG.MMCM_DIVCLK_DIVIDE {5} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.USE_BOARD_FLOW {true} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: pwm_0, and set properties
  set pwm_0 [ create_bd_cell -type ip -vlnv usu.edu:ECE3700:pwm:1.0 pwm_0 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {not} \
CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: wavetable_0, and set properties
  set wavetable_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:wavetable:1.0 wavetable_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {0} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {16} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {15} \
CONFIG.DIN_TO {1} \
CONFIG.DIN_WIDTH {16} \
CONFIG.DOUT_WIDTH {15} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {7} \
CONFIG.DIN_TO {0} \
CONFIG.DOUT_WIDTH {8} \
 ] $xlslice_2

  # Create port connections
  connect_bd_net -net btnU_1 [get_bd_ports btnU] [get_bd_pins c_shift_ram_3/D]
  connect_bd_net -net c_counter_binary_0_THRESH0 [get_bd_pins c_counter_binary_0/THRESH0] [get_bd_pins wavetable_0/clk]
  connect_bd_net -net c_shift_ram_0_Q [get_bd_pins c_shift_ram_0/Q] [get_bd_pins c_shift_ram_2/CE] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net c_shift_ram_1_Q [get_bd_pins c_shift_ram_1/Q] [get_bd_pins wavetable_0/den]
  connect_bd_net -net c_shift_ram_2_Q [get_bd_pins c_shift_ram_2/Q] [get_bd_pins wavetable_0/num]
  connect_bd_net -net c_shift_ram_3_Q [get_bd_pins c_shift_ram_3/Q] [get_bd_pins wavetable_0/clr]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins pwm_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins c_counter_binary_0/CLK] [get_bd_pins c_shift_ram_0/CLK] [get_bd_pins c_shift_ram_1/CLK] [get_bd_pins c_shift_ram_2/CLK] [get_bd_pins c_shift_ram_3/CLK] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net pwm_0_sout [get_bd_ports sout] [get_bd_pins pwm_0/sout]
  connect_bd_net -net sw_1 [get_bd_ports sw] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins c_shift_ram_1/CE] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net wavetable_0_dout [get_bd_pins wavetable_0/dout] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net xlconstant_0_dout [get_bd_ports gain] [get_bd_ports shutdown_l] [get_bd_pins wavetable_0/en] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins c_shift_ram_0/D] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins c_shift_ram_1/D] [get_bd_pins c_shift_ram_2/D] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins pwm_0/din] [get_bd_pins xlslice_2/Dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port sys_clock -pg 1 -y 240 -defaultsOSRD
preplace port sout -pg 1 -y 130 -defaultsOSRD
preplace port shutdown_l -pg 1 -y 570 -defaultsOSRD
preplace port gain -pg 1 -y 500 -defaultsOSRD
preplace port btnU -pg 1 -y 400 -defaultsOSRD
preplace portBus sw -pg 1 -y 80 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 1 -y 150 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 4 -y 500 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 3 -y 80 -defaultsOSRD
preplace inst xlslice_2 -pg 1 -lvl 6 -y 220 -defaultsOSRD
preplace inst util_vector_logic_0 -pg 1 -lvl 3 -y 180 -defaultsOSRD
preplace inst c_counter_binary_0 -pg 1 -lvl 4 -y 310 -defaultsOSRD
preplace inst wavetable_0 -pg 1 -lvl 5 -y 220 -defaultsOSRD
preplace inst c_shift_ram_0 -pg 1 -lvl 2 -y 190 -defaultsOSRD
preplace inst pwm_0 -pg 1 -lvl 7 -y 140 -defaultsOSRD
preplace inst c_shift_ram_1 -pg 1 -lvl 4 -y 60 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 1 -y 240 -defaultsOSRD
preplace inst c_shift_ram_2 -pg 1 -lvl 4 -y 200 -defaultsOSRD
preplace inst c_shift_ram_3 -pg 1 -lvl 4 -y 410 -defaultsOSRD
preplace netloc c_shift_ram_1_Q 1 4 1 800
preplace netloc xlslice_1_Dout 1 3 1 570
preplace netloc btnU_1 1 0 4 NJ 400 NJ 400 NJ 400 NJ
preplace netloc wavetable_0_dout 1 5 1 NJ
preplace netloc util_vector_logic_0_Res 1 3 1 580
preplace netloc sys_clock_1 1 0 1 NJ
preplace netloc c_shift_ram_2_Q 1 4 1 790
preplace netloc c_shift_ram_3_Q 1 4 1 810
preplace netloc xlconstant_0_dout 1 4 4 820 500 NJ 500 NJ 500 1350
preplace netloc pwm_0_sout 1 7 1 1350
preplace netloc clk_wiz_0_clk_out1 1 1 6 NJ 130 NJ 130 NJ 130 NJ 130 NJ 130 NJ
preplace netloc xlslice_2_Dout 1 6 1 1210
preplace netloc clk_wiz_0_clk_out2 1 1 3 210 250 NJ 250 590
preplace netloc sw_1 1 0 3 20 80 NJ 80 NJ
preplace netloc c_counter_binary_0_THRESH0 1 4 1 780
preplace netloc c_shift_ram_0_Q 1 2 2 390 230 NJ
preplace netloc xlslice_0_Dout 1 1 1 NJ
levelinfo -pg 1 0 110 300 480 690 920 1120 1280 1370 -top 0 -bot 590
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


