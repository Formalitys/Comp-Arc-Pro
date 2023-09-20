module shift_4bit (input [3:0] a, input [1:0] shift, output [3:0] l_shift, r_shift);


// 4-bit Left Shift (multiplication by 2) with zero-fill
assign l_shift = a << shift;

// 4-bit Right Shift (division by 2) with zero-fill
assign r_shift = a >> shift;

endmodule
