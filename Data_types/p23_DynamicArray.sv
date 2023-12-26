module tb;
	int d1[],d2[];	//dynmaic array declaration
	
	initial begin
		d1=new[4];	//memory of size 4 is assigned to the dynamic array d1
		
		d1[0]=11;
		d1[1]=22;
		d1[2]=33;
		d1[3]=44;
		
		$display("size= %0d  d1= %0p",$size(d1),d1);
		
		d2=d1;
		$display("size= %0d  d2= %0p",$size(d2),d2);
		
		d1=new[8] (d1);		//here d1 is updated with size 8 along with previous members
		
		$display("size= %0d  d1= %0p",$size(d1),d1);
		
		d2=new[13];
		$display("size= %0d  d2= %0p",$size(d2),d2);
		
		d2.delete();
		
	end

endmodule
		
		
	