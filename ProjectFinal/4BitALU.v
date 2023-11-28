module alu(
    input [3:0] A, B,  // ALU 4-bit Inputs
    input [3:0] ALU_Sel, // ALU Operation Selection
    input CarryIn, // Carry-In Input for add, sub, and mul
    output [3:0] ALU_Out, // ALU 4-bit Output
    output reg CarryOut // Carry Out Flag
);
    reg [3:0] ALU_Result;
    wire [4:0] add_sub_tmp; // Temporary result for add/sub with carry

    assign ALU_Out = ALU_Result; // Connect the result to ALU output
    assign add_sub_tmp = (ALU_Sel == 4'b0000) ? ({1'b0, A} + {1'b0, B} + CarryIn) :
                                             ({1'b0, A} - {1'b0, B} - CarryIn);

    always @(*) begin
        case(ALU_Sel)
            4'b0000: // Addition
                {CarryOut, ALU_Result} = add_sub_tmp;
            4'b0001: // Subtraction
                {CarryOut, ALU_Result} = add_sub_tmp;
            4'b0010: // Multiplication
                // For simplicity, carry in and carry out are ignored for multiplication
                // Note: Multiplication result can be larger than 4 bits
                ALU_Result = A * B; 
            4'b0011: // Division
                // Division does not use carry in and carry out
                ALU_Result = A / B;
            4'b0100: // Logical shift left
                ALU_Result = A << 1;
            4'b0101: // Logical shift right
                ALU_Result = A >> 1;
            4'b1000: // Logical AND 
                ALU_Result = A & B;
            4'b1001: // Logical OR
                ALU_Result = A | B;
            4'b1010: // Logical XOR 
                ALU_Result = A ^ B;
            4'b1011: // Logical NOR
                ALU_Result = ~(A | B);
            4'b1100: // Logical NAND 
                ALU_Result = ~(A & B);
            4'b1101: // Logical XNOR
                ALU_Result = ~(A ^ B);
            default: 
                // Default case, use addition as default
                {CarryOut, ALU_Result} = add_sub_tmp;
        endcase
    end
endmodule