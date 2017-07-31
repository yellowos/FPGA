
module yellowos_de_nios_ii (
	clk_clk,
	reset_reset_n,
	sdram_0_addr,
	sdram_0_ba,
	sdram_0_cas_n,
	sdram_0_cke,
	sdram_0_cs_n,
	sdram_0_dq,
	sdram_0_dqm,
	sdram_0_ras_n,
	sdram_0_we_n,
	epcs_0_dclk,
	epcs_0_sce,
	epcs_0_sdo,
	epcs_0_data0,
	pio_0_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_0_addr;
	output	[1:0]	sdram_0_ba;
	output		sdram_0_cas_n;
	output		sdram_0_cke;
	output		sdram_0_cs_n;
	inout	[15:0]	sdram_0_dq;
	output	[1:0]	sdram_0_dqm;
	output		sdram_0_ras_n;
	output		sdram_0_we_n;
	output		epcs_0_dclk;
	output		epcs_0_sce;
	output		epcs_0_sdo;
	input		epcs_0_data0;
	output	[7:0]	pio_0_export;
endmodule
