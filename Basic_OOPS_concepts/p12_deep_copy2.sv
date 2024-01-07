//deep copy complex example1

class B;
	int k;
	
	function B copy();
		B copy_handle1;
		copy_handle1=new;	//create the handle
		
		copy_handle1.k=this.k;	//copy the variables of current object into copy_handle
		
		return copy_handle1;		//return copy_handle
		
	endfunction
	
endclass

class A;
    int j;
    B b1;

    function new();
		b1=new;
    endfunction
	
	function A copy();
		A copy_handle2;
		copy_handle2=new;					//create the handle
		
		copy_handle2.j=this.j;				//copied the variables
		copy_handle2.b1=this.b1.copy();		//copying the handles
		
		return copy_hanlde2;				//return copy_handle
	endfunction
	
endclass

program test;
A a1,a2;

initial begin
    
    a1=new;
    a1.j=10;a1.b1.k=33;
    $display("a1.j=%0d a1.b1.k=%0d \n",a1.j,a1.b1.k);
    
	a2=new;
	a2=a1.copy();	
									
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