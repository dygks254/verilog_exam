module top_module (
    input clk,
    input x,
    output z
); 

    reg buff_xor, buff_and, buff_or;
    
    always @(posedge clk)begin
        buff_xor <= x ^ buff_xor;
    	buff_and <= x & (~buff_and);
    	buff_or <= x | (~buff_or);
    end
    
    assign z = ~( buff_xor | buff_and | buff_or );
    
endmodule
