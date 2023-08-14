onerror {resume}
radix define States {
    "8'b000?????" "Play" -color "green",
    "8'b001?????" "Play Repeat" -color "purple",
    "8'b01??????" "Pause" -color "orange",
    "8'b10??????" "Seek" -color "blue",
    "8'b11??????" "Stop" -color "red",
    -default hexadecimal
    -defaultcolor white
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/clk
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/reset
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/execute_btn
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/sync
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/led
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/audio_out
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_reg
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/current_state
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/next_state
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_play
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_play_repeat
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_stop
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_seek
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/data_address_pause
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/instruction
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/inst_addr
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/play_cmd
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/pause_cmd
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/seek_cmd
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/seek_addr
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/stop_cmd
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/execute_en
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/seek_value
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/repeat_func
add wave -noupdate /dj_roomba_3000_tb/dj_roomba/opcode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2012 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 202
configure wave -valuecolwidth 48
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {490 ns}
