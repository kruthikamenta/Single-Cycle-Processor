module maindec(input [6:0] opcode,
               output [1:0] ResultSrc,
               output MemWrite, MemRead,
               output Branch, ALUSrc,
               output RegWrite, Jump,
               output [1:0] ImmSrc,
               output [1:0] ALUOp);

    reg [10:0] controls;

    assign {RegWrite, ImmSrc, ALUSrc, MemWrite, MemRead,
            ResultSrc, Branch, ALUOp, Jump} = controls;

    always @(*) begin
        case(opcode)
            // RegWrite_ImmSrc_ALUSrc_MemWrite_MemRead_ResultSrc_Branch_ALUOp_Jump
            7'b0000011: controls = 12'b1_00_1_0_1_01_0_00_0; // lw
            7'b0100011: controls = 12'b0_01_1_1_0_00_0_00_0; // sw
            7'b0110011: controls = 12'b1_xx_0_0_0_00_0_10_0; // R-type
            7'b1100011: controls = 12'b0_10_0_0_0_00_1_01_0; // beq
            7'b0010011: controls = 12'b1_00_1_0_0_00_0_10_0; // I-type ALU
            7'b1101111: controls = 12'b1_11_0_0_0_10_0_00_1; // jal
            default: controls = 12'bx_xx_x_x_x_xx_x_xx_x; // unknown instruction
        endcase
    end
endmodule
