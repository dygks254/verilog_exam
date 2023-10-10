module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    reg [11:0] state, next_state;
    
    always @(*)
        case(state)
            12'b000000000001 : 	if(~in) next_state <= 12'b000000000010;
            					else next_state <= 12'b000000000001;

            12'b000000000010 : 	next_state <= 12'b000000000100;
            12'b000000000100 : 	next_state <= 12'b000000001000;
            12'b000000001000 : 	next_state <= 12'b000000010000;
            12'b000000010000 : 	next_state <= 12'b000000100000;
            12'b000000100000 : 	next_state <= 12'b000001000000;
            12'b000001000000 : 	next_state <= 12'b000010000000;
            12'b000010000000 : 	next_state <= 12'b100000000000;
            12'b100000000000 : 	next_state <= 12'b000100000000;

            12'b000100000000 : 	if(in) next_state <= 12'b001000000000;
                                else   next_state <= 12'b010000000000;
            12'b001000000000 :   if(in) next_state <= 12'b000000000001;
                                else   next_state <= 12'b000000000010;
            12'b010000000000 :   if(in) next_state <= 12'b000000000001;
                                else   next_state <= 12'b010000000000;

            default : next_state <= 12'b000000000001;
        endcase

    always @(posedge clk)
        if(reset)
            state <= 12'b000000000001;
        else
            state <= next_state;

    assign done = (state == 12'b001000000000);
    
endmodule
