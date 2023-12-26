module tb;
	bit [7:0] array_1[50];
	bit [7:0] array_2[50];
	
	initial begin
	array_1[10]=8'h5a;
	$display("arr1= %0p  \n arr2=%0p",array_1,array_2);
	run(array_1,array_2);
	$display( "arr1= %0p \n arr2=%0p",array_1,array_2);
	
	end
	
	task automatic run (ref bit[7:0] p[50],ref bit[7:0] q[50]);
		bit [7:0] data;
		
		data=p[10];		//reading from array_1
		
		q[7]=data;		//writing in array_2
	endtask

endmodule

/* ref keywords toes the formal and actual arguments 
you can do both read and write in task and changes will reflect on both the actual and formal arguments


*/