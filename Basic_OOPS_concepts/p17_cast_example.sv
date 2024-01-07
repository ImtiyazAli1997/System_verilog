//Example describes $cast usage
class base;
	int k;
	  
	virtual function void print ();
		k=44;
		$display("[BASE print] k=%0d ",k);
	endfunction
  
endclass

class derived extends base;

	virtual function void print();		// virtual is optional for derived class
		k=55;
		$display("[DERIVED print] k=%0d ",k);
	endfunction
  
endclass

program test;
	derived d1,d2;
	base b;

	initial begin
		d1=new;
		d1.print();
		b=d1;
		 //b=new;
		  $cast(d2,b);
		 // d2=b;
	end
endprogram




