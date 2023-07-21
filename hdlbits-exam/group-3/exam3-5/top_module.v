module add16(
  input cin,
  input [15:0] a,
  input [15:0] b,
  output cout,
  output [15:0] sum
);

  assign {cout, sum} = {15'b0,cin} + a + b;

endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire buff_cin;
    
    add16 instance_0 ( .cin(1'b0), .a(a[15:0]), .b(b[15:0]), .cout(buff_cin), .sum(sum[15:0]) );
    add16 instance_1 ( .cin(buff_cin), .a(a[31:16]), .b(b[31:16]), .cout(), .sum(sum[31:16]) );
    
endmodule

