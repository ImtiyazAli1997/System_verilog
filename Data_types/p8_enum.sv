//don't uplaod
module fsm (clock,resetN);
  input clock;
  
  input resetN;
  
  enum {IDLE,LOAD,STORE,WAIT} State, NextState;

always @(posedge clock, negedge resetN)
  if (!resetN) 
    State <= IDLE;
else
  State <= NextState;

always_comb begin
//always@(State) begin
case (State)
IDLE:  NextState = LOAD;
LOAD:  NextState = STORE;
STORE: NextState = WAIT;
endcase
  
end
  

endmodule

module tb;
  
  reg clk,resetN;
  
  fsm fsm_inst(clk,resetN);
  
  initial begin
    clk=0;resetN=1;
    #1 resetN=0;
    #3 resetN=1;
    #50 $finish;
  end
  
  always #5 clk = !clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb.fsm_inst);
  end
  
endmodule