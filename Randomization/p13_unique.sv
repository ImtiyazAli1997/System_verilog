class A;
	//rand bit [31:0] arr[5];
	rand bit [7:0] arr[5];
	rand bit[7:0] dyn[];
	
	constraint my_c {
		unique{ arr,dyn};
		
		dyn.size() inside{[4:10]};
	}
	
	function print();
		
		$display("arr=%0p dyn=%0p ",arr,dyn);
	endfunction
	
	function void post_randomize();
		print();
	endfunction

endclass

program test;
	A a1;
	
	initial begin 
		a1=new();
		
		repeat(5) a1.randomize();
	end
	
endprogram

/*
The item 'this.dyn' and 'this.arr' are of non-equivalent type - they have 
  different total bits, signedness, numeric types or enum types.
  Please make sure items in unique constraint have equivalent types.

*/
		
	