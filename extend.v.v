module extend(
    input wire [24:0] instr,
    input wire [1:0] ImmSrc,
    output reg [31:0] ImmExt
);

    always @(*) begin
        case (ImmSrc)
            2'b00: ImmExt = {{20{instr[24]}}, instr[24:13]};  // Example for I-type immediate
            2'b01: ImmExt = {{20{instr[24]}}, instr[24:18], instr[4:0]};  // Example for S-type
            2'b10: ImmExt = {{19{instr[24]}}, instr[24], instr[0], instr[23:19], instr[18:13]};  // Example for B-type
            default: ImmExt = 32'b0;
        endcase
    end
endmodule

