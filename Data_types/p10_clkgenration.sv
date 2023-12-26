//don't_uplaod
module tb;
	
	
	`ifdef METHOD1
		bit clk1; // starts with 0
		always #5 clk1=~clk1;
	`endif
	
	`ifdef METHOD2
		bit clk2=1;	// starts with1
		always #5 clk2=~clk2;
	`endif
	
	`ifdef METHOD3
		bit clk3=1;	// starts with1
		
		initial forever #5 clk3=~clk3;
	`endif
	
	
	initial #200 $finish;
endmodule