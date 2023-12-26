module test;

typedef enum {IDLE,WAIT,LOAD,STORE} states_t;

function states_t  NextState (states_t  inp_state);
case (inp_state)
	WAIT:     NextState = LOAD;
	LOAD:     NextState = STORE;
	STORE:    NextState = WAIT;
    default : NextState = inp_state; // default next state
endcase
endfunction

states_t st_p,st_n;

initial begin
  $display("Initial values of Enum st_p=%0s st_n=%0s",st_p.name(),st_n.name());
  st_n=WAIT;
  st_p=NextState(st_n);
  $display("Enum st_n=%0s st_p=%0s ",st_n.name(),st_p.name());
  st_p=NextState(LOAD);
  $display("Enum st_n=%0s st_p=%0s ",st_n.name(),st_p.name());
  st_n=STORE;
  st_p=NextState(st_n);
  $display("Enum st_n=%0s st_p=%0s ",st_n.name(),st_p.name());
end
endmodule