module controller(
    input wire [6:0] opcode,            
    input wire [2:0] funct3,        
    input wire funct7b5,            
    input wire Zero,                
    output [1:0] ResultSrc,   
    output MemWrite,   
	output MemRead,       
    output PCSrc,              
    output ALUSrc,             
    output RegWrite,          
    output Jump,               
    output [1:0] ImmSrc,       
    output [2:0] ALUControl   
);

   
    wire [1:0] ALUOp;          
    wire Branch;             

    
    maindec md (
        .opcode(opcode), 
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
	.MemRead(MemRead),
        .Branch(Branch), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .Jump(Jump), 
        .ImmSrc(ImmSrc), 
        .ALUOp(ALUOp)
    );

    aludec ad (opcode[5], funct3, funct7b5, ALUOp, ALUControl); 
    

   
    assign PCSrc = (Branch & Zero) | Jump;

endmodule

