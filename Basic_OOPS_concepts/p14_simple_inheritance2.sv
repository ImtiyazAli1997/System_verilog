//p14
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
	Base b1;
	int ret1,ret2;
	
	initial begin
		d=new;
		b1=new;
		
		b1.b=40;
		
		d.b=10;			// b is a part od base class
		d.c=20;			// c is a part of derived class
		
		ret1=d.get;			//base class method;
		ret2=b1.get;
		
		$display("ret1=%0d ret2=%0d",ret1,ret2);
		d.print;		// deroved class method
		
	end
    
endprogram