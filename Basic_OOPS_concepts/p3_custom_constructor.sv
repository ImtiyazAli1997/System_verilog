//Example shows how to define and call the custom constructor

class Packet;

	bit [7:0] addr;
	bit [31:0] wdata;

	function void print();
		$display("[Packet] addr=%0d wdata=%0d ",addr,wdata);
	endfunction

	function new (input int a1=9,input int a2=8);		//with default values
		//function new (int a1, int a2);		//without default values
		addr=a1;
		wdata=a2;
	endfunction

endclass

program test;
    Packet pkt1,pkt2;
    initial begin
    pkt1=new(5,10);

    pkt1.print();
      
     //pkt2=new(6,66);
      pkt2=new;
    pkt2.print();
end
endprogram