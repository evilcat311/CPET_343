onerror {resume}
radix define States {
    "7'b1111111" "EMPTY" -color "red",
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    "7'b0001000" "A" -color "red",
    "7'b0000011" "B" -color "red",
    "7'b1000110" "C" -color "red",
    "7'b0100001" "D" -color "red",
    "7'b0000110" "E" -color "red",
    "7'b0001110" "F" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /top_tb/clk_tb
add wave -noupdate /top_tb/key_tb
add wave -noupdate /top_tb/led_tb
add wave -noupdate -radix States /top_tb/hex2_tb
add wave -noupdate -radix States /top_tb/hex1_tb
add wave -noupdate -radix States /top_tb/hex0_tb
add wave -noupdate /top_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /top_tb/UUT/CLOCK_50
add wave -noupdate /top_tb/UUT/KEY
add wave -noupdate /top_tb/UUT/LEDR
add wave -noupdate -radix States /top_tb/UUT/HEX2
add wave -noupdate -radix States /top_tb/UUT/HEX1
add wave -noupdate -radix States /top_tb/UUT/HEX0
add wave -noupdate /top_tb/UUT/exe_detect
add wave -noupdate /top_tb/UUT/instruction
add wave -noupdate /top_tb/UUT/instruc_reg
add wave -noupdate /top_tb/UUT/rom_out
add wave -noupdate /top_tb/UUT/address
add wave -noupdate /top_tb/UUT/decode_en
add wave -noupdate /top_tb/UUT/sw_sig
add wave -noupdate /top_tb/UUT/keys_sig
add wave -noupdate /top_tb/UUT/op_2bit
add wave -noupdate /top_tb/UUT/operation
add wave -noupdate /top_tb/UUT/mr_pb
add wave -noupdate /top_tb/UUT/ms_pb
add wave -noupdate -radix unsigned /top_tb/UUT/data
add wave -noupdate /top_tb/UUT/reset_n
add wave -noupdate -divider ROM
add wave -noupdate /top_tb/UUT/rom_inst/address
add wave -noupdate /top_tb/UUT/rom_inst/clock
add wave -noupdate /top_tb/UUT/rom_inst/q
add wave -noupdate /top_tb/UUT/rom_inst/sub_wire0
add wave -noupdate -divider Calculator
add wave -noupdate /top_tb/UUT/calculator/CLOCK_50
add wave -noupdate /top_tb/UUT/calculator/SW
add wave -noupdate /top_tb/UUT/calculator/KEY
add wave -noupdate /top_tb/UUT/calculator/LEDR
add wave -noupdate -radix States /top_tb/UUT/calculator/HEX4
add wave -noupdate -radix States /top_tb/UUT/calculator/HEX2
add wave -noupdate -radix States /top_tb/UUT/calculator/HEX0
add wave -noupdate /top_tb/UUT/calculator/sw_sync
add wave -noupdate /top_tb/UUT/calculator/key_sync
add wave -noupdate /top_tb/UUT/calculator/execute
add wave -noupdate /top_tb/UUT/calculator/ms
add wave -noupdate /top_tb/UUT/calculator/mr
add wave -noupdate /top_tb/UUT/calculator/reset_n
add wave -noupdate /top_tb/UUT/calculator/reset
add wave -noupdate /top_tb/UUT/calculator/alu_result
add wave -noupdate /top_tb/UUT/calculator/mem_addr
add wave -noupdate /top_tb/UUT/calculator/mem_write_en
add wave -noupdate /top_tb/UUT/calculator/mem_data_out
add wave -noupdate /top_tb/UUT/calculator/result_reg_inp
add wave -noupdate /top_tb/UUT/calculator/en_result_reg
add wave -noupdate /top_tb/UUT/calculator/load_saved_data
add wave -noupdate /top_tb/UUT/calculator/result
add wave -noupdate /top_tb/UUT/calculator/desired_op
add wave -noupdate /top_tb/UUT/calculator/input_num
add wave -noupdate -divider {Detect Exe PB}
add wave -noupdate /top_tb/UUT/edge_detect_exe/clk
add wave -noupdate /top_tb/UUT/edge_detect_exe/reset_n
add wave -noupdate /top_tb/UUT/edge_detect_exe/input
add wave -noupdate /top_tb/UUT/edge_detect_exe/edge
add wave -noupdate /top_tb/UUT/edge_detect_exe/input_z
add wave -noupdate /top_tb/UUT/edge_detect_exe/input_zz
add wave -noupdate /top_tb/UUT/edge_detect_exe/input_zzz
add wave -noupdate -divider {Three Digit Disp}
add wave -noupdate /top_tb/UUT/calculator/disp/reset_n
add wave -noupdate /top_tb/UUT/calculator/disp/clk
add wave -noupdate /top_tb/UUT/calculator/disp/input
add wave -noupdate /top_tb/UUT/calculator/disp/hundreds
add wave -noupdate /top_tb/UUT/calculator/disp/tens
add wave -noupdate /top_tb/UUT/calculator/disp/ones
add wave -noupdate -radix unsigned /top_tb/UUT/calculator/disp/hundreds_bcd
add wave -noupdate -radix unsigned /top_tb/UUT/calculator/disp/tens_bcd
add wave -noupdate -radix unsigned /top_tb/UUT/calculator/disp/ones_bcd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {709656 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {945 ns}
