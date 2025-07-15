module top1(
    input wire clk, reset,
    output [31:0] WriteData, DataAdr,
    output MemWrite
);
    wire [31:0] PC, Instr, ReadData;
 wire MemRead;
 
    riscvsingle rvsingle(
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr),
        .MemWrite(MemWrite),
	.MemRead(MemRead),
        .DataAdr(DataAdr),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

  
    imem imem(
	.clk(clk),
        .addr(PC),         
        .rd(Instr)      
    );

    
    dmem dmem(
        .clk(clk),         
        .MemWrite(MemWrite),     
        .addr(DataAdr),   
        .WriteData(WriteData),
        .ReadData(ReadData),
	.MemRead(MemRead)
    );

endmodule
