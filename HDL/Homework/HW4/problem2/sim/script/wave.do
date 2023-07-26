onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /jk_flip_flop_tb/j_tb
add wave -noupdate /jk_flip_flop_tb/k_tb
add wave -noupdate /jk_flip_flop_tb/preset_n_tb
add wave -noupdate /jk_flip_flop_tb/clear_n_tb
add wave -noupdate /jk_flip_flop_tb/clk_tb
add wave -noupdate /jk_flip_flop_tb/que_tb
add wave -noupdate /jk_flip_flop_tb/que_n_tb
add wave -noupdate /jk_flip_flop_tb/sim_done
add wave -noupdate -divider UUT
add wave -noupdate /jk_flip_flop_tb/UUT/j
add wave -noupdate /jk_flip_flop_tb/UUT/k
add wave -noupdate /jk_flip_flop_tb/UUT/preset_n
add wave -noupdate /jk_flip_flop_tb/UUT/clear_n
add wave -noupdate /jk_flip_flop_tb/UUT/clk
add wave -noupdate /jk_flip_flop_tb/UUT/que
add wave -noupdate /jk_flip_flop_tb/UUT/que_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {278777 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 174
configure wave -valuecolwidth 48
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
WaveRestoreZoom {0 ps} {779100 ps}
