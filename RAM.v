module RAM(data,address, write, read, clock);
	input [10:0] address;
	input [31:0] data;
	input write, clock;
	output [31:0] read;
	reg [31:0] ramD [10:0];

	always @ (posedge clock)  begin
		if (write) begin
			ramD[address] = data;
		end
	end
	assign read = ramD[address];
endmodule