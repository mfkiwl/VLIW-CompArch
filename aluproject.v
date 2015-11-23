module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [4:0] func, input aluOp, input iCarry, output reg [31:0] aluOut, output reg carry, output reg overflow, output reg zero, output reg neg);
always@(aluIn1 or aluIn2 or aluOp)
	begin
		zero = 1'b0;
		overflow=1'b0;
		carry=1'b0;
		case(aluOp) 
			1'b0:
			begin 
			aluOut = aluIn1 + aluIn2;
			if(aluIn1[31]==0 && aluIn2[31]==0 && aluOut[31]==1)
				overflow=1'b1;
			else if(aluIn1[31]==1 && aluIn2[31]==1 && aluOut[31]==0)
				overflow=1'b1;
			end
			1'b1:
			begin
				case(func)
				5'b00101: begin
			          aluOut = aluIn2 - aluIn1 - iCarry;
			          if(aluIn1[31]==0 && aluIn2[31]==1 && aluOut[31]==1)
				          overflow=1'b1;
			          else if(aluIn1[31]==1 && aluIn2[31]==0 && aluOut[31]==0)
			           	overflow=1'b1;
			           end
				5'b01001: begin
			          aluOut = aluIn2 >> aluIn1;
			          end
				5'b00110: begin
			          aluOut = ~aluIn2; 
			          end
				endcase 			
			end		 
		endcase
		if(aluIn1[31]==0 && aluIn2[31]==1 && aluOut[31]==0)
			carry=1'b1;
		else if(aluIn1[31]==1 && aluIn2[31]==0 && aluOut[31]==0)
			carry=1'b1;
		else if(aluIn1[31]==1 && aluIn2[31]==1)
			carry=1'b1;
		if (aluOut == 0)
			zero = 1'b1;
		neg = aluOut[31];
	end
endmodule

module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out, output reg overflow);
	always@(in1 or in2)
	begin
		adder_out = in1 +in2;
		if(in1[31]==0 && in2[31]==0 && adder_out[31]==1)
			overflow=1'b1;
		else if(in1[31]==1 && in2[31]==1 && adder_out[31]==0)
			overflow=1'b1;
		end
endmodule

module simple_adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1,in2)
	begin
		adder_out = in1 + in2;
	end
endmodule
