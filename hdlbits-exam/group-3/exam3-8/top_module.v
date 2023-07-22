module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] buff_xor;
    wire buff_cout;
    
    assign buff_xor = {32{sub}} ^ b;
    
    add16 instance_0 ( .a(a[15:0]), .b(buff_xor[15:0]), .cin(sub), .cout(buff_cout), .sum(sum[15:0]) );
    add16 instance_1 ( .a(a[31:16]), .b(buff_xor[31:16]), .cin(buff_cout), .cout(), .sum(sum[31:16]) );
    
endmodule

module add16(
  input cin,
  input [15:0] a,
  input [15:0] b,
  output cout,
  output [15:0] sum
);

  assign {cout, sum} = {15'b0,cin} + a + b;

endmodule