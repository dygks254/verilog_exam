module top_module(
    input clk,
    input [7:0] in,
    input reset, 
    output done);

    parameter BT1 = 0, BT2 = 1, BT3 = 2, DONE = 3;
    reg [1:0] state, next_state;

    always @(*) begin
        case(state)
            BT1 :
                if(in[3])   next_state <= BT2;
                else        next_state <= BT1;
            BT2 :
                next_state <= BT3;
            BT3 :
                next_state <= DONE;
            DONE : 
                if(in[3])   next_state <= BT2;
                else        next_state <= BT1;
            default : 
                next_state <= next_state;
        endcase
    end

    always @(posedge clk)
        if(reset)
            state <= BT1;
        else
            state <= next_state;

    assign done = ( state == DONE );
            

endmodule
