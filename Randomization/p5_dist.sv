class A;
	rand bit [7:0] sa,da;
	int count[4];
	int count1[4];
	
	constraint c_dist{
		
		sa dist {0:=40, [1:3]:=60};
		
		da dist {0:/ 40, [1:3]:/60};
	}
	
	function print();
		
		$display("sa=%0d da=%0d",sa,da);
		
		$display("************\n");
	endfunction
	
	function void post_randomize();
		this.print();
		
		case(sa)
        0:	count[0]++;
        1: 	count[1]++;
        2: 	count[2]++;
        3:	count[3]++;
       endcase
      
      case(da)
        0:	count1[0]++;
        1: 	count1[1]++;
        2: 	count1[2]++;
        3:	count1[3]++;
       endcase
	   
	   
	endfunction
endclass

program test;
	A a1;
	bit ret;
	
	initial begin 
		a1= new;
		repeat(220)
			void'(a1.randomize());
	end
	
	final begin
      $display("sa p[0]=%0d",a1.count[0]);
      $display("sa p[1]=%0d",a1.count[1]);
      $display("sa p[2]=%0d",a1.count[2]);
      $display("sa p[3]=%0d",a1.count[3]);
      
      $display("da p[0]=%0d",a1.count1[0]);
      $display("da p[1]=%0d",a1.count1[1]);
      $display("da p[2]=%0d",a1.count1[2]);
      $display("da p[3]=%0d",a1.count1[3]);
    end
	
	
endprogram