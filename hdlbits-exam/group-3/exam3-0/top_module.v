
module mod_a ( input in1, input in2, output out);

  assign out = in1 | in2;

endmodule

module top_module ( input a, input b, output out );

    mod_a instance_tmp ( .in1(a), .in2(b), .out(out) );
    
endmodule
