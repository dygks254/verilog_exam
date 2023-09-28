module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    reg [2:0] all_buff;
    assign {fr3, fr2, fr1} = all_buff;
    
    always @(posedge clk)begin
        if(reset)
            all_buff <= 0;
        else
            case(s)
                3'b111 : all_buff <= 3'b000;
                3'b011 : all_buff <= 3'b001;
                3'b001 : all_buff <= 3'b011;
                3'b000 : all_buff <= 3'b111;
                default : all_buff <= 3'b000; 
            endcase
    end
    
    reg [3:1] buff_s;
    always @(posedge clk)begin
       buff_s <= all_buff; 
    end
    
    assign dfr = all_buff >= buff_s ? 1'b1 : 1'b0;
    
endmodule
