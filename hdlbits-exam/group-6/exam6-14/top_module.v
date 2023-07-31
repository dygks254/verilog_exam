module top_module( 
    input [2:0] in,
    output [1:0] out );

    //assign out = in[0] + in[1] + in[2];
    
    assign out[1] = &in | ( &in[1:0] & ~in[2] ) | ( &in[2:1] & ~in[0] ) | ( in[0] & in[2] & ~in[1] );
    assign out[0] = ^ in;
    
endmodule
