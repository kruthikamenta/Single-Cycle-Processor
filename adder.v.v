module adder(
    input wire [31:0] a, 
    input wire [31:0] b, 
    output [31:0] y
);
    assign y = a + b;
endmodule
