onerror {resume}
radix define op_codes {
    "2'b00" "Invalid" -color "yellow",
    "2'b01" "Subtract" -color "green",
    "2'b10" "Add" -color "green",
    "2'b11" "Invalid" -color "yellow",
    -default default
}
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
add wave -noupdate /calculator_tb/clk_tb
add wave -noupdate -radix hexadecimal -childformat {{/calculator_tb/UUT/inp_a_bcd(3) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(2) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(1) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(0) -radix hexadecimal}} -subitemconfig {/calculator_tb/UUT/inp_a_bcd(3) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(2) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(1) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(0) {-height 15 -radix hexadecimal}} /calculator_tb/UUT/inp_a_bcd
add wave -noupdate -radix hexadecimal -childformat {{/calculator_tb/UUT/inp_b_bcd(3) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(2) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(1) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(0) -radix hexadecimal}} -subitemconfig {/calculator_tb/UUT/inp_b_bcd(3) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(2) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(1) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(0) {-height 15 -radix hexadecimal}} /calculator_tb/UUT/inp_b_bcd
add wave -noupdate -radix unsigned /calculator_tb/sw_tb
add wave -noupdate /calculator_tb/op_inp_tb
add wave -noupdate -radix States /calculator_tb/HEX4_tb
add wave -noupdate -radix States /calculator_tb/HEX2_tb
add wave -noupdate -radix States /calculator_tb/HEX0_tb
add wave -noupdate /calculator_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /calculator_tb/UUT/reset
add wave -noupdate /calculator_tb/UUT/CLOCK_50
add wave -noupdate -radix unsigned /calculator_tb/UUT/SW
add wave -noupdate /calculator_tb/UUT/KEY
add wave -noupdate -radix op_codes -childformat {{/calculator_tb/UUT/op_code(1) -radix op_codes} {/calculator_tb/UUT/op_code(0) -radix op_codes}} -subitemconfig {/calculator_tb/UUT/op_code(1) {-height 15 -radix op_codes} /calculator_tb/UUT/op_code(0) {-height 15 -radix op_codes}} /calculator_tb/UUT/op_code
add wave -noupdate /calculator_tb/UUT/operation
add wave -noupdate -radix States /calculator_tb/UUT/HEX4
add wave -noupdate -radix States /calculator_tb/UUT/HEX2
add wave -noupdate -radix States /calculator_tb/UUT/HEX0
add wave -noupdate -radix hexadecimal -childformat {{/calculator_tb/UUT/inp_a_bcd(3) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(2) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(1) -radix hexadecimal} {/calculator_tb/UUT/inp_a_bcd(0) -radix hexadecimal}} -subitemconfig {/calculator_tb/UUT/inp_a_bcd(3) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(2) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(1) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_a_bcd(0) {-height 15 -radix hexadecimal}} /calculator_tb/UUT/inp_a_bcd
add wave -noupdate -radix hexadecimal -childformat {{/calculator_tb/UUT/inp_b_bcd(3) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(2) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(1) -radix hexadecimal} {/calculator_tb/UUT/inp_b_bcd(0) -radix hexadecimal}} -subitemconfig {/calculator_tb/UUT/inp_b_bcd(3) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(2) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(1) {-height 15 -radix hexadecimal} /calculator_tb/UUT/inp_b_bcd(0) {-height 15 -radix hexadecimal}} /calculator_tb/UUT/inp_b_bcd
add wave -noupdate -radix hexadecimal -childformat {{/calculator_tb/UUT/result(3) -radix hexadecimal} {/calculator_tb/UUT/result(2) -radix hexadecimal} {/calculator_tb/UUT/result(1) -radix hexadecimal} {/calculator_tb/UUT/result(0) -radix hexadecimal}} -subitemconfig {/calculator_tb/UUT/result(3) {-height 15 -radix hexadecimal} /calculator_tb/UUT/result(2) {-height 15 -radix hexadecimal} /calculator_tb/UUT/result(1) {-height 15 -radix hexadecimal} /calculator_tb/UUT/result(0) {-height 15 -radix hexadecimal}} /calculator_tb/UUT/result
add wave -noupdate -divider add_sub
add wave -noupdate -radix op_codes /calculator_tb/UUT/add_sub_module/op_code
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/add_sub_module/inp_a
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/add_sub_module/inp_b
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/add_sub_module/result
add wave -noupdate -divider inp_a_display
add wave -noupdate /calculator_tb/UUT/inp_a_disp/enable
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/inp_a_disp/bcd
add wave -noupdate -radix States /calculator_tb/UUT/inp_a_disp/seven_seg_out
add wave -noupdate -divider inp_b_display
add wave -noupdate /calculator_tb/UUT/inp_b_disp/enable
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/inp_b_disp/bcd
add wave -noupdate -radix States /calculator_tb/UUT/inp_b_disp/seven_seg_out
add wave -noupdate -divider result_display
add wave -noupdate /calculator_tb/UUT/result_disp/enable
add wave -noupdate -radix hexadecimal /calculator_tb/UUT/result_disp/bcd
add wave -noupdate -radix States /calculator_tb/UUT/result_disp/seven_seg_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5285991 ps} 0} {{Cursor 2} {37302 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 155
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {325608 ps}
