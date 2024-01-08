class packet;

	rand bit [3:0]  data;
	bit [3:0] prev_data;
	bit [7:0] max;
	  
	constraint valid {
		data inside {[10:max]};
		data != prev_data;
	}

	function void pre_randomize();
		$display("**** Pre_randomize called *****");
		max=40;
	endfunction
	  
	function void post_randomize();
		$display("**** Post_randomize called *****");
		prev_data=data;
	endfunction
  
endclass


program test;

packet pkt;

initial begin
	pkt=new;
	repeat(3) begin
		void'(pkt.randomize());
		$display("After randomize : pkt.data=%0d \n ",pkt.data);
	end
end
endprogram