//Shall copy complex example

class B;
	int k;
endclass

class A;
    int j;
    B b1;

    function new();
	b1=new;
    endfunction
endclass

program test;
A a1,a2;

initial begin
    
    a1=new;
    a1.j=10;a1.b1.k=33;
    $display("a1.j=%0d a1.b1.k=%0d \n",a1.j,a1.b1.k);
    
    a2=new a1;		//this line is equivalent to
									//a2=new;
									//a2.j=a1.j;	//variable assignment
									//a2.b1=a1.b1	//handle asssignment
									// inter b1 object elements are not copied only the handle is copied
									//both a2.b1 and a1.b1 points to same object
									
    $display("After Shallow copy");
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

/*
# Deep

a1.j=10 a1.b1.k=33 

After Deep copy
a2.j=10 a2.b1.k=33

a1.j=20 a2.j=10 

a1.b1.k=44 a2.b1.k=33

a1.b1.k=44 a2.b1.k=55

a1.j=20 a2.j=30 







#shallow

a1.j=10 a1.b1.k=33 

After Shallow copy
a2.j=10 a2.b1.k=33

a1.j=20 a2.j=10 

a1.b1.k=44 a2.b1.k=44

a1.b1.k=55 a2.b1.k=55

a1.j=20 a2.j=30 
*/