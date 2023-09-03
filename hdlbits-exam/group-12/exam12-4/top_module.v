module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

	wire D0, D1, D2;
    
    assign D0 = KEY[1] ? SW[0] : LEDR[2]   ; 
    assign D1 = KEY[1] ? SW[1] : LEDR[0]   ; 
    assign D2 = KEY[1] ? SW[2] : ^LEDR[2:1]; 
    
    always @(posedge KEY[0])begin
        LEDR <= {D2,D1,D0}; 
    end
    
endmodule
