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

  
endclass

program test;
	child c1;

	initial begin
	 
	  c1=new();
	end
endprogram

/*Error:
Super class constructor has non-default arguments. Arguments can be specified in the "extends" clause or by calling super.new() explicitly.

Two solutions
1] add a default value to base class constructot to g1
2]write a constructor in child class in that we have to call super.new constructor of base with an arguments
i.e 
function new(int arg);
	super.new(arg); 
endfunction
*/