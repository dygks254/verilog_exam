`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire buffer_1, buffer_2, buffer_3;
    
    assign buffer_1 = a&b;
    assign buffer_2 = c&d;
    assign buffer_3 = buffer_1 | buffer_2;
    
    assign out = buffer_3;
    assign out_n = ~buffer_3;

endmodule
