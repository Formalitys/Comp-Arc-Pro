module multiplier_4bit_carry(
    input [3:0] A, B,             // 4-bit multiplicands
    input carry_in,               // 1-bit carry-in
    output reg [7:0] PRODUCT,     // 8-bit product output
    output reg carry_out          // 1-bit carry-out
);

    wire [7:0] raw_product;
    assign raw_product = A * B; // Basic multiplication
    
    always @(*) begin
        PRODUCT = raw_product + {7'b0, carry_in};  // Adding the carry-in to the raw product
        carry_out = PRODUCT[7];                    // MSB is treated as the carry-out
    end

endmodule

