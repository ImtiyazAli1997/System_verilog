module tb;
	parameter SIZE=128;
	reg [SIZE-1:0] data;
	
	initial begin
		data =~0 ;
		//this changes all bits to one
		#10;
		data=-8;	// to check that negative values are in 2's complement form
		#10;
		data=64'ha5a5;
		#10;
		data=-1;
		//this changes all bits to one
		
		
		
	end
	
	initial $monitor ($time," data is %0h",data);
	
endmodule