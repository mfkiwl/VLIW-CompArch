module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module register1bit(input clk,input reset,input regWrite,input decOut1b,input init, input d_in, output q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init,d_in,q_out);
endmodule

module register2bit(input clk,input reset,input regWrite,input decOut1b,input [1:0]init, input [1:0] d_in, output [1:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
endmodule

module register_Mem(input clk,input reset,input regWrite,input decOut1b,input [7:0]init, input [7:0] d_in, output [7:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);

	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);


endmodule
module Instr_Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [31:0] IR );
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,decOut;

	decoder4to16 dec0( pc[4:1], decOut);

	register_Mem r0(clk,reset,memWrite,decOut[0],32'b 0101111010011100_0001110001011101,dataIn,Qout0);
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b 1101011111111111_0100001001101001,dataIn,Qout1);
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b 0101111000100101_0001110001100110,dataIn,Qout2);
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b 0101111000110001_0100000110110010,dataIn,Qout3);

	register_Mem r4(clk,reset,memWrite,decOut[4],32'b 0101011010011110_0001110001011011,dataIn,Qout4);
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b 1110000000000010_0001110001011010,dataIn,Qout5);
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b 1101011100000100_0100000101100010,dataIn,Qout6);
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b 1101011100001010_0001110001111110,dataIn,Qout7);

	register_Mem r8(clk,reset,memWrite,decOut[8],32'b 1101011111110000_0001110001110111,dataIn,Qout8);
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b 0101011011101100_0001110110111111,dataIn,Qout9);
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b 01011111000001_100100000101000111,dataIn,Qout10);
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b 01010110111010_010100000110100100,dataIn,Qout11);

	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 01010110010001_101111111111111111,dataIn,Qout12);
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 00000000000000_000000000000000000,dataIn,Qout13);
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b 00000000000000_000000000000000000, dataIn, Qout14);
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b 00000000000000_000000000000000000,dataIn,Qout15);

	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[4:1],IR);
endmodule

