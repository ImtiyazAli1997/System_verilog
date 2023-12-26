module tb;
  
	reg clk,reset;
	  
	initial  forever #5 clk =~clk;
	  
	enum {IDLE,LOAD,STORE,WAIT,DONE} State;
	   
	initial begin
		clk=0;reset<=1;
		$monitor ($time," state = %s  =%0d",State,State);
		#14 reset<=0;
		
		#100 $finish;
	end
	  
	always @(posedge clk)
	  if (reset) 
		State <= IDLE;
	else
	 	case (State)
			IDLE:  State <= LOAD;
			LOAD:  State <= STORE;
			STORE: State <= WAIT;
			WAIT:	State <=DONE;
			DONE:	State<=IDLE;
		endcase
	
  
endmodule