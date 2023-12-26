module tb;
	bit [7:0] array_1[50];
	bit [7:0] array_2[50];
	
	
	initial begin
	array_1[10]=8'h5a;
	$display("arr1= %0p  \n arr2=%0p",array_1,array_2);
	run(array_1,array_2);
	$display( "arr1= %0p \n arr2=%0p",array_1,array_2);
	
	end
	
	task automatic run (const ref bit[7:0] p[50],ref bit[7:0] q[50]);
		bit [7:0] data;
		
		data=p[10];		//reading from array_1
		
		//p[7]=data;		//writing in array_1
		
		q[49]=data;	//writing in array_2
		
		
	endtask

endmodule

/*
	const ref is read only 
	
	due to line19 we get error
	# ** Error: p13_const_ref.sv(19): Variable 'p' is const
	# ** Error: p13_const_ref.sv(19): Illegal LHS of assignment.

	refer topic4 slipde22
*/