onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate /top_level_tb/count
add wave -noupdate /top_level_tb/x_tb
add wave -noupdate /top_level_tb/y_tb
add wave -noupdate /top_level_tb/z_tb
add wave -noupdate /top_level_tb/w_tb
add wave -noupdate /top_level_tb/f1_tb
add wave -noupdate /top_level_tb/f1_truth
add wave -noupdate -divider UUT
add wave -noupdate /top_level_tb/UUT/x
add wave -noupdate /top_level_tb/UUT/y
add wave -noupdate /top_level_tb/UUT/z
add wave -noupdate /top_level_tb/UUT/w
add wave -noupdate /top_level_tb/UUT/f1
add wave -noupdate /top_level_tb/UUT/and_3_out
add wave -noupdate /top_level_tb/UUT/nor_4_out
add wave -noupdate /top_level_tb/UUT/or_2_out
add wave -noupdate /top_level_tb/UUT/z_n
add wave -noupdate /top_level_tb/UUT/x_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {94386 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 44
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
WaveRestoreZoom {0 ps} {338150 ps}
