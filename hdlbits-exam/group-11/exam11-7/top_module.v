module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire ena_ss, ena_mm, ena_hh;
    
    assign ena_ss = 1'b1;
    assign ena_mm = ss==8'h59 ? 1'b1 : 1'b0;
    //assign ena_hh = mm==8'h59 ? 1'b1 : 1'b0;
    assign ena_hh = 1'b0;
    
    bcd_60 bcd_ss(
        .clk(clk),
        .reset(reset),
        .ena(ena_ss),
        .q(ss)
    );
    bcd_60 bcd_mm(
        .clk(clk),
        .reset(reset),
        .ena(ena_mm),
        .q(mm)
    );
    bcd_12 bcd_hh(
        .clk(clk),
        .reset(reset),
        .ena(ena_hh),
        .q(hh)
    );
    
    always @(posedge clk)begin
        if(reset) 
            pm <= 1'b0;
        else if( {hh,mm,ss} == 12'h125959 )
            pm <= ~pm;
        else
            pm <= pm;
    end
    
endmodule

module bcd_60(
    input clk,
    input reset,
    input ena,
    output reg [7:0] q
);
    
    always @(posedge clk)begin
        if(reset || (q[3:0]==4'h9 && ena)) 
            q[3:0] <= 4'b0;
        else if(ena)
            q[3:0] <= q[3:0] + 4'b1;
        else
            q[3:0] <= q[3:0];
    end
    
    always @(posedge clk)begin
        if(reset || (q[7:0]==8'h59 && ena)) 
            q[7:4] <= 8'b0;
        else if(q[3:0]==4'h9 && ena)
            q[7:4] <= q[7:4] + 4'b1;
        else
            q[7:4] <= q[7:4];
    end
    
endmodule

module bcd_12(
    input clk,
    input reset,
    input ena,
    output reg [7:0] q
);
    
    always @(posedge clk)begin
        if(reset)
            q[3:0] <= 4'h2;
        else if((q[3:0]==4'h9&&ena) || (q[7:0]==8'h12&&ena))
            q[3:0] <= 4'b0;
        else if(ena)
            q[3:0] <= q[3:0] + 4'b1;
        else 
            q[3:0] <= q[3:0];
    end
    
    always @(posedge clk)begin
        if(reset) 
            q[7:4] <= 4'h1;
        else if((q[7:0]==8'h12)&&ena)
            q[7:4] <= 4'b0;
        else if((q[7:4]==4'h9)&&ena)
            q[7:4] <= q[7:4] + 4'b1;
        else
            q[7:4] <= q[7:4];
    end
    
endmodule
