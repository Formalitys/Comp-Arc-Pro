`timescale 1ns / 1ps

module alu_testbench;

    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALU_Sel;
    reg CarryIn;

    // Outputs
    wire [31:0] ALU_Out;
    wire CarryOut;

    // Instantiate the ALU module
    32BitALU uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .CarryIn(CarryIn), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut)
    );

    // Test scenarios
    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        ALU_Sel = 0;
        CarryIn = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Initialize VCD output
        $dumpfile("alu_waveform.vcd");
        $dumpvars(0, alu_testbench);

        // Test case 1: Addition
        A = 32'h0000000F; // 15 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b0000; // Addition operation
        CarryIn = 0;
        #10; // Wait for 10ns

        // Test case 2: Subtraction
        A = 32'h00000010; // 16 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b0001; // Subtraction operation
        #10; // Wait for 10ns

        // Test case 3: Multiplication
        A = 32'h00000003; // 3 in hex
        B = 32'h00000002; // 2 in hex
        ALU_Sel = 4'b0010; // Multiplication operation
        #10; // Wait for 10ns

        // Test case 4: Division
        A = 32'h00000010; // 16 in hex
        B = 32'h00000002; // 2 in hex
        ALU_Sel = 4'b0011; // Division operation
        #10; // Wait for 10ns

        // Test case 5: Logical shift left
        A = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b0100; // Shift left operation
        #10; // Wait for 10ns

        // Test case 6: Logical shift right
        A = 32'h00000002; // 2 in hex
        ALU_Sel = 4'b0101; // Shift right operation
        #10; // Wait for 10ns

        // Test case 7: Logical AND
        A = 32'h0000000F; // 15 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b1000; // AND operation
        #10; // Wait for 10ns

        // Test case 8: Logical OR
        A = 32'h0000000E; // 14 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b1001; // OR operation
        #10; // Wait for 10ns

        // Test case 9: Logical XOR
        A = 32'h0000000F; // 15 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b1010; // XOR operation
        #10; // Wait for 10ns

        // Test case 10: Logical NOR
        A = 32'h0000000F; // 15 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b1011; // NOR operation
        #10; // Wait for 10ns

        // Test case 11: Logical NAND
        A = 32'h0000000F; // 15 in hex
        B = 32'h00000001; // 1 in hex
        ALU_Sel = 4'b1100; // NAND operation
        #10; // Wait for 10ns

        // Test case 12: Logical XNOR
        A = 32'h0000000F; // 15 in hex
        B = 32'h0000000F; // 15 in hex
        ALU_Sel = 4'b1101; // XNOR operation
        #10; // Wait for 10ns

        // End the simulation
        $finish;
    end
      
endmodule
