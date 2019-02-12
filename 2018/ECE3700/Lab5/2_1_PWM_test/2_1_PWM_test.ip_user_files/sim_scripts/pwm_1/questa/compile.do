vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../2_1_PWM_test.srcs/sources_1/ip/pwm_1/src/pwm.v" \
"../../../../2_1_PWM_test.srcs/sources_1/ip/pwm_1/sim/pwm_1.v" \


vlog -work xil_defaultlib "glbl.v"

