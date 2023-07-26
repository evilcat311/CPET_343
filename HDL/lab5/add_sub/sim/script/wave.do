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
	"7'b0001000" "A" -color "red",
    "7'b0000011" "B" -color "red",
    "7'b1000110" "C" -color "red",
    "7'b0100001" "D" -color "red",
    "7'b0000110" "E" -color "red",
    "7'b0001110" "F" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider UUT
add wave -noupdate -divider Counter
add wave -noupdate /add_sub_tb/sim_done
add wave -noupdate /add_sub_tb/a_tb
add wave -noupdate /add_sub_tb/b_tb
add wave -noupdate -radix States /add_sub_tb/hexOut_tb
add wave -noupdate -radix States /add_sub_tb/hexA_tb
add wave -noupdate -radix States /add_sub_tb/hexB_tb
add wave -noupdate /add_sub_tb/clk_tb
add wave -noupdate /add_sub_tb/reset_n_tb
add wave -noupdate /add_sub_tb/add_tb
add wave -noupdate /add_sub_tb/sub_tb
add wave -noupdate -divider UUT
add wave -noupdate /add_sub_tb/UUT/clk_50mhz
add wave -noupdate /add_sub_tb/UUT/a_in
add wave -noupdate /add_sub_tb/UUT/b_in
add wave -noupdate /add_sub_tb/UUT/reset_n
add wave -noupdate /add_sub_tb/UUT/add
add wave -noupdate /add_sub_tb/UUT/subtract
add wave -noupdate -radix States /add_sub_tb/UUT/hexA
add wave -noupdate -radix States /add_sub_tb/UUT/hexB
add wave -noupdate -radix States /add_sub_tb/UUT/hexSum
add wave -noupdate /add_sub_tb/UUT/sum
add wave -noupdate /add_sub_tb/UUT/add_hold
add wave -noupdate /add_sub_tb/UUT/sub_hold
add wave -noupdate /add_sub_tb/UUT/add_sync
add wave -noupdate /add_sub_tb/UUT/sub_sync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {161 ns} 0}
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
WaveRestoreZoom {2571 ns} {3012 ns}
