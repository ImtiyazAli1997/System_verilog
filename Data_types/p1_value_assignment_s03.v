module tb;
	parameter SIZE=64;
	reg [SIZE-1:0] data;
	
	initial begin
		data =0 ;
		#10;
		data='bz;
		#10;
		data='bx;
		#10;
		data=64'hFFFF_FFFF_FFFF_FFFF;
		
	end
	
	initial $monitor ($time," data is %0h",data);
	
endmodule