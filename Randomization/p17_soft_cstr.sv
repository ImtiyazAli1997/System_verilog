class base;
  
  rand bit [3:0] k,k2;
  
  constraint valid {
   soft k inside {[2:4]};
   soft k > 5; 
  }
endclass

program test;
  base b1;

  
initial begin
    b1=new;
    repeat(2) begin
      assert(b1.randomize());
      $display("[Base] b1.k=%0d",b1.k);
    end
  $display("******************");
  
end
endprogram