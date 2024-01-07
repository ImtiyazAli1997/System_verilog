//deep copy complex example1

class B;
	int k;
	
	function void copy(B inp);
		this.k=inp.k;
	endfunction
	
endclass

class A;
    int j;
    B b1;

    function new();
		b1=new;
    endfunction
	
	function void copy(A inp);
		this.j=inp.j;
		b1.copy(inp.b1);
	endfunction
	
endclass

program test;
A a1,a2;

initial begin
    
    a1=new;
    a1.j=10;a1.b1.k=33;
    $display("a1.j=%0d a1.b1.k=%0d \n",a1.j,a1.b1.k);
    
	a2=new;
	a2.copy(a1);	
									
    $display("After Deep copy");
    $display("a2.j=%0d a2.b1.k=%0d\n",a2.j,a2.b1.k);
    
    a1.j=20;
    $display("a1.j=%0d a2.j=%0d \n",a1.j,a2.j);
    
    a1.b1.k=44;
    $display("a1.b1.k=%0d a2.b1.k=%0d\n",a1.b1.k,a2.b1.k);
	
    a2.b1.k=55;
    $display("a1.b1.k=%0d a2.b1.k=%0d\n",a1.b1.k,a2.b1.k);
    a2.j=30;
    $display("a1.j=%0d a2.j=%0d \n",a1.j,a2.j);
end
endprogram