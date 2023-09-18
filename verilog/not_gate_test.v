module not_gate_test;
reg a;
wire y;

not_gate uut(a,y);

initial begin
a = 0;
#10
b = 1;
#10
$finish();
end
                
endmodule