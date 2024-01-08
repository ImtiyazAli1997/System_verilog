class A;
	rand bit[3:0] x;
	
	constraint c1 {
		soft x==4;
		soft x>5;
	}
	
	constraint c2 {
		x<5;
	}
	
	function print();
		$display("x=%0d",x);
	endfunction
	
	function void post_randomize();
		print();
	endfunction
	
endclass

program tb;
	A a1;
	
	initial begin
		a1=new();
		
		repeat(5) a1.randomize();
		
	end
	
endprogram
		
		