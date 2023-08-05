module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [2:0]c_buff;
    
    addr instance_0[3:0]( .a(x), .b(y), .cin({c_buff,1'b0}), .cout({sum[4],c_buff}), .sum(sum[3:0]) );
    
endmodule

module addr( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
    
endmodule
