module InOut(clock, I, O, BusIn, DataLCD, resALU, Hex1, Hex2, Hex3, Hex4, pc);
//BUS FPGA, Data Processador
input clock, I, O;
input [10:0] pc;
input [31:0] resALU;
input [14:0] BusIn;
reg [31:0] Data;
wire [3:0] Hnd, Tns, Ons, Hnd1, Tns1, Ons1;
output [6:0] Hex1, Hex2, Hex3, Hex4;
output [14:0] DataLCD;

initial begin
	Data = 0;
end
always @(*) begin
	if (I) begin
		Data = BusIn;
	end
	
	else if (O == 1) begin
		Data = resALU;
	end
end
assign DataLCD = BusIn;
BCD bBCD2(.binary(pc[9:0]), .Hundreds(Hnd1[3:0]), .Tens(Tns1[3:0]), .Ones(Ons1[3:0]));

BCD bBCD(.binary(Data[9:0]), .Hundreds(Hnd[3:0]), .Tens(Tns[3:0]), .Ones(Ons[3:0]));
DisplayF vD1(.sum(Ons[3:0]), .Hex(Hex1));
DisplayF vD2(.sum(Tns[3:0]), .Hex(Hex2));
DisplayF vD3(.sum(Hnd[3:0]), .Hex(Hex3));
DisplayF vD4(.sum(Ons1[3:0]), .Hex(Hex4));

endmodule