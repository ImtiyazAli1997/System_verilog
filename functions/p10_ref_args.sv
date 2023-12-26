module tb;
   
	bit [3:0] i1,out;
  
	initial begin
		i1=0; out=5;
		foo(i1,out);
		$display("[test] i1=%0d  out=%0d at time=%0t ",i1,out,$time);
	end
	  
	 task  automatic foo (input bit[3:0] a1 ,ref bit[3:0] out_a3);
		$display("[task] Start of task a1=%0d out_a3=%0d at time=%0t",a1,out_a3,$time);
		#2 a1=5; 
		$display("[task] a1 changed to=%0d at time=%0t",a1,$time);
		#1 $display("[task] a1 changed to=%0d at time=%0t",a1,$time);
		#2 out_a3 = out_a3 + 3;
		$display("[task] task a1=%0d out_a3=%0d at time=%0t",a1,out_a3,$time);
		#2 out_a3 = out_a3 + 5;
		$display("[task] task a1=%0d out_a3=%0d at time=%0t",a1,out_a3,$time);
		#1 
		$display("[task] End of task a1=%0d out_a3=%0d at time=%0t",a1,out_a3,$time);
	endtask  //end of time 7
	  

	  
	always @(i1) begin
		$display("[Always_i1] Detected change on i1=%0d at time=%0t",i1,$time);
		i1++;
	end
	  
	always @(out) 
		$display("[Always_out] Detected change on out=%0d at time=%0t",out,$time);
 
endmodule