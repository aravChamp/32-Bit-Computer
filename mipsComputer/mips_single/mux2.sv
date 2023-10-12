`ifndef mux2
`define mux2

module mux2 #(parameter N=32)(A, B, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [N-1:0] A, B;
   input wire S;
   wire [N-1:0] Sn, AS, BS;
   output wire [N-1:0] F;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   genvar i;
   
   generate
    for (i = 0; i < N; i = i + 1) begin
        
        not n_i (Sn[i], S);
        and a1_i (AS[i], Sn[i], A[i]);
        and a2_i (BS[i], S, B[i]);
        or o2_i (F[i], AS[i], BS[i]);
    
        //and g_i (F[i], A[i], B[i]);
    end
   endgenerate

endmodule

`endif 
