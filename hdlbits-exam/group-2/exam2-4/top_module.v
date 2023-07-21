module top_module( 
    input [3:0] in,
    output reg out_and,
    output reg out_or,
    output reg out_xor
);

    always @(*)begin
        out_and <= &in;
        out_or <= |in;
        out_xor <= ^in;
    end
    
endmodule
