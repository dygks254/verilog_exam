module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] buff_0;
    
    always @(posedge clk)begin
        buff_0 <= in;
        anyedge <= buff_0 ^ in;
    end
    
endmodule
