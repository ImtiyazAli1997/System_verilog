module tb;
	typedef enum {IDLE,WAIT,LOAD,STORE} state_t;
	
	state_t p_state,n_state;
	
	initial begin
	
		p_state=LOAD;
		n_state=get_next(p_state);
		$display("present state= %s next_state=%s",p_state,n_state);
	end
	
	function state_t get_next(input state_t in_state);
		case(in_state)
			IDLE:	get_next= LOAD;
			LOAD:	get_next=STORE;
			STORE:	get_next=WAIT;
			default:	get_next=in_state;
		endcase
	endfunction
	
endmodule