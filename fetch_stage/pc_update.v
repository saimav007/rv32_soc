module pc_update(input [31:0]pc, branch_target_pc, pc_jump_addr, 
                 input jump_en, btb_pc_valid, btb_pc_predictTaken,
                 output reg [31:0]next_pc);
wire [1:0]sel = {jump_en,btb_pc_valid && btb_pc_predictTaken};
wire [31:0]pc_plus_four=pc+32'd4;

always@(*)begin 
next_pc <= (sel==2'd0) ? pc_plus_four:
           (sel==2'd1) ? branch_target_pc:
           (sel==2'd2) ? pc_jump_addr: pc_jump_addr;
end

endmodule 

