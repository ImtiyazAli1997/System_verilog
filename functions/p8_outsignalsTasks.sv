module tb;
	bit[3:0] i1,out_sig=2;
	
	task automatic run(input bit [3:0] a1, output bit [3:0] out);
		#2 a1=5;
		$display("[task] a1 changed to = %0d  at time t=%0t",a1,$time);
		#2 out = a1+3;
		$display("[task] out changed to = %0d  at time t=%0t",out,$time);
		#2 out = a1*5;
	endtask
	
	initial run(i1,out_sig);
	
	always @(i1) begin
		$display("[Always1] detected change on i1 =%0d at time %0t",i1,$time);
		i1++;
	end
	
	always@(out_sig)
		$display("[Always2] detected change on out_sig =%0d at time=%0t",out_sig,$time);

endmodule

/*
the chnages that occur on input signals inside the task are 
not reflected on the signals outside the tasks as these signals are not tied by ref


only the last value assigned to output signals will reflected
*/