vlib work
vcom -93 -quiet -work work ../../src/one_hot_fsm.vhd
vcom -93 -quiet -work work ../src/one_hot_fsm_tb.vhd
vsim -voptargs=+acc -msgmode both one_hot_fsm_tb
do wave.do
run -all
