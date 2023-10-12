///////////////////////////////////////////////////////////////////////////////
//
// Full Adder
//
// This module is a full adder with carry in function built with half adders
//
// module: FullAdder
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
///////////////////////////////////////////////////////////////////////////////

`ifndef FullAdder
`define FullAdder

//`include "HalfAdder.sv"

module FullAdder(input wire A, 
					input wire B, 
					input wire Cin, 
					output wire S, 
					output wire Cout);
   
   assign {Cout, S} = A + B + Cin;
   
   
endmodule

`endif // HalfAdder