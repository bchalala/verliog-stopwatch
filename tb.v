`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:01 10/28/2015
// Design Name:   time_counter
// Module Name:   C:/Users/152/Broah/lab3/stopwatch/tb.v
// Project Name:  stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg rst;
	reg clk;
  reg back = 1;

	// Outputs
	wire ovf;
	wire [2:0] high_val;
	wire [3:0] low_val;
  
  
  always #500000000 clk = ~clk;
  
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
    
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
  
  	// Instantiate the Unit Under Test (UUT)
	time_counter uut (
		.rst(rst), 
		.clk(clk), 
		.ovf(ovf), 
		.high_val(high_val), 
		.low_val(low_val),
    .back(back)
	);
      
      
endmodule

