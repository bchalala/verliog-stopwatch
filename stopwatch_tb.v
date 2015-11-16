`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:39 11/02/2015
// Design Name:   stopwatch
// Module Name:   C:/Users/152/Broah/lab3/stopwatch/stopwatch_tb.v
// Project Name:  stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stopwatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stopwatch_tb;

	// Inputs
	reg clk;
	reg btnS;
	reg btnR;
	reg [2:0] sw;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;
  
  always #5 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	stopwatch uut (
		.clk(clk), 
		.btnS(btnS), 
		.btnR(btnR), 
		.sw(sw), 
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btnS = 0;
		btnR = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

