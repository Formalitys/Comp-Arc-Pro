module shift_4bit (input [3:0] a, output [3:0] l_shift, r_shift);


// 4-bit Left Shift (multiplication by 2) with zero-fill
assign l_shift = a << 1;

// 4-bit Right Shift (division by 2) with zero-fill
assign r_shift = a >> 1;

endmodule
