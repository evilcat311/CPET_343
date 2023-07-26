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
radix define FSM_State {
    "9'b000001000" "INPUT_A" -color "orange",
    "9'b000001100" "INPUT_B" -color "orange",
    "9'b000001110" "DISP_SUM" -color "orange",
    "9'b000001111" "DISP_DIFF" -color "orange",
    -default default
}
radix define DispValues {
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
add wave -noupdate -radix unsigned /top_tb/sw_tb
add wave -noupdate /top_tb/key_tb
add wave -noupdate -radix FSM_State /top_tb/LEDR_tb
add wave -noupdate -radix DispValues /top_tb/HEX4_tb
add wave -noupdate -radix DispValues /top_tb/HEX2_tb
add wave -noupdate -radix DispValues /top_tb/HEX0_tb
add wave -noupdate /top_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /top_tb/UUT/CLOCK_50
add wave -noupdate /top_tb/UUT/reset_n
add wave -noupdate -radix unsigned /top_tb/UUT/SW
add wave -noupdate /top_tb/UUT/KEY
add wave -noupdate -radix FSM_State /top_tb/UUT/LEDR
add wave -noupdate -radix DispValues /top_tb/UUT/HEX4
add wave -noupdate -radix DispValues /top_tb/UUT/HEX2
add wave -noupdate -radix DispValues /top_tb/UUT/HEX0
add wave -noupdate -radix unsigned /top_tb/UUT/sw_sync
add wave -noupdate /top_tb/UUT/key_sync
add wave -noupdate /top_tb/UUT/inp_a_write_en
add wave -noupdate /top_tb/UUT/inp_b_write_en
add wave -noupdate -radix unsigned /top_tb/UUT/inp_a
add wave -noupdate -radix unsigned /top_tb/UUT/inp_b
add wave -noupdate -radix op_codes /top_tb/UUT/op_code
add wave -noupdate -radix unsigned /top_tb/UUT/calc_result
add wave -noupdate -radix unsigned /top_tb/UUT/padded_result
add wave -noupdate -divider FSM
add wave -noupdate /top_tb/UUT/top_inst/clock
add wave -noupdate /top_tb/UUT/top_inst/reset_n
add wave -noupdate /top_tb/UUT/top_inst/exe_n
add wave -noupdate -radix FSM_State /top_tb/UUT/top_inst/led
add wave -noupdate -radix op_codes /top_tb/UUT/top_inst/op_code
add wave -noupdate /top_tb/UUT/top_inst/inp_a_en
add wave -noupdate /top_tb/UUT/top_inst/inp_b_en
add wave -noupdate /top_tb/UUT/top_inst/curr_state
add wave -noupdate /top_tb/UUT/top_inst/next_state
add wave -noupdate -divider add_sub
add wave -noupdate /top_tb/UUT/calc_block/reset_n
add wave -noupdate /top_tb/UUT/calc_block/clk
add wave -noupdate -radix op_codes /top_tb/UUT/calc_block/op_code
add wave -noupdate -radix unsigned /top_tb/UUT/calc_block/inp_a
add wave -noupdate -radix unsigned /top_tb/UUT/calc_block/inp_b
add wave -noupdate /top_tb/UUT/calc_block/op_enabled
add wave -noupdate -radix unsigned /top_tb/UUT/calc_block/result
add wave -noupdate -divider three_digit_display
add wave -noupdate /top_tb/UUT/displays/reset_n
add wave -noupdate /top_tb/UUT/displays/clk
add wave -noupdate -radix unsigned /top_tb/UUT/displays/input
add wave -noupdate -radix DispValues /top_tb/UUT/displays/hundreds
add wave -noupdate -radix DispValues /top_tb/UUT/displays/tens
add wave -noupdate -radix DispValues /top_tb/UUT/displays/ones
add wave -noupdate -radix unsigned /top_tb/UUT/displays/hundreds_bcd
add wave -noupdate -radix unsigned /top_tb/UUT/displays/tens_bcd
add wave -noupdate -radix unsigned /top_tb/UUT/displays/ones_bcd
add wave -noupdate -divider {Storage A}
add wave -noupdate /top_tb/UUT/inp_a_store/reset_n
add wave -noupdate /top_tb/UUT/inp_a_store/clk
add wave -noupdate /top_tb/UUT/inp_a_store/enable_write
add wave -noupdate -radix unsigned /top_tb/UUT/inp_a_store/input
add wave -noupdate -radix unsigned /top_tb/UUT/inp_a_store/output
add wave -noupdate -divider {Storage B}
add wave -noupdate /top_tb/UUT/inp_b_store/reset_n
add wave -noupdate /top_tb/UUT/inp_b_store/clk
add wave -noupdate /top_tb/UUT/inp_b_store/enable_write
add wave -noupdate -radix unsigned /top_tb/UUT/inp_b_store/input
add wave -noupdate -radix unsigned /top_tb/UUT/inp_b_store/output
add wave -noupdate -divider sw_clk_sync
add wave -noupdate /top_tb/UUT/sw_clk_sync/clk
add wave -noupdate /top_tb/UUT/sw_clk_sync/async_in
add wave -noupdate /top_tb/UUT/sw_clk_sync/sync_out
add wave -noupdate /top_tb/UUT/sw_clk_sync/prev_data_1
add wave -noupdate /top_tb/UUT/sw_clk_sync/prev_data_2
add wave -noupdate -divider rising_edge_sync_key
add wave -noupdate /top_tb/UUT/key_clk_sync/clk
add wave -noupdate /top_tb/UUT/key_clk_sync/reset_n
add wave -noupdate /top_tb/UUT/key_clk_sync/input
add wave -noupdate /top_tb/UUT/key_clk_sync/edge
add wave -noupdate /top_tb/UUT/key_clk_sync/input_z
add wave -noupdate /top_tb/UUT/key_clk_sync/input_zz
add wave -noupdate /top_tb/UUT/key_clk_sync/input_zzz
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {350807 ps} 0} {{Cursor 2} {8664 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 232
configure wave -valuecolwidth 67
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {226283 ps}
