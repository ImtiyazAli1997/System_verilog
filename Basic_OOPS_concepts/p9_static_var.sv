//Example shows the usage of static variables inside the class

class Packet;

	static int id=0;
	bit [7:0] obj_id;

	function new();
	  id++;
	   obj_id=id;
	endfunction

endclass

program test;

	Packet p1,p2,p3;

	initial begin

	  $display("\nStatic id=%0d ",Packet::id);
	  $display("Static id=%0d ",p1.id);
	  p1=new;
	  $display("Static id=%0d p1.obj_id=%0d",Packet::id,p1.obj_id);
	  p2=new;
	  $display("Static id=%0d p2.obj_id=%0d",p2.id,p2.obj_id);
	  p3=new;
	  $display("Static id=%0d p3.obj_id=%0d\n",p3.id,p3.obj_id);
	  
	  $display("Static id=%0d p1.obj_id=%0d\n",p1.id,p1.obj_id);
	  $display("Static id=%0d p2.obj_id=%0d\n",p2.id,p2.obj_id);
	  $display("Static id=%0d p3.obj_id=%0d\n",p3.id,p3.obj_id);
	end

endprogram