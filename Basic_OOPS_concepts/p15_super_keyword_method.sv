//p15

class Base;
	int b;
  	int c;
  
  function void display();
    $display("[base] b=%0d c=%0d",b,c);
  endfunction
endclass

class derived extends Base;
	
  	int c,e;
	
  /*
  function void display();
    $display("[Derived] c=%0d e=%0d",c,e);
  endfunction
   */
  
   function void display();
     super.display();				// this will call base class display function
     $display("[Derived2] c=%0d e=%0d",c,e);
   endfunction
   
   
  
	
  
	
endclass

program test;
	derived d;
	
	
	initial begin
				
		d=new;
      	d.c=10;d.b=30;d.e=40;
		d.c=20;
		
      
      //d.display();		//same function in both base and derived. so derived class function is called
      
      d.display();
		
	end
	
endprogram