module tb;

	struct {
		logic [31:0] data;
		bit [7:0] addr;
	} packet;
	// here packet is the name of the variabble
	initial begin
		$monitor($time," data= %0h addr =%0d",packet.data,packet.addr);
		//initialization method 1
		packet.data=32'hFACE_EAC2;
		packet.addr=8'd24;
		
		#5;
		//initialization method 2 using structure member namesnames
		packet = '{data:32'hACE3_BAC7,addr:8'd54};
		
	
		
	end
endmodule