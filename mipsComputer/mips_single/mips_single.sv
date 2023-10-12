`include "dataMemory.sv"
`include "imem.sv"
`include "MIPSprocessor.sv"
`include "dmem.sv"
`include "ControlUnit.sv"
`include "muxes.sv"
`include "decoders.sv"
`include "datapath.sv"
`include "nBitRegister.sv"
`include "Adder32Bit.sv"
`include "AluDecoder.sv"
`include "MainDecoder.sv"
`include "dFlipFlop.sv"
`include "mux2.sv"
`include "programCounter.sv"
`include "regfile.sv"
`include "shiftLeft.sv"
`include "signExtension.sv"
`include "ALU.sv"
`include "FullAdder.sv"

module testbench();
    logic clk; 
    logic reset;
    wire [31:0] writedata, dataadr; 
    wire memwrite;

    top dut (.clk(clk), .reset(reset), .writedata(writedata), .dataadr(dataadr), .memwrite(memwrite));



    // initial 

    // $monitor("writedata=%d, dataadr=%d, memwrite=%d",writedata, dataadr, memwrite);

    initial begin
        reset <= 1; #22;
        reset <= 0; #22;
    end

    always begin
        clk <= 1; #5;
        clk <= 0; #5;
    end

        
    always @(negedge clk) begin
        if (memwrite) begin
            if (dataadr == 84 && writedata == 7) begin 
                $display("Simulation succeeded"); 
                $stop;
            end else if (dataadr != 80) begin 
                $display("Simulation failed"); 
                $stop;
            end 
        end
    end 
endmodule

module top (input wire clk, reset,
            output wire [31:0] writedata, dataadr,
            output wire memwrite ); 
        
        
        wire [31:0] pc, instr, readdata;

    MIPSprocessor mips(clk, reset, pc, instr, memwrite, dataadr,writedata, readdata); 
    imem imem(pc[7:2], instr);
    //dataMemory dmem(rest, clk, memwrite, dataadr, writedata, readdata); 
    dmem dmem(clk, memwrite, dataadr, writedata, readdata); 



endmodule