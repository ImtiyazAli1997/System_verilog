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
        `ifdef DEBUG  $display("packet %0d inp_stream=%0p",pkt_id,pkt.inp_stream);	`endif
		vif.cb.inp_valid<=1'b0;vif.cb.dut_inp<='z;
		repeat(5) @(vif.cb);
    endtask