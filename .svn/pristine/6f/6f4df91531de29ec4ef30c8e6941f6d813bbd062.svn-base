vlib work
vcom -93 -quiet -work work ../../src/jk_flip_flop.vhd
vcom -93 -quiet -work work ../src/jk_flip_flop_tb.vhd
vsim -voptargs=+acc -msgmode both jk_flip_flop_tb
do wave.do
run -all
