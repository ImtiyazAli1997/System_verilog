module top;
  
  Packet pkt;
  
  initial begin
    
    pkt=new;
    pkt.addr=10;
    
    $display("[Module] pkt.addr=%0d",pkt.addr);
    
  end
  
endmodule