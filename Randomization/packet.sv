class Packet;
  
  bit [3:0] k;
  rand bit [7:0] sa,da;
  rand bit [31:0] payload[];
  rand logic a;

  constraint valid {
    sa inside {[1:8]};
    //sa >10;
  }
  
  constraint kkk {    
    da > 1 && da < 9;
  }
 
  
  constraint con_arr {
     foreach(payload[i]) 
       payload[i] inside {[1:255]};
  }
  
  constraint gen_arr {
     payload.size inside {[1:9]};  
    
  }
  
 function void print();
   $display("[Packet] k=%0d sa=%0d da=%0d payload.size=%0d",k,sa,da,payload.size());
   foreach (payload[i])
   $display("[Packet] payload[%0d]=%0d ",i,payload[i]);
 endfunction
  
endclass
