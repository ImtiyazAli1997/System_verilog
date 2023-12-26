typedef longint unsigned uint;

typedef bit[63:0] bit64;

module tb;
	uint a,b;		//each is 63 bits
	bit[64:0] c;
	bit [6:0] count1;
	
	bit64 data1,data2;
	
	initial begin
	a=64'hFF00_aa55_0000_118c;b=36; // _ is used as a separator 64 is bit size
									// b = 36 in decimal =24 in hexa decimal
	
	//a=18374873761720570252 in decimal
	
	c=add(a,b);
	$display("sum is %0h",c);				//sum is ff00aa55000011b0
	
	count1=add_ones(c);				 //function call
	
	//try below 
	//count1=add_ones(65'1_FFFF_FFFF_FFFF_FFF);	
	
	$display("number of ones in c is %0d \n %0b",count1,c);
	
	data1=$size(a);					 // system task used to measure size in bits
	$display ("size of a is %0d",data1);
	end
	
	
endmodule

function uint add(input uint inp1,inp2);		// function return_type function_name (port_list);
	add =inp1+inp2;								 // though add is not declared. Its the function_name so it can be used as a variable 
	
	
endfunction

function bit[6:0] add_ones ( input bit[64:0]  in1);
	int i;
	bit[6:0] sum;
	sum=0;
	
	for(i=0;i<65;i++) begin
		sum=in1[i]+sum;
	end
	
	add_ones=sum;						//return sum can also be used
endfunction