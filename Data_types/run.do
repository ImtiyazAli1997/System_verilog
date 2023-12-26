vlib work
vdel -all
vlib work


vlog $1 +acc -sv

#vlog $2.sv +acc -sv


vsim work.tb

#add wave -r *
run -all