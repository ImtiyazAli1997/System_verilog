vlib work
vdel -all
vlib work


vlog $1 -sv +acc

#vlog $2.sv +acc -sv


vsim work.tb

#add wave -r *
#do wave.do
run -all