module not_gate_test;			//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg a = 0;				//inputs
  initial begin				//load new values
    # 10 a = 1;				//every 10 nano	
    # 10 $finish;			//seconds
  end
  
  wire y;				//output
  not_gate a0(a, y);			//call for gate module
  
  initial begin				//code for gtkwave
    $dumpfile("not_gate.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,a);
    $dumpvars(2,y);
  end
  
  initial
    $monitor("At time %t, a(%b)= y(%b)", 	//prints to screen
				$time, a, y);   //when any value changes
endmodule //test
