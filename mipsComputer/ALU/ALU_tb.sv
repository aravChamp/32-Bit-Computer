module ALU32Bit_tb;

    parameter N = 32;
    reg [N-1:0] A, B;
    reg [5:0] opcode;
    wire [N-1:0] out;

    ALU32Bit #(.N(N)) dut(.A(A), .B(B), .opcode(opcode), .out(out));

    initial begin
        $monitor("A=%d, B=%d, opcode=%d, out=%d", A, B, opcode, out);
        
        A = 10; B = 5; opcode = 6'b100000;
        #5;
        
        A = 10; B = 5; opcode = 6'b100100;
        #5;

        A = 10; B = 5; opcode = 6'b100101;
        #5;

        A = 10; B = 5; opcode = 6'b101010;
        #5;

        A = 10; B = 5; opcode = 6'b100010;
        #5;
        
        $finish;
    end
    
endmodule
