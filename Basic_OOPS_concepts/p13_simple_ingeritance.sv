class Base;
	int b;
	
	function int get();
		return b;
	endfunction
	
endclass

class Derived extends Base;
	int c;
	
	function void print();
		$display("b=%0d c=%0d",b,c);
	endfunction
	
endclass

program test;
	Derived d;
	
	initial begin
		d=new;
		
		d.b=10;			// b is a part od base class
		d.c=20;			// c is a part of derived class
		
		d.get;			//base class method;
		
		d.print;		// deroved class method
		
	end
    
endprogram