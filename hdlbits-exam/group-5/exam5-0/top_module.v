module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    
    wire [7:0] buff_0, buff_1;
    
    assign buff_0 = (a>b) ? b : a;
    assign buff_1 = (c>d) ? d : c;
    assign min = (buff_0>buff_1) ? buff_1 : buff_0;

endmodule
