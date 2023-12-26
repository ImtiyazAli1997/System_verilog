typedef struct {
	logic [7:0] sa;				//MSB
	logic [7:0] da;
	logic [7:0] crc;
	logic [7:0] payload;		//LSB
} unpacked_st;
	
module tb;
	unpacked_st p1;
	bit [31:0] din;
	
	initial begin
		p1='{sa:8'h4a,da:8'd47,crc:8'hFF,payload:8'hac};
			
		$display ("*** packet p1 = %p",p1);
			
		//p1[7:0] =40;	//error as slicing of unpacked structure is not allowed
		//din=p1;		//error
	end
	
	
endmodule