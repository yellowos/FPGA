`timescale 1ns/1ns
module precise_divider
#(
	paramater DEVIDE_CNT = 332'd6597070;
)
(
	input clk,
	input rst_n,

	output divide_clk,
	output divide_clken
);

	reg [31 : 0] cnt;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			cnt <= 0;
		else
			cnt <= cnt + DEVIDE_CNT;
	end


	reg cnt_equal;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			cnt <= 0;
		else if(cnt < 32'h7FFF_FFFF)
			cnt_equal <= 0;
		else 
			cnt_equal <= 1;
	end


	reg cnt_equal_r
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			cnt_equal_r <= 0;
		else
			cnt_equal_r <= cnt_equal;
	end

	assign divide_clken = (~cnt_equal_r & cnt_equal) ? 1'b1 : 1'b0;
	assign divide_clk = clk_equal_r;
endmodule
