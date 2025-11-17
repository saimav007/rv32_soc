`include "fetch_stage.v"
module test_fetch;

reg clk,rst,pc_en, flush,jump_en, btb_pc_valid, btb_pc_predictTaken;
reg [31:0]pc_jump_addr, btb_target_pc;
wire [31:0]instruction, pc;

fetch_stage t1(clk,rst,pc_en, flush,jump_en, btb_pc_valid, btb_pc_predictTaken, pc_jump_addr, btb_target_pc,instruction, pc);

initial begin 
    {pc_en, flush,jump_en, btb_pc_valid, btb_pc_predictTaken} = 5'd0;
    clk=0; rst=1;
    #5; 
    rst=0; pc_en=1; 
    #100000 $finish();
end
initial begin 
    forever #10 clk=~clk;
end
initial begin
    $dumpfile("test_fetch_out.vcd");
    $dumpvars(0, t1);
end
endmodule 
