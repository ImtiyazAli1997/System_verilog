typedef struct packed{
	logic [7:0] sa;				//MSB
	logic [7:0] da;
	logic [7:0] crc;
	logic [7:0] payload;		
	//bit	  [2:0] flags;//LSB
} packed_st;
	
	//total 32 bits in the 
	// packed structures cannot contain real or short real variables
module tb;
	packed_st p1;
	
	reg [31:0] din;
	
	initial begin
		p1='{sa:81,da:44,crc:15,payload:22};//,flags:5};
			
		$display ("*** packet p1 = %p",p1);
			
		p1[7:0] =40;	//lsb
		
		$display ("*** packet p1 = %p",p1);
		
		din=p1;// this will not throw error as in the case of unpacked error
		
		$display("din sa=%0d, \t da =%0d \t crc =%0d \t payload = %0d",din[7:0],din[15:8],din[23:14],din[31:24]);
	
		$display("p1 sa=%0d, \t da =%0d \t crc =%0d \t payload = %0d",p1[7:0],p1[15:8],p1[23:14],p1[31:24]);
		
		$display("p1 sa=%0h, \t da =%0h \t crc =%0h \t payload = %0h",p1[7:0],p1[15:8],p1[23:14],p1[31:24]);
		
		$display("din sa=%0h, \t da =%0h \t crc =%0h \t payload = %0h",din[7:0],din[15:8],din[23:14],din[31:24]);
	
	
		$display("din = %0h",din);
	end
	
	
endmodule