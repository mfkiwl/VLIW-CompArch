module D_ff_reg (input clk, input reset, input regWrite , input decOut1b, input d, output reg q);
	always @ (posedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
		end
endmodule

module register1bit_pipe( input clk, input reset, input regWrite, input decOut1b, input writeData, output outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData, outBus);
endmodule

module register2bit_pipe( input clk, input reset, input regWrite, input decOut1b, input [1:0] writeData, output  [1:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
endmodule

module register3bit_pipe( input clk, input reset, input regWrite, input decOut1b, input [2:0] writeData, output  [2:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
  D_ff_reg d2(clk, reset, regWrite, decOut1b, writeData[2], outBus[2]);
endmodule

module register7bit_pipe( input clk, input reset, input regWrite, input decOut1b, input [6:0] writeData, output  [6:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
  D_ff_reg d2(clk, reset, regWrite, decOut1b, writeData[2], outBus[2]);
  D_ff_reg d3(clk, reset, regWrite, decOut1b, writeData[3], outBus[3]);
	D_ff_reg d4(clk, reset, regWrite, decOut1b, writeData[4], outBus[4]);
  D_ff_reg d5(clk, reset, regWrite, decOut1b, writeData[5], outBus[5]);
  D_ff_reg d6(clk, reset, regWrite, decOut1b, writeData[6], outBus[6]);
endmodule

module register5bit_pipe( input clk, input reset, input regWrite, input decOut1b, input [4:0] writeData, output  [4:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
  D_ff_reg d2(clk, reset, regWrite, decOut1b, writeData[2], outBus[2]);
  D_ff_reg d3(clk, reset, regWrite, decOut1b, writeData[3], outBus[3]);
	D_ff_reg d4(clk, reset, regWrite, decOut1b, writeData[4], outBus[4]);
  
endmodule

module register8bit_pipe( input clk, input reset, input regWrite, input decOut1b, input [7:0] writeData, output  [7:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
  D_ff_reg d2(clk, reset, regWrite, decOut1b, writeData[2], outBus[2]);
	D_ff_reg d3(clk, reset, regWrite, decOut1b, writeData[3], outBus[3]);
  D_ff_reg d4(clk, reset, regWrite, decOut1b, writeData[4], outBus[4]);
	D_ff_reg d5(clk, reset, regWrite, decOut1b, writeData[5], outBus[5]);
  D_ff_reg d6(clk, reset, regWrite, decOut1b, writeData[6], outBus[6]);
	D_ff_reg d7(clk, reset, regWrite, decOut1b, writeData[7], outBus[7]);	
endmodule


module register32bit_pipe(input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outBus);
  D_ff_reg d0(clk, reset, regWrite, decOut1b, writeData[0], outBus[0]);
	D_ff_reg d1(clk, reset, regWrite, decOut1b, writeData[1], outBus[1]);
  D_ff_reg d2(clk, reset, regWrite, decOut1b, writeData[2], outBus[2]);
	D_ff_reg d3(clk, reset, regWrite, decOut1b, writeData[3], outBus[3]);
  D_ff_reg d4(clk, reset, regWrite, decOut1b, writeData[4], outBus[4]);
	D_ff_reg d5(clk, reset, regWrite, decOut1b, writeData[5], outBus[5]);
  D_ff_reg d6(clk, reset, regWrite, decOut1b, writeData[6], outBus[6]);
	D_ff_reg d7(clk, reset, regWrite, decOut1b, writeData[7], outBus[7]);	
  D_ff_reg d8(clk, reset, regWrite, decOut1b, writeData[8], outBus[8]);
	D_ff_reg d9(clk, reset, regWrite, decOut1b, writeData[9], outBus[9]);
  D_ff_reg d10(clk, reset, regWrite, decOut1b, writeData[10], outBus[10]);
	D_ff_reg d11(clk, reset, regWrite, decOut1b, writeData[11], outBus[11]);
  D_ff_reg d12(clk, reset, regWrite, decOut1b, writeData[12], outBus[12]);
	D_ff_reg d13(clk, reset, regWrite, decOut1b, writeData[13], outBus[13]);
  D_ff_reg d14(clk, reset, regWrite, decOut1b, writeData[14], outBus[14]);
	D_ff_reg d15(clk, reset, regWrite, decOut1b, writeData[15], outBus[15]);	
  D_ff_reg d16(clk, reset, regWrite, decOut1b, writeData[16], outBus[16]);
	D_ff_reg d17(clk, reset, regWrite, decOut1b, writeData[17], outBus[17]);
  D_ff_reg d18(clk, reset, regWrite, decOut1b, writeData[18], outBus[18]);
	D_ff_reg d19(clk, reset, regWrite, decOut1b, writeData[19], outBus[19]);
  D_ff_reg d20(clk, reset, regWrite, decOut1b, writeData[20], outBus[20]);
	D_ff_reg d21(clk, reset, regWrite, decOut1b, writeData[21], outBus[21]);
  D_ff_reg d22(clk, reset, regWrite, decOut1b, writeData[22], outBus[22]);
	D_ff_reg d23(clk, reset, regWrite, decOut1b, writeData[23], outBus[23]);	
  D_ff_reg d24(clk, reset, regWrite, decOut1b, writeData[24], outBus[24]);
	D_ff_reg d25(clk, reset, regWrite, decOut1b, writeData[25], outBus[25]);
  D_ff_reg d26(clk, reset, regWrite, decOut1b, writeData[26], outBus[26]);
	D_ff_reg d27(clk, reset, regWrite, decOut1b, writeData[27], outBus[27]);
  D_ff_reg d28(clk, reset, regWrite, decOut1b, writeData[28], outBus[28]);
	D_ff_reg d29(clk, reset, regWrite, decOut1b, writeData[29], outBus[29]);
  D_ff_reg d30(clk, reset, regWrite, decOut1b, writeData[30], outBus[30]);
	D_ff_reg d31(clk, reset, regWrite, decOut1b, writeData[31], outBus[31]);	
endmodule 



//PIPELINE MODULES

//IF_ID Pipeline
module pipeline0(input clk, input reset,input regWrite, input decOut1b, input [31:0] pcOut, instr, output [31:0] p0_pcOut, p0_instr);
  register32bit_pipe PCValue(clk, reset, regWrite, decOut1b, instr, p0_instr);
  register32bit_pipe pc(clk, reset, regWrite, decOut1b, pcOut, p0_pcOut);
endmodule

//ID_EX Pipeline
module pipeline1(input clk, input reset, input regWritePipe, input memRead, input decOut1b, memWrite, R_regWrite, S_regWrite,
 aluSrcA, aluSrcB, branch,  PCWrite, input [31:0] p0_pcOut, RmoutBus, RnoutBus, RdoutBus, SmoutBus, SnoutBus, SdoutBus, aluOp, 
 input [2:0] Rm, Rn, Rd, Sm, Sn, Sd, Imm, input [4:0] func, output [31:0] p1_pcOut, p1_RmoutBus, p1_RnoutBus, p1_RdoutBus, p1_SmoutBus, p1_SnoutBus, p1_SdoutBus, 
 output p1_aluOp, output [2:0] p1_Rm,  p1_Rn, p1_Rd, p1_Sm, p1_Sn, p1_Sd, p1_Imm, output p1_memWrite, p1_memRead,
  p1_S_regWrite, p1_R_regWrite, p1_branch, p1_jump, p1_aluSrcA, p1_aluSrcB, output [4:0] p1_func ); 
  //Reg[]
  register32bit_pipe pc(clk, reset, regWrite, decOut1b, p0_pcOut, p1_pcOut);
  register32bit_pipe regRm(clk, reset, regWritePipe, decOut1b, RmoutBus, p1_RmoutBus);
  register32bit_pipe regRd(clk, reset, regWritePipe, decOut1b, RdoutBus, p1_RdoutBus);
  register32bit_pipe regSm(clk, reset, regWritePipe, decOut1b, SmoutBus, p1_SmoutBus);
  register32bit_pipe regSn(clk, reset, regWritePipe, decOut1b, SnoutBus, p1_SnoutBus);
  register32bit_pipe regSd(clk, reset, regWritePipe, decOut1b, SdoutBus, p1_SdoutBus);
  register32bit_pipe regRn(clk, reset, regWritePipe, decOut1b, RnoutBus, p1_RnoutBus); 
  //functionfield
  register5bit_pipe funcfield (clk, reset, regWritePipe, decOut1b, func, p1_func);
  //Decoded Instruction Parameters
  register3bit_pipe decode_Rm(clk, reset, regWritePipe, decOut1b, Rm, p1_Rm);
  register3bit_pipe decode_Rn(clk, reset, regWritePipe, decOut1b, Rd, p1_Rd);
  register3bit_pipe decode_Rd(clk, reset, regWritePipe, decOut1b, Rd, p1_Rd);
  register3bit_pipe decode_Sm(clk, reset, regWritePipe, decOut1b, Sm, p1_Sm);
  register3bit_pipe decode_Sn(clk, reset, regWritePipe, decOut1b, Sn, p1_Sn);
  register3bit_pipe decode_Sd(clk, reset, regWritePipe, decOut1b, Sd, p1_Sd);
  register3bit_pipe decode_Imm(clk, reset, regWritePipe, decOut1b, Imm, p1_Imm);
  
  //Control Signals
  
  register2bit_pipe sig_ALUOP(clk, reset, regWritePipe, decOut1b, aluOp, p1_aluOp);
  
  register1bit_pipe sig_memWrite(clk, reset, regWritePipe, decOut1b, memWrite, p1_memWrite);
  register1bit_pipe sig_memRead(clk, reset, regWritePipe, decOut1b, memRead, p1_memRead);
  register1bit_pipe sig_RregWrite(clk, reset, regWritePipe, decOut1b, R_regWrite, p1_R_regWrite);
  register1bit_pipe sig_SregWrite(clk, reset, regWritePipe, decOut1b, S_regWrite, p1_S_regWrite);
  register1bit_pipe sig_PCWrite(clk, reset, regWritePipe, decOut1b, PCWrite, p1_PCWrite);
 
  register1bit_pipe sig_ALUSRCA(clk, reset, regWritePipe, decOut1b, aluSrcA, p1_aluSrcA);
  register1bit_pipe sig_ALUSRCb(clk, reset, regWritePipe, decOut1b, aluSrcB, p1_aluSrcB);
  
  register1bit_pipe sig_branch(clk, reset, regWritePipe, decOut1b, branch, p1_branch);
  register1bit_pipe sig_jump(clk, reset, regWritePipe, decOut1b, jump, p1_jump);
endmodule
  
//EX_MEM Pipeline  
module pipeline2(input clk, input reset,input regWritePipe, input decOut1b, input [31:0] aluOut, p1_SdoutBus, input [7:0] flag , input carry,
input p1_memRead, p1_PCWrite, p1_branch,  input p1_memWrite,input p1_S_regWrite, p1_R_regWrite , input [2:0] p1_Rd, p1_Sd, 
input [31:0] adderOut, output p2_memRead, output p2_memWrite,
	output p2_S_regWrite, p2_R_regWrite, output [31:0] p2_aluOut, output [7:0] p2_flag, output p2_carry, output [2:0] p2_Rd, p2_Sd, output p2_PCWrite, p2_branch, output [31:0] p2_adderOut, p2_SdoutBus);

  register3bit_pipe decode2_Rd(clk, reset, regWritePipe, decOut1b, p1_Rd, p2_Rd);
  register3bit_pipe decode2_Sd(clk, reset, regWritePipe, decOut1b, p1_Sd, p2_Sd);
  
  register8bit_pipe flagRegister(clk, reset, regWritePipe, decOut1b, flag, p2_flag);
  

  register32bit_pipe regOfSd(clk, reset, regWritePipe, decOut1b, p1_SdoutBus, p2_SdoutBus);
  register32bit_pipe aluoutreg(clk, reset, regWritePipe, decOut1b, aluOut, p2_aluOut);
  register32bit_pipe adderoutreg(clk, reset, regWritePipe, decOut1b, adderOut, p2_adderOut);
  
  register1bit_pipe sig2_R_regWrite(clk, reset, regWritePipe, decOut1b, p1_R_regWrite, p2_R_regWrite);
  register1bit_pipe sig2_S_regWrite(clk, reset, regWritePipe, decOut1b, p1_S_regWrite, p2_S_regWrite);
  register1bit_pipe sig2_readMem(clk, reset, regWritePipe, decOut1b, p1_memRead, p2_memRead);
  register1bit_pipe sig2_writeMem(clk, reset, regWritePipe, decOut1b, p1_memWrite, p2_memWrite);
  register1bit_pipe sig2_PCWrite(clk, reset, regWritePipe, decOut1b, p1_PCWrite, p2_PCWrite);
  register1bit_pipe sig2_branch(clk, reset, regWritePipe, decOut1b, p1_branch, p2_branch);

endmodule 


//MEW_WB
module pipeline3(input clk, input reset,input regWritePipe, input decOut1b, p2_Rd, p2_Sd, input [31:0] p2_aluOut, input [31:0] memOut,input p2_S_regWrite,p2_R_regWrite, output [2:0] p3_Sd, p3_Rd,output [31:0] p3_aluOut, p3_memOut);
	register32bit_pipe ALUOUT(clk, reset, regWritePipe, decOut1b, p2_aluOut, p3_aluOut );
	register32bit_pipe MEMORY(clk, reset, regWritePipe, decOut1b, memOut, p3_memOut);
	
	register3bit_pipe decode_Rd(clk, reset, regWritePipe, decOut1b, p2_Rd, p3_Rd);
	register3bit_pipe decode_Sd(clk, reset, regWritePipe, decOut1b, p2_Sd, p3_Sd);
		
	register1bit_pipe sig3_R_regWrite( clk, reset, regWritePipe, decOut1b, p2_R_regWrite, p3_R_regWrite );
  register1bit_pipe sig3_S_regWrite( clk, reset, regWritePipe, decOut1b, p2_S_regWrite, p3_S_regWrite );
endmodule

 