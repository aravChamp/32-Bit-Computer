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
