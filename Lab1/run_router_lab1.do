vlib work
vdel -all
vlib work

vlog router_dut.sv -sv +acc
vlog lab1.sv -sv +acc


vsim work.testbench

#add wave -r *
do wave_lab1.do
run -all