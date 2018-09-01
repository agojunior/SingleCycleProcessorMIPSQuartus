module Banco(r1,r2, r3, data, clock, write, rd1,rd2);
input [4:0]r1,r2,r3;
input clock, write;
input [31:0] data;
output [31:0] rd1, rd2;
//integer PrimeiroClock=1;
reg[31:0] regs[31:0];

always @ (posedge clock) begin
	//if (PrimeiroClock==1) begin
	//	regs[31]= 127;
	//	regs[30] = 126;
	//end
	
	if (write) begin
		regs[r3] = data;
	end
end

assign rd1 = regs[r1];

assign rd2 = regs[r2];

endmodule