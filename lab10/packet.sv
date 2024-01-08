class packet;
	bit [7:0] sa;
	bit [7:0] da;
    bit[31:0] len;
    bit [31:0] crc;
    bit [7:0] payload[];
	
	bit[7:0] inp_stream[$];

    bit [7:0] outp_stream[$];
	
	function  void pack(ref bit[7:0] q_inp[$]);		// I* why no automatic for task
        q_inp={<<8{this.payload,this.crc,this.len,this.da,this.sa}};
    endfunction
	
	function automatic void unpack(ref bit[7:0] q_inp[$]);
        {<<8{this.payload,this.crc,this.len,this.da,this.sa}}=q_inp;
    endfunction
	
	function void print();
		$display("[Packet print] sa=%0d da=%0d	len=%0d crc=%0d",this.sa,this.da,this.len,this.crc);
		$write("Payload");
		foreach(payload[k])
			$write("%0h",payload[k]);
		
		$display("\n");
		
	endfunction
		
endclass