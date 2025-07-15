module datapath(
    input wire clk, reset,
    input wire[1:0] ResultSrc,
    input wire PCSrc, ALUSrc,
    input wire RegWrite,
    input wire[1:0] ImmSrc,
    input wire[2:0] ALUControl,
    output wire Zero,
    output [31:0] PC,
    input wire[31:0] Instr,
    output [31:0] ALUResult, WriteData,
    input wire [31:0]ReadData,
output [31:0] DataAdr, MemWrite
);
    wire [31:0] PCNext, PCPlus4, PCTarget;
    wire [31:0] ImmExt;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;


   
    floprr pc(clk, reset, PCNext, PC); 
    adder pcadd4(PC, 32'd4, PCPlus4);
    adder pcaddbranch(PC, ImmExt, PCTarget);
    mux2 #(32) pcmux(PCPlus4, PCTarget, PCSrc, PCNext);

assign Result = WriteData;

    
    regfile rf(clk, RegWrite, Instr[19:15], Instr[24:20],
               Instr[11:7], Result, SrcA, SrcB);
    extend ext(Instr[31:7], ImmSrc, ImmExt);

  
    mux2 #(32) srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
    alu alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
    //mux3 #(32) resultmux(ALUResult, ReadData, PCPlus4,
                //ResultSrc, Result);
assign DataAdr = ALUResult;
assign WriteData = (MemWrite) ? ALUResult : 32'b0;
assign MemWrite = (Instr[6:0] == 7'b0100011) ? 1 : 0;

endmodule
