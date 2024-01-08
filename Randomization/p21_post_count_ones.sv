class A;
  
  rand bit [7:0] v1,v2;
  rand bit [7:0] s,e;
  bit [31:0] ones,zeros;
  
  function void pre_randomize();
    //this.s.rand_mode(0);
    //s = 10;e=50
  endfunction
  
  constraint valid {
    v1 inside {[s:e]};
    v2 inside {[0:99]};
    
  }
  
  function void post_randomize();
    ones=$countones(v1);
    $display("No of ones=%0d",ones);
    zeros=$bits(v1) - $countones(v1);
    $display("No of zeros=%0d",zeros);
    
  endfunction
  
endclass


program test;
  A a1;
  
  initial begin
    a1=new;
    repeat(3) begin
      assert(a1.randomize());
    $display("a1,v1=%0d",a1.v1);
      $display("*************");
    end
  end
endprogram