vlib work
vdel -all
vlib work

vlog router_dut.sv -sv

vlog lab5.sv -sv

vlog top_lab5.sv -sv +acc

vsim work.testbench

add wave -r *
#do wave_lab4.do
run -all