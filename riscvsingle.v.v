module riscvsingle(
    input wire clk, reset,
    output wire [31:0] PC,
    input wire [31:0] Instr,
    output wire MemWrite, MemRead,
    output wire [31:0] DataAdr,
    output wire [31:0] WriteData,
    input wire [31:0] ReadData
);

   wire Zero;
   wire [1:0] ResultSrc , ImmSrc;
   wire PCSrc , ALUSrc , RegWrite;
   wire [2:0] ALUControl;
   wire [31:0] ALUResult;

    // Instantiate controller
    controller c(
        .opcode(Instr[6:0]), 
        .funct3(Instr[14:12]), 
        .funct7b5(Instr[30]), 
        .Zero(Zero),
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
	.MemRead(MemRead),
        .PCSrc(PCSrc),
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .Jump(Jump),
        .ImmSrc(ImmSrc), 
        .ALUControl(ALUControl)
    );

    // Instantiate datapath
    datapath dp(
        .clk(clk), 
        .reset(reset), 
        .ResultSrc(ResultSrc), 
        .PCSrc(PCSrc),
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc), 
        .ALUControl(ALUControl),
        .Zero(Zero), 
        .PC(PC), 
        .Instr(Instr),
        .ALUResult(ALUResult), 
        .WriteData(WriteData), 
        .ReadData(ReadData),
	.DataAdr(DataAdr),
	.MemWrite(MemWrite)
    );

assign DataAdr = ALUResult;

endmodule
