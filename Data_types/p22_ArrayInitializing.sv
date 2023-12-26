module tb;
	int arr1[5] ='{10,20,16,24,97};
	string str[4]='{"adi","balu","cnu","sita"};
	int arr2[5]='{0:5,1:16,default:-1};
	
	initial begin
		for(int i=0; i<5;i++) begin
			$display("arr1[%0d] =%0d",i,arr1[i]);
		end
		
		$display(" arr1 = %0p",arr1);
		
		$display("*************");
		
		for(int i=0; i<5;i++) begin
			$display("arr2[%0d] =%0d",i,arr2[i]);
		end
		
		$display(" arr2 = %0p",arr2);
		
		$display("*************");
		
		for(int i=0; i<4;i++) begin
			$display("str[%0d] =%0d",i,str[i]);
		end
		
		$display(" str = %0p",str);
		
		$display("*************");
		
		
	end

endmodule