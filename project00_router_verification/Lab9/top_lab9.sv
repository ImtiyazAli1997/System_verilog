//Section 7:Define interface with clk as input
interface router_if(input clk);//OLD code lab8

	logic reset;
	logic [7:0] dut_inp;
	logic inp_valid;
	logic [7:0]dut_outp;
	logic outp_valid;
	logic busy;
	logic [3:0] error;

//Section 10 :Define the clocking block
	clocking cb @(posedge clk);
		output dut_inp;
		output inp_valid;
		input outp_valid;
		input dut_outp;
		input busy;
		input error;
	endclocking
	//I* clk and reset not there in clocking block

//Section 9:Define modport for TB
  //modport tb_mod_port (output reset,dut_inp,inp_valid, input outp_valid,dut_outp,busy,error);//old code lab8
	modport tb_mod_port (clocking cb, output reset);

endinterface

module top;

//Section1: Variables for Port Connections Of DUT and TB.
logic clk;
  
//Section2: Clock initiliazation and Generation
initial clk=0;
always #5 clk=!clk;

//Section 8: Instantiate interface
router_if router_if_inst(clk);//old code lab8

//Section3:  DUT instantiation
router_dut dut_inst(.clk(clk),
.reset(router_if_inst.reset),
.dut_inp(router_if_inst.dut_inp),
.inp_valid(router_if_inst.inp_valid),
.dut_outp(router_if_inst.dut_outp),
.outp_valid(router_if_inst.outp_valid),
.busy(router_if_inst.busy),
.error(router_if_inst.error)
);

//Section4:  Program Block (TB) instantiation
testbench  tb_inst(.clk(clk), .vif(router_if_inst.tb_mod_port));

 
//Section 6: Dumping Waveform
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,top.dut_inst); 
end

endmodule


