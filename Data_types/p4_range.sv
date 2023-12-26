module tb;
	bit b1;					//0,1
	bit [7:0] b2;			//8 bit      	[0] to [(2^7)-1]
	byte b3;				//8 bits  [- (2^7)] to [(2^7)-1]
	
	shortint i1;	//16 bits  [-2^15] to [(2^15)-1]
	int i2;			//32 bits  [-2^31] to [(2^31)-1]
	longint i3;		//64 bits  [-2^63] to [(2^63)-1]
	
	byte unsigned u1;			//8 bit      	[0] to [(2^8)-1]
	shortint unsigned u2;		//16 bits		[0] to [(2^16)-1]
	int unsigned u3;			//32 bits		[0] to [(2^32)-1]
	longint unsigned u4;		//64 bits  		[0] to [(2^64)-1]
	
	initial begin
		b1=1;
		b2=4'b1010;
		b3=-4;
		i1=16'habcd;
		i2=32'habcd_ffff;
		i3=64'haaaa_bbbb_cccc_dddd;
		u1=255;
		u2=65536;
		u3=4294967295;
	end

endmodule