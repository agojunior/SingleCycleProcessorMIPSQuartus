module BranchControl(halt, j, branch, PCIn, zero, IMM16, IMM26, clock, PCOut, OK);
input halt,j,branch, zero, clock, OK;
input [15:0] IMM16;
input [25:0] IMM26;
input [10:0]PCIn;
reg[10:0] PCValue;
output [10:0]PCOut;


always @ (*) begin
	PCValue =PCIn + 1;
	if (halt == 1'b0) begin
		if(j == 1) begin
			PCValue = IMM26;
		end
		else if(branch ==1 & zero == 1) begin
			PCValue = PCValue + IMM16 - 1;
		end
	end
	
	else if(halt ==1'b1 && OK == 1'b0) begin
		PCValue =PCIn;
	end	
	
end

assign PCOut = PCValue;

endmodule