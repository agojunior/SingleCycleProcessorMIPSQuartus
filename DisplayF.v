module DisplayF(sum, Hex );

input [3:0] sum;
output reg [6:0] Hex;

always @(*)
begin
Hex = 7'b1111111;
 case(sum)
  4'b0000: Hex = 7'b0000001;
  4'b0001: Hex = 7'b1001111;
  4'b0010: Hex = 7'b0010010;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  4'b0011: Hex = 7'b0000110;
  4'b0100: Hex = 7'b1001100;
  4'b0101: Hex = 7'b0100100;
  4'b0110: Hex = 7'b0100000;
  4'b0111: Hex = 7'b0001111;
  4'b1000: Hex = 7'b0000000;
  4'b1001: Hex = 7'b0001100;
  default: Hex = 7'b1111111;
 endcase
end

endmodule