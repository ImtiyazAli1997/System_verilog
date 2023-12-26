//system verilog
module tb;
	parameter SIZE=64;
	reg [SIZE-1:0] data;
	
	initial begin
		data ='1 ;
		#10;
		data='0;
		#10;
		data='z;
		#10;
		data='x;
		
	end
	
	initial $monitor ($time," data is %0h",data);
	
endmodule