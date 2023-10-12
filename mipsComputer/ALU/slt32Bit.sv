`ifndef slt32Bit
`define slt32Bit

module slt32Bit(
    input [31:0] a,
    input [31:0] b,
    output reg out
);
  
  assign out = (a < b) ? 1'b1 : 1'b0;

endmodule


`endif