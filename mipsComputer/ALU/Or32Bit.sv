`ifndef And32Bit
`define And32Bit
 

module AND32bit (
  input wire [31:0] A,
  input wire [31:0] B,
  output wire [31:0] Out,
);


assign Out = A || B;

endmodule


`endif