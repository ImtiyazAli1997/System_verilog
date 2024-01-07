vlib work
vdel -all
vlib work

vlog router_dut.sv -sv +acc
vlog lab3.sv -sv +acc


vsim work.testbench

#add wave -r *
do wave_lab3.do
run -all