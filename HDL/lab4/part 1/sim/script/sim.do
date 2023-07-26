vlib work
vcom -93 -quiet -work work ../../src/bcd_7seg.vhd
vcom -93 -quiet -work work ../../src/generic_counter.vhd
vcom -93 -quiet -work work ../../src/generic_adder_beh.vhd
vcom -93 -quiet -work work ../../src/top.vhd
vcom -93 -quiet -work work ../src/seven_seg_tb.vhd
vsim -voptargs=+acc -msgmode both seven_seg_tb
do wave.do
run -all
