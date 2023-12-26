module tb;
  
	reg [31:0] in1,in2,sum;
	 
	 
	initial begin
		in1=5;in2=5;
		sum=add(in1,in2);
		$display("[vlog add]in1=%0d in2=%0d sum=%0d ",in1,in2,sum);
		sum=sv_add1(in1,in2);
		$display("[SV sv_add1] in1=%0d in2=%0d sum=%0d ",in1,in2,sum);
		sum=sv_add2(in1,in2);
		$display("[SV sv_add2] in1=%0d in2=%0d sum=%0d ",in1,in2,sum);
		
	 end
	 
	 
	 
	function reg [31:0] add (input reg [31:0] a,b);
	begin
	   add=a+b;
	end
	endfunction

	function bit [31:0] sv_add1 (input [31:0] a,b);
	  return a+b;
	endfunction
	 
	function bit [31:0] sv_add2 (input [31:0] a,b);
	   sv_add2 =a+b;
	 endfunction

  
 
endmodule