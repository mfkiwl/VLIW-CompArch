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
			zeroExtOffset = {{24{0}}, offset};
			
	end
endmodule

