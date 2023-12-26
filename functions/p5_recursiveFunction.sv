module tb;

bit [31:0] result;

initial begin
  
for (int n = 0; n <= 7; n++) begin
result = factorial(n);
  $display("n=%0d factorial=%0d", n, result);
end
  
end



function automatic bit [31:0] factorial (input [31:0] operand);
if (operand >= 2)
factorial = factorial (operand - 1) * operand;
else
factorial = 1;
endfunction


  

  
endmodule