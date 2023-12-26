module tb;
	bit [7:0] packed_arr1;		//declarations
	bit [3:0] [7:0] packed_arr2;		//total 4*8=32 bts
	
	bit unpacked_arr1[7:0]; //start and end indexes are used
	bit unpacked_arr2[4];	//here size of array is used as index in declaration [0:3]
	bit [7:0] unpacked_arr3[4];		// total 4*8=32 bts
	//4 elements each of 8 bits
	
	bit [31:0] din;
	
	
	
	int i;				
	
	initial begin
		packed_arr1 =8'hFA;
		$display("*1* packed_arr1  =%p",packed_arr1);
		foreach (packed_arr1[i])
			$display("*2* packed_arr1 [%0d] =%p",i,packed_arr1[i]);
			
		packed_arr2 ='{8'hFA,8'hCE,8'hDC,8'h51};
		$display("*3* packed_arr2  =%p",packed_arr2);
		
		foreach (packed_arr2[i])
			$display("*4* packed_arr2 [%0d] =%p",i,packed_arr2[i]);
			
		foreach (packed_arr2[i,j])
			$display("*5* packed_arr2 [%0d] [%0d]=%p",i,j,packed_arr2[i][j]);
		
		din=packed_arr2;		//no compilation error, as both are 32 bit and packed_arr2 is a packed array
		
		$display("\n\n\n**6** din=%0h  packed_arr2=%p",din,packed_arr2);
		
		
		//unpacked_arr1 =8'hca; //error Cannot assign a packed type to an unpacked type
		
		unpacked_arr1='{1,1,0,1,0,0,1,0};
		$display("*7* unpacked_arr1 =%p",unpacked_arr1);
		
		foreach (packed_arr1[i])
			$display("*8* unpacked_arr1 [%0d] =%p",i,unpacked_arr1[i]);
			
		
		unpacked_arr2='{0,1,0,0};
		$display("*9* unpacked_arr2 =%p",unpacked_arr2);
		foreach (unpacked_arr2[i])
			$display("*10* unpacked_arr2 [%0d] =%p",i,unpacked_arr1[i]);
			
		unpacked_arr3='{8'hfa,8'hce,8'hca,8'hfe};
		$display("*11* unpacked_arr3 =%p",unpacked_arr3);
		foreach (unpacked_arr3[i])
			$display("*12* unpacked_arr3 [%0d] =%p",i,unpacked_arr3[i]);
		foreach (unpacked_arr3[i,j])
			$display("*13* unpacked_arr3 [%0d] [%0d]=%p",i,j,unpacked_arr3[i][j]);
			
			
			
		//din=unpacked_arr3; 		//Though both are 32 bit compile error
		
		
		din={unpacked_arr3[3],unpacked_arr3[2],unpacked_arr3[1],unpacked_arr3[0]};	//using concatenation to assign it
		
		$display("\n\n\n ** 14 ** din assigned unpackedarr3 value ",din);
		
	end
	/*
	for (i=0;i<4;i++) begin
			unpacked_arr1[i]=$randam;
		
		end
	*/
endmodule