`timescale 1ns/1ns
module testbench;
	reg clk;
	reg [15 : 0] code_in;
	wire [3 : 0] code_out;

	initial begin
		clk = 1'b1;
		code_in = 16'h0;
	end

	always begin
		#10 clk = ~ clk;
	end

	always@(posedge clk) begin
		code_in = code_in + 1'b1;
	end

	n_priority_encoder#(4) encoder_16_4(
		.code_in(code_in),
		.code_out(code_out)
		);
endmodule






