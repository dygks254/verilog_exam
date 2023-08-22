module top_module (
    input clk,
    input d,
    output q
);

    wire buff_0, buff_1;
    
    always @(posedge clk)
        buff_0 <= d;
    always @(negedge clk)
        buff_1 <= d;
    
    assign q = clk ? buff_0 : buff_1;
    
endmodule
