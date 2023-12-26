module tb;

reg [3:0] sum_t,sum_f,k;

initial begin
   add_t(5,5,sum_t);
  $display("Task output sum=%0d",sum_t);
end

initial begin
  sum_f =  5 + add_f(5,5);
  $display("Function output sum=%0d",sum_f);
  
  sum_f = sv_add_f(6,5);
  $display("SV Function output sum=%0d",sum_f);
  
  sum_f = sv_add_f2(10,3);
  $display("SV Function output sum=%0d",sum_f);
  
end



task add_t (input [3:0] in1,in2, output [3:0] out);
out=in1+in2;
endtask

function reg [3:0] add_f (input [3:0] in1,in2);
begin  //reg [3:0] add_f;  
add_f = in1+in2;
end
endfunction

  function reg [3:0] sv_add_f (input [3:0] in1,in2);
  return (in1+in2);
endfunction
 
  function reg [3:0] sv_add_f2 (input [3:0] in1,in2);
  sv_add_f2=in1+in2;
endfunction
  

endmodule
