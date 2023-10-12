`timescale 1ns / 1ps
`include "ThirtyTwoBitRegisterFile.sv"

module ThirtyTwoBitRegisterFile_tb;

    reg [31:0] D;
    reg r, Clk, En;
	reg [4:0] addy;
	reg [4:0] addy2, addy3;
    wire [31:0] Q1, Qn, Q2;
	
	reg [5:0] count;
    
    initial
        $monitor ("D = %d, Clk = %b, addy = %b, addy2 = %b, addy3 = %b, Q1 = %b, Q2 = %b", D, Clk, addy, addy2, addy3, Q1, Q2);
    
    initial
    begin
    
        #0
		r = 1;
		
		#10
		r = 0;
		En = 1;
        D = 7;
		addy = 1;
		addy2 = 1;
		addy3 = 1;
        Clk = 1'b0;
		
		for (count = 0; count <= 31; count = count + 1) begin
   			
			#10
			En = 1;
        	D = count;
			addy = count;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = count;
			addy = count;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b1;
   		end
		
		#10
			En = 1;
        	D = 2147483647;
			addy = 1;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = 2147483647;
			addy = 1;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b1;
			
			#10
			En = 1;
        	D = -2147483648;
			addy = count;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = -2147483648;
			addy = count;
			addy2 = count;
			addy3 = 1;
        	Clk = 1'b1;
		
        
    end
    
    initial
    begin
        $dumpfile("waveForm.vcd");
        
        $dumpvars(1, regF);
    end
    
	ThirtyTwoBitRegisterFile regF (
		.R(r),
		.WriteReg(addy), 
		.WriteEn(En), 
		.Clock(Clk), 
		.WriteData(D),
		.ReadReg1(addy2),
		.ReadData1(Q1),
		.ReadReg2(addy3),
		.ReadData2(Q2)
	);

endmodule