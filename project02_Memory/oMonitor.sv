class oMonitor ;
string name;
bit [15:0] no_of_pkts_recvd;
packet   pkt;
virtual memory_if.tb_mon_out vif;
mailbox #(packet) mbx;//will be connected to input of scoreboard


function new (input mailbox #(packet) mbx_in,
              input virtual memory_if.tb_mon_out vif_in,
	      input string name="oMonitor");
this.mbx = mbx_in;
this.vif = vif_in;
this.name=name;
endfunction

task run() ;
bit [15:0] addr;
$display("[%s] run started at time=%0t ",name,$time); 
while(1) begin
@(vif.cb_mon_out.rdata);

//skip the loop when data_out is in high impedance state
if(vif.cb_mon_out.rdata === 'z || vif.cb_mon_out.rdata === 'x)
begin
//$display("@%0t [%s] DEBUG 1 data_out=%0d \n",$time,name,vif.cb_mon_out.data_out); 
    continue;
end

//$display("@%0t [%s] data_out=%0d \n",$time,name,vif.cb_mon_out.data_out); 
pkt=new;
pkt.addr  = vif.cb_mon_out.addr;
pkt.data  = vif.cb_mon_out.rdata;//read data

mbx.put(pkt);
no_of_pkts_recvd++;
pkt.print();
$display("[%s] Sent packet %0d to scoreboard at time=%0t ",name,no_of_pkts_recvd,$time); 
end

$display("[%s] run ended at time=%0t ",name,$time);//monitor will never end 
endtask

function void report();
$display("[%s] Report: total_packets_received=%0d ",name,no_of_pkts_recvd); 
endfunction



endclass
