# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.cache/wt [current_project]
set_property parent.project_path C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_repo_paths {
  c:/XilinxWorking/ip_repo
  c:/XilinxWorking/Lab5/2_1_PWM_IP/ip_repo
} [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/wavetablebd.bd
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_wavetable_0_1/src/Basys3_Master-1.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_pwm_0_0/src/Basys3_Master-1.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_c_shift_ram_0_0/wavetablebd_c_shift_ram_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_c_shift_ram_1_0/wavetablebd_c_shift_ram_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_c_shift_ram_2_0/wavetablebd_c_shift_ram_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_c_shift_ram_3_0/wavetablebd_c_shift_ram_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/ip/wavetablebd_c_counter_binary_0_0/wavetablebd_c_counter_binary_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/wavetablebd_ooc.xdc]
set_property is_locked true [get_files C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/wavetablebd.bd]

read_verilog -library xil_defaultlib C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/sources_1/bd/wavetablebd/hdl/wavetablebd_wrapper.v
read_xdc C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/constrs_1/imports/Lab4/Basys3_Master-1.xdc
set_property used_in_implementation false [get_files C:/XilinxWorking/Lab5/2_3_wavetable_test/2_3_wavetable_test.srcs/constrs_1/imports/Lab4/Basys3_Master-1.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top wavetablebd_wrapper -part xc7a35tcpg236-1 -flatten_hierarchy none -directive RuntimeOptimized -fsm_extraction off
write_checkpoint -noxdef wavetablebd_wrapper.dcp
catch { report_utilization -file wavetablebd_wrapper_utilization_synth.rpt -pb wavetablebd_wrapper_utilization_synth.pb }