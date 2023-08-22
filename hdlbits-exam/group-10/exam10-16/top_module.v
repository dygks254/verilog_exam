module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg [31:0] buff_0;
    
    always @(posedge clk)begin
       buff_0 <= in; 
    end
    
    integer i;
    
    always @(posedge clk)begin
        for(i=0; i<$bits(in); i++)begin
            if(reset)
                out[i] <= 'b0;
            else if({buff_0[i], in[i]} == 2'b10)
                out[i] <= 'b1;
            else
                out[i] <= out[i];
        end
    end
    
endmodule
