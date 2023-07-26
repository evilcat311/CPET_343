vlib work
vcom -93 -quiet -work work ../../src/bcd_7seg.vhd
vcom -93 -quiet -work work ../src/bcd_7seg_tb.vhd
vsim -voptargs=+acc -msgmode both bcd_7seg_tb
do wave.do
run -all
