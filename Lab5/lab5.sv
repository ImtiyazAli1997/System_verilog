program testbench(clk,reset,dut_inp,inp_valid,dut_outp,outp_valid,busy,error);

//Section1: Declaration of input/output ports
    input clk;
    output reg reset;

    output reg[7:0] dut_inp;
    output reg inp_valid;
    
    input [7:0] dut_outp;
    input outp_valid;
    input busy;
    input [3:0] error;
//Section4: TB Variables declarations. 
//Variables required for various testbench related activities . 
//ex: stimulus generation,packing ....
 //TODO
    typedef struct {
            bit[7:0] sa;
            bit [7:0] da;
            bit[31:0] len;
            bit [31:0] crc;
            bit [7:0] payload[];
    } packet;

    packet stimulus_pkt;

    bit [31:0] pkt_count,pkt_count_in,pkt_count_out;

    bit[7:0] inp_stream[$];

    bit [7:0] outp_stream[$];

    packet dut_pkt;

    packet q_inp[$];

    packet q_outp[$];

//Section 5: Methods (functions/tasks) definitions related to Verification Environment 

    task apply_reset();
    //TODO
        $display("[TB Reset] Applied reset to DUT");
        reset<=1;
        repeat(2) @(posedge clk);
        reset<=0;
        $display("[TB Reset]  reset completed");

    endtask

    function automatic void generate_stimulus(ref packet pkt);
        pkt.sa=$urandom_range(1,8);
        pkt.da=$urandom_range(1,8);
        pkt.payload=new[$urandom_range(10,20)];
        
        foreach (pkt.payload[i]) begin
            pkt.payload[i]=i+1;
        end
        
        pkt.len=1+1+4+4+pkt.payload.size();
        pkt.crc=pkt.payload.sum();
        $display("[TB Generate] Packet(size= %0d) generate at time=%0t",pkt.len,$time);
    endfunction

    function automatic void pack(ref bit[7:0] q_inp[$],packet pkt);
        q_inp={<<8{pkt.payload,pkt.crc,pkt.len,pkt.da,pkt.sa}};
    endfunction

    task automatic drive(const ref bit[7:0] inp_stream[$]);
        wait(busy==0);//wait utill router is ready to accept packets
        @(posedge clk);
        $display("[TB Drive] Driving of packet started at time=%0t",$time);
        //TODO
        inp_valid<=1'b1;
        foreach(inp_stream[i]) begin
            dut_inp<=inp_stream[i];
            @(posedge clk);
        end


    inp_valid<=1'b0;dut_inp<=0;
    endtask

    function automatic void unpack(ref bit[7:0] q_inp[$],packet pkt);
        {<<8{pkt.payload,pkt.crc,pkt.len,pkt.da,pkt.sa}}=q_inp;
    endfunction

    function bit compare (packet ref_pkt, packet dut_pkt );
        case(0)
            ref_pkt.sa==dut_pkt.sa:             return 0;
            ref_pkt.da==dut_pkt.da:             return 0;
            ref_pkt.len==dut_pkt.len:           return 0;
            ref_pkt.crc==dut_pkt.crc:           return 0;
            ref_pkt.payload==dut_pkt.payload:   return 0;
            default: return 1;
        endcase
    endfunction

    function void result ();
        bit[31:0] matched;
        bit[31:0] mis_matched;

        if(q_inp.size()==0) begin 
            $display(" [TB error result func] There are no input packets");
            $finish;
        end

        if(q_outp.size()==0) begin 
            $display(" [TB error result func] There are no output packets");
            $finish;
        end

        foreach(q_inp[i]) begin
            if(compare(q_inp[i],q_outp[i]))
                matched++;
            else   begin 
                mis_matched++;
                $display("[TB error result func] packet %0d is mismatched",i);
            end
        end

        if(mis_matched ==0 && matched ==pkt_count) begin
			$display("[INFO] *******************************************");
			$display("[INFO] ****************TEST PASSED****************");
			$display("[INFO] Matched=%0d mis_matched=%0d",matched,mis_matched);
			$display("[INFO]********************************************");
		end
		else begin
			$display("[INFO] *******************************************");
			$display("[INFO] ****************TEST FAILED****************");
			$display("[INFO] Matched=%0d mis_matched=%0d",matched,mis_matched);
			$display("[INFO]********************************************");
		end

    endfunction


    function void print(input packet pkt,string s);
        $display("%s",s);
        $display("[TB Packet] Sa=%0h Da=%0h Len=%0h Crc=%0h",pkt.sa,pkt.da,pkt.len,pkt.crc);
        foreach(pkt.payload[k])
        $display("[TB Packet] Payload[%0d]=%0h",k,pkt.payload[k]);
    endfunction
    //--------End of Section 5 ---------------- 

//Section 6: Verification Flow
    initial begin
    //TODO
        pkt_count=10;
        inp_valid<=0;dut_inp<=0;
        apply_reset();
        
        repeat(pkt_count) begin
            pkt_count_in++;
            wait(busy==0);          // this is an important thing added now
            generate_stimulus(stimulus_pkt);
            pack(inp_stream,stimulus_pkt);
            q_inp.push_back(stimulus_pkt);
            drive(inp_stream);          
            //after drive we actually should delete the input stream but the pack method is overwriting it here
            //$display("[DUT veri flow] pkt %0d inp_stream=%0p",pkt_count_in,inp_stream);
            //print(stimulus_pkt,{"stimulus pkt",string'(48+pkt_count_in)});
            repeat(5) @(posedge clk);
        end
        
        //Wait for dut to process the packet and to drive on output
        wait(busy==0);
        repeat(10) @(posedge clk);

        if (q_outp.size ==0)	begin
			$display("[Error] There are no output packets to compare");
			$display("[Error] q_outp.size() is zero");
			$display("[Error] Check the output collection logic in section 8");
          	$display("[Error] Check Error message code = %0d Received from DUT",error);
			$finish;
		end

        result();
        #1;
        $finish;
    end
  //--------End of Section 6 ---------------- 
   
    

    //Section 8: Collect DUT output
    //TODO 
    initial begin
        forever begin
            @(posedge outp_valid);
            pkt_count_out++;
            while(1) begin
               
                if(outp_valid==0) break;
                outp_stream.push_back(dut_outp);
                //$display("[DUT packet] dut_outp=%0d time=%0t",dut_outp,$time);
                 @(posedge clk);    // as the program block got shifted in the reactive region
            end
            unpack(outp_stream,dut_pkt);
            q_outp.push_back(dut_pkt);
            //$display("[DUT out collect] pkt %0d outp_stream=%0p",pkt_count_out,outp_stream);
            //print(dut_pkt,{"dut pkt",string'(48+pkt_count_out)});
            outp_stream={};
        end
    end

    //--------End of Section 8---------------- 
endprogram

