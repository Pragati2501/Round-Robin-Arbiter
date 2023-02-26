`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:10 02/26/2023
// Design Name:   round_robin_arbiter
// Module Name:   C:/Users/DELL/Documents/newbie/round_robin_arbiter/round_robin_arbiter_tb.v
// Project Name:  round_robin_arbiter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: round_robin_arbiter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module round_robin_arbiter_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] REQ;

	// Outputs
	wire [3:0] GNT;

	// Instantiate the Unit Under Test (UUT)
	round_robin_arbiter uut (
		.clk(clk), 
		.rst(rst), 
		.REQ(REQ), 
		.GNT(GNT)
	);
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		REQ = 4'b0;
		#5 rst = 1;
		@(negedge clk) REQ = 4'b1000;
		@(negedge clk) REQ = 4'b1010;
		@(negedge clk) REQ = 4'b0010;
		@(negedge clk) REQ = 4'b0110;
		@(negedge clk) REQ = 4'b1110;
		@(negedge clk) REQ = 4'b1111;
		@(negedge clk) REQ = 4'b0100;
		@(negedge clk) REQ = 4'b0010;
		#5 rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

