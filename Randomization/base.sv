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