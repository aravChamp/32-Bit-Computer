`ifndef ALU32bit
`define ALU32bit

`include "Adder32Bit.sv"
`include "And32Bit.sv"
`include "Or32Bit.sv"
`include "slt32Bit.sv"
`include "Sub32Bit.sv"


module ALU32Bit #(parameter N=32) (input [N-1:0] A, B, input [5:0] instruction, output [N-1:0] out);

    wire [N-1:0] add_result, and_result, or_result, slt_result, sub_result;
    wire [5:0] function_code = instruction[5:0];

    Adder32Bit #(.N(N)) adder (.A(A), .B(B), .S(add_result), .Cout());
    And32Bit #(.N(N)) and_gate (.A(A), .B(B), .S(and_result));
    Or32Bit #(.N(N)) or_gate (.A(A), .B(B), .S(or_result));
    Slt32Bit #(.N(N)) slt (.A(A), .B(B), .S(slt_result));
    Sub32Bit #(.N(N)) subtract (.A(A), .B(~B + 1), .S(sub_result));

    assign out = (instruction[31:26] == 6'b000000) ? 
                 (function_code == 6'b100000) ? add_result :
                 (function_code == 6'b100100) ? and_result :
                 (function_code == 6'b100101) ? or_result :
                 (function_code == 6'b101010) ? slt_result :
                 (function_code == 6'b100010) ? sub_result :
                 32'h0 : 32'h0;

endmodule




`endif // ALU32bit
