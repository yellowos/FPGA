module	p_encoder(
	input  [3 : 0] code_in,
       	output reg	[1 : 0] code_out
);
//	reg [1 : 0] code_out_reg;
//	reg [3 : 0] code_in_reg;
//	reg [3 : 0] test;
	reg flag;
	integer i;

	always@(code_in)
	begin
		//code_out_reg <= 2'b01;
		//code_in_reg <= code_in;
		flag = 0;
		for(i = 0; i <= 3; i = i + 1) begin
			if(code_in[i] && flag == 0) begin
				code_out = i;
				flag = 1;
			end	
		end
		//code_out_reg = code_out_reg + 2'b01;
	end
//	assign code_out = code_out_reg;
endmodule





