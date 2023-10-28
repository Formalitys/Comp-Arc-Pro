module multiplier_4bit_tb;

    reg clk = 0; // 5 ns clock
    always #5 clk = !clk;

    reg [3:0] A = 0;
    reg [3:0] B = 0;

    wire [7:0] PRODUCT;

    multiplier_4bit uut (.A(A), .B(B), .PRODUCT(PRODUCT));

    initial begin
        #10 A = 4'b0011;
        #10 B = 4'b0010;
        #10 A = 4'b0001;
             B = 4'b0111;
        #10 A = 4'b0011;
             B = 4'b0011;
        #10 $finish;
    end

    initial begin
        $dumpfile("multiplier_4bit.vcd");
        $dumpvars(0,clk);
        $dumpvars(1,A);
        $dumpvars(2,B);
        $dumpvars(3,PRODUCT);
    end

    initial 
        $monitor("At time %t, A(%b), B(%b) = PRODUCT(%b)", 
                 $time, A, B, PRODUCT);

endmodule
