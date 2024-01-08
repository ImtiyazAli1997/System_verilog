class A;
	rand int x;
	rand int y;
	rand int z;
	
	function print();
		$display("x=%0d y=%0d z=%0d",x,y,z);
	endfunction
	
	function void post_randomize();
		print();
	endfunction
	
endclass

program test;
	A a1;
	
	initial begin
		a1=new();
		
		a1.rand_mode(0);
		a1.x.rand_mode(1);
		
		a1.randomize();
		
		#10 a1.rand_mode(1);
		
		a1.randomize();
		
	end
	
endprogram
		