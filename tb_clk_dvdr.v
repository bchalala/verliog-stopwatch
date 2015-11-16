`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:38 10/28/2015
// Design Name:   clockdivider
// Module Name:   C:/Users/152/Broah/lab3/stopwatch/tb_clk_dvdr.v
// Project Name:  stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clockdivider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_clk_dvdr;

	// Inputs
	reg rst;
	reg clk;
	reg pause;

	// Outputs
	wire onehz;
	wire twohz;
  wire fivehundhz;



  always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		pause = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
  
  	// Instantiate the Unit Under Test (UUT)
	clockdivider uut (
		.rst(rst), 
		.clk(clk), 
		.pause(pause), 
		.onehz(onehz), 
		.twohz(twohz),
    .fivehundhz(fivehundhz)
	);
      
endmodule

