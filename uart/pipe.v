module pipe(
	input clk,
	input [7 : 0] data_in,
	input send,
	output [7 : 0] data_out,
	output full_sign,
);
	reg [15 : 0] pipe_data [1024]

