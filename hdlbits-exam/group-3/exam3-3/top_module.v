module my_dff ( input clk, input d, output reg q);

  always @( posedge clk ) begin
    q <= d;
  end

endmodule

module top_module ( input clk, input d, output q );

    wire buff_0, buff_1;
    
    my_dff instance_0 ( .clk(clk), .d(d), .q(buff_0) );
    my_dff instance_1 ( .clk(clk), .d(buff_0), .q(buff_1) );
    my_dff instance_3 ( .clk(clk), .d(buff_1), .q(q) );
    
endmodule
