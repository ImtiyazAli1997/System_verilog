module tb;
	
	union packed {
		bit [7:0] v1;
		logic [7:0] v2;
	} un;
	// the width of all elements in a union had to be same
	initial begin
		un.v1=10;
		$display("un.v1 =%0d un.v2=",un.v1,un.v2);
		
		un.v2=22;
		$display("un.v1 =%0d un.v2=%0d",un.v1,un.v2);
	end
	
endmodule

/*
only packed unions are synthesizable

all members should have same number of bits otherwise compile error occur

each member can only store integral values

union members cannot be of data type real or short real
*/