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
    repeat(2) begin
      void'(b1.randomize());
      $display("[Base] b1.k=%0d",b1.k);
    end
    $display("******************\n");
  
  d1=new;
  repeat(2) begin
    
      void'(d1.randomize());
      $display("[Derived] d1.k=%0d",d1.k);
    end
end
endprogram