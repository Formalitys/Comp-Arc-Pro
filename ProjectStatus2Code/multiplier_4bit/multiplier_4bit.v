module multiplier_4bit(
    input [3:0] A, B,
    output [7:0] PRODUCT
);

    assign PRODUCT = A * B;

endmodule
