module Extender (IMM16, result, clock);

input [15:0] IMM16;
input clock;


output reg [31:0] result;

always @ (*) begin
		result = IMM16;
		if(IMM16[15]==1'b1) result = {{16{IMM16[15]}}, IMM16};; // (ADDI,SUBI, ...)
end

endmodule