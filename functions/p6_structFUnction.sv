module tb;
  
typedef struct {
    bit [7:0] addr;
    bit [31:0] data;
}  struct_type;


struct_type   svar;

initial begin
  $display("Before svar.addr= %0d svar.data=%0d ",svar.addr,svar.data);
  
svar = fn_struct(20,30);
    $display("After svar.addr= %0d svar.data=%0d ",svar.addr,svar.data);

end 


function struct_type fn_struct (int addr,data);
fn_struct.addr=addr;
fn_struct.data=data;
endfunction



endmodule
