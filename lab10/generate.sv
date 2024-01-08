function automatic void generate_stimulus(ref packet gen_pkt, input int pkt_id);
        gen_pkt.sa=$urandom_range(1,8);
        gen_pkt.da=$urandom_range(1,8);
        gen_pkt.payload=new[$urandom_range(10,15)];
        
        foreach (gen_pkt.payload[i]) begin
            gen_pkt.payload[i]=i+1;
        end
        
        gen_pkt.len=1+1+4+4+gen_pkt.payload.size();
        gen_pkt.crc=gen_pkt.payload.sum();
        $display("[Packet Generate] Packet %0d (size= %0d) generate at time=%0t",pkt_id,gen_pkt.len,$time);
		`ifdef DEBUG $display("[GEN]packet %0d =%0p",pkt_id,gen_pkt);	`endif
endfunction