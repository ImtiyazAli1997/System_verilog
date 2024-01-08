class A;
	rand integer a,b,c;
	
	constraint c2{
		a inside {b,c};
	}
	
	int arr[4]='{5,10,15,47};
	
	rand int v1,v2;
	
	constraint c3{
      !(v1 inside {arr});
	}
	
	constraint c4 {
		v2 inside{arr};
	}
	
	rand bit[6:0] d;
	rand bit [5:0] e;
	
	constraint c_range {
		d inside {[$:4],[20:$]};
		e inside {[$:4],[20:$]};
	}
	
	function print();
		$display(" b=%0d a=%0d c=%0d",b,a,c);
		$display("v1=%0d v2=%0d",v1,v2);
		$display("d=%0d e=%0d",d,e);
      $display("************\n");
	endfunction
	
	function void post_randomize();
		this.print();
	endfunction
	
endclass

program test;
	A a1;
  	
  	initial begin
      a1= new;

      repeat(10) a1.randomize();
    end
endprogram


		