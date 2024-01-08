typedef enum {SHORT,MEDIUM, JUMBO} pkt_type_e;

class A;
	rand pkt_type_e pkt_size;
	rand int len;
	
	constraint c_len_frames{
		if(pkt_size==JUMBO)	len inside {[2000:5000]};
		else if (pkt_size==MEDIUM) len inside {[64:1024]};
		else len inside {[1:63]};
	}
	function print();
		
		$display("pkt_size=%0s len=%0d",pkt_size,len);
		
		$display("************\n");
	endfunction
	
	function void post_randomize();
		this.print();
	endfunction
	
endclass

program test;
	A a1;
	bit ret;
	
	initial begin
		a1=new;
		
		repeat(5) ret=a1.randomize();
	
	end

endprogram
