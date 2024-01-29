program test;
	mailbox mbx;

	int j;

	initial begin
	
		mbx=new(1);
		
		fork
			for(int i=1;i<=3;i++) brgin
				$display("producer. before put(%0d)",i);
				mbx.put(i);
				$display("producer after put(%0f)",i);
			end
			
			repeat(3) begin
				mbx.get(j);
				$display("consumer after get(%0d)",j);
			end
		join
		
	end
endprogram

/*
# producer. before put(1)
# producer after put(1.000000)
# producer. before put(2)
# consumer after get(1)
# consumer after get(2)
# producer after put(2.000000)
# producer. before put(3)
# producer after put(3.000000)
# consumer after get(3)

*/