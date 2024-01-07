//p15

class Base;
	int b;
  	int c;
endclass

class derived extends Base;
	
  	int c,e;
	
	function void print();
      $display("1 Base b= %0d c=%0d \n Derived c=%0d d=%0d",super.b,super.c,c,e);
		//super.c=20;
      $display("2 Base b= %0d c=%0d \n Derived c=%0d d=%0d",b,super.c,c,e);
	endfunction
	
endclass

program test;
	derived d;
	
	
	initial begin
				
		d=new;
      	d.c=10;d.b=30;d.e=40;
		d.c=20;
		d.print;
		
	end
	
endprogram