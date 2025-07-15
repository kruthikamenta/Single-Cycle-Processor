module alu (
    input wire [31:0] SrcA,
    input wire [31:0] SrcB,
    input wire [2:0] ALUControl,
    output reg [31:0] ALUResult,

    output wire Zero
);

  

    always @(*) begin
        case (ALUControl)
            3'b000: ALUResult = SrcA + SrcB;            // Addition
            3'b001: ALUResult = SrcA - SrcB;            // Subtraction
            3'b010: ALUResult = SrcA & SrcB;            // Bitwise AND
            3'b011: ALUResult = SrcA | SrcB;            // Bitwise OR
            3'b100: ALUResult = SrcA << SrcB[4:0];      // Shift left
            3'b101: ALUResult = SrcA >> SrcB[4:0];      // Logical shift right
            3'b110: ALUResult = $signed(SrcA) >>> SrcB[4:0]; // Arithmetic shift right
            3'b111: ALUResult = SrcA ^ SrcB;            // Bitwise XOR
            default: ALUResult = 32'h0;
        endcase

        end
        assign Zero = (ALUResult == 32'h0);
   

endmodule
