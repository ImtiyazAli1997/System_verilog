`include "base.sv"

program test;
  base b1;
  derived d1;
  
initial begin
    d1=new;
	b1=d1;
	$display("*********After handle assignment************");
    repeat(3) begin
    void'(b1.randomize());
    $display("b1.k=%0d b1.k2=%0d",b1.k,b1.k2);
   end
end
endprogram

