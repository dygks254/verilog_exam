module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 

    reg [7:0] q;
    
    always @(posedge clk)
        if(enable) begin
            q <= {q[6:0],S};
        end
    
    always @(*) begin
        case({A,B,C})
            3'h0 : Z <= q[0];
            3'h1 : Z <= q[1];
            3'h2 : Z <= q[2];
            3'h3 : Z <= q[3];
            3'h4 : Z <= q[4];
            3'h5 : Z <= q[5];
            3'h6 : Z <= q[6];
            3'h7 : Z <= q[7];
            default : Z <= q[0];
        endcase
    end
    
endmodule
