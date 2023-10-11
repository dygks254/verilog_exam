module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
); //

    parameter ST0=1, ST1=2, ST2=4, ST3=8, ST4=16, ST5=32, ST6=64, ST7=128, ST8=256, ST9=512, ST10=1024;
    reg [10:0] state, next_state;
    reg [7:0] buff_out_byte;

    always @(*)begin
        case(state)
            ST0 :   if(reset)   next_state <= ST0;
                    else        next_state <= ST1;
            ST1 :   next_state <= ST2;
            ST2 :   next_state <= ST3;
            ST3 :   next_state <= ST4;
            ST4 :   next_state <= ST5;
            ST5 :   next_state <= ST6;
            ST6 :   next_state <= ST7;
            ST7 :   next_state <= ST8;
            ST8 :   next_state <= ST9;
            ST9 :   next_state <= ST10;
            ST10:   next_state <= ST1;
            default : next_state <= ST0;
        endcase
    end

    always @(posedge clk)
        if(reset)
            state <= ST0;
        else
            state <= next_state;

    always @(posedge clk)begin
        buff_out_byte <= {buff_out_byte[6:0], in};
        out_byte <= buff_out_byte;
    end

    assign done = (state == ST10);

endmodule
