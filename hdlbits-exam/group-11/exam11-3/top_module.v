module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk)begin
        if( reset ) 
            q <= 0;
        else if ( slowena )
            if( q == 4'h9 )
                q <= 0;
        	else
                q <= q + 4'b1;
        else
            q <= q;
    end
    
endmodule
