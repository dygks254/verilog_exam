module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output reg q);

    always @(posedge clk, posedge ar)
        if(ar)
            q <= 'b0;
        else
            q <= d;
        
endmodule
