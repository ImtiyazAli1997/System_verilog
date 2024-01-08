class base;
  
  rand bit [3:0] k,k2;
  
  constraint valid {
   k inside {[2:4]};
   
  }
endclass

class derived extends base;
  
  constraint valid {
    k inside {[5:8]};
   
  }
endclass

program test;
  base b1;
  derived d1;
  
initial begin
    b1=new;
    driver(b1);
	
	d1=new;
	$display("*********After Polymorphism ************");
	repeat(6) driver(d1);
	
	
end
  
task driver(base b_h);
void'(b_h.randomize());
$display("[Driver] b_h.k=%0d",b_h.k);

//Drive stimulus received in object onto interface signals
//vif.cb.inp<=b_h.k
endtask

endprogram