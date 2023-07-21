module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
   
    wire buff_cin;
    
    add16 instance_0 ( .cin(1'b0), .a(a[15:0]), .b(b[15:0]), .cout(buff_cin), .sum(sum[15:0]) );
    add16 instance_1 ( .cin(buff_cin), .a(a[31:16]), .b(b[31:16]), .cout(), .sum(sum[31:16]) ); 
    
endmodule

module add16 ( input [15:0] a, input [15:0] b, input cin, output [15:0] sum, output cout ); 

  wire [14:0] buff_cin; 

  add1 instance_0 [15:0] (
      .a(a)
    , .b(b)
    , .cin({buff_cin,cin}) 
    , .sum(sum)
    , .cout({cout,buff_cin}) 
  );

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;

endmodule
