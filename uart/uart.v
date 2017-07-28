module uart_ttl_send
(
	input [7 : 0] send_data,
       	input baud_rate_sign,
	input clk,
	output serial_send,
//	output reg send_finish,
	input reg send
);
	integer i;

	initial begin
		busy = 1'b0;
		serial_send = 1'b1;
		send_data = 8'b11111111;
		i = 0;
	end

	always@(posedge clk) begin

		if(baud_rate_sign && send) begin
			if(i == 0) begin
				serial_send = 1'b0;
			end
			serial_send = send_data[i];
			i = i + 1;
		end

		if(i == 8) begin
			serial_send = 1'b0;
			if(baud_rate_sign && send == 0 ) begin
				i = 0;
				serial_send = 1'b1;
			end
			send = 0;
		end
	end

endmodule
		
