program testbench(input clk, router_if vif);

//Section4: TB Variables declarations. 
//Variables required for various testbench related activities . 
//ex: stimulus generation,packing ....
	`include "packet.sv"

	bit [7:0] inp_stream[$];
	bit [7:0] outp_stream[$]; 

	packet stimulus_pkt; 
	packet dut_pkt;

	packet q_inp[$];
	packet q_outp[$];

	bit [15:0] pkt_count,pkt_id;


//Section 6: Verification Flow
	initial begin
		pkt_count=10;
		apply_reset();
		repeat(pkt_count) begin
			inp_stream.delete();
			wait(vif.cb.busy==0);
			pkt_id++;
			
			//Section 6.1: Construct the object for stimulus_pkt handle
			stimulus_pkt=new;
			
			//Section 6.2: Call generate_stimulus() method from stimulus_pkt object
			generate_stimulus(stimulus_pkt,pkt_id);

			//Section 6.3: Call pack(inp_stream) method from stimulus_pkt object
			stimulus_pkt.pack(stimulus_pkt.inp_stream);
			
			//Section 6.4: store the packet in iMonitoe q_inp 
			q_inp.push_back(stimulus_pkt);
			
			//drive the stimulus into router
			drive(stimulus_pkt,pkt_id);
		end
		//Wait for dut to process the packet and to drive on output
		wait(vif.cb.busy==0);//drain time
		repeat(10) @(vif.cb);//drain time
		result();
		$finish;
	end

//Section 5: Methods (functions/tasks) definitions related to Verification Environment 

	task apply_reset();
		$display("[TB Reset] Applied reset to DUT at time=%0t",$time);    
		vif.reset<=1;
		repeat(2) @(vif.cb);
		vif.reset<=0;
		$display("[TB Reset] Reset Completed at time=%0t",$time);  
		
		//making signal value default at start of simulation
		vif.cb.inp_valid<=1'b0;vif.cb.dut_inp<='z;
		
	endtask

	//Section 5.1 : Define generate_stimulus() method
	function automatic void generate_stimulus(ref packet gen_pkt, input int pkt_id);
        gen_pkt.sa=$urandom_range(1,8);
        gen_pkt.da=$urandom_range(1,8);
        gen_pkt.payload=new[$urandom_range(10,1900)];
        
        foreach (gen_pkt.payload[i]) begin
            gen_pkt.payload[i]=i+1;
        end
        
        gen_pkt.len=1+1+4+4+gen_pkt.payload.size();
        gen_pkt.crc=gen_pkt.payload.sum();
        $display("[Packet Generate] Packet %0d (size= %0d) generate at time=%0t",pkt_id,gen_pkt.len,$time);
    endfunction

	//Section 5.2 : Define drive() method
	task automatic drive(ref packet pkt,input int pkt_id);
        wait(vif.cb.busy==0);//wait utill router is ready to accept packets
        @(vif.cb);
        $display("[TB Drive] Driving of packet %0d (size = %0d)started at time=%0t",pkt_id,pkt.len,$time);
        //TODO
        vif.cb.inp_valid<=1'b1;
        foreach(pkt.inp_stream[i]) begin
            vif.cb.dut_inp<=pkt.inp_stream[i];
            @(vif.cb);
        end

		$display("[TB Drive] Driving of packet %0d (size = %0d)ended at time=%0t",pkt_id,pkt.len,$time);
        `ifdef DEBUG  $display("packet %0d inp_stream=%0p",pkt_id,inp_stream);	`endif
		vif.cb.inp_valid<=1'b0;vif.cb.dut_inp<='z;
		repeat(5) @(vif.cb);
    endtask
	//Section 5.3 : Define compare method()
	function bit compare (input packet ref_pkt, input packet dut_pkt );
		    case(0)
				ref_pkt.sa==dut_pkt.sa:             return 0;
				ref_pkt.da==dut_pkt.da:             return 0;
				ref_pkt.len==dut_pkt.len:           return 0;
				ref_pkt.crc==dut_pkt.crc:           return 0;
				ref_pkt.payload==dut_pkt.payload:   return 0;
				default: return 1;
			endcase
		
		
	endfunction
		


	function void result();
		bit [31:0] matched,mis_matched;
		
		foreach (q_inp[i]) begin
			if (compare(q_inp[i],q_outp[i])) 
			 matched++;
			else begin
			mis_matched++;
			$display("[TB Error] Packet %0d MisMatched ",i);
			end
		end//end_of_forever
		
		if (mis_matched == 0 && matched==pkt_count) begin 
			$display("\n[INFO] *************************************");
			$display("[INFO] ************Test PASSED *************");
			$display("[INFO] *Tot_pkts=%0d Matched=%0d mis_matched=%0d",pkt_count,matched,mis_matched);
			$display("[INFO] *************************************\n");
		end 
		
		else begin
			$display("\n[INFO] *************************************");
			$display("[INFO] ************Test FAILED *************");
			$display("[INFO] *Tot_pkts=%0d Matched=%0d mis_matched=%0d",pkt_count,matched,mis_matched);
			$display("[INFO] *************************************\n");
		end 
	endfunction
  
//Section 8: Collecting DUT output
	initial begin
		bit [15:0] cnt;
		
		forever begin
			@(posedge vif.cb.outp_valid);
			while(1) begin
				
				  //$display("[TB outp] dut_outp=%0d time=%0t",vif.cb.dut_outp,$time);
				if(vif.cb.outp_valid==0) begin
					cnt++; 
					//Section 8.1: Construct object for handle dut_pkt
					dut_pkt=new;
					
					//Section 8.2: Call unpack(outp_stream) method from dut_pkt object
					dut_pkt.unpack(outp_stream);
					
					
					q_outp.push_back(dut_pkt);
					//print(dut_pkt);
					$display("[TB Output Monitor] Packet %0d collected size=%0d time=%0t",cnt,outp_stream.size(),$time);  
					`ifdef DEBUG $display("packet %0d outp_stream=%0p",cnt,outp_stream);	`endif
					outp_stream.delete();
					break;
				end
              	outp_stream.push_back(vif.cb.dut_outp);
				@(vif.cb);
			end//end_of_while
		end//end_of_forever
	end//end_of_initial
  
endprogram


