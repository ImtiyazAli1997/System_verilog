//example shows the usage of static methods inside the class
class Packet;

    static int id=0;
    bit [7:0] data;

    function new();
	id++;
    endfunction

    static function int get();
    return id;
    endfunction

endclass

program test;

Packet p1,p2,p3;

initial begin

    $display(" static method get id=%0d \n",Packet::get());
    p1=new;
    $display(" static id=%0d \n",Packet::id);
    p2=new;
    $display("Static id=%0d \n",p2.id);
    p3=new;
    $display("Static method get  id=%0d \n",p3.get());
    $display(" static method get  id=%0d \n",Packet::get());
end

endprogram

