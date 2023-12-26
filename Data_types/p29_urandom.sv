module tb;

  bit [31:0] addr1;
  bit [31:0] addr2;
  bit [64:0] addr3;
  bit [31:0] data;
  initial begin
    addr1 = $urandom();
    addr2 = $urandom(89);		// 89 is seed
    addr3 = {$urandom(),$urandom()};
    data  = $urandom * 6;

    $display("addr1=%0d, addr2=%0d, addr3=%0d, data=%0d",addr1,addr2,addr3,data);
 
    addr1 = $urandom_range(30,20);
    addr2 = $urandom_range(20); //takes max value as '0'
    addr3 = $urandom_range(20,30); //considers max value as '30' and min value as '20'
    $display("addr1=%0d, addr2=%0d, addr3=%0d",addr1,addr2,addr3);
  end

	int unsigned a;
	
	initial begin
		$display("default value of a is ",a);
		a=$urandom;
		$display("after urandom a is ",a);
	end

endmodule

/*
https://verificationguide.com/systemverilog/systemverilog-random-system-methods/#:~:text=%24random()%20is%20same%20as,but%20it%20generates%20signed%20numbers.

*/

