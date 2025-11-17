`timescale 1ns / 1ps

module pc(
    input clk,rst,pc_en,
    input [31:0] next_pc,  // normally pc + 4 , but next for general jump cases
    output reg [31:0] pc
);

    always@(posedge clk or posedge rst)
    begin
        if(rst)
            pc<=0;
        else if(pc_en)
            pc<=next_pc;
    end
endmodule
