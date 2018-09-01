module  Processador (clockIn, OK, BusIn, reset, Hex1, Hex2, Hex3, Hex4);
//outmuxALU, outALUsrc, outRd1, outResExtender, outMuxR, outRsrc, outPC, outResALU, outALUop, outOPCODE, outReadData, outDataLCD);

input clockIn, reset, OK;
//output wire [5:0] outResAlu;
//output wire [5:0] outPC, outResALU, outmuxALU, outALUsrc, outRd1, outMuxR, outRsrc, outOPCODE, outALUop, outResExtender, outReadData, outDataLCD;
wire [31:0] instruction, resExtender, rd1, rd2, resALU, readData, muxALU, muxWrite, muxR;
wire j, clock, branch, memWrite, I , O, Halt, write,zeroALU,  PCSignal, IOFlag;
wire [1:0] ALUsrc,Rsrc,Wsrc, PCsrc;
wire [5:0] ALUop, opcode;
wire [10:0] PC, PCBranch;
input [14:0] BusIn;
wire [14:0]  DataLCD;
output [6:0] Hex1, Hex2, Hex3, Hex4;
Temp t1(.clk_in(clockIn),.clockO(clock));
Control bc(.instruction(instruction),.opcode(opcode),  .j(j),.branch(branch), .write(write),.memWrite(memWrite), .ALUop(ALUop), .ALUsrc(ALUsrc),.Rsrc(Rsrc),.Wsrc(Wsrc), .PCsrc(PCsrc),.I(I), .O(O), .Halt(Halt), .PCSignal(PCSignal));

Instructions  bi(.PC(PC),.Inst(instruction),.clock(clock));

Banco bb(.r1(instruction[25:21]),.r2(instruction[20:16]), .r3(muxR), .data(muxWrite), .clock(clock), .write(write), .rd1(rd1),.rd2(rd2));

ula balu(.a(rd1),.b(muxALU),.op(ALUop),.res(resALU),.zero(zeroALU),.clock(clock));

MUX mR(.A(instruction[20:16]),.B(instruction[15:11]),.C(instruction[15:11]), .Sel(Rsrc), .Out(muxR),.clock(clock));
MUX mAlu(.A(rd2),.B(resExtender),.C(instruction[25:0]), .Sel(ALUsrc), .Out(muxALU), .clock(clock));

MUX mWrite(.A(resALU),.B(readData),.C(DataLCD), .Sel(Wsrc), .Out(muxWrite), .clock(clock));

RAM bRAM(.data(rd2),.address(resALU), .write(memWrite), .read(readData), .clock(clock));

Extender bExtender(.IMM16(instruction[15:0]), .result(resExtender), .clock(clock));

ProgramCounter bPC( .PCIn(PCBranch), .signal(PCSignal), .clock(clock), .PCOut(PC), .reset(reset));

BranchControl bBC(.halt(Halt), .j(j), .OK(OK), .branch(branch), .PCIn(PC), .zero(zeroALU), .IMM16(resExtender), .IMM26(instruction[25:0]), .clock(clock), .PCOut(PCBranch));

InOut bIO(.clock(clock), .I(I), .O(O), .BusIn(BusIn), .DataLCD(DataLCD), .resALU(resALU), .Hex1(Hex1), .Hex2(Hex2), .Hex3(Hex3),.Hex4(Hex4), .pc(PC) );
//Outvalue bO(.In(PC) ,.Out(outPC));
//Outvalue bO2(.In(resALU) ,.Out(outResALU));
//Outvalue bO3(.In(muxALU) ,.Out(outmuxALU));
//Outvalue bO4(.In(ALUsrc) ,.Out(outALUsrc));
//Outvalue bO5(.In(rd1) ,.Out(outRd1));
//Outvalue bO6(.In(muxR) ,.Out(outMuxR));
//Outvalue bO7(.In(Rsrc) ,.Out(outRsrc));
//Outvalue bO8(.In(opcode) ,.Out(outOPCODE));
//Outvalue bO9(.In(ALUop) ,.Out(outALUop));
//Outvalue bO10(.In(resExtender) ,.Out(outResExtender));
//Outvalue bO11(.In(readData) ,.Out(outReadData));
//Outvalue bO12(.In(DataLCD2) ,.Out(outDataLCD));


 
endmodule