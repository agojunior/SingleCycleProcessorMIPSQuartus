module Temp(clk_in,clockO);

input clk_in;
output wire clockO;

parameter n =25;
reg [n:0] cont;

always@(posedge clk_in)
   begin
     cont <= cont + 1 ;
   end
	
	assign clockO = cont[n];

endmodule