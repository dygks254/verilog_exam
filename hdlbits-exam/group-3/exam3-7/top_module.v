module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] buff_sum_0, buff_sum_1;
    wire buff_cout;
    
    add16 instance_0 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(buff_cout), .sum(sum[15:0]) );
    
    add16 instance_1 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b0), .cout(), .sum(buff_sum_0) );
    add16 instance_2 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .cout(), .sum(buff_sum_1) );
    
    assign sum[31:16] = buff_cout ? buff_sum_1 : buff_sum_0;
    
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