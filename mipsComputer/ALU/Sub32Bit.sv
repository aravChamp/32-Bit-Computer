`ifndef Sub32Bit
`define Sub32Bit

`include "Adder32Bit.sv"

module Sub32Bit(A, B, S, Bout);

   // ---------------- PORT DEFINITIONS ----------------
   
   input [31:0] A, B;
   output [31:0] S;
   output Bout;
   
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   
   wire [31:0] invB;
   
   // Invert the second operand
   assign invB = ~B + 1;
   
   // Pass the operands and inverted second operand to the adder
   Adder32Bit adder (.A(A), .B(invB), .S(S), .Cout(Bout));
   
endmodule


`endif