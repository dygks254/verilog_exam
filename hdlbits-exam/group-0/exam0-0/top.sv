`include "top_module.v"
`timescale 1ps/1ps

module top;

  wire a;

  top_module src( a );

  initial begin
    $display("Output value : 0x%0h", a);
    $display("Output value : 0x%0h", a);
    $finish;
  end

endmodule