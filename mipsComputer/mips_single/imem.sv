`ifndef imem
`define imem

///////////////////////////////////////////////////////////////////////////////
//
// instruction memory
//
// This module is an instruction memory
//
// module: instruction memory
// hdl: Verilog
//
// author: Lei(Raymond) Chi <lei.chi@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module imem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 32, parameter r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(r-1):0] addr,
    output logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[0:(2**r-1)];

  initial
    begin
      // read memory in hex format from file 
      $readmemh("memfile.dat",RAM);
    end

  assign readdata = RAM[addr]; // word aligned

endmodule


`endif 