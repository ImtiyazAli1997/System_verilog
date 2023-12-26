module tb;
	union tagged {
		int i;
		real f;
	} un;		//un is a variable
	
	int int_v;
	real real_v;
	
	initial begin
		un = tagged f 1.234;
		
		real_v= un.f;
		//int_v = un.i;	//error as union was previously tagged to f
		$display("un.f=%0d",un.f);
		
		un= tagged i 10;
		int_v =un.i;
		
		$display("un.i=%0d",un.i);
	end
	
endmodule

/*
tagged union contains an implicit member that stores a tag, which 
represents the name of the last union member into which a value was stored.
When a value is stored in a tagged uion using a tagged expression, the 
implicit tag automatically stores information as to which member the value was written.



# ** Error: (vsim-8011) p19_taggedUnion.sv(14): Union is tagged 'f', but is referenced as 'i'.
#    Time: 0 ps  Iteration: 0  Instance: /tb

*/