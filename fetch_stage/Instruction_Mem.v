`timescale 1ns / 1ps

module Instruction_Mem(
    input [31:0] pc,
    input rst,
    input pc_en, flush,
    output reg [31:0] instruction
);

    reg [31:0] Memory [0:1023]; 
    
    integer i;
    initial begin
       // Memory[0] = 32'h00000000; 
        //Memory[1] = 32'b000000000011_00000_010_00001_0010011;
        //Memory[2] = 32'b000000000101_00000_010_00010_0010011;
        //for (i = 3; i < 32; i = i + 1)
          //  Memory[i] = 32'b0000000_00001_00010_010_00010_0110011; 
    //end
        Memory [0] <= 32'h01E50533;
        Memory [1] <= 32'h00B60693;
        Memory [2] <= 32'h02C58533;
        Memory [3] <= 32'h01460593;
        Memory [4] <= 32'h00E78733;
        Memory [5] <= 32'h028786B3;
        Memory [6] <= 32'h00080867;
        Memory [7] <= 32'h12080867;
        Memory [8] <= 32'h00A4A823;
        Memory [9] <= 32'h01B7A6A3;
        Memory [10] <= 32'h014000EF;
        Memory [11] <= 32'h000005EF;
        Memory [12] <= 32'h0200006F;
        Memory [13] <= 32'h000002EF;
        Memory [14] <= 32'h00C80693;
        Memory [15] <= 32'h00B909B3;
        Memory [16] <= 32'h41F70733;
        Memory [17] <= 32'h01B807B3;
        Memory [18] <= 32'h000005EF;
        Memory [19] <= 32'h000002EF;
        Memory [20] <= 32'h00A80863;
        Memory [21] <= 32'h02450833;
        Memory [22] <= 32'h00C60693;
        Memory [23] <= 32'h01A88863;
        Memory [24] <= 32'h02478933;
        Memory [25] <= 32'h00B50533;
        Memory [26] <= 32'h00B50593;
        Memory [27] <= 32'h02C40833;
        Memory [28] <= 32'h01F70533;
        Memory [29] <= 32'h01A78733;
        Memory [30] <= 32'h00C78863;
        Memory [31] <= 32'h014000EF;
        Memory [32] <= 32'h00C50533;
        Memory [33] <= 32'h01050533;
        Memory [34] <= 32'h01850533;
        Memory [35] <= 32'h00F80893;
        Memory [36] <= 32'h02360863;
        Memory [37] <= 32'h0374C963;
        Memory [38] <= 32'h01C0006F;
        Memory [39] <= 32'h000003EF;
        Memory [40] <= 32'h000007EF;
        Memory [41] <= 32'h000006EF;
        Memory [42] <= 32'h000005EF;
        Memory [43] <= 32'h000001EF;
        Memory [44] <= 32'h000002EF;
        Memory [45] <= 32'h000004EF;
        Memory [46] <= 32'h02A60613;
        Memory [47] <= 32'h00880993;
        Memory [48] <= 32'h00C98863;
        Memory [49] <= 32'h03422023;
        Memory [50] <= 32'h00900993;
        Memory [51] <= 32'h00A52793;
        Memory [52] <= 32'h02C48563;
        Memory [53] <= 32'h01E42023;
        Memory [54] <= 32'h02078693;
        Memory [55] <= 32'h01088733;
        Memory [56] <= 32'h01090993;
        Memory [57] <= 32'h01480993;
        Memory [58] <= 32'h01880993;
        Memory [59] <= 32'h01C80993;
        Memory [60] <= 32'h02080993;
        Memory [61] <= 32'h02480993;
        Memory [62] <= 32'h02880993;
        Memory [63] <= 32'h02C80993;
        Memory [64] <= 32'h03080993;
        Memory [65] <= 32'h03480993;
        Memory [66] <= 32'h03880993;
        Memory [67] <= 32'h03C80993;
        Memory [68] <= 32'h41E50533;
        Memory [69] <= 32'h00A78793;
        Memory [70] <= 32'h01F707B3;
        Memory [71] <= 32'h08F007E7;
        Memory [72] <= 32'h00780493;
        Memory [73] <= 32'h01E40793;
        Memory [74] <= 32'h02D70733;
        Memory [75] <= 32'h00C78763;
        Memory [76] <= 32'h00B0006F;
        Memory [77] <= 32'h0100006F;
        Memory [78] <= 32'h0200006F;
        Memory [79] <= 32'h0300006F;
        Memory [80] <= 32'h0400006F;
        Memory [81] <= 32'h000001B7;
        Memory [82] <= 32'h000002B7;
        Memory [83] <= 32'h000003B7;
        Memory [84] <= 32'h000004B7;
        Memory [85] <= 32'h000005B7;
        Memory [86] <= 32'h00A88863;
        Memory [87] <= 32'h00B88963;
        Memory [88] <= 32'h00C92023;
        Memory [89] <= 32'h00DA2023;
        Memory [90] <= 32'h00450593;
        Memory [91] <= 32'h00E505B3;
        Memory [92] <= 32'h01A60613;
        Memory [93] <= 32'h02660613;
        Memory [94] <= 32'h03260613;
        Memory [95] <= 32'h03E60613;
        Memory [96] <= 32'h0000006F;
        Memory [97] <= 32'h00000097;
        Memory [98] <= 32'h00000013;
        Memory [99] <= 32'h00000067;
        Memory [100] <= 32'h00000073;
        Memory [101] <= 32'h000000B3;
end
    
    
    
    always @(*) begin
        if (rst)
              instruction <= 0;
        else if(pc_en)
            instruction <= Memory[pc>>2 & 32'b111111111];
        else if(flush)
            instruction <= 0;
    end

endmodule
