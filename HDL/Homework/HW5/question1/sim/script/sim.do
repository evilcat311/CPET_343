vlib work
vcom -93 -quiet -work work ../../src/three_proc_sm.vhd
vcom -93 -quiet -work work ../src/three_proc_sm_tb.vhd
vsim -voptargs=+acc -msgmode both three_proc_sm_tb
do wave.do
run -all
