onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /three_proc_sm_tb/reset_n_tb
add wave -noupdate /three_proc_sm_tb/clk_tb
add wave -noupdate /three_proc_sm_tb/serial_bit_tb
add wave -noupdate /three_proc_sm_tb/pattern_found_tb
add wave -noupdate /three_proc_sm_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /three_proc_sm_tb/UUT/reset_n
add wave -noupdate /three_proc_sm_tb/UUT/clk
add wave -noupdate /three_proc_sm_tb/UUT/serial_bit
add wave -noupdate /three_proc_sm_tb/UUT/pattern_found
add wave -noupdate /three_proc_sm_tb/UUT/curr_state
add wave -noupdate /three_proc_sm_tb/UUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 207
configure wave -valuecolwidth 63
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1806 ns}
