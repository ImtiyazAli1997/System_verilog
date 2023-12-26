module tb;
	int arr[3:0];
	int c_style[4];
	//both are array with 4 elements
	//in second declaration  4 represents the size i.r number of elements
	
	int mda[6][4];
	int i,j;
	
	initial begin
	
		for (i=0;i<4;i++) begin
			arr[i]=5;
			$display("arr[%0d]=%0d",i,arr[i]);
		end
		
		$display("****************************");
		
		for (i=0;i<6;i++) begin
			for(j=0;j<4;j++) begin
				mda[i][j]=i+j;
				$display("mda[%0d][%0d]=%0d",i,j,mda[i][j]);
			end
		end
		
	end
endmodule