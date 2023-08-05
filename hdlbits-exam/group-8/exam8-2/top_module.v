module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    addr instance_0[2:0]( .a(a), .b(b), .cin({cout[1:0],cin}), .cout(cout), .sum(sum) );
    
endmodule

module addr( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
    
endmodule

