module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        casex({state, bump_left, bump_right})
            3'b01x: next_state <= RIGHT;
            3'b00x: next_state <= LEFT;
            3'b1x0: next_state <= RIGHT;
            3'b1x1: next_state <= LEFT;
            default : next_state <= next_state;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
