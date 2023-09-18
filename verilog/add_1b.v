module add_1b(x, y, ci, o, co);

  output o, co;
  input x, y, ci;

  wire x, y, ci, o, co;

  assign o = x ^ y ^ ci;

  assign co = (x & y) | (x & ci) | (y & ci);

endmodule
