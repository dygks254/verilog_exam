module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

	parameter ST0=0, ST1=1, ST2=2, ST4;
    reg [1:0] state, next_state;
    
    always @(*)
        case(state)
            ST1 : 	if(in[3]) next_state <= ST2;
            		else next_state <= ST1;
            ST2 : 	next_state <= ST3;
            ST3 : 	next_state <= ST4;
            ST4 : 	if(in[3]) next_state <= ST2;
            		else next_state <= ST1;
            default : next_state <= next_state;
        endcase

    always @(posedge clk)
        if(reset) begin
           	state <= ST1;
            out_bytes <= 0;
        end else begin
			state <= next_state;
            out_bytes <= {out_bytes[15:0], in};
        end
    
    assign done = (state == ST4);
    
endmodule
