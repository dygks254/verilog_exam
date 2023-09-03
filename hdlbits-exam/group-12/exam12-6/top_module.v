module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] Q_B;
    
    always @(posedge clk)begin
        if(!resetn)
            Q_B <= 4'h0;
        else
            Q_B <= { Q_B[2:0], in };
    end
    
    assign out = Q_B[3];
    
endmodule
