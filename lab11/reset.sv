task apply_reset();
		
		$display("[TB Reset] Applied reset to DUT at time=%0t",$time);    
		
		vif.reset<=1;
		
		repeat(2) @(vif.cb);
		
		vif.reset<=0;
		
		$display("[TB Reset] Reset Completed at time=%0t",$time);
		vif.cb.inp_valid<=1'b0;vif.cb.dut_inp<='z;
	endtask