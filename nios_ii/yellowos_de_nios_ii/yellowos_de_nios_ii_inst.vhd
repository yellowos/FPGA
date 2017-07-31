	component yellowos_de_nios_ii is
		port (
			clk_clk       : in    std_logic                     := 'X';             -- clk
			reset_reset_n : in    std_logic                     := 'X';             -- reset_n
			sdram_0_addr  : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_0_ba    : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_0_cas_n : out   std_logic;                                        -- cas_n
			sdram_0_cke   : out   std_logic;                                        -- cke
			sdram_0_cs_n  : out   std_logic;                                        -- cs_n
			sdram_0_dq    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_0_dqm   : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_0_ras_n : out   std_logic;                                        -- ras_n
			sdram_0_we_n  : out   std_logic;                                        -- we_n
			epcs_0_dclk   : out   std_logic;                                        -- dclk
			epcs_0_sce    : out   std_logic;                                        -- sce
			epcs_0_sdo    : out   std_logic;                                        -- sdo
			epcs_0_data0  : in    std_logic                     := 'X';             -- data0
			pio_0_export  : out   std_logic_vector(7 downto 0)                      -- export
		);
	end component yellowos_de_nios_ii;

	u0 : component yellowos_de_nios_ii
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --     clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --   reset.reset_n
			sdram_0_addr  => CONNECTED_TO_sdram_0_addr,  -- sdram_0.addr
			sdram_0_ba    => CONNECTED_TO_sdram_0_ba,    --        .ba
			sdram_0_cas_n => CONNECTED_TO_sdram_0_cas_n, --        .cas_n
			sdram_0_cke   => CONNECTED_TO_sdram_0_cke,   --        .cke
			sdram_0_cs_n  => CONNECTED_TO_sdram_0_cs_n,  --        .cs_n
			sdram_0_dq    => CONNECTED_TO_sdram_0_dq,    --        .dq
			sdram_0_dqm   => CONNECTED_TO_sdram_0_dqm,   --        .dqm
			sdram_0_ras_n => CONNECTED_TO_sdram_0_ras_n, --        .ras_n
			sdram_0_we_n  => CONNECTED_TO_sdram_0_we_n,  --        .we_n
			epcs_0_dclk   => CONNECTED_TO_epcs_0_dclk,   --  epcs_0.dclk
			epcs_0_sce    => CONNECTED_TO_epcs_0_sce,    --        .sce
			epcs_0_sdo    => CONNECTED_TO_epcs_0_sdo,    --        .sdo
			epcs_0_data0  => CONNECTED_TO_epcs_0_data0,  --        .data0
			pio_0_export  => CONNECTED_TO_pio_0_export   --   pio_0.export
		);

