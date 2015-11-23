
module HazardDetection(input ID_EXMemRead,input [2:0] IF_IDRm, input [2:0] IF_IDRd,input [2:0] IF_IDSm,input [2:0] IF_IDSn,input [2:0] IF_IDSd, input [2:0] ID_EXSd, input Branch, output reg ControlMux,output reg PCWrite, output reg IF_IDWrite);

 //Forward A

 always@(ID_EXMemRead or IF_IDRm or IF_IDRd or IF_IDSd or ID_EXSd )
 begin
    ControlMux=1'b1;
    PCWrite=1'b1;
    IF_IDWrite = 1'b1;

 if(Branch || ((ID_EXMemRead) && ((ID_EXSd == IF_IDRm) || (ID_EXSd == IF_IDRd) ||(ID_EXSd == IF_IDSm) || (ID_EXSd == IF_IDSn))))
  begin
    ControlMux=1'b0;
    PCWrite=1'b0;
    IF_IDWrite = 1'b0;
  end

	end


 endmodule
