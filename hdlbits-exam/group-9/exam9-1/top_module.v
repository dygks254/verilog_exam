module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (~a)&(~d) | a&c&d | (~b)&(~c) | (~a)&b&c;
    
endmodule
