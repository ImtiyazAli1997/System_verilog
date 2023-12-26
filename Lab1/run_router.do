vlib work
vdel -all
vlib work

vlog router_dut.sv -sv +acc
vlog testbench.sv -sv +acc


vsim work.testbench

add wave -r *
run -all