module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [7:0] dataIn,output [7:0] IR );
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,decOut;

	decoder4to16 dec0( pc[4:1], decOut);

	register_Mem r0(clk,reset,memWrite,decOut[0],8'b 1000_01111,dataIn,Qout0); //addi $r8,$r0,15
	register_Mem r1(clk,reset,memWrite,decOut[1],8'b 0101_00101,dataIn,Qout1); //addi $r5,$r0,5
	register_Mem r2(clk,reset,memWrite,decOut[2],8'b 0010_00010,dataIn,Qout2); //addi $r2,$r0,2
	register_Mem r3(clk,reset,memWrite,decOut[3],8'b 0000_00000,dataIn,Qout3); //addi $r0,$r0,0

	register_Mem r4(clk,reset,memWrite,decOut[4],8'b 1000_00000,dataIn,Qout4); //mul $r8,$r8
	register_Mem r5(clk,reset,memWrite,decOut[5],8'b 0000_01001,dataIn,Qout5); //mflo $r9
	register_Mem r6(clk,reset,memWrite,decOut[6],8'b 0101_01010,dataIn,Qout6); //add $r10,$r5,$r5
	register_Mem r7(clk,reset,memWrite,decOut[7],8'b 0100_00100,dataIn,Qout7);  //addi $r4,$r0,4

	register_Mem r8(clk,reset,memWrite,decOut[8],8'b 0101_00000,dataIn,Qout8); //sw $r5,$r0(0)
	register_Mem r9(clk,reset,memWrite,decOut[9],8'b 0010_00000,dataIn,Qout9); //div $r8,$r2
	register_Mem r10(clk,reset,memWrite,decOut[10],8'b 0000_00001,dataIn,Qout10); //mfhi $r1
	register_Mem r11(clk,reset,memWrite,decOut[11],8'b 0000_00111,dataIn,Qout11); //mflo $r7

	register_Mem r12(clk,reset,memWrite,decOut[12],8'b 0000_00000,dataIn,Qout12);	//add $r0,$r0,$r0
	register_Mem r13(clk,reset,memWrite,decOut[13],8'b 0110_00000,dataIn,Qout13); //lw $r6,$r0(0)
	register_Mem r14(clk,reset,memWrite,decOut[14],8'b 0001_00101,dataIn,Qout14); //add $r5,$r5,$r1
	register_Mem r15(clk,reset,memWrite,decOut[15],8'b 0001_00011,dataIn,Qout15); //add $r3,$r2,$r1

	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[4:1],IR);
endmodule

//memory

module D_ff (input clk, input reset, input regWrite1,input regWrite2, input decOut1b,input decOut2b, input d1,input d2, output reg q);
	always @(posedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite1 == 1'b1 && decOut1b==1'b1) begin q=d1; end
		else
		  if(regWrite2 == 1'b1 && decOut2b==1'b1) begin q=d2; end
	end
endmodule

module register32bit( input clk, input reset, input regWrite1,input regWrite2, input decOut1b,input decOut2b, input [31:0] writeData1,input [31:0] writeData2, output  [31:0] outR );
	D_ff d0(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[0], writeData2[0], outR[0]);
	D_ff d1(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[1], writeData2[1], outR[1]);
	D_ff d2(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[2], writeData2[2], outR[2]);
	D_ff d3(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[3], writeData2[3], outR[3]);
	D_ff d4(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[4], writeData2[4], outR[4]);
	D_ff d5(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[5], writeData2[5], outR[5]);
	D_ff d6(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[6], writeData2[6], outR[6]);
	D_ff d7(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[7], writeData2[7], outR[7]);
	D_ff d8(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[8], writeData2[8], outR[8]);
	D_ff d9(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[9], writeData2[9], outR[9]);
	D_ff d10(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[10],writeData2[10], outR[10]);
	D_ff d11(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[11],writeData2[11], outR[11]);
	D_ff d12(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[12],writeData2[12], outR[12]);
	D_ff d13(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[13],writeData2[13], outR[13]);
	D_ff d14(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[14],writeData2[14], outR[14]);
	D_ff d15(clk, reset,regWrite1,regwrite2, decOut1b,decOut2b, writeData1[15],writeData2[15], outR[15]);
  D_ff d16(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[16], writeData2[16], outR[16]);
	D_ff d17(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[17], writeData2[17], outR[17]);
	D_ff d18(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[18], writeData2[18], outR[18]);
	D_ff d19(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[19], writeData2[19], outR[19]);
	D_ff d20(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[20], writeData2[20], outR[20]);
	D_ff d21(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[21], writeData2[21], outR[21]);
	D_ff d22(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[22], writeData2[22], outR[22]);
	D_ff d23(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[23], writeData2[23], outR[23]);
	D_ff d24(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[24], writeData2[24], outR[24]);
	D_ff d25(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[25],writeData2[25], outR[25]);
	D_ff d26(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[26],writeData2[26], outR[26]);
	D_ff d27(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[27],writeData2[27], outR[27]);
	D_ff d28(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[28],writeData2[28], outR[28]);
	D_ff d29(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[29],writeData2[29], outR[29]);
	D_ff d30(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[30],writeData2[30], outR[30]);
	D_ff d31(clk, reset, regWrite1,regwrite2, decOut1b,decOut2b, writeData1[31],writeData2[31], outR[31]);
endmodule

module registerSet( input clk, input reset, input regWrite1,input regWrite2 ,input [7:0] decOut1,
  input [7:0] decOut2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR0,
  output [31:0] outR1,output [31:0] outR2,output [31:0] outR3,output [31:0] outR4,output [31:0] outR5,
  output [31:0] outR6,output [31:0] outR7 );
		register32bit r0 (clk, reset, 1'b0     ,1'b0     , decOut1[0] , decOut2[0] , writeData1 ,writeData2, outR0 );
		register32bit r1 (clk, reset, regWrite1,regWrite2, decOut1[1] , decOut2[1] , writeData1 ,writeData2, outR1 );
		register32bit r2 (clk, reset, regWrite1,regWrite2, decOut1[2] , decOut2[2] , writeData1 ,writeData2, outR2 );
		register32bit r3 (clk, reset, regWrite1,regWrite2, decOut1[3] , decOut2[3] , writeData1 ,writeData2, outR3 );
		register32bit r4 (clk, reset, regWrite1,regWrite2, decOut1[4] , decOut2[4] , writeData1 ,writeData2, outR4 );
		register32bit r5 (clk, reset, regWrite1,regWrite2, decOut1[5] , decOut2[5] , writeData1 ,writeData2, outR5 );
		register32bit r6 (clk, reset, regWrite1,regWrite2, decOut1[6] , decOut2[6] , writeData1 ,writeData2, outR6 );
		register32bit r7 (clk, reset, regWrite1,regWrite2, decOut1[7] , decOut2[7] , writeData1 ,writeData2, outR7 );
	endmodule

module decoder3to8(input [2:0] destReg, output reg [7:0] decOut);
	always@(destReg)
	case(destReg)
			3'b000: decOut=8'b00000001;
			3'b001: decOut=8'b00000010;
			3'b010: decOut=8'b00000100;
			3'b011: decOut=8'b00001000;
			3'b100: decOut=8'b00010000;
			3'b101: decOut=8'b00100000;
			3'b110: decOut=8'b01000000;
			3'b111: decOut=8'b10000000;
	endcase
endmodule

module mux8to1( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7, input [2:0] Sel, output reg [31:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or Sel)
	case (Sel)
				3'b000: outBus=outR0;
				3'b001: outBus=outR1;
				3'b010: outBus=outR2;
				3'b011: outBus=outR3;
				3'b100: outBus=outR4;
				3'b101: outBus=outR5;
				3'b110: outBus=outR6;
				3'b111: outBus=outR7;

	endcase
endmodule

module registerFile(input clk, input reset, input RregWrite,input SregWrite,input [2:0] Rm, input [2:0] Rn,
		input [2:0] Rd,  input [31:0] RwriteData,input [2:0] Sm, input [2:0] Sn, input [2:0] Sd,
		input [31:0] SwriteData, output [31:0] RmoutBus, output [31:0] RnoutBus, output [31:0] RdoutBus, output [31:0] SmoutBus,
		output [31:0] SnoutBus,output [31:0] SdoutBus );
	wire [7:0] RdecOut;
	wire [7:0] SdecOut;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;

	decoder3to8 dec0 (Rd,RdecOut);
	decoder3to8 dec1 (Sd,SdecOut);

	registerSet RegSet(clk,reset,RregWrite,SregWrite, RdecOut,SdecOut,RwriteData,SwriteData,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7 );

	mux8to1 m1(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Rm,RmoutBus);
	mux8to1 m2(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Rd,RdoutBus);
	mux8to1 m6(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Rn,RnoutBus);
	mux8to1 m3(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Sm,SmoutBus);
	mux8to1 m4(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Sn,SnoutBus);
	mux8to1 m5(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,Sd,SdoutBus);

endmodule
//Register File Design Ends
