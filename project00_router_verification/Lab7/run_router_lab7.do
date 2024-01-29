vlib work
vdel -all
vlib work

vlog router_dut_lab7.sv -sv

vlog lab7.sv -sv

vlog top_lab7.sv -sv +acc

vsim work.testbench

add wave -r *
#do wave_lab4.do
run -all