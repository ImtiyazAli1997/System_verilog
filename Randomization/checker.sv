class Packet;
  
    bit [7:0] sa,da;
  
  
  constraint valid {
    sa inside {[1:8]};
    da inside {[1:8]};
  }
  
   function void print();
   $display("[Packet] sa=%0d da=%0d ",sa,da);
   endfunction
endclass

program test;
    
Packet pkt;
    
initial begin
      pkt=new;
      //pkt.sa=4;pkt.da=3;
        $display("******************************");
        void'(pkt.randomize());
        pkt.print();
        $display("******************************");
          
end
      
endprogram