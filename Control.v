module Control(instruction, opcode,j,branch,write,memWrite, ALUop,  ALUsrc,Rsrc,Wsrc, PCsrc, I, O, Halt,  PCSignal);
input [31:0] instruction;
output reg [5:0] ALUop, opcode;
output reg [1:0]ALUsrc,Rsrc,Wsrc;
output reg branch, j, write, memWrite, PCsrc,I,O,Halt, PCSignal;
localparam [5:0] FORMAT1 = 	6'b000000,
					  JUMP 	=		6'b010000,
					  ADDI  	= 		6'b001000,
					  SUBI 	= 		6'b001001,
					  BEQ  	= 		6'b001010,
					  BNE  	= 		6'b001011,
					  LR  	= 		6'b001100,
					  SR  	= 		6'b001101,
					  IN  	= 		6'b001110,
					  OUT = 6'b001111,
					  NOP = 6'b111000,
					  SHL = 6'b000111,
					  SHR = 6'b001000,
					  LI = 6'b011000,
					  HALT = 6'b111001;
always @*
	begin
	opcode = instruction[31:26];
	I = 0;
	O = 0;
	branch = 0;
	j = 0;
	write = 0;
	memWrite = 0;
	PCsrc = 0;
	Halt = 0;
	ALUop = 6'b001011;
	Wsrc = 2'b00;
	Rsrc = 2'b00;
	ALUsrc = 2'b00;
	PCSignal= 0;
	case (instruction[31:26])			
			FORMAT1: begin
				write = 1;
				ALUop = instruction[5:0];
				Rsrc = 2'b01; 
			end
			ADDI: begin
				write = 1;
				ALUsrc = 2'b01;
				ALUop = 6'b000000;
				
			end
			SUBI: begin
				write = 1;
				ALUsrc = 2'b01;
				ALUop = 6'b000001;
			end
			JUMP: begin
				j = 1;
				PCsrc = 1;
				PCSignal = 1;
			end
			BEQ: begin
				ALUop = 6'b000001;
				branch = 1;
				PCsrc = 1;
				PCSignal = 1;
			end
			BNE: begin
				ALUop = 6'b001110;
				branch = 1;
				PCsrc = 1;
				PCSignal = 1;
			end
			LR: begin
				 write = 1;
				 ALUsrc = 2'b01;
				 Wsrc = 2'b01; 
			end
			SR: begin
				 memWrite = 1;
				 ALUsrc = 2'b01;
			end
			HALT: begin
				Halt = 1;
				PCSignal = 1;
			end
			IN: begin
				Halt = 1;
				Wsrc = 2'b10;
				PCSignal = 1;
				I = 1;
				write = 1;
			end		
			OUT: begin
				Halt = 1;
				PCSignal = 1;
				O = 1;
			end
			LI: begin
				write = 1;
				ALUsrc = 2'b01;
			end
	endcase
end
endmodule				  
