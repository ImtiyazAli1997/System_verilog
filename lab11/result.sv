function void result();
		bit [31:0] matched,mis_matched;

		foreach (q_inp[i]) begin
		//Fill the code here from LAB document
			if(q_inp[i].compare(q_outp[i]))
				matched++;
			else	begin
				mis_matched++;
				$display("\n[TB error] **********************");
				$display("[TB error] packet %0d mismatched",i);
				q_inp[i].print();
				q_outp[i].print();
				$display("[TB error]*******************\n");
			end
			
		end//end_of_foreach

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