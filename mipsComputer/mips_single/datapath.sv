///////////////////////////////////////////////////////////////////////////////
//
// datapath
//
// This module is an datapath
//
// module: datapath 
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef datapath
`define datapath

//`include "ALU.sv"
//`include "Adder32Bit.sv"
//`include "mux2.sv"
//`include "shiftLeft.sv"
//`include "programCounter.sv"
//`include "ThirtyTwoBitRegisterFile.sv"
//`include "signExtension.sv"
//`include "nBitRegister.sv"

module datapath(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, ALUresult, writedata, readdata);
        input wire clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
        input wire [2:0] alucontrol;
        output wire zero; 
        output wire [31:0] pc;
        input wire [31:0] instr;
        output wire [31:0] ALUresult, writedata;
        input wire [31:0] readdata;
        
        //output wire [1023:0] Q;

        //wire cIn; 
        wire Cout;

    wire [4:0] writereg;
    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    wire [31:0] signimm, signimmsh;
    wire [31:0] srca, srcb;
    wire [31:0] result;

  //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //


    programCounter  pcreg(reset, pc, pcnext, clk);
    Adder32Bit #(32)    pcadd1(pc, 32'b100, 1'b0, pcplus4, Cout);
    shiftLeft   immsh(signimm, signimmsh);
    Adder32Bit #(32)      pcadd2(pcplus4, signimmsh, 1'b0, pcbranch, Cout);
    mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);

                                
    //ThirtyTwoBitRegisterFile    rf(reset, instr[25:21], regwrite,clk, result, instr[20:16], srca, writereg, writedata);  
    regfile rf (clk, regwrite, instr[25:21], instr[20:16], writereg, result, srca, writedata); 
    mux2 #(5)   wrmux(instr[20:16], instr[15:11], regdst, writereg);
    mux2 #(32)  resmux(ALUresult, readdata, memtoreg, result);
    signExtension   se(instr[15:0], signimm);
    mux2 #(32)  srcbmux(writedata, signimm, alusrc, srcb);
    ALU alu(srca, srcb, alucontrol, Cout, ALUresult, zero);

endmodule

`endif 