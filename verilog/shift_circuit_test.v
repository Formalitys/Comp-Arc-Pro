module shift_circuit_tb;		//module name

  /* Make a regular pulsing clock. */	//tracks every 5 ns
  reg clk = 0;
  always #5 clk = !clk;			//every 5 ns clk either 1 or 0S
  
  reg [3:0] a;				//inputs
  reg [1:0] shift;

  initial begin				//load new values
    	 a = 4'b0010; shift = 2'b00;	//every 10 nano
    # 10 a = 4'b1000; shift = 2'b01;	//seconds
    # 10 a = 4'b1111; shift = 2'b10;
    # 10 a = 4'b1001; shift = 2'b11;
    # 10 $finish;
  end

  wire [3:0]l_shift;				//outputs
  wire [3:0]r_shift;
  
  shift_4bit a0(a, shift, l_shift, r_shift);  //call for gate module
  
  initial begin				//code for gtkwave
    $dumpfile("shift_circuit.vcd");
    $dumpvars(0,clk);
    $dumpvars(1,a);
    $dumpvars(2,l_shift);
    $dumpvars(3,r_shift);
    $dumpvars(4,shift);
  end

  initial 				//prints to screen when values change
    $monitor("At time %t, a(%b) << l_shift(%b) = (%b), a(%b) >> r_shift(%b) = (%b)",  
    		$time, a, shift, l_shift, a, shift, r_shift);   
 									
endmodule //test
