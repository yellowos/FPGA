
module testbench;
	reg clk;
	reg [3 : 0] code_in;
	wire [1 : 0] code_out;

	initial begin
		clk <= 1'b1;
		code_in <=4'b0;
	end

	always begin
		#10 clk <= ~clk;
	end

	always@(posedge clk) begin
		code_in = code_in + 1'b1;
	end

	p_encoder encoder_1(
		.code_in(code_in),
		.code_out(code_out));
endmodule
	






