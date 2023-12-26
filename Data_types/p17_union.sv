module tb;
	int k;
	
	union {
		int i;
		real f;
	}	un;
	
		//un is a variable not user def data type
	
	initial begin
		$display (" un.f= %0f uni.i =%0d", un.f,un.i);
		
		//point 4 demonstration
		un.f=1.234;
		k=un.i;
		$display (" un.f= %0f uni.i =%0d \t k=%0d", un.f,un.i,k);
		
		un.i=65536;
		$display (" un.f= %0f uni.i =%0d", un.f,un.i);
		$display (" un.f= %0b uni.i =%0b", un.f,un.i);
	end

endmodule

/*
1]union represents a single prce of storage
2]only one element can be accessed at a time
3]useful when we r reading and writing registers in different formats
4]if a value is stored in one union member and read back from a different union member , 
	then the value that is read is not defined and may yield different results in different siimulators

5] unpacked unions are not synthesizable


*/