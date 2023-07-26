vlib work
vcom -93 -quiet -work work ../../src/adderSingleBitBehavioral.vhd
vcom -93 -quiet -work work ../src/adderSingleBitBehavioral_tb.vhd
vsim -voptargs=+acc -msgmode both adderSingleBitBehavioral_tb
do wave.do
run -all
