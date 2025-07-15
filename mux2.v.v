module mux2 #(parameter WIDTH = 32) 
(
    input wire [WIDTH-1:0] a,    // Input a
    input wire [WIDTH-1:0] b,    // Input b
    input wire sel,              // Selector
    output [WIDTH-1:0] y    // Output y
);

    assign y = sel ? b : a;

endmodule
