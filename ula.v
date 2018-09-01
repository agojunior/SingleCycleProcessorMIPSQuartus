module ula(a,b,op,res,zero,clock);
	input clock;
	input[31:0]a,b;
	input[5:0]op;
	output zero;
	output reg [31:0]res;
		always @ (*)
			begin
			if(op == 6'b000000)
				res = a + b;
			else if(op == 6'b000001)
				res = a - b;
			else if(op == 6'b000010)
				res = a * b;
			else if(op == 6'b000011)
				res = a % b;
			else if(op == 6'b000100)
				res = a / b;
			else if(op == 6'b000101)
				res = a & b;
			else if(op == 6'b000110)
				res = a | b;
			else if(op == 6'b000111)
				res = a <<< b;
			else if(op == 6'b001000)
				res = a >>> b;
			else if(op == 6'b001001)
				if(($signed(a) > $signed(b)))
					res=1;
				else
					res=0;
			else if(op == 6'b001010)
				if(($signed(a) < $signed(b)))
					res=1;
				else
					res=0;
			else if(op == 6'b001011)
				res = b;
			else if(op == 6'b001100)
				res = a ^ b;
			else if(op == 6'b001101)
				res = ~(a | b);
			else if(op == 6'b001110)
				if(a ==b)
					res = 1;
				else
					res = 0;
			else
		   	res = 0;
		end
		assign zero = (res == 0) ? 1'b1: 1'b0;

endmodule
				