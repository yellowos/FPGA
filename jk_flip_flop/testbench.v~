`timescale 1ns/1ns
module testbench;
	reg clk;
	wire j_in;
	wire k_in;
	wire Q_out;
	wire _Q_out;
	reg [1 : 0] cnt;
	initial begin 
		clk = 1'b1;
		cnt = 2'b01;

	end

	always begin
		#10 clk = ~clk;
//		#5
//		#40 j_in = ~j_in;
//		#20 k_in = ~k_in;
	end
	always@(posedge clk) begin
		#5 
		cnt = cnt + 1'b1;
	end

	assign j_in = cnt[0];
	assign k_in = cnt[1];

	jk_flip_flop jk_ff(
		.clk(clk),
		.j(j_in),
		.k(k_in),
		.Q(Q_out),
		._Q(_Q_out)
	);
endmodule






