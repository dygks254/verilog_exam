module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [98:0] buff_cout;
    
    addr instance_0 [99:0] (
        .a(a),
        .b(b),
        .cin( {buff_cout, cin} ),
        .cout({cout, buff_cout}),
        .sum(sum)
    );
    
endmodule

module addr( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
    
endmodule
