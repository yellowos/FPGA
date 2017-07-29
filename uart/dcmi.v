module dcmi(
	input [7 : 0] data,
	input pclk,
	input href,
	input vsync,
	output reg [15 : 0] data_out_RGB565,
	output reg send,
	output reg receive_finish
);
	
	reg connect_low;
	reg [8 : 0] pixel_cnt;
	reg [8 : 0] row_cnt;

	initial begin
		connect_low = 1;
	end

	always@(posedge pclk) begin
		if(vsync) begin
			pixel_cnt = 9'b0;
			row_cnt = 9'b0;
			send = 1'b0;
			receive_finish = 1'b0;
		end
		if(href && (send == 0)) begin
			if(connect_low) begin
				data_out_RGB565[7 : 0] = data;
			end
			else begin
				data_out_RGB565[15 : 8] = data;
				send = 1'b1;
				pixel_cnt = pixel_cnt + 1'b1;
				if(pixel_cnt == 9'd400) begin
					pixel_cnt = 9'b0;
					row_cnt = row_cnt + 9'b1;
					if(row_cnt  == 9'd300) begin
						row_cnt = 9'b0;
						receive_finish = 1'b1;
					end
				end
			end
			connect_low = ~connect_low;
		end
	end
endmodule		
				
