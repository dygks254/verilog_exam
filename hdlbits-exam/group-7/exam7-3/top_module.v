module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output reg out );

    integer i;
    
    always @(*)begin
        for(i=0; i < $bits(in); i++)begin
            if(sel == i) begin
                out = in[i] ;
            end
        end
    end
    
    // assign out = in[sel];
    
endmodule
