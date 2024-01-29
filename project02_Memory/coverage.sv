class coverage ;

packet pkt;
real coverage_score;
mailbox#(packet) mbx;
 
   covergroup fcov with function sample(packet pkt) ;
   coverpoint pkt.addr; 
   endgroup

function new (input mailbox #(packet) mbx_arg);
this.mbx=mbx_arg;
fcov=new;
endfunction

virtual task run();
  $display("[Coverage] run started at time=%0t",$time);
while(1) begin
@(mbx.num);
mbx.peek(pkt);
fcov.sample(pkt);
coverage_score=fcov.get_coverage();

$display("[FCOV] Coverage=%0f ",coverage_score);
end
endtask

function void report();
$display("********* Functional Coverage **********");
$display("** coverage_score=%0f ",coverage_score);
$display("**************************************");
endfunction
  
endclass