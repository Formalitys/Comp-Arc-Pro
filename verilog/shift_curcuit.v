module shift_4bit (
    input [3:0] input_4bit,
    output [3:0] left_shift, right_shift
);

// 4-bit Left Shift (multiplication by 2) with zero-fill
assign left_shift = input_4bit << 1;

// 4-bit Right Shift (division by 2) with zero-fill
assign right_shift = input_4bit >> 1;

endmodule