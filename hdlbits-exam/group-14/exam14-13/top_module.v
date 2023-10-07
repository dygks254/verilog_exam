module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8, S9=9;
    
    always @(*)begin
        S0 : begin
            if(in)  next_state <= S1;
            else    next_state <= S0;
            end
        S1 : begin
            if(in)  next_state <= S2;
            else    next_state <= S0;
            end
        S2 : begin
            if(in)  next_state <= S3;
            else    next_state <= S0;
            end
        S3 : begin
            if(in)  next_state <= S4;
            else    next_state <= S0;
            end
        S4 : begin
            if(in)  next_state <= S5;
            else    next_state <= S0;
            end
        S5 : begin
            if(in)  next_state <= S6;
            else    next_state <= S8;
            end
        S6 : begin
            if(in)  next_state <= S7;
            else    next_state <= S9;
            end
        S7 : begin
            if(in)  next_state <= S7;
            else    next_state <= S0;
            end
        S8 : begin
            if(in)  next_state <= S1;
            else    next_state <= S0;
            end
        S9 : begin
            if(in)  next_state <= S1;
            else    next_state <= S0;
            end
    end

endmodule







