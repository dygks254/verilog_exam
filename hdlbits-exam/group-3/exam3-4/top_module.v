module my_dff8 ( input clk, input [7:0] d, output reg [7:0] q);

  always @( posedge clk ) begin
    q <= d;
  end

endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);

    wire [7:0] buff_0, buff_1, buff_2;
    
    my_dff8 instance_0 ( .clk(clk), .d(d), .q(buff_0) );
    my_dff8 instance_1 ( .clk(clk), .d(buff_0), .q(buff_1) );
    my_dff8 instance_2 ( .clk(clk), .d(buff_1), .q(buff_2) );
    
    always @(*)begin
        case(sel) 
            0 : q = d;
            1 : q = buff_0;
            2 : q = buff_1;
            3 : q = buff_2;
            default : q = d;
        endcase
    end
    
endmodule
