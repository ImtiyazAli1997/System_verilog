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