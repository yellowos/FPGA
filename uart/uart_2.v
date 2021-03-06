`timescale 1ns/1ns
module uart_receiver(
	//global clock
	input clk,
	input rst_n,
	//user interface
	input clken_16bps,//clk_bps*16
	input rxd,
	output reg [7 : 0] rxd_data,
	output reg rxd_flag
);

	reg rxd_sync;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			rxd_sync <= 1;
		else
			rxd_sync <= rxd;
	end

	localparam R_IDLE = 0;
	localparam R_START = 1;
	localparam R_SAMPLE = 2;
	localparam R_STOP = 3;


	case(rxd_state)
		R_IDLE:
			begin
				rxd_cnt <= 0;
				smp_cnt <= 0;
				if(rxd_sync == 1'b0)
					rxd_state <= R_STATE;
				else
					rxd_state <= R_IDLE;
			end

		localparam SMP_TOP = 8'd15;
		localparam SMP_CENTER = 8'd7;

		R_STATE:
			begin
				if(clken_16bps == 1) begin
					smp_cnt <= smp_cnt +1'b1;
					if(smp_cnt == SMP_CENTER && rxd_sync != 1'b0) begin
						rxd_cnt <= 0;
						rxd_state <= R_IDLE;
					end
					else if(smp_cnt == SMP_TOP) begin
						rxd_cnt <= 1;
						rxd_state <= R_SAMPLE;
					end
					else begin
						rxd_cnt <= 0;
						rxd_state <= R_START;
					end
				end
				else begin
					smp_cnt <= smp_cnt;
					rxd_state <= rxd_state;
				end
			end


		R_SAMPLE:
			begin
				if(clken_16bps == 1) begin
					smp_cnt <= smp_cnt + 1'b1;
					if(smp_cnt == SMP_TOP) begin
						if(rxd_cnt == 4'd8) begin
							rxd_cnt <= rxd_cnt + 1'b1;
							rxd_state <= R_SAMPLE;
						end
						else begin
							rxd_cnt <= 4'd9;
							rxd_state <= R_STOP;
						end
					end
					else begin
						rxd_cnt <= rxd_cnt;
						rxd_state <= rxd_state;
					end
				end
				else begin
					smp_cnt <= smp_cnt;
					rxd_cnt <= rxd_cnt;
					rxd_state <= rxd_state;
				end
			end
		
		
		R_STOP:
			begin
				if(clken_16bps == 1) begin
					smp_cnt <= smp_cnt + 1'b1;
					if(smp_cnt == SMP_TOP) begin
						rxd_state <= R_IDLE;
						rxd_cnt <= 0;
					end
					else begin
						rxd_cnt <= 9;
						rxd_sate <= R_STOP;
					end
				end
				else begin
					smp_cnt <= smp_cnt;
					rxd_cnt <= rxd_cnt;
					rxd_state <= rxd_state;
				end
			end
	endcase


	reg [7 : 0] rxd_data_r;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n)
			rxd_data_r <= 0;
		else if(rxd_state == R_SAMPLE) begin
			if(clken_16bps == 1 && smp_cnt == SMP_CENTER)
				case(rxd_cnt)
					4'd1:rxd_data_r[0] <= rxd_sync;
					4'd2:rxd_data_r[1] <= rxd_sync;
					4'd3:rxd_data_r[2] <= rxd_sync;
					4'd4:rxd_data_r[3] <= rxd_sync;
					4'd5:rxd_data_r[4] <= rxd_sync;
					4'd6:rxd_data_r[5] <= rxd_sync;
					4'd7:rxd_data_r[6] <= rxd_sync;
					4'd8:rxd_data_r[7] <= rxd_sync;
					default:;
				endcase
			else begin
				rxd_data_r <= rxd_data_r;
			end;
			else if(rxd_data_r == R_STOP)
				rxd_data_r <= rxd_data_r;
			else
				rxd_data_r <= 0;
	end

	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			rxd_data <= 0;
			rxd_falg <= 0;
		end
		else if(clken_16bps == 1 && rxd_cnt == 4'd9 && smp_cnt == SMP_TOP) begin
			rxd_data <= rxd_data_r;
			rxd_falg <= 1;
		end
		else begin
			rxd_data <= rxd_data;
			rxd_falg <= 0;
		end
	end








				


