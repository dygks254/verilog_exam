module top_module (input x, input y, output z);

    wire buff_0, buff_1, buff_2, buff_3;
    
    A IA1 ( .x(x), .y(y), .z(buff_0) );
    A IA2 ( .x(x), .y(y), .z(buff_1) );
    B IB1 ( .x(x), .y(y), .z(buff_2) );
    B IB2 ( .x(x), .y(y), .z(buff_3) );
    
    assign z = ( buff_0 | buff_1 ) ^ ( buff_2 & buff_3 );
    
endmodule

module A (input x, input y, output z);

    assign z = (x^y)&x;
    
endmodule

module B ( input x, input y, output z );

    assign z = ~( x^y );
    
endmodule


