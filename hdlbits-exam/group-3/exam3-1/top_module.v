module mod_a(
    output out1,
    output out2, 
    input a, 
    input b, 
    input c,
    input d
)

  assign out1 = a | (~b);
  assign out2 = (~c) | d;

endmodule

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a instance_tmp ( 
    	out1, out2,
        a, b, c, d
    );
    
endmodule
