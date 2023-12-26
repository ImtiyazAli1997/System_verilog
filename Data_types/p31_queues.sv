module tb;
  
	typedef logic [7:0] queue[$];
  
	queue q_inp[$];  //queue of queues
  
  
	logic [7:0] t1[$];   
	logic [7:0] t2[$]; 
	
	initial begin
  
		for (int i=0; i<10;i++) begin
		   t1.push_back(i);					//t1={0,1,2,3,4,5,6,7,8,9}
		   t2.push_back(i*2);				//t2={0,2,4,6,8,10,12,14,16,18}
		end
		q_inp.push_back(t1);				//q={t1}={{0,1,2,3,4,5,6,7,8,9}};
		q_inp.push_back(t2);				//q={t1,t2}={{0,1,2,3,4,5,6,7,8,9},{0,2,4,6,8,10,12,14,16,18}};

		$display("Size of q_inp=%0d",q_inp.size());	// 2 as only 2 queues
		$display("Size of t1=%0d",q_inp[0].size());	//q_inp[0] =t1 and t1 size is 10
		$display("Size of t2=%0d",q_inp[1].size());	//q_inp[0] =t2 and t2 size is 10

		for (int k=0; k <q_inp.size();k++) begin
			for (int m=0; m <q_inp[k].size();m++) begin
				$display("[test1] t%0d[%0d] = %0d", k+1,m, q_inp[k][m]);
			end
		end

	end

endmodule
