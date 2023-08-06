module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [2:0] buff_cout;
    
    bcd_fadd instance_0 [3:0](
        .a(a),
        .b(b),
        .cin({buff_cout,cin}),
        .cout({cout,buff_cout}),
        .sum(sum)
    );
    
endmodule
