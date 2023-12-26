// this code doesn't work on older version of model sim use EDA playground

module tb;


	logic [7:0] d[][];


	initial begin

		d=new[8];			//d[0],d[1],d[2]...d[7]
		 
		foreach(d[k]) d[k]=new[4];//each array with 4 elements
		
								//d[0]	-> 	d[0][0],d[0][1],d[2][2],d[0][3]
								//d[1]	-> 	d[1][0],d[1][1],d[1][2],d[1][3]
								//d[2]	-> 	d[2][0],d[2][1],d[2][2],d[2][3]
								//d[3]	-> 	d[3][0],d[3][1],d[3][2],d[3][3]
      
      for (int i=0; i<d.size();i++)
			$display("Size of d[%0d]=%0d ",i,d[i].size());
      
		  
		foreach(d[a,e]) begin
			d[a][e]=$urandom_range(10,100);
			$display("MDA Dyn[%0d][%0d]=%0d",a,e,d[a][e]);
		end
		  
		$display("Size of arr=%0d ",d.size());
		  
		
      
      
      $display("dynamic array d= %0p",d);
				   
	end
endmodule