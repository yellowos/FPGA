module jk_flip_flop(
	input clk,
	input j,
	input k,
	output reg Q,
	output reg _Q
);
	initial begin
		Q = 1'b1;
	end

	always@(posedge clk) begin
		if(j == 0) begin
			if(k == 1) begin
				Q = 0;
			end
		end
		else begin
			if(k == 0) begin
				Q = 1;
			end
			else begin
				Q = ~Q;
			end
		end
		_Q = ~Q;		
	end
//	always@(Q) begin
//		_Q = ~Q;
//	end
endmodule



