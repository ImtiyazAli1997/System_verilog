`include "base.sv"

program test;
  base b1;
  derived d1;
  
initial begin
    b1=new;
    driver(b1);
	
	d1=new;
	$display("*********After Polymorphism ************");
	driver(d1);
	
	
end
  
task driver(base b_h);
void'(b_h.randomize());
$display("[Driver] b_h.k=%0d",b_h.k);

//Drive stimulus received in object onto interface signals
//vif.cb.inp<=b_h.k
endtask

endprogram