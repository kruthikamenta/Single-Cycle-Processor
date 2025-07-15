module dmem(
    input wire [31:0] addr,
    input wire [31:0] WriteData,
    output reg [31:0] ReadData,  // Changed to 'output reg'
    input wire MemWrite,
    input wire MemRead,
    input wire clk
);
    reg [31:0] memory [0:1023];  // 1KB memory

    // Write operation
    always @(posedge clk) begin
        if (MemWrite) begin
            memory[addr[31:2]] <= WriteData;  // Write data to memory
        end
    end

    // Read operation
    always @(*) begin
        if (MemRead) begin
            ReadData = memory[addr[31:2]];  // Read data from memory
        end else begin
            ReadData = 32'b0;  // High impedance when MemRead is low
        end
    end

endmodule


