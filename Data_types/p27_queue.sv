module tb;
	reg [7:0] q[$];
	
	int q1[$];	// a queue of integers
	
	string names[$];	//a queue of strings
	
	bit q2[$:255]; //a queuq with max size 256 bits
	
	integer q3[$]={3,2,7};	// quaue initialization id done with ' 
	
	reg[7:0] v1,v2;
	
	initial begin
		q.push_back(20);
		$display(q);
		q.push_back(30);
		$display(q);
		q.push_back(40);
		$display(q);
		
		for (shortint i=0;i<10;i=i+1) begin
			q.push_back($urandom_range(1,30));
		end
		
		$display(q);
		
		q.delete(9);		//index 9 value is deleted
		$display(q);
		q.insert(5,100);		//at index 5 value 11 is inserted
		$display(q);
		q.push_front(125);
		$display(q);
		v1=q.pop_front();
		$display(q);
		$display("v1= %0d",v1);
		v2=q.pop_back();
		$display(q);
		$display("v2= %0d",v2);
		q={};	//empties the queue
		$display("value of queue is %0p",q);
		
	end
endmodule