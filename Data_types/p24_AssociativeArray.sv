module tb;
	bit[7:0] array1[int];	//integer index;
	
	int array2[int];		//string index;
	
	bit [7:0] k;
	initial begin
		
		array1[13]=15;	//any integer value can be index but the assigned value can be of 8 bits as per declaration
		array1[4]=12;
		array1[6]=3;
		
		$display(" size of array1 = %0d array1= %0p",$size(array1),array1);
		
		array1.delete(6);	//pass the index which you want to delete
		
		$display(" size of array1 = %0d array1= %0p",$size(array1),array1);
		
		if(array1.exists(6))
			array1[7]=13;
		else
			array1[6]=1;
			
		$display(" size of array1 = %0d array1= %0p",$size(array1),array1);
		
		array2='{14:4, 18:7,12:56};
		
		$display(" size of array2 = %0d array2= %0p",$size(array2),array2);
		
		$display(" number of element in array1 = %0d  ",array1.num());
		
		
		if(array1.first(k))			//1st index is stored in k and 1 is returned
		$display(" first element index =%0d value = %0d",k,array1[k]);
		
		
				
		if(array1.next(k))			// index is stored in k and 1 is returned
		$display(" next element index =%0d value = %0d",k,array1[k]);
		
		//using prev method to get to previoys index 
			
		if(array1.prev(k))			//previous index is stored in k and 1 is returned
		$display(" previous element index =%0d value = %0d",k,array1[k]);
		else
		$display("not there");
		
		
		if(array1.prev(k))			//1st index is stored in k and 1 is returned
		$display(" previous element index =%0d value = %0d",k,array1[k]);
		else
		$display("not there");
		
		
		
		//iteration though array associative array elements
		if(array1.first(k)) begin
			do 
				$display("indx=%0d value=%0d",k,array1[k]);
			while(array1.next(k));
		end
			
	end

endmodule