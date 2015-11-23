module ForwardingUnit(input [2:0] ID_EXRm,input [2:0] ID_EXRn, input [2:0] ID_EXSm, input [2:0] ID_EXSn, input [2:0] ID_EXSd, input [2:0]  EX_MEMRd, input [2:0]  EX_MEMSd, input [2:0] MEM_WBRd, input [2:0] MEM_WBSd, input ID_EXMW, input EX_MEMMW, input MEM_WBMR, input EX_MEMRRegWrite,input MEM_WBRRegWrite,input MEM_WBSRegWrite,output reg [1:0]  ForwardA, output reg [1:0] ForwardB , output reg [1:0] ForwardC,output reg [1:0] ForwardD output reg ForwardAS, output reg ForwardLS);
initial
begin
ForwardA = 2'b00; ForwardB = 2'b00; ForwardC = 2'b00; ForwardD = 2'b00; ForwardAS = 1'b0; ForwardLS = 1'b0;
end
 //Forward A
 
 always@(EX_MEMRRegWrite or MEM_WBRRegWrite or  MEM_WBSRegWrite or ID_EXRm or EX_MEMRd or MEM_WBRd or MEM_WBSd) 
 begin
 if((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXRm))//forwarding rd from ex_mem to rm
	ForwardA = 2'b01;
 else if((MEM_WBRRegWrite)&&(MEM_WBRd != 0)&&(MEM_WBRd == ID_EXRm) && !((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXRm)))//forwarding rd from mem_wb to rm
	ForwardA = 2'b10;
 else if ((MEM_WBSRegWrite) && (MEM_WBSd !=0) && (MEM_WBSd == ID_EXRm))//forwarding sd from mem_wb to rm
	ForwardA = 2'b11;
 else
	ForwardA=2'b00;
 end
 
 //Forward B
 always@(EX_MEMRRegWrite or MEM_WBRRegWrite or MEM_WBSRegWrite or ID_EXRn or EX_MEMRd or MEM_WBRd or MEM_WBSd) 
 begin
 if((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXRn))//forwarding rd from ex_mem to rn
	ForwardB = 2'b01;
 else if((MEM_WBRRegWrite)&&(MEM_WBRd != 0)&&(MEM_WBRd == ID_EXRn) && !((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXRn)))//forwarding rd from mem_wb to rn
	ForwardB = 2'b10;
 else if ((MEM_WBSRegWrite) && (MEM_WBSd !=0) && (MEM_WBSd == ID_EXRn))//forwarding sd from mem_wb to rn
	ForwardB = 2'b11;
 else
	ForwardB=2'b00;
 end

 //Forward C
 always@(EX_MEMRRegWrite or MEM_WBRRegWrite or MEM_WBSRegWrite or ID_EXSm or EX_MEMRd or MEM_WBRd or MEM_WBSd) 
 begin
 if((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXSm))//forwarding rd from ex_mem to sm
	ForwardC = 2'b01;//
 else if((MEM_WBRRegWrite)&&(MEM_WBRd != 0)&&(MEM_WBRd == ID_EXSm) && !((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXSm)))//forwarding rd from mem_wb to sm
	ForwardC = 2'b10;
 else if ((MEM_WBSRegWrite) && (MEM_WBSd !=0) && (MEM_WBSd == ID_EXSm))//forwarding sd from mem_wb to sm
	ForwardC = 2'b11;
 else
	ForwardC=2'b00;
 end
 
 //ForwardD
 always@(EX_MEMRRegWrite or MEM_WBRRegWrite or MEM_WBSRegWrite or ID_EXSn or EX_MEMRd or MEM_WBRd or MEM_WBSd) 
 begin
 if((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXSn))//forwarding rd from ex_mem to sn
	ForwardD = 2'b01;
 else if((MEM_WBRRegWrite)&&(MEM_WBRd != 0)&&(MEM_WBRd == ID_EXSn) && !((EX_MEMRRegWrite)&&(EX_MEMRd != 0)&&(EX_MEMRd == ID_EXSn)))//forwarding rd from mem_wb to sn
	ForwardD = 2'b10;
 else if ((MEM_WBSRegWrite) && (MEM_WBSd !=0) && (MEM_WBSd == ID_EXSn))//forwarding sd from mem_wb to sn
	ForwardD = 2'b11;
 else
	ForwardD=2'b00;

//Add - Store
always@(ID_EXMW or EX_MEMRRegWrite or EX_MEMRd or ID_EXSd)
	if(ID_EXMW && EX_MEMRRegWrite && (EX_MEMRd == ID_EXSd) && (EX_MEMRd != 0))
		ForwardAS = 1;
	else
		ForwardAS = 0;

//Load - Store
always@(EX_MEMMW or MEM_WBMR or EX_MEMSd or MEM_WBSd)
	if((MEM_WBMR == EX_MEMMW) && (MEM_WBSd == EX_MEMSd) && (MEM_WBSd != 0))
		ForwardLS = 1;
	else
		ForwardLS = 0;
 end
 endmodule

 