# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: imports/Lab4/Basys3_Master-1.xdc

# Block Designs: bd/wavetablebd/wavetablebd.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd || ORIG_REF_NAME==wavetablebd}]

# IP: bd/wavetablebd/ip/wavetablebd_wavetable_0_1/wavetablebd_wavetable_0_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_wavetable_0_1 || ORIG_REF_NAME==wavetablebd_wavetable_0_1}]

# IP: bd/wavetablebd/ip/wavetablebd_pwm_0_0/wavetablebd_pwm_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_pwm_0_0 || ORIG_REF_NAME==wavetablebd_pwm_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_clk_wiz_0_0 || ORIG_REF_NAME==wavetablebd_clk_wiz_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_xlslice_0_0/wavetablebd_xlslice_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_xlslice_0_0 || ORIG_REF_NAME==wavetablebd_xlslice_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_c_shift_ram_0_0/wavetablebd_c_shift_ram_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_c_shift_ram_0_0 || ORIG_REF_NAME==wavetablebd_c_shift_ram_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_util_vector_logic_0_0/wavetablebd_util_vector_logic_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_util_vector_logic_0_0 || ORIG_REF_NAME==wavetablebd_util_vector_logic_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_xlslice_1_0/wavetablebd_xlslice_1_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_xlslice_1_0 || ORIG_REF_NAME==wavetablebd_xlslice_1_0}]

# IP: bd/wavetablebd/ip/wavetablebd_c_shift_ram_1_0/wavetablebd_c_shift_ram_1_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_c_shift_ram_1_0 || ORIG_REF_NAME==wavetablebd_c_shift_ram_1_0}]

# IP: bd/wavetablebd/ip/wavetablebd_c_shift_ram_2_0/wavetablebd_c_shift_ram_2_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_c_shift_ram_2_0 || ORIG_REF_NAME==wavetablebd_c_shift_ram_2_0}]

# IP: bd/wavetablebd/ip/wavetablebd_c_shift_ram_3_0/wavetablebd_c_shift_ram_3_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_c_shift_ram_3_0 || ORIG_REF_NAME==wavetablebd_c_shift_ram_3_0}]

# IP: bd/wavetablebd/ip/wavetablebd_c_counter_binary_0_0/wavetablebd_c_counter_binary_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_c_counter_binary_0_0 || ORIG_REF_NAME==wavetablebd_c_counter_binary_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_xlconstant_0_0/wavetablebd_xlconstant_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_xlconstant_0_0 || ORIG_REF_NAME==wavetablebd_xlconstant_0_0}]

# IP: bd/wavetablebd/ip/wavetablebd_xlslice_2_0/wavetablebd_xlslice_2_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==wavetablebd_xlslice_2_0 || ORIG_REF_NAME==wavetablebd_xlslice_2_0}]

# XDC: bd/wavetablebd/ip/wavetablebd_wavetable_0_1/src/Basys3_Master-1.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==wavetablebd_wavetable_0_1 || ORIG_REF_NAME==wavetablebd_wavetable_0_1}] {/inst }]/inst ]]

# XDC: bd/wavetablebd/ip/wavetablebd_pwm_0_0/src/Basys3_Master-1.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==wavetablebd_pwm_0_0 || ORIG_REF_NAME==wavetablebd_pwm_0_0}] {/inst }]/inst ]]

# XDC: bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==wavetablebd_clk_wiz_0_0 || ORIG_REF_NAME==wavetablebd_clk_wiz_0_0}] {/inst }]/inst ]]

# XDC: bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==wavetablebd_clk_wiz_0_0 || ORIG_REF_NAME==wavetablebd_clk_wiz_0_0}] {/inst }]/inst ]]

# XDC: bd/wavetablebd/ip/wavetablebd_clk_wiz_0_0/wavetablebd_clk_wiz_0_0_ooc.xdc

# XDC: bd/wavetablebd/ip/wavetablebd_c_shift_ram_0_0/wavetablebd_c_shift_ram_0_0_ooc.xdc

# XDC: bd/wavetablebd/ip/wavetablebd_c_shift_ram_1_0/wavetablebd_c_shift_ram_1_0_ooc.xdc

# XDC: bd/wavetablebd/ip/wavetablebd_c_shift_ram_2_0/wavetablebd_c_shift_ram_2_0_ooc.xdc

# XDC: bd/wavetablebd/ip/wavetablebd_c_shift_ram_3_0/wavetablebd_c_shift_ram_3_0_ooc.xdc

# XDC: bd/wavetablebd/ip/wavetablebd_c_counter_binary_0_0/wavetablebd_c_counter_binary_0_0_ooc.xdc

# XDC: bd/wavetablebd/wavetablebd_ooc.xdc
