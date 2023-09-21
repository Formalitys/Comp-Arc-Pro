module nand_gate_test;			//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg a = 0;				//inputs
  reg b = 0;
  initial begin				//load new values
    # 10 a = 1;				//every 10 nano
    # 10 b = 1;				//seconds
    # 10 a = 0;
    # 10 $finish;
  end
  
  wire y;				//output
  nand_gate a0(a, b, y);		//call for gate module
  
  initial begin				//code for gtkwave
    $dumpfile("nand_gate.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,a);
    $dumpvars(2,b);
    $dumpvars(3,y);
  end
  
  initial				//prints to screen when values change
    $monitor("At time %t, a(%b), b(%b) = y(%b)",  
    		$time, a, b, y);
endmodule //test
