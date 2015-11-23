module mux4to1_32bits(input [31:0] in1, input [31:0] in2, input [31:0] in3,input [31:0] in4, input [1:0] sel, output reg [31:0] muxout);
always @ (in1, in2, in3, in4, sel)
  begin
    case(sel)
      2'b00: muxout = in1;
      2'b01: muxout = in2;
      2'b10: muxout = in3;
      2'b11: muxout = in4;
    endcase
end
endmodule

module mux2to1_32bits(input [31:0] in1, input [31:0] in2, input sel, output reg [31:0] muxout);
always@(in1, in2, sel)
  begin
    case(sel)
      0: muxout = in1;
      1: muxout = in2;
  endcase
end
endmodule

module mux2to1_2bits(input selector, output reg [2:0] muxout);
always @(selector)
begin
  case (selector)
    0: muxout = 2'10;
    1: muxout = 2'01;
  endcase
end
endmodule
