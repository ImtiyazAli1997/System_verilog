`include "packet.sv"
program test;
    
Packet pkt;
    
initial begin
      pkt=new;

  repeat(2) begin
        $display("******************************");
        void'(pkt.randomize());
        pkt.print();
        $display(" logic a=%b ",pkt.a);
        $display("******************************");
      end
  
  pkt.valid.constraint_mode(0);
  void'(pkt.randomize()  with {sa == 9 ;});
  $display("NEW pkt.sa=%0d",pkt.sa);
           
end
      
endprogram