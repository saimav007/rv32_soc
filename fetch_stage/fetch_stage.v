`include "pc.v"
`include "pc_update.v"
`include "Instruction_Mem.v"
module fetch_stage(input clk,rst,pc_en, flush,jump_en, btb_pc_valid, btb_pc_predictTaken, 
                   input [31:0]pc_jump_addr, branch_target_pc,
                   output [31:0] instruction, pc);

wire [31:0] next_pc;

pc m1(clk, rst, pc_en, next_pc, pc);
pc_update m2(pc, branch_target_pc, pc_jump_addr, jump_en, btb_pc_valid, btb_pc_preditTaken,next_pc);
Instruction_Mem m3(pc, rst, pc_en, flush, instruction);

endmodule   
