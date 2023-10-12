///////////////////////////////////////////////////////////////////////////////
//
// dLatch
//
// This module is a dLatch
//
// module: dLatch
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
///////////////////////////////////////////////////////////////////////////////
`ifndef dLatch4
`define dLatch4

`timescale 1ns / 1ps
//`include "srLatch2.sv"

module dLatch4 (D, Clk, R, Q, Qn);

    input D, Clk, R;
    output Q, Qn;
    
    wire D, Clk;
    wire Dn, R, S, R2, R3;
    wire Q, Qn;
    
    srLatch2 srOne (
        .R(R3),
        .S(S),
        .Q(Q),
        .Qn(Qn)
    );
    
    or (R3, R, R2);
    
    and (R2, Clk, Dn);
    
    and (S, Clk, D);
    
    not (Dn, D);

endmodule

`endif 