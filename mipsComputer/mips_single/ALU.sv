`ifndef ALU
`define ALU

 //ALU alu(srca, srcb, alucontrol, Cout, ALUresult, zero);

module ALU #(parameter N=32)(
	input wire [N-1:0] A, 
	input wire [N-1:0] B,
   input wire [2:0] F,
   output wire Cout, 
   output wire [N-1:0] Y,
   output wire zf);
   
   wire [N-1:0] Bnot, BB;
   
   
   wire [N-1:0] andY, orY, sumDiffY, U;
   
   assign Bnot = ~B;
   
   NBitTwoWayMux #(.N(N)) chooseBB (.A(B), .B(Bnot), .S(F[2]), .F(BB));
   
   assign andY = A & BB;
   
   assign orY = A | B;
   
   Adder32Bit #(.N(N)) YSumDiff (.A(A), .B(BB), .cIn(F[2]), .S(sumDiffY), .Cout(Cout));
   
   assign U[N-1:1] = 0;
   assign U[0] = sumDiffY[N-1];
   
   NBitFourWayMux #(.N(N)) muxY (.A(andY), .B(orY), .C(sumDiffY), .D(U), .S(F[1:0]), .F(Y));
   
   assign zf = Y==0; //zero flag
   
endmodule

`endif // ALU
