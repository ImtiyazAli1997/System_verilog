class A;
    int j;
endclass

program test;

A a1,a2;

initial begin
    a1=new;
    a1.j=10;
    $display("a1.j=%0d \n",a1.j);
    
    a2=new a1;						//this line is equivalent to
									//a2=new;
									//a2.j=a1.j;	//variable assignment
    $display("After Shallow copy");
  
    $display("a2.j=%0d ",a2.j);
    a1.j=20;
    $display("a1.j=%0d a2.j=%0d ",a1.j,a2.j);
    a2.j=30;
  $display("a1.j=%0d a2.j=%0d \n",a1.j,a2.j);
end
endprogram
