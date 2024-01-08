class A;
	rand bit x;
	rand bit [1:0] y;
	
	constraint c_xy {
		(x==0)->(y==0);
		solve x before y;
	}
	
	function void print();
		$display("x=%0d y=%0d",x,y);
	endfunction
	
	function void post_randomize();
		print();
	endfunction
	
endclass

program test;
	A a1;
	bit ret;
	
	initial begin
		a1=new;
		
		repeat(5) a1.randomize();
		
	end

endprogram
		