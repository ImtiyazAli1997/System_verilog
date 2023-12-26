module tb;
	int d[]='{9,1,12,3,4,4,32};
	
	int tq[$];
	
	initial begin
		$display(d);
		
		tq = d.find with (item >3);
		$display(" d.find with (item >3) = %p",tq);
		
		tq = d.find_index with (item >3);
		$display(" d.find_index with (item >3) = %p",tq);
		
		tq = d.find_first with (item>42);
		$display(" d.find_first with (item>42) = %p",tq);
		
		tq = d.find_first_index with (item ==12);
		$display(" d.find_first_index with (item ==12) = %p",tq);
		
		tq = d.find_first_index with (item ==4);
		$display(" d.find_first_index with (item ==4) = %p",tq);
		
		tq = d.find_last_index with (item ==4);
		$display(" d.find_last_index with (item ==4) = %p",tq);
		
	end
endmodule

/*
	item represents the element of the array
	
	with is a clause


	these returns  queue
	
*/