`timescale 1ns/1ps
module testbench;
	reg clk;
	reg [31 : 0] freq;
	reg [31 : 0] phase_1;
	reg [31 : 0] phase_2;
	reg reset;
	wire pul_1;
	wire pul_2;
	initial begin
		clk = 1'b0;
		reset = 1'b0 ;
		phase_1 = 32'd0;
		phase_2 = 32'b0;
		freq = 32'd858993;
		#200000 freq = 32'd2576980;
		#500000 freq = 32'd4294967;
		#800000 phase_1 = 32'd1073741824;
		#1200000 phase_1 = 32'd2147483648;
		#3400000 reset = 1'b1;
		#6000000 freq = 32'd858993;
	end

	always begin 
		#10 clk = ~clk;
	end

	dds_pulse #(32) dds_pulse_test_phase(
		.clk(clk),
		.reset(reset),
		.freq_ctrl_f(freq),
		.freq_ctrl_p(phase_1),
		.pulse(pul_1)
	);
	
	dds_pulse #(32) dds_pulse_test_freq_only(
		.clk(clk),
		.reset(reset),
		.freq_ctrl_f(freq),
		.freq_ctrl_p(phase_2),
		.pulse(pul_2)
	);


endmodule

