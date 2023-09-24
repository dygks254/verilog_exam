module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    wire [$bits(data)-1:0] left, center, right;
    assign left = {1'h0, q[511:1]};
    assign center = q;
    assign right = {q[510:0], 1'h0};
    
    always @(posedge clk)begin
        if(load)
            q <= data;
        else
            q <= ( left&(center^right) ) | ( (~left)&(center|right) );
    end
    
endmodule
