class A;
	rand bit [3:0] addr;
	
	function print();
		$display("[CA print] addr=%0d",addr);
	endfunction
	
	function void post_randomize();
		$display("[CA post_randomize] ");
		print();
	endfunction
	
endclass

class B;
	rand bit[7:0] data;
	rand A a1;
	
	function new();
		a1=new();
	endfunction
	function print();
		$display("[CB print] data=%0d",data);
	endfunction
	
	function void post_randomize();
		$display("[CB post_randomize] ");
		print();
	endfunction
endclass

program test;
	B b1;
	
	initial begin
		b1=new();
		
		b1.randomize();
	
	end
	
endprogram