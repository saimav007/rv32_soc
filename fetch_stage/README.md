Instruction fetch stage !!!
----------------------------------------------------------------

consists of 4 modules:
1) pc.v
2) pc_update.v
3) instruction_memory.v
4) fetch_stage.sv (top module)

Functionality: 
Fetches instructions from instruction memory.
Maintains the program counter (PC) with enable and reset.
Supports branch prediction using BTB.
Handles pipeline flushes for mispredicted branches.
Modular design to separate PC register, PC update logic, and instruction memory.

Ports
Name                 Direction  Width  Description                                                                        
clk                  input      1      Clock        signal                                                                
rst                  input      1      Reset        signal                                                                
pc_en                input      1      Enable       PC           update                                                   
flush                input      1      Flush        current      instruction  (NOP)                                       
pc_jump_addr         input      32     Target       PC           for          jumps/branches                              
jump_en              input      1      High         if           current      instruction     is      a      jump/branch  taken
btb_target_pc        input      32     PC           predicted    by           BTB                                         
btb_pc_valid         input      1      High         if           BTB          prediction      is      valid               
btb_pc_predictTaken  input      1      High         if           BTB          predicts        branch  taken               
instruction          output     32     Fetched      instruction  from         memory                                      
pc                   output     3iCurent      PC           value           

Behavior
Program Counter (PC): Maintains current instruction address; updates based on jump/branch, BTB prediction, or increments by 4.
PC Update Logic: Chooses next_pc using priority: jump/branch > BTB prediction > PC + 4.
Instruction Memory: Fetches 32-bit instruction from synchronous memory. Supports flush (sets instruction to NOP).
Branch Target Buffer Integration: If BTB predicts a branch taken and is valid, fetches instruction from btb_target_pc.


basically pc_update.v is a mux with jump_en as s0, logical
and(btb_pc_predictTaken(if branch was predicted taken) and btb_pc_valid (if pred
is valid))

4 inputs are s=00, next_pc=pc+4 
             s=01, next_pc= jump target calculated by BTB 
             s=10, next_pc= jump target for unconditional branch(target
             specified in the instruction itself)

So essentially we know the target of branches, but the conditioal ones have to
go through the BTB to predict branch early.

Notes
Flush logic allows handling of mispredicted branches.
BTB integration improves branch prediction performance.

----------------------------------------------------------------
