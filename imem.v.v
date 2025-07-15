module imem(
    input wire clk,
    input wire [31:0] addr,
    output [31:0] rd
);
    reg [31:0] RAM[63:0];  

	initial begin
        $readmemh("riscvtest.txt", RAM);
$display("RAM[0] = %h", RAM[0]);  // Check the first word
$display("RAM[1] = %h", RAM[1]);  // Check the first word 
    end

      assign rd = RAM[addr[31:2]];

 
endmodule


