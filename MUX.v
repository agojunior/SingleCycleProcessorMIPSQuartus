module MUX(A, B, C, Sel , clock, Out);

input [1:0]Sel;
input clock;
input [31:0] A,B,C;
output reg [31:0]Out;

always @ (*) begin
	Out = B;

	if (Sel == 0) begin
		Out = A;
	end
	
	else if (Sel == 2) begin
		Out = C;
	end
	
end

endmodule