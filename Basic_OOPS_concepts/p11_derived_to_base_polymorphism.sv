//handle assignments of base and derived
class base;
	bit [7:0] addr;
	
	function void run();			//***use virtual key word before function
		addr=5;
		$display("[base] addr=%0d ",addr);
	endfunction
endclass

class derived extends base;

	function void run();
		addr=6;
		$display("[derived] addr=%0d ",addr);
	endfunction
	
endclass 

program test;
	base b;
	derived d;
  
	initial begin
		b=new;
		b.run();
		
		d=new();
		d.run();
		
		b=d;		// here base handle is pointing to derived object
					//if same name method exists between base and derived class and the method is called
					//then system verilog calls the method based on handle type
					//if the handle is of type base then base method will be called 
					//if the handle is of type derived then derived methos will be called
					
		$display("After handle Assignment");
		b.run();		//though b is pointing to derived object and derived method is called but  
						//same method exists in base class so the run() method which has to be executed depends on the handle type
						
	end
  
endprogram

/* NOTE:
if there were other method in derived class.
we cannot use a base handle pointing to derived class inorder to access those methods 

example if run2() was a function in derived class
b.run2(); will give an error it will not execute



*****
if we use virtual keyword in the base class then
b.run() will execute the derived class method.
this is polymorphism
*/