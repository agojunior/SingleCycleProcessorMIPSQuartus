module ProgramCounter( PCIn, signal, clock, PCOut, reset);

input signal, clock, reset;
input [10:0]PCIn;
reg[10:0] PCValue;
output [10:0]PCOut;


initial begin
	PCValue = 11'b0;
end

always @ (posedge clock) begin
	if (signal == 1'b0) begin
		PCValue =PCValue + 1;
	end
	
	
	if(signal ==1'b1) begin
	PCValue =PCIn;
	end
	
	
	if(reset == 1'b1) begin
		PCValue =  11'b0;
	end
	
end

assign PCOut = PCValue;

endmodule