onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate -radix decimal /testbench/freq
add wave -noupdate -radix decimal /testbench/phase_1
add wave -noupdate -radix decimal /testbench/phase_2
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/pul_1
add wave -noupdate /testbench/pul_2
add wave -noupdate -divider cnt
add wave -noupdate -format Analog-Step -height 60 -max 14148100000.0 -radix decimal /testbench/dds_pulse_test_phase/cnt
add wave -noupdate -format Analog-Step -height 60 -max 14148100000.0 -radix decimal /testbench/dds_pulse_test_phase/cnt_shadow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2284770000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 84
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
configure wave -timelineunits ms
update
WaveRestoreZoom {1604800350 ps} {2674667262 ps}
