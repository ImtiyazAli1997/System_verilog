class base;
	randc bit[1:0] id;
	rand bit [1:0] k;
	
	function void print();
		$display("id =%0d \t k=%0d",id,k);
	endfunction
	
endclass

program test;
	base b;
	int cnt;
	
	initial begin
		b=new;
		b.print();
		
		repeat(20) begin
			b.randomize();
			b.print();
			
			if(cnt==3) begin
				cnt=0;     
				$display("*****");  
				continue;
			end
          	
          	cnt++;
		end
	end

endprogram