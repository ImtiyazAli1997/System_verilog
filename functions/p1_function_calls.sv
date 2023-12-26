module tb;
	int p,q,r,s;
	
	initial begin
	print();
	#1 print(6,7,8,9);//
	#1 print(,23,.d(57));//mixed passing arguments
	
	
	
	end
	



	function void print(input int a=1,b=2,c=3,d=4);
		$display($time," a= %0d,b=%0d,c=%0d,d=%0d", a,b,c,d);
	endfunction

endmodule