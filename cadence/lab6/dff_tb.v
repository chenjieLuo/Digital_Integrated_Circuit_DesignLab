/*****************************************************************
 Design Name 	: dff_tb
 File Name 	: dff_tb.v
 Function	: Testbench code for D-Flip-flop module 
******************************************************************/

module dff_tb();

// Input signal declaration
reg clk, reset;
reg[3:0] d;
wire [3:0] q;

// Code starts here
initial begin
reset = 0;
clk = 0;
d = 4'b0000;
#5 reset = 1;
#10 
clk = 1;
d = 4'b1110;
end

// Clock generation

// Instance
dff dff_1(clk, reset, d, q);

endmodule // End of dff_tb

