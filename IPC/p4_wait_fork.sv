task display1();
	$display("from task 1");
endtask

task display2();
	$display("from task 2");
endtask


task display3();
	$display("from task 3");
endtask



program test;
	initial begin
		$display("started");
		
		fork	: BLOCK1
			display1();
			display2();
			display3();
        join_none
		
		$display("ended");
		wait fork;
	end
endprogram
