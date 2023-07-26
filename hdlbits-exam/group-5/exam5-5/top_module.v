module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    generate
    genvar i;
        for(i=0; i<$bits(a); i++) begin: add_gen
            if(i==0) begin
            	add add_gen ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0]) );
            end else begin 
                add add_gen ( .a(a[i]), .b(b[i]), .cin(cout[i-1]), .sum(sum[i]), .cout(cout[i]) );
            end
        end
    endgenerate
    
endmodule

module add(
	input a,
	input b,
	input cin,
    output sum,
    output cout
);
    
    assign {cout,sum} = a+b+cin;
    
endmodule
