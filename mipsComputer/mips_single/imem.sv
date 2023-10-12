`ifndef imem
`define imem

module imem

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

      $readmemh("memfile.dat",RAM);
    end

  assign readdata = RAM[addr]; // word aligned

endmodule


`endif 
