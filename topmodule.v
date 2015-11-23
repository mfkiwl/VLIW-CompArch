module topmodule (input clk, input reset);
	wire [31:0] PCadder_out, PC_out,  Jump_add, Branch_add, Exception_add, muxout1, muxout2, muxout3, muxout4, muxout5, muxout6, muxout7, instr, p0_instr, p0_pcOut, p1_pcOut;
	wire [31:0] RwriteData, SwriteData,RmoutBus, RdoutBus, SmoutBus, RnoutBus,SnoutBus,SdoutBus, p1_RmoutBus, p1_RnoutBus,
 p1_RdoutBus, p1_SmoutBus, p1_SnoutBus, p1_SdoutBus, p2_SdoutBus;
	wire [31:0] branch_signExtOffset,jump_signExtOffset, S_type_out, aluOut, p2_aluOut, p2_S_type_out, p3_aluOut, zero_Memout;
	wire ALU_Op, R_RegWrite, S_RegWrite, Mem_Write, Mem_Read, branch, jump, PC_Write, exception, aluSrcA, aluSrcB, p1_aluOp, p1_memWrite, p1_memRead, p1_S_regWrite, p1_R_regWrite, p1_branch, p1_jump, p1_aluSrcA, p1_aluSrcB, p2_memRead,  p2_memWrite, p2_S_regWrite, p2_R_regWrite, p2_PCWrite, p2_branch;
	wire p3_RregWrite, p3_SregWrite;
	wire [2:0] p1_Rm,  p1_Rn, p1_Rd, p1_Sm, p1_Sn, p1_Sd, p1_Imm, p2_Rd, p2_Sd, p3_Rd, p3_Sd;
	wire S_carry,S_overflow, carry, overflow, p2_carry;
	wire [1:0] ForwardA, ForwardB , ForwardC,ForwardD;
	reg [7:0] flag, p2_flag, Memout, p3_memOut;
	wire [4:0] p1_func;
	wire ControlMux, hduPCWrite, IF_IDWrite;
	wire [1:0] causeWrite;

	register32bit_pipe PC(clk, reset, PC_Write && hduPCWrite, 1, muxout3, PC_out);

	simple_adder A_PC(PC_out, 32'b00000000000000000000000000000100, PCadder_out);
	simple_adder A_jump(jump_signExtOffset<<1, PC_out, Jump_add);
	simple_adder A_branch(branch_signExtOffset<<1, PC_out, Branch_add);

	mux2to1_32bits M1(PCadder_out, Jump_add, jump, muxout1);
	mux2to1_32bits M2(muxout1, Branch_add, branch&&p2_carry, muxout2);
	mux2to1_32bits M3(muxout2, Exception_add, exception, muxout3);

	Instr_Mem IM(clk,  reset,p3_memWrite,p3_memRead, PC_out, 32'b00000000000000000000000000000000,instr );

	pipeline0 p0 (clk,  reset,1,1, PC_out, instr, p0_pcOut, p0_instr);

	registerFile R1(clk, reset,  p3_RregWrite, p3_SregWrite,p0_instr[8:6], p0_instr[5:3], p0_instr[2:0], p3_aluOut , p0_instr[24:22], p0_instr[21:19], p0_instr[18:16], p3_memOut, RmoutBus, RdoutBus, RnoutBus, SmoutBus, SnoutBus,SdoutBus);

	signExt8to32 sExt_branch(p0_instr[23:16], branch_signExtOffset);
	signExt11to32 sExt_jump (p0_instr[26:16] , jump_signExtOffset);

	control_S control (p0_instr[15:11], p0_instr[31:27],  ALU_Op, R_RegWrite, S_RegWrite, Mem_Write, Mem_Read, branch, jump, PC_Write, exception, aluSrcA, aluSrcB);

	pipeline1 p1(clk, reset,1, Mem_Read, 1, Mem_Write, R_RegWrite, S_RegWrite, aluSrcA, aluSrcB, branch,	 PC_Write && hduPCWrite, p0_pcOut, RmoutBus, RnoutBus, RdoutBus, SmoutBus, SnoutBus, SdoutBus, ALU_Op, p0_instr[8:6], p0_instr[5:3], p0_instr[2:0], p0_instr[24:22], p0_instr[21:19], p0_instr[18:16], p0_instr[8:6], p0_instr[10:6], p1_pcOut, p1_RmoutBus, p1_RnoutBus, p1_RdoutBus, p1_SmoutBus, p1_SnoutBus, p1_SdoutBus, p1_aluOp, p1_Rm,  p1_Rn, p1_Rd, p1_Sm, p1_Sn, p1_Sd, p1_Imm, p1_memWrite, p1_memRead,
  p1_S_regWrite, p1_R_regWrite, p1_branch, p1_jump, p1_aluSrcA, p1_aluSrcB, p1_func);

  ForwardingUnit F1( p1_Rm,  p1_Rn,  p1_Sm, p1_Sn, p2_Rd,
  p3_Rd, p3_Sd,p2_R_regWrite,p3_R_regWrite,p3_S_regWrite,
  ForwardA, ForwardB , ForwardC,ForwardD);

	HazardDetection hdu(Mem_Read, p0_instr[5:3], p0_instr[2:0], p0_instr[24:22], p0_instr[21:19], p0_instr[18:16], p1_Sd, branch || jump, ControlMux, hduPCWrite, IF_IDWrite);

	mux4to1_32bits M4 (p1_RmoutBus, p2_RdoutBus, p3_RdoutBus, p3_SdoutBus, ForwardA, muxout4);
	mux4to1_32bits M5 (p1_RnoutBus, p2_RdoutBus, p3_RdoutBus, p3_SdoutBus, ForwardB, muxout5);
	mux4to1_32bits M6 (p1_SmoutBus, p2_RdoutBus, p3_RdoutBus, p3_SdoutBus, ForwardC, muxout6);
	mux4to1_32bits M7 (p1_SnoutBus, p2_RdoutBus, p3_RdoutBus, p3_SdoutBus, ForwardD, muxout7);
	adder S_type(muxout6, muxout7, S_type_out, S_carry,S_overflow);
	mux2to1_32bits M8(muxout4, p1_Imm, p1_aluSrcA, muxout8);
	mux2to1_32bits M9(muxout5, p1_RdoutBus, p1_aluSrcB, muxout9);
	alu A1(muxout8, muxout9, p1_func, p1_aluOp, p2_carry, aluOut,carry, overflow);

	mux2to1_2bits causemux(exception, causeWrite);
	register32bit_pipe EPC(clk, reset, exception || overlow, 1, muxout3, PC_out);
	register2bit CauseReg(clk,reset,exception || overflow,1'b1,2'b00, causeWrite, cause_out); // 2 - Arithmetic, 1 - undefined

	pipeline2 p2(clk, reset,1, 1, aluOut, p1_SdoutBus, flag , carry, p1_memRead, p1_PCWrite, p1_branch,  p1_memWrite, p1_S_regWrite, p1_R_regWrite, p1_Rd, p1_Sd, S_type_out,	 p2_memRead, p2_memWrite, p2_S_regWrite, p2_R_regWrite,  p2_aluOut, p2_flag, p2_carry, p2_Rd, p2_Sd, p2_PCWrite, p2_branch, p2_S_type_out, p2_SdoutBus);

	Mem DM(clk, reset,p2_memWrite,p2_memRead, p2_S_type_out, p2_SdoutBus [7:0],Memout);
	zeroExt8to32 zExt(Memout, zero_Memout);

	pipeline3 p3(clk, reset,1,1, p2_Rd, p2_Sd, p2_aluOut, zero_Memout,p2_S_regWrite,p2_R_regWrite, p3_Sd, p3_Rd,p3_aluOut, p3_memOut);

endmodule
