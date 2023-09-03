module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    wire w,L,E,clk;
    assign {w,L,E,clk} = KEY;
    
    MUXDFF instance_3 (.clk(clk), .R(SW[3]), .E(E), .L(L), .D(w), .Q(LEDR[3]));
    MUXDFF instance_2 (.clk(clk), .R(SW[2]), .E(E), .L(L), .D(LEDR[3]), .Q(LEDR[2]));
    MUXDFF instance_1 (.clk(clk), .R(SW[1]), .E(E), .L(L), .D(LEDR[2]), .Q(LEDR[1]));
    MUXDFF instance_0 (.clk(clk), .R(SW[0]), .E(E), .L(L), .D(LEDR[1]), .Q(LEDR[0]));

endmodule

module MUXDFF (input clk, input R, input E, input L, input D, output reg Q);

    wire buff_0, buff_1;
    
    assign buff_0 = E ? D : Q;
    assign buff_1 = L ? R : buff_0;
    
    always @(posedge clk)begin
        Q <= buff_1;
    end
    
endmodule
