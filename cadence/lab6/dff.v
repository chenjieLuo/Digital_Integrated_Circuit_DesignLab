/*****************************************************************
 Design Name 	: dff
 File Name 	: dff.v
 Function	: D-Flip-flop design with 
                  positive edge triggered reset and clock signals
******************************************************************/

module dff (
	clk	, // clock signal (positive edge triggered)
	reset	, // reset signal (positive edge triggered)
	d	, // input D
	q	  // output Q
	);

// Input declaration
input clk, reset, d;
// Output declaration
output q;

// Output should be also declared as reg type
reg[3:0]	q;

// Code starts here
always @(posedge clk or posedge reset)
begin
	if (reset)
		q <= 0;
	else
		q <= d;
end

endmodule // End of dff

