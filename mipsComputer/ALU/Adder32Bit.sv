`ifndef Adder32Bit
`define Adder32Bit

module HalfAdder(A, B, S, Cout);
   // ---------------- PORT DEFINITIONS ----------------
   input A, B;
   output S, Cout;
   
   wire A, B;
   wire S, Cout;
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   xor (S, A, B);
   and (Cout, A, B);
endmodule

module FullAdder(A, B, Cin, S, Cout);
   // ---------------- PORT DEFINITIONS ----------------
   input A, B, Cin;
   output S, Cout;
   wire A, B, Cin;
   wire AplusB, cOut1, cOut2;
   wire S, Cout;
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   HalfAdder lowerHalfAdder (.A(A), .B(B), .S(AplusB), .Cout(cOut1));
   HalfAdder upperHalfAdder (.A(Cin), .B(AplusB), .S(S), .Cout(cOut2));
   or (Cout, cOut1, cOut2);
endmodule

module Adder32Bit #(parameter N=32)(A, B, S, Cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A, B;
   output [N-1:0] S;
   output Cout;
   
   wire [N-1:0] A, B;
   wire [N-1:0] S;
   wire Cout;
   wire [N-2:0] carrys;
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   
   HalfAdder Adder1 (.A(A[0]), .B(B[0]), .S(S[0]), .Cout(carrys[0]));
   
   genvar i;
   
   generate 
    for (i = 1; i < N-1; i = i+1) begin: forloop
        FullAdder adder_i (.A(A[i]), .B(B[i]), .Cin(carrys[i-1]), .S(S[i]), .Cout(carrys[i]));
    end
   endgenerate
   
   FullAdder adder_i (.A(A[N-1]), .B(B[N-1]), .Cin(carrys[N-2]), .S(S[N-1]), .Cout(Cout));
   
endmodule

`endif // Adder32Bit