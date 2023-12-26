vlib work
vdel -all
vlib work


vlog p10_clkgenration.sv +acc -sv +define+METHOD1 +define+METHOD2 +define+METHOD3

#vlog $2.sv +acc -sv


vsim work.tb

add wave -r *
run -all