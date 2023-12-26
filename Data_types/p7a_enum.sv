module tb;
  enum {IDLE,WAIT,LOAD,DONE} state;
  
  initial begin 
    	state= WAIT;
    	$display("state= %s =%0d",state,state);
  end
  
endmodule