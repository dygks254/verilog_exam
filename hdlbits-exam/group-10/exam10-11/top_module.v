module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

    wire buff_0;
    assign buff_0 = E ? w : Q;
    
    always @(posedge clk)
        if(L)
            Q <= R;
    	else
            Q <= buff_0;
    
endmodule
