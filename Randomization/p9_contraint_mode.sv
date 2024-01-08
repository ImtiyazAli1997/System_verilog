class packet;
	rand bit[15:0] length;
	
	constraint c_long {
		length inside{[1000:1900]};
	}
	
	constraint c_short {
		length inside{[1:32]};
	}
	
	function void post_randomize();
		print();
	endfunction
	
	function print;
		$display("length =%0d",length);
	endfunction
endclass

program test;
	packet p1;
	
	initial begin
		p1=new();
		
		p1.c_long.constraint_mode(0);
		
		p1.randomize();
		
		#20;
		
		p1.c_long.constraint_mode(1);
		p1.c_short.constraint_mode(0);
		
		p1.randomize();
		
		#20;
		
		p1.constraint_mode(0);
		p1.randomize();
		
	end
	
endprogram