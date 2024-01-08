class packet;
	bit [7:0] sa,da;
	
	constraint valid{
		sa inside{[1:8]};
		da inside{[1:8]};
	}

	function print();
		$display("sa=%0d da=%0d ",sa,da);
	endfunction
	
	function void post_randomize();
		print();
	endfunction

endclass

program test;
	packet p1;
	
	initial begin
		p1=new();
		
		p1.sa=4; p1.da=6;
		
		p1.randomize();
	
	end

endprogram