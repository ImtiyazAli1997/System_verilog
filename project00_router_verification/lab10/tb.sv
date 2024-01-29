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
//Section 5: Methods (functions/tasks) definitions related to Verification Environment 

	`include "reset.sv"

	//Section 5.1 : Define generate_stimulus() method
	
	`include "generate.sv"

	//Section 5.2 : Define drive() method
	
	`include "drive.sv"
	
	//Section 5.3 : Define compare method()
	
	`include"compare_result.sv"
//Section 6: Verification Flow
	initial begin
		pkt_count=1;
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
			`ifdef DEBUG $display("[s6 veri_flow 1] inp_stream=%0p",stimulus_pkt.inp_stream); `endif
			
			//Section 6.4: store the packet in iMonitoe q_inp 
			q_inp.push_back(stimulus_pkt);
			`ifdef DEBUG $display("[s6 veri_flow2]packet %0d =%0p",pkt_id,stimulus_pkt);	`endif
			
			//drive the stimulus into router
			drive(stimulus_pkt,pkt_id);
		end
		//Wait for dut to process the packet and to drive on output
		wait(vif.cb.busy==0);//drain time
		repeat(10) @(vif.cb);//drain time
		result();
		$finish;
	end


	
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


