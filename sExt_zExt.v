module signExt8to32( input [7:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{24{offset[7]}},offset[7:0]};
	end
endmodule

module signExt11to32( input [10:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{21{offset[7]}},offset[7:0]};
	end
endmodule

module zeroExt8to32( input [7:0] offset, output reg [31:0] zeroExtOffset);
	always@(offset)
	begin
			zeroExtOffset[0] = offset[0];
			zeroExtOffset[1] = offset[1];
			zeroExtOffset[2] = offset[2];
			zeroExtOffset[3] = offset[3];
			zeroExtOffset[4] = offset[4];
			zeroExtOffset[5] = offset[5];
			zeroExtOffset[6] = offset[6];
			zeroExtOffset[7] = offset[7];
			zeroExtOffset[8] = 0;
			zeroExtOffset[9] = 0;
			zeroExtOffset[10] = 0;
			zeroExtOffset[11] = 0;
			zeroExtOffset[12] = 0;
			zeroExtOffset[13] = 0;
			zeroExtOffset[14] = 0;
			zeroExtOffset[15] = 0;
			zeroExtOffset[16] = 0;
			zeroExtOffset[17] = 0;
			zeroExtOffset[18] = 0;
			zeroExtOffset[19] = 0;
			zeroExtOffset[20] = 0;
			zeroExtOffset[21] = 0;
			zeroExtOffset[22] = 0;
			zeroExtOffset[23] = 0;
			zeroExtOffset[24] = 0;
			zeroExtOffset[25] = 0;
			zeroExtOffset[26] = 0;
			zeroExtOffset[27] = 0;
			zeroExtOffset[28] = 0;
			zeroExtOffset[29] = 0;
			zeroExtOffset[30] = 0;
			zeroExtOffset[31] = 0;

	end
endmodule
