vlib work
vcom -2008 -quiet -work work ../../src/common.vhd
vcom -2008 -quiet -work work ../../src/raminfr.vhd
vcom -2008 -quiet -work work ../../src/generic_adder_beh.vhd
vcom -2008 -quiet -work work ../../src/generic_subtractor_beh.vhd
vcom -2008 -quiet -work work ../../src/double_dabble.vhd
vcom -2008 -quiet -work work ../../src/edge_detect.vhd
vcom -2008 -quiet -work work ../../src/bcd2seven_seg.vhd
vcom -2008 -quiet -work work ../../src/clock_synchronizer.vhd
vcom -2008 -quiet -work work ../../src/alu.vhd
vcom -2008 -quiet -work work ../../src/add_sub.vhd

vcom -2008 -quiet -work work ../../src/rom/lab8rom.vhd
vcom -2008 -quiet -work work ../../src/processor.vhd
vcom -2008 -quiet -work work ../src/processor_tb.vhd
vsim -voptargs=+acc -msgmode both processor_tb
do wave.do
run -all