module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    reg [2:0] state, next_state;
    parameter A=1, B=2, C=3, D=4;
    
    always @(*) begin
        case (state)
            A: next_state <= in ? B : A;
            B: next_state <= in ? B : C;
            C: next_state <= in ? D : A;
            D: next_state <= in ? B : C;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if(areset) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    assign out = (state == D);

endmodule
