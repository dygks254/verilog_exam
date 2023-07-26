module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [$bits(a)/4:0] buff_carry;
    assign buff_carry[0] = cin;
    assign cout = buff_carry[$bits(a)/4];
    
    generate
    genvar i;
        for(i=0; i<$bits(a)/4; i++) begin: gen_loop
            bcd_fadd gen_bcd( 
                .a(a[(i+1)*4-1:i*4]), 
                .b(b[(i+1)*4-1:i*4]), 
                .cin(buff_carry[i]),
                .cout(buff_carry[i+1]),
                .sum(sum[(i+1)*4-1:i*4])
            );
        end
    endgenerate

endmodule
