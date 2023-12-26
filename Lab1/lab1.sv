module testbench;

//Section 1: Define variables for DUT port connections
reg clk,reset;
//TODO
reg [7:0] dut_inp;
reg inp_valid;
wire outp_valid;
wire busy;
wire [3:0] error;
wire [7:0] dut_outp;

 
//Section 2: Router DUT instantiation
//TODO router_dut dut_inst(.clk(clk),.reset(reset),..........);
router_dut dut_inst (.clk(clk),
                    .reset(reset),
                    .dut_inp(dut_inp),
                    .inp_valid(inp_valid),
                    .dut_outp(dut_outp),
                    .outp_valid(outp_valid),
                    .busy(busy),
                    .error(error)
                );

//Section 3: Clock initiliazation and Generation
//TODO
initial clk=0;

always #5 clk=~clk;

//Section 4: TB Variables declarations. 
//Variables required for various testbench related activities . ex: stimulus generation,packing ....
//TODO
 typedef struct {
        bit[7:0] sa;
        bit [7:0] da;
        bit[31:0] len;
        bit [31:0] crc;
        bit [7:0] payload[];
 } packet;


//Section 5: Methods (functions/tasks) definitions related to Verification Environment 

task apply_reset();
//TODO
$display("[TV Reset] Applied reset to DUT");
reset<=1;
repeat(2) @(posedge clk);
reset<=0;
$display("[TV Reset]  reset completed");

endtask

function automatic void generate_stimulus(ref packet pkt);
pkt.sa=4;
pkt.da=8;
pkt.payload=mew[10];
foreach (pkt.payload[i]) begin
    pkt.payload[i]=$urandom;
end
pkt.len=1+1+4+4+pkt.payload.size();
pkt.crc=pkt.payload.sum();

endfunction

task drive(input packet pkt);
wait(busy==0);//wait utill router is ready to accept packets
@(posedge clk);
$display("[TB Drive] Driving of packet started at time=%0t",$time);
//TODO
inp_valid<=1'b1;dut_inp<=pkt.sa;
@(posedge clk);dut_inp<=pkt.da;
@(posedge clk);dut_inp<=pkt.len[7:0];
@(posedge clk);dut_inp<=pkt.len[15:8];
@(posedge clk);dut_inp<=pkt.len[23:16];
@(posedge clk);dut_inp<=pkt.len[31:24];
@(posedge clk);dut_inp<=pkt.crc[7:0];
@(posedge clk);dut_inp<=pkt.crc[15:8];
@(posedge clk);dut_inp<=pkt.crc[23:16];
@(posedge clk);dut_inp<=pkt.crc[31:24];
foreach(pkt.payload[i]) begin
    @(posedge clk);dut_inp<=pkt.payload[i];

end
endtask


function void print(input packet pkt);
$display("[TB Packet] Sa=%0h Da=%0h Len=%0h Crc=%0h",pkt.sa,pkt.da,pkt.len,pkt.crc);
foreach(pkt.payload[k])
$display("[TB Packet] Payload[%0d]=%0h",k,pkt.payload[k]);
endfunction
//--------End of Section 5 ----------------  

//Section 6: Verification Flow

packet stimuls_pkt;

initial begin
//TODO
    apply_reset();
    generate_stimulus(stimuls_pkt);
    drive(stimulus_pkt);
    repeat(5) @(posedge clk);
    
//Wait for dut to process the packet and to drive on output
    wait(busy==0);
    repeat(10) @(posedge clk);
    $finish;
end
//--------End of Section 6 ---------------- 


  
//Section 7: Dumping Waveform
//TODO
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,testbench.dut_inst);
    end
//--------End of Section 7 ---------------- 

//Section 8: Collect DUT output
//TODO 


//--------End of Section 8---------------- 


always@(error) begin
case(error)
1:$display("[TB Error] Protocol Violation. Packet driven while Router is busy");
2:$display("[TB Error] Packet Dropped due to CRC mismatch");
3:$display("[TB Error] Packet Dropped due to Minimum packet size mismatch");
4:$display("[TB Error] Packet Dropped due to Maximum packet size mismatch");
5:begin
  $display("[TB Error] Packet Corrupted.Packet dropped due to packet length mismatch")
  $display("[TB Error] Step 1: Check value of len filed of packet driven from TB");
  $display("[TB Error] Step 2: Check total number of bytes received in DUT in the waveform (Check dut_inp)");
  $display("[TB Error] Check value of Step 1 matching with Step 2 or not");
  end
endcase
end
endmodule


