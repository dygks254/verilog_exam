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

    parameter LEFT=0, RIGHT=1, FALL_L=2, FALL_R=3, DIG_L=4, DIG_R=5, SPLAT=6;
    reg [2:0] state, next_state;
	reg buff_dig;    
    
    reg [31:0] fall_cycle;
    
    always @(*)begin
        casex(state) 
            LEFT: begin
                if(ground)
                    if(dig)
                    	next_state <= DIG_L;
                	else
                        next_state <= bump_left ? RIGHT : LEFT;
                else begin
                    next_state <= FALL_L;
                end
            end
            RIGHT: begin
                if(ground)
                    if(dig)
                    	next_state <= DIG_R;
                	else
                        next_state <= bump_right ? LEFT : RIGHT;
                else begin
                    next_state <= FALL_R;
                end
            end
            FALL_L: begin
                if(ground) begin
                    if(fall_cycle >19)
                    	next_state <= SPLAT;
                    else
                        next_state <= LEFT;
                end else begin
                    next_state <= FALL_L;
                end
            end
            FALL_R: begin
                if(ground) begin
                    if(fall_cycle >19)
                    	next_state <= SPLAT;
                    else
                        next_state <= RIGHT;
                end else begin
                    next_state <= FALL_R;
                end
            end
            DIG_L: begin
                if(ground) 
                    next_state <= DIG_L;
                else begin
                    next_state <= FALL_L;
                end
            end
            DIG_R: begin
                if(ground)
                    next_state <= DIG_R;
                else begin
                    next_state <= FALL_R;
                end
            end
            SPLAT: begin
                next_state <= SPLAT;
            end
            default:
                next_state <= state;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset)
            state <= LEFT;
        else if(state == FALL_L || state == FALL_R) begin
            state <= next_state;
            fall_cycle <= fall_cycle + 1;
        end
        else begin
            state <= next_state;
            fall_cycle <= 0;
        end
    end
    
    
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
	assign aaah = (state == FALL_L) || (state == FALL_R);
    assign digging = (state == DIG_L) || (state == DIG_R);
    
endmodule
