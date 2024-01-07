//Example shows how to write and contrcut simple class

class A;
	logic [31:0] k;
endclass

function A create();		// Here A is the datatype of class
	A a1=new;
	a1.k=55;
	$display("[create] a1.k=%0d \n",a1.k);
	
	return a1;
endfunction

function void print (A h1);		
	$display("[print] h1.k=%0d \n",h1.k);
endfunction

program test;
  
    A p1;
  
  initial begin
    p1=create();
    $display("[program] p1.k=%0d",p1.k);
    print(p1);
  end
endprogram