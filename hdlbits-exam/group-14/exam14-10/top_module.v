module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=0, RIGHT=1, FALL_L=2, FALL_R=3;
    reg state, next_state;
    
    
    always @(*)begin
        casex({ground, state, bump_left, bup_right}) 
            4'b1xx10 : next_state <= FALL_L;
            4'b1xx01 : next_state <= FALL_R;
            4'b0
        endcase
    end

endmodule
