module add_1b_test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  reg x = 0;
  reg y = 0;
  reg ci = 0;
  initial begin
     # 10 x = 1;
     # 10 y = 1;
     # 10 ci = 1;
     # 10 y = 0;
     # 10 x = 0;
     # 10 y = 1;
     # 10 ci = 0;
     # 10 $finish;
  end

  wire o;
  wire co;
  add_1b a0 (x, y, ci, o, co);
  
  initial begin
     $dumpfile("add_1b.vcd");
     $dumpvars(0,clk);
     $dumpvars(1,x);
     $dumpvars(2,y);
     $dumpvars(3,ci);
     $dumpvars(4,o);
     $dumpvars(5,co);
  end
  
  initial
     $monitor("At time %t, x(%b) + y(%b) + ci(%b) = o(%b) + co(%b)",
              $time, x, y, ci, o, co);
endmodule // test
