vlib work
vcom -93 -quiet -work work ../../src/add_sub.vhd
vcom -93 -quiet -work work ../../src/seven_seg.vhd
vcom -93 -quiet -work work ../../src/clock_synchronizer.vhd
vcom -93 -quiet -work work ../../src/calculator.vhd
vcom -93 -quiet -work work ../src/calculator_tb.vhd
vsim -voptargs=+acc -msgmode both calculator_tb
do wave.do
run -all
