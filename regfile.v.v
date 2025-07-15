module regfile (
    input wire clk,
    input wire RegWrite,
    input wire [4:0] rs1_addr,
    input wire [4:0] rs2_addr,
    input wire [4:0] rd_addr,
    input wire [31:0] WriteData,
    output wire [31:0] rs1_data,
    output wire [31:0] rs2_data
);

    reg [31:0] registers [0:31]; // Array of 32 registers

    // Read data from the registers
    assign rs1_data = registers[rs1_addr];
    assign rs2_data = registers[rs2_addr];

    // Write data to the registers
    always @(posedge clk) begin
        if (RegWrite && rd_addr != 0) begin // Prevent writing to register 0
            registers[rd_addr] <= WriteData;
        end
    end

    // Initialize registers to 0
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] = 32'h00000000;
        end
    end 
endmodule
