task automatic drive(ref packet pkt , input int pkt_id);
	
		wait(vif.cb.busy==0);
		@(vif.cb);
		
		$display("[TB Drive] Driving of packet %0d (size=%0d) started at time=%0t",pkt_id,pkt.len,$time);
		
		vif.cb.inp_valid<=1;
		
		foreach(pkt.inp_stream[i])  begin
			vif.cb.dut_inp <= pkt.inp_stream[i];
			@(vif.cb);
		end
		
		$display("[TB Drive] Driving of packet %0d (size=%0d) ended at time=%0t \n",pkt_id,pkt.len,$time);
		
		`ifdef DEBUG  $display("packet %0d inp_stream=%0p",pkt_id,inp_stream);	`endif
		//@(vif.cb);
		vif.cb.inp_valid<=0;
		vif.cb.dut_inp<='z;
		
		repeat(5) @(vif.cb);
	endtask