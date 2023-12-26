module tb;
	
	typedef struct {
		
		bit	is_float;
		
		union	{				// This union is a part of structure
			int 	i;
			real	f;
		}un;				//un is the variable to access the elements of the union. 
	}	un_type	;			//un_type is a user defined data typedef
	
	un_type p1;
	
	initial begin
	
		p1.is_float =1;
		
		p1.un.f=1.234;
		
		if(p1.is_float)
			$display(" un.f = %0f",p1.un.f);
		else
			$display("un.i=%0d",p1.un.i);
	
	end
	
endmodule

/*
we created a logic which element of union is being selected
but whenever we want to write any value in the union element correspding value of is_float varoable has to be updated by user


//A union is a data type that represents a single piece of storage that 
//can be accessed using one of the named member data types. 
//Only one of the data types in the union can be used at a time



*/