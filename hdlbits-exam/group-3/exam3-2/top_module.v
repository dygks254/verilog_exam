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
         .in1(a)
        ,.in2(b)
        ,.in3(c)
        ,.in4(d)
        ,.out1(out1)
        ,.out2(out2)
    );
    
endmodule
