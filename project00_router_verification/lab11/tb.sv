program testbench(input clk, router_if vif);

    //Section4: TB Variables declarations. 
    //Variables required for various testbench related activities . 
    //ex: stimulus generation,packing ....

    //Section 4.1 : Include packet.sv 
    `include "packet.sv"

    //Section 4.2 : Define packet class handles
    packet stimulus_pkt; 
    packet dut_pkt;

    //Section 4.3 : Define local outp_stream to capture packet from dut
    bit [7:0] outp_stream[$]; 

    //Section 4.4: Store input stimulus packets into q_inp : Reference packet
    packet q_inp[$]; //queue of objects

    //Section 4.5 : Store dut output packet into q_outp : Actual packet
    packet q_outp[$]; //queue of objects

    //Section 4.6 : Stimulus packet count and packet id
    bit [15:0] pkt_count,pkt_id;

	//Section 6: Verification Flow
	initial begin
		//Section 6.1 : How many number of packets to generate
		pkt_count=10;

		//Section 6.2 : Call apply_reset() method.
		
		apply_reset();

		repeat(pkt_count) begin
			wait(vif.cb.busy==0);
			
			pkt_id++;
		//Section 6.3 : Construct stimulus packet Object
			stimulus_pkt=new();

		//Section 6.4 : Generate random stimulus.
          void'(stimulus_pkt.randomize());
		//Section 6.5 : Store Reference/Golden packet into q_inp.
			q_inp.push_back(stimulus_pkt);

		//Section 6.6 : Call drive() method.
			drive(stimulus_pkt,pkt_id);
          stimulus_pkt.print();
		end

		//Wait for dut to process the packet and to drive on output
		wait(vif.cb.busy==0);//drain time
		repeat(10) @(vif.cb);//drain time
		result();
		$finish;
	end

	//Section 5: Methods (functions/tasks) definitions related to Verification Environment 

	`include "reset.sv"

	//Section 5.1 : Define drive() method

	`include "driver.sv"

	//Section 5.2 : Define result() method
	`include "result.sv"
  
//Section 8: Collecting DUT output
initial begin
		bit [15:0] cnt;
	  
		forever begin
          
			@(posedge vif.cb.outp_valid);
          
		while(1) begin
					
			//Section 8.2 : Collect untill outp_valid becomes 0.
			if(vif.cb.outp_valid==0) begin
		 
				//Section 8.3 : Increment the cnt to track how many output packets collected
				cnt++; 
			 
				//Section 8.4 : Construct dut_pkt object to store the collected output
				dut_pkt=new;
			 
				//Section 8.5 : Unpack collected outp_stream into dut_pkt fields
				dut_pkt.unpack(outp_stream);
			 
				//Section 8.6 : Copy local outp_stream to outp_stream in dut_pkt ********not required
				//dut_pkt.outp_stream=outp_stream;
			 
				//Section 8.7 : Store the actual packet from DUT for sel-checking
				q_outp.push_back(dut_pkt);
				//dut_pkt.print();
			 
				$display("[TB Output Monitor] Packet %0d collected size=%0d time=%0t",cnt,outp_stream.size(),$time);  
				//Section 8.8 : Delete local outp_stream queue
				outp_stream.delete();
			 
				//Section 8.9 : Break out of while loop as collection of packet completed.
				break;
			end
			//Section 8.1 : Capture complete packet from DUT
			outp_stream.push_back(vif.cb.dut_outp);
			//Section 8.10 : Wait for posedge of clk to collect all the dut output
			@(vif.cb);
		
		end//end_of_while
	  end//end_of_forever
	end//end_of_initial
  
endprogram


//`include "top.sv"
