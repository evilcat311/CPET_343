onerror {resume}
radix define States {
    "7'b1111111" "BLANK" -color "red",
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0010000" "9" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider UUT
add wave -noupdate /processor_tb/UUT/clk_50mhz
add wave -noupdate /processor_tb/UUT/reset
add wave -noupdate /processor_tb/UUT/execute
add wave -noupdate -radix States /processor_tb/UUT/hex2
add wave -noupdate -radix States /processor_tb/UUT/hex1
add wave -noupdate -radix States /processor_tb/UUT/hex0
add wave -noupdate /processor_tb/UUT/ledOut
add wave -noupdate /processor_tb/UUT/count_sig
add wave -noupdate /processor_tb/UUT/opcode
add wave -noupdate /processor_tb/UUT/rom_out
add wave -noupdate /processor_tb/UUT/exeSync
add wave -noupdate /processor_tb/UUT/memAddr
add wave -noupdate /processor_tb/UUT/hex1s
add wave -noupdate /processor_tb/UUT/hex10s
add wave -noupdate /processor_tb/UUT/hex100s
add wave -noupdate /processor_tb/UUT/l7led
add wave -noupdate -divider sth
add wave -noupdate /processor_tb/UUT/L7/clk_50mhz
add wave -noupdate /processor_tb/UUT/L7/op_mode
add wave -noupdate /processor_tb/UUT/L7/a_in
add wave -noupdate /processor_tb/UUT/L7/pb_in
add wave -noupdate -radix States /processor_tb/UUT/L7/hex2
add wave -noupdate -radix States /processor_tb/UUT/L7/hex1
add wave -noupdate -radix States /processor_tb/UUT/L7/hex0
add wave -noupdate /processor_tb/UUT/L7/ledOut
add wave -noupdate /processor_tb/UUT/L7/current_state
add wave -noupdate /processor_tb/UUT/L7/next_state
add wave -noupdate /processor_tb/UUT/L7/pb_sync
add wave -noupdate /processor_tb/UUT/L7/a_sync
add wave -noupdate /processor_tb/UUT/L7/reset_edge
add wave -noupdate /processor_tb/UUT/L7/op_sync
add wave -noupdate /processor_tb/UUT/L7/execute
add wave -noupdate /processor_tb/UUT/L7/memSave
add wave -noupdate /processor_tb/UUT/L7/memRstr
add wave -noupdate /processor_tb/UUT/L7/load_save
add wave -noupdate /processor_tb/UUT/L7/result_en
add wave -noupdate /processor_tb/UUT/L7/memAddr
add wave -noupdate /processor_tb/UUT/L7/memRWen
add wave -noupdate /processor_tb/UUT/L7/result_reg
add wave -noupdate /processor_tb/UUT/L7/alu_out
add wave -noupdate /processor_tb/UUT/L7/memOut
add wave -noupdate /processor_tb/UUT/L7/output
add wave -noupdate /processor_tb/UUT/L7/out_12b
add wave -noupdate /processor_tb/UUT/L7/hex1s
add wave -noupdate /processor_tb/UUT/L7/hex10s
add wave -noupdate /processor_tb/UUT/L7/hex100s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {127 ns} 0}
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
WaveRestoreZoom {0 ns} {478 ns}
