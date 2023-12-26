module tb;
	typedef enum {Add, Sub, Not_A, ReductionOR} operations_t; // making enum as a user define data type

	operations_t opcode;

	int i;

	initial begin
		i = Not_A;
		$display("***1***i=%0d", i); 
		
		i=3;
		if (!$cast(opcode,i))		//static casting using system task
			$display("Cast failed for i=%0d", i);
		$display("**2****opcode=%s =%0d",opcode, opcode);   
		
		i=4;
		if (!$cast(opcode,i))
			$display("**3*****Cast failed for i=%0d", i); 
		
		$display("**4**opcode=%s =%0d",opcode, opcode); 
		
		opcode = operations_t'(i);		//dynamic casting
		$display("**5****opcode=%s=%0d",opcode, opcode);  

	end

endmodule

/*
# ***1***i=2
# **2****opcode=ReductionOR =3
# **3*****Cast failed for i=4
# **4**opcode=ReductionOR =3
# **5****opcode=?(4)=4
*/