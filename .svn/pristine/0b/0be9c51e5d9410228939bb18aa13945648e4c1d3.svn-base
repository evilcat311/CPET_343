vlib work
vcom -93 -quiet -work work ../../src/d_flip_flop.vhd
vcom -93 -quiet -work work ../src/d_flip_flop_tb.vhd
vsim -voptargs=+acc -msgmode both d_flip_flop_tb
do wave.do
run -all
