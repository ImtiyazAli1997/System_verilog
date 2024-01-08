//Section 7 : Interface definitioninterface
interface router_if();
	logic reset;
	logic [7:0] dut_inp;
	logic inp_valid;
	  
	logic [7:0] dut_outp;
	logic outp_valid;
	logic busy;
	logic [3:0] error;
	
modport tb_mod_port(input dut_outp,outp_valid,busy,error,output inp_valid,dut_inp,reset);

modport dut_mod_port(output dut_outp,outp_valid,busy,error,input inp_valid,dut_inp,reset);
endinterface

module top;

//Section1: Variables for Port Connections Of DUT and TB.
logic clk;

  
//Section2: Clock initiliazation and Generation
initial clk=0;
always #5 clk=!clk;

//Section 8 : Instantiate interface with instance name router_if_inst.
router_if router_if_inst();

//Section3:  DUT instantiation
router_dut dut_inst(	.clk(clk),
                        .reset(router_if_inst.reset),
                        .dut_inp(router_if_inst.dut_inp),
                        .inp_valid(router_if_inst.inp_valid),
                        .dut_outp(router_if_inst.dut_outp),
                        .outp_valid(router_if_inst.outp_valid),
                        .busy(router_if_inst.busy),
                        .error(router_if_inst.error)
					);

//Section4:  Program Block (TB) instantiation
testbench  tb_inst(		.clk(clk),
                        .vif(router_if_inst.tb_mod_port)
					);
 
//Section 6: Dumping Waveform
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,top.dut_inst); 
end

endmodule