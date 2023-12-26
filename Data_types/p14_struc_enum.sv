module tb;
	typedef enum {NOP,ADD,SUB,MUL,DIV} opcode_t;
	
	//here opcode_t is a user defined data type
	
	struct {
		logic [31:0] in1;
		logic [31:0] in2;
		
		opcode_t op1;
					//this op1 is a variable f data type opcode_t
	}	packet;
	
	initial begin
		packet.in1=32'hABCD_EF3C;
		packet.in2=32'hC143_D7A4;
		packet.op1 = MUL;
		
		$display("in1=%0h, \t in2 =%0h \t op1 =%s =%0d",packet.in1,packet.in2,packet.op1,packet.op1);
		
		$display ("*** packet = %p",packet); // the vlues will be in decimal only
		
		#5;
		packet='{in1:32'd5482, in2:32'd65536, op1:DIV};
		
		$display (" packet = %p",packet);	
	
	end
	
endmodule