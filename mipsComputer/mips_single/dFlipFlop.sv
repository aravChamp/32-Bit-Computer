`timescale 1ns / 1ps

`ifndef dFlipFlop
`define dFlipFlop


//`include "dLatch4.sv"

//(D1, Clk, R, Q2, Qn2)

module dFlipFlop (input wire D1, Clk, R,
		output reg Q2, Qn2);
		
	always_ff @(posedge Clk, posedge R)
	if (R) begin
		Q2 <= 0;
		Qn2 <= ~Q2;
	end else begin
		Q2 <= D1;
		Qn2 <= ~Q2;
	end
	
endmodule

`endif 
