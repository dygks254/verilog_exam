`include "top_module.v"
`timescale 1ps/1ps

module top;

  wire a;

  top_module src( a );

  initial begin
    $display("Output value : 0x%0h", a);
    $display("Output value : 0x%0h", a);
    if( a == 1'b1 )begin
      $error("Error :: output is not hitgh");
    end
    $finish;  
  end

endmodule