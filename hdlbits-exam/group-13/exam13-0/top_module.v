module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 

  wire [$bits(q)-1:0] left, center, right;

  assign left = {1'h0, q[$bits(data)-1:1]};
  assign center = q;
  assign right = {q[$bits(data)-2:0], 1'h0};

	always @(posedge clk) begin
		if (load) begin
			q <= data;
		end
		else begin
            q <= ( left&(~right) ) | ( ~left & right );
		end
	end
    
endmodule
