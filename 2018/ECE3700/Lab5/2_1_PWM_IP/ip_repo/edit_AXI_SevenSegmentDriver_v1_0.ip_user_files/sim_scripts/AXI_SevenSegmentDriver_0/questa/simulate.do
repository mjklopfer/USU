onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib AXI_SevenSegmentDriver_0_opt

do {wave.do}

view wave
view structure
view signals

do {AXI_SevenSegmentDriver_0.udo}

run -all

quit -force
