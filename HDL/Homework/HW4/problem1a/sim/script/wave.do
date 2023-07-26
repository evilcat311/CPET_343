onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /d_flip_flop_tb/clk_tb
add wave -noupdate /d_flip_flop_tb/data_tb
add wave -noupdate /d_flip_flop_tb/que_tb
add wave -noupdate /d_flip_flop_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /d_flip_flop_tb/UUT/clk
add wave -noupdate /d_flip_flop_tb/UUT/data
add wave -noupdate /d_flip_flop_tb/UUT/que
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {42980 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 168
configure wave -valuecolwidth 39
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
WaveRestoreZoom {0 ps} {180600 ps}
