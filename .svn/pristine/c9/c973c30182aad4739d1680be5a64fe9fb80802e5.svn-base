vlib work
vcom -93 -quiet -work work ../../src/alu_xor.vhd
vcom -93 -quiet -work work ../../src/alu_and.vhd
vcom -93 -quiet -work work ../../src/alu_or.vhd
vcom -93 -quiet -work work ../../src/adderSingleBitStructural.vhd
vcom -93 -quiet -work work ../src/adderSingleBitStructural_tb.vhd
vsim -voptargs=+acc -msgmode both adderSingleBitStructural_tb
do wave.do
run -all
