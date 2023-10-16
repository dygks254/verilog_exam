module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT=0, RIGHT=1, FALL_L=2, FALL_R=3, DIG_L=4, DIG_R=5;
    reg [2:0] state, next_state;
	reg buff_dig;    
    
    always @(*)begin
        casex(state) 
            LEFT: begin
                if(ground)
                    if(dig)
                    	next_state <= DIG_L;
                	else
                        next_state <= bump_left ? RIGHT : LEFT;
                else
                    next_state <= FALL_L;
            end
            RIGHT: begin
                if(ground)
                    if(dig)
                    	next_state <= DIG_R;
                	else
                        next_state <= bump_right ? LEFT : RIGHT;
                else
                    next_state <= FALL_R;
            end
            FALL_L: begin
                if(ground)
                    next_state <= LEFT;
                else
                    next_state <= FALL_L;
            end
            FALL_R: begin
                if(ground)
                    next_state <= RIGHT;
                else
                    next_state <= FALL_R;
            end
            DIG_L: begin
                if(ground) 
                    next_state <= DIG_L;
                else
                    next_state <= FALL_L;
            end
            DIG_R: begin
                if(ground)
                    next_state <= DIG_R;
                else
                    next_state <= FALL_R;
            end
            default:
                next_state <= state;
        endcase
    end

    
    always @(posedge clk, posedge areset)begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end
    
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
	assign aaah = (state == FALL_L) || (state == FALL_R);
    assign digging = (state == DIG_L) || (state == DIG_R);
    
endmodule
