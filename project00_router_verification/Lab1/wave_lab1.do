onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /testbench/clk
add wave -noupdate -format Logic /testbench/reset
add wave -noupdate -format Logic /testbench/inp_valid
add wave -noupdate -format Literal -radix unsigned /testbench/dut_inp
add wave -noupdate -format Logic /testbench/busy
add wave -noupdate -format Logic /testbench/outp_valid
add wave -noupdate -format Literal -radix unsigned /testbench/dut_outp
add wave -noupdate -format Literal /testbench/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {455 ps} 0}
configure wave -namecolwidth 184
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {572 ps}
