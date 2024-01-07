  typedef enum {WRITE,READ} enum_t;

class Packet;

bit [3:0] addr;
bit [31:0] wdata;
enum_t  wr;  
reg a;

function void print();
  $display("[Packet] addr=%0d wdata=%0d wr=%0s ",addr,wdata,wr.name());
endfunction

task run();
addr=$urandom_range(1,15);
wdata=$urandom_range(20,200);
endtask

endclass  


program test;    
 
  
    Packet pkt1,pkt2;
    initial begin
    pkt1=new;
    pkt1.wr=READ;
    pkt1.addr=10;
    pkt1.wdata=55;
    pkt1.print();
         
    pkt2=new;
	pkt2.wr=WRITE ;
    pkt2.addr=12;
    pkt2.wdata=66;
    pkt2.print();
       
    //pkt1=null;
    //pkt1.wr=READ;
         
    
end
endprogram



