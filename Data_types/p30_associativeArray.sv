module tb;

	int a1[int];
	int a2[string];
	int k;
	logic [7:0] d[];

	initial begin
		d[2]=10;
		$display("dyn d[4]=%0d d[2]= %0d",d[4],d[2]);	// a warning will be issued when reading non existing index element
	  
		a1[0]=10;
		a1[5]=10;
		a1[3]=10;
		a1[2]=10;

		$display("int a1[10]=%0d",a1[10]);
	  
		foreach(a1[i])
			$display("int a1[%0d]=%0d",i,a1[i]);

		if(a1.first(k)) begin		// k will be assigened the first index and .first function returns 1
			do 	begin
				$display("first a1[%0d]=%0d",k,a1[k]);
			end
			while(a1.next(k));
			
		end


		a2["abc"]=20;
		a2["abd"]=20;
		a2["c"]=40;
		a2["b"]=30;

		foreach(a2[i])
			$display("string a2[%0s]=%0d ",i,a2[i]);
	end
endmodule