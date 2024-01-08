class Transaction;
	rand bit[7:0] addr;
	rand bit[31:0] data;
	
	constraint valid {
		addr inside {[0:15]};
		data inside {[100:500]};
	}
	
	function void print();
		$display("addr=%0d \t data=%0d",addr,data);
	endfunction
	
endclass

program test;
	Transaction pkt;
	bit ret;
	
	initial begin
		pkt=new;
		
		pkt.print();
		
		ret=pkt.randomise();
		
		$display("ret =%0d",ret);
		
		pkt.print();
		
		
	end
	
endprogram