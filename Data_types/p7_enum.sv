//not working _doon't upload
module FSM (clk,rst,state);
	input clk,rst;
	output [1:0] state;
	
	enum {IDLE,WAIT,LOAD,DONE} ps,ns;
	
	/*
	always@(posedge clk) begin
		if(rst)
			ps<=IDLE;
		else
			case(ps)
			IDLE:	begin ps<=WAIT; 	end
			WAIT:	begin ps<=LOAD;	end
			LOAD:	begin ps<=DONE;	end
			DONE:	begin ps<=IDLE;	end
			default:	ns<=IDLE;
			
		endcase
		
	end
	
	
	assign state = ps;
	
	*/
	
	always@(posedge clk) begin
		if(rst)
			ps<=IDLE;
		else
			ps<=ns;
		
	end
	
	//not working
	//always@(ps) begin
	always_comb  begin
	
		case(ps)
			IDLE:	 ns=WAIT; 	
			WAIT:	 ns=LOAD;	
			LOAD:	 ns=DONE;	
			DONE:	 ns=IDLE;	
			default:	ns=IDLE;
		endcase
	
	end
	
	
	assign state = ps;
	
endmodule


module tb;
	
	//enum {IDLE,WAIT,LOAD,DONE} tb_state;
	
	bit clk,rst;
	wire [1:0] tb_state;
	
	initial forever #5 clk =!clk;
	
	FSM uut (clk,rst,tb_state);
	initial begin 
		clk=0;rst=1;
		#2;
		rst=0;
		
		$monitor($time," tb_state= %0d ps = %s  %0d \t ns =%s %0d",tb_state,uut.ps,uut.ps,uut.ns,uut.ns);
		
		#50 $finish;
	end
	
endmodule
