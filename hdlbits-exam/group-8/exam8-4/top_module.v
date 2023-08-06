module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    wire [7:0] buff_cout;

    addr instance_0 [7:0] (
        .a(a),
        .b(b),
        .cin( {buff_cout[6:0], 1'b0}),
        .cout(buff_cout),
        .sum(s)
    );
    
    assign overflow = buff_cout[6] ^ buff_cout[7];

endmodule


module addr( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
    
endmodule
