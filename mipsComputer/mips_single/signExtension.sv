`ifndef signExtension
`define signExtension

module signExtension (A, B);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [15:0] A;
   output [31:0] B;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   assign B = {{16{A[15]}}, A};
   
endmodule

`endif // leftShift
