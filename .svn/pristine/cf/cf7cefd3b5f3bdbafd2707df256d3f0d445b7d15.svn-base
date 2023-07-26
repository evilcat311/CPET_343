vlib work
vcom -93 -quiet -work work ../../src/bus_compare.vhd
vcom -93 -quiet -work work ../src/bus_compare_tb.vhd
vsim -voptargs=+acc -msgmode both bus_compare_tb
do wave.do
run -all
