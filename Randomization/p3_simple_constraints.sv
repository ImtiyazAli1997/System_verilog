class A;
	rand bit [7:0] len,addr,src;
	rand bit[31:0] data;
	rand bit wr,sel;
	
	constraint my_cnstrn {
		addr>0; addr <15;
		
		wr==1;
		
		data>100 && data<500;
		
		len<=src;
		
		if(sel==1)	{
			src inside {10,[30:40],[66:88],100};
		} else {
			src inside{[199:255]};
		}
	}
	
	function void print();
		$display("addr=%0d \t data=%0d \t len=%0d \t src=%0d \t wr=%0d \t sel=%0d \n",addr,data,len,src,wr,sel);
	endfunction
			
endclass

program test;
	A a1;
	bit ret;
	
	initial begin
		a1=new;
		
		repeat(20) begin
			ret=a1.randomize();
			
			if(ret)	a1.print();
			else $display("randomization failed");
		end
		
	end
endprogram
		
		