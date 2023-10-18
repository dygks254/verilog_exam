module top_module(
    input clk,
    input in,
    input reset,
    output [7:0] out_byte,
    output done
); 
    reg [3:0] num8;
    parameter RUNNING=0, DONE=1, IDLE=3, ERROR=4, PARITY=5;
    reg [2:0] state, next_state;
    reg [7:0] data;

    wire pari_reset, odd;

    always @(*) begin
        case (state)
            IDLE: next_state <= in ? IDLE : RUNNING;
            RUNNING: begin
                if((num8==8)&in) begin
                    if( ^data ) next_state <= PARITY;
                    else        next_state <= DONE;
                end else if((num8==8)&(~in)) begin
                    next_state <= ERROR;
                end else begin
                    next_state <= RUNNING;
                    data[num8] <= in;
                end
            end
            PARITY: begin
                if(in)  next_state <= PARITY;
                else    next_state <= RUNNING;
            end
            DONE: begin
                next_state <= in ? IDLE : RUNNING;
                out_byte <= data;
            end
            ERROR: next_state <= in ? IDLE : ERROR;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state <= IDLE;
            num8 <= 0;
        end else begin
            if((state == RUNNING)&&(num8!=8)) begin
                num8 <= num8 + 1;
            end else if(state == ERROR) begin
                num8 <= 0;
            end else if(state == DONE) begin
                num8 <= 0;
            end
            state <= next_state;
        end
    end
    assign done = (state == DONE);

    assign pari_reset = ( state == PARITY );
    parity parity_0 (
        .clk(clk),
        .reset(pari_reset),
        .in(in),
        .odd(odd)
    )

endmodule


module parity (
    input clk,
    input reset,
    input in,
    output reg odd);

    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;

endmodule