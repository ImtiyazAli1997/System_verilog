class packet;
	rand bit[7:0] addr;
	
	rand bit[31:0] data;
	
	extern constraint valid_c;
	
	extern function void print();
	
	extern function void post_randomize();
	
endclass

constraint packet::valid_c{
	addr inside {[0:15]};
	data inside {[100:500]};
}

function void packet::print();
	$display("addr=%0d data=%0d",addr,data);
endfunction
	
function void packet::post_randomize();
	$display("[C_Packet]");
	print();
endfunction
	
	
	
program tb;
	packet p1;
	
	initial begin
		p1=new();
		
		repeat(5) p1.randomize();
		
	end
	
endprogram
		
		