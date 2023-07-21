module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire buffer_1, buffer_2, buffer_3, buffer_4;
    
    assign buffer_1 = p2a & p2b;
    assign buffer_2 = p2c & p2d;
    assign buffer_3 = p1a & p1b & p1c;
    assign buffer_4 = p1d & p1e & p1f;
    
    assign p2y = buffer_1 | buffer_2;
    assign p1y = buffer_3 | buffer_4;

endmodule
