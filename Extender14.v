module Extender14 (IMM15, result, clock);

input [14:0] IMM15;
input clock;


output reg [31:0] result;

always @ (*) begin
		result = IMM15;
		if(IMM15[14]==1'b1) result = {{17{IMM15[14]}}, IMM15};; // (ADDI,SUBI, ...)
end

endmodule