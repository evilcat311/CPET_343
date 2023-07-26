vlib work
vcom -93 -quiet -work work ../../src/alu_xor.vhd
vcom -93 -quiet -work work ../../src/alu_and.vhd
vcom -93 -quiet -work work ../../src/alu_or.vhd
vcom -93 -quiet -work work ../../src/full_adder.vhd
vcom -93 -quiet -work work ../../src/full_adder_3bit.vhd
vcom -93 -quiet -work work ../src/full_adder_3bit_tb.vhd
vsim -voptargs=+acc -msgmode both full_adder_3bit_tb
do wave.do
run -all