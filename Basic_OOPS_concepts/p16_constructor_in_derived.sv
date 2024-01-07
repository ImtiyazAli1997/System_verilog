//Constructors in extended class

class base;
	int b;

	function new (int g1);
		b=g1;
		$display("\n[base] b=%0d",b);
	endfunction 

endclass


class child extends base;
	int c;

  
	function new (int arg);
		super.new(arg);
		$display("[derived] c=%0d b=%0d \n",c,b);
	endfunction
  
endclass

program test;
	child c1;

	initial begin
	 
		c1=new(8);
	end
endprogram