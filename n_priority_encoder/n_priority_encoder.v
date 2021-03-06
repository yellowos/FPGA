module n_priority_encoder
#(parameter N) (
	input [(2 ** N - 1) : 0] code_in,
	output reg [(N-1) : 0] code_out
	);
	integer i;
	always@(code_in) begin
		//reg flag = 0;
		for (i = (2 ** N - 1); i >= 0; i = i - 1) begin
			if(code_in[i]) begin
				code_out = i;
			end
		end
	end
endmodule



