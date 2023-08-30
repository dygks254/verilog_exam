module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);

    always @(posedge clk)begin
        if(reset || q[3:0]==4'h9)
            q[3:0] <= 'b0;
        else
            q[3:0] <= q[3:0] + 4'b1;        
        
        if(reset || q[7:0]==8'h99)
            q[7:4] <= 'b0;
        else if(q[3:0]==4'h9)
            q[7:4] <= q[7:4] + 4'b1;
        else
            q[7:4] <= q[7:4];
        
        if(reset || q[11:0]==12'h999)
            q[11:8] <= 'b0;
        else if(q[7:0]==8'h99)
            q[11:8] <= q[11:8] + 4'b1;
        else
            q[11:8] <= q[11:8];
        
        if(reset || q[15:0]==16'h9999)
            q[15:12] <= 'b0;
        else if(q[11:0]==12'h999)
            q[15:12] <= q[15:12] + 4'b1;
        else
            q[15:12] <= q[15:12];
    end
    
    assign ena[1] = q[3:0] == 4'h9   ? 1'b1 : 1'b0;
    assign ena[2] = q[7:0] == 8'h99  ? 1'b1 : 1'b0;
    assign ena[3] = q[11:0]==12'h999 ? 1'b1 : 1'b0;
    
endmodule
