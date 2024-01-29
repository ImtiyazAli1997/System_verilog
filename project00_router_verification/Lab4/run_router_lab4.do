vlib work
vdel -all
vlib work

vlog router_dut.sv -sv +acc
vlog lab4.sv -sv +acc


vsim work.testbench

add wave -r *
#do wave_lab4.do
run -all