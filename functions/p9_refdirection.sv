module tb;
	bit[3:0] i1,out_sig=2;
	
	task automatic run(ref bit [3:0] a1, inout bit [3:0] out);
		#2 a1=4;
		$display("[task] a1 changed to = %0d  at time t=%0t",a1,$time);
		#2 a1=2;
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
	->arguments passed by reference are not copied into the subroutine area, rather,
	->a reference to the original argument is passed to the subroutine.
	->Subroutines access ref arguments via referencing
	->the formal arguments should match the equivalent datatype when passed by reference
	
	it shall be illegal to use arguments passing by reference for subroutines with 
	lifetime of static
	
*/