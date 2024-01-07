//Class Handle assignment, assigning one handle to another
class A;
    int m;
endclass

class B;
	int m;
endclass


program test;
  
    A a1,a2,a3;
	B b1;

    initial begin
		a1=new;	// let this handle a1 be pointing to object P
		a2=new;// let this handle a2 be pointing to object Q
		$display("\n Before Handle assignment ");
		a1.m=10;
		a2.m=20;
		  
		//$display("Before Handle assign  a1.m=%0d a2.m=%0d ",a1.m,a2.m);      
		a1=a2;		// a1 and a2 are pointing to same object which is Q
		a1.m=30;     // as both are pointing to object Q whichever handle we use contents of object Q will be manipulated with both handles
		$display("After  Handle assign  a1.m=%0d a2.m=%0d ",a1.m,a2.m);
		  
		a2.m=40;
		$display("After  Handle assign  a1.m=%0d a2.m=%0d \n",a1.m,a2.m);
	   		
	 /*
	 b1=new;
	  a3=b1;		//error  Illegal class assignment as the type of both handles is different ae is of type A class and b1 is of type B class
	 */  
	   
      end
endprogram

/*
"a3 = b1;"
  Expression 'b1' on rhs is not a class or a compatible class and hence cannot
  be assigned to a class handle on lhs.
  Source type: class $unit::B
  Target type: class $unit::A
  Please make sure that the lhs and rhs expressions are compatible.
  
  */