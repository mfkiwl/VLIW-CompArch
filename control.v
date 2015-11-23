module control_S (input [4:0] R_opcode, input [4:0] S_opcode,  output reg  ALU_Op,
output reg R_RegWrite, output reg S_RegWrite, output reg Mem_Write, output reg Mem_Read, output reg Branch,
output reg Jump, output reg PC_Write, output reg exception, output reg aluSrcA, output reg aluSrcB);
reg Exception1, Exception2;
always@(R_opcode, S_opcode)
begin

PC_Write = 1;

  case(S_opcode)
    5'b01010: begin //load
              Exception1 = 0;
              Branch = 0;
              Jump = 0;
              S_RegWrite = 1;
              Mem_Read = 1;
              Mem_Write = 0;
              end
     5'b01011: begin //store

              Exception1 = 0;
              Branch = 0;
              Jump = 0;
              S_RegWrite = 0;
              Mem_Read = 0;
              Mem_Write = 1;
              end

      5'b11100: begin //jump
              Exception1 = 0;
              Branch = 0;
              Jump = 1;
              S_RegWrite = 0;
              Mem_Read = 0;
              Mem_Write = 0;
              end
      5'b11010: begin //branch
              Exception1 = 0;
              Branch = 1;
              Jump = 0;
              S_RegWrite = 0;
              Mem_Read = 0;
              Mem_Write = 0;
              end

      default: begin
              Exception1 = 1;
              Branch = 0;
              Jump = 0;
              S_RegWrite = 0;
              Mem_Read = 0;
              Mem_Write = 0;
            end
    endcase
    case(R_opcode)
    5'b00011: begin //add
              ALU_Op = 1'b0;
              Exception2= 0;
              aluSrcA = 0 ;//imm
              aluSrcB = 0 ;//Rn
              R_RegWrite = 1;
              end
      5'b01000: begin //sub, lsr, neg
              Exception2= 0;
              aluSrcA = 1 ;//Rm
              aluSrcB = 1 ;//Rd
              ALU_Op = 1'b1;
              R_RegWrite = 1;
            end
      default: begin
              Exception2= 1;
              ALU_Op = 1'b0;
              R_RegWrite = 0;

              end
   endcase
   exception = Exception1 | Exception2;
  end

endmodule
