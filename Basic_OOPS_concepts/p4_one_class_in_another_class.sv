//One class inside another class

class A;
	int j;
  
	function new(int g=7);
		j=g;
	endfunction
endclass

class B;
	int k;
	A a1;

	function new();
		a1=new;
	endfunction
  
endclass

program test;
	B b1;
	A K1;
	initial begin
		//K1=new;
		//K1.j=44;
	  
		b1=new;
		b1.k=10;
		b1.a1.j=20;
		$display("b1.k=%0d b1.a1.j=%0d",b1.k,b1.a1.j);
		  //$display("K1.j=%0d ",K1.j);
	end
endprogram