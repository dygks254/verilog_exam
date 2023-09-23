module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    wire [3:0] next_state;
    reg  [3:0] state;
    
    assign next_state[A] = ~in & ( state[0] | state[2] );
    assign next_state[B] =  in & ( |{state[3],state[1:0]} );
    assign next_state[C] = ~in & ( state[1] | state[3] );
    assign next_state[D] =  in & state[2];
    
    always @(posedge clk, posedge areset)begin
        if(areset)
            state <= 'h0;
        else
            state <= next_state;
    end
    
    assign out = state[D] == 'b1 ? 'b1 : 'b0;

endmodule
