vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../AXI_SevenSegmentDriver_1.0/src/AXI_SevenSegmentDriver_0/hdl/AXI_SevenSegmentDriver_v1_0_S00_AXI.v" \
"../../../../AXI_SevenSegmentDriver_1.0/src/AXI_SevenSegmentDriver_0/hdl/AXI_SevenSegmentDriver_v1_0.v" \
"../../../../AXI_SevenSegmentDriver_1.0/src/AXI_SevenSegmentDriver_0/sim/AXI_SevenSegmentDriver_0.v" \


vlog -work xil_defaultlib "glbl.v"

