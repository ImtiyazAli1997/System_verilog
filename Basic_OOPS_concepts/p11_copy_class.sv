//: copy method example
class A;
	bit [7:0] addr,data;

	function void copy (A inp);
	  
		if(inp==null) begin
			$display("FATAL Received null object in copy method");
			$finish;
		end
	  
		this.addr=inp.addr;
		this.data=inp.data;
	endfunction

endclass

program test;
A a1,a2;
initial begin
  a1=new;  
  a1.addr=55;  
  a1.data=66;
  
  $display("[A1] a1.addr=%0d a1.data=%0d",a1.addr,a1.data);

  a2=new;
  a2.copy(a1);
  $display("[A2] a2.addr=%0d a2.data=%0d",a2.addr,a2.data);
  
end
endprogram