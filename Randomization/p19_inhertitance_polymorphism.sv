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
    d1=new;
	b1=d1;
	$display("*********After handle assignment************");
    repeat(3) begin
    void'(b1.randomize());
    $display("b1.k=%0d b1.k2=%0d",b1.k,b1.k2);
   end
end
endprogram

/*

*********After handle assignment************
b1.k=5 b1.k2=9
b1.k=5 b1.k2=11
b1.k=7 b1.k2=10
b1.k=8 b1.k2=7
b1.k=5 b1.k2=0
b1.k=5 b1.k2=3
b1.k=8 b1.k2=10

*/