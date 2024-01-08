class Transaction;
	rand bit [31:0] addr,data;
	
	constraint c1 {
		addr inside{[0:100],[1000:2000]};
	}
	
	function print();
		$display("addr=%0d data=%0d ",addr,data);
	endfunction
	
	function void post_randomize();
		print();
	endfunction
endclass

program test;
	Transaction tr;
	bit [31:0] data;
	
	initial begin
		tr=new;
		
		tr.randomize() with {addr>=50; addr<=1500;data<=10;};	//these are additional constraints to the contraints declared in class
		
		#10
		
		tr.randomize() with {addr ==2000; data>10;};
		
		#10
		tr.constraint_mode(0);
		tr.randomize() with {addr>101;addr<500;};
		
		#10
		data=15;
		tr.constraint_mode(1);
		tr.randomize() with {data<= local::data+15;};
		
	end
	
endprogram