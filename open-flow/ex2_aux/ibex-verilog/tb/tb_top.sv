// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module tb_top
(
`ifdef USE_POWER_PINS
	inout        VPWR,
	inout        VGND,
`endif

    input  logic sys_clk_i,
    input  logic sys_rst_ni,

    input  logic uart_rx_i,
    output logic uart_tx_o,
    
    output logic led
);

`ifdef ICARUS
    initial begin
        $dumpfile("dump.fst");
        $dumpvars(0, tb_top);
    end
`endif

    localparam INIT_FILE0 = "program0.vmem";
    localparam INIT_FILE1 = "program1.vmem";
    
    localparam VERBOSE = 0;

    localparam SRAM_NUM_WMASKS = 4;
    localparam SRAM_DATA_WIDTH = 32;
    localparam SRAM_ADDR_WIDTH = 9;

    // SRAM 0
    logic                       sram0_clk0;
    logic                       sram0_csb0;
    logic                       sram0_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram0_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram0_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram0_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram0_dout0;
    logic                       sram0_clk1;
    logic                       sram0_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram0_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram0_dout1;

    // SRAM 1
    logic                       sram1_clk0;
    logic                       sram1_csb0;
    logic                       sram1_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram1_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram1_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram1_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram1_dout0;
    logic                       sram1_clk1;
    logic                       sram1_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram1_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram1_dout1;
    
    // SRAM 2
    logic                       sram2_clk0;
    logic                       sram2_csb0;
    logic                       sram2_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram2_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram2_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram2_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram2_dout0;
    logic                       sram2_clk1;
    logic                       sram2_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram2_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram2_dout1;

    // SRAM 3
    logic                       sram3_clk0;
    logic                       sram3_csb0;
    logic                       sram3_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram3_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram3_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram3_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram3_dout0;
    logic                       sram3_clk1;
    logic                       sram3_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram3_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram3_dout1;
    
    // SRAM 4
    logic                       sram4_clk0;
    logic                       sram4_csb0;
    logic                       sram4_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram4_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram4_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram4_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram4_dout0;
    logic                       sram4_clk1;
    logic                       sram4_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram4_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram4_dout1;

    // SRAM 5
    logic                       sram5_clk0;
    logic                       sram5_csb0;
    logic                       sram5_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram5_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram5_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram5_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram5_dout0;
    logic                       sram5_clk1;
    logic                       sram5_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram5_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram5_dout1;
    
    // SRAM 6
    logic                       sram6_clk0;
    logic                       sram6_csb0;
    logic                       sram6_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram6_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram6_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram6_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram6_dout0;
    logic                       sram6_clk1;
    logic                       sram6_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram6_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram6_dout1;

    // SRAM 7
    logic                       sram7_clk0;
    logic                       sram7_csb0;
    logic                       sram7_web0;
    logic [SRAM_NUM_WMASKS-1:0] sram7_wmask0;
    logic [SRAM_ADDR_WIDTH-1:0] sram7_addr0;
    logic [SRAM_DATA_WIDTH-1:0] sram7_din0;
    logic [SRAM_DATA_WIDTH-1:0] sram7_dout0;
    logic                       sram7_clk1;
    logic                       sram7_csb1;
    logic [SRAM_ADDR_WIDTH-1:0] sram7_addr1;
    logic [SRAM_DATA_WIDTH-1:0] sram7_dout1;

    parameter ROM_DATA_WIDTH = 32;
    parameter ROM_ADDR_WIDTH = 10;

    // ROM 0
    logic                      rom0_clk;
    logic                      rom0_cs;
    logic [ROM_ADDR_WIDTH-1:0] rom0_addr;
    logic [ROM_DATA_WIDTH-1:0] rom0_dout;
    
    // ROM 1
    logic                      rom1_clk;
    logic                      rom1_cs;
    logic [ROM_ADDR_WIDTH-1:0] rom1_addr;
    logic [ROM_DATA_WIDTH-1:0] rom1_dout;

    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst0 (
        // Port 0: RW
        .clk0   (sram0_clk0),
        .csb0   (sram0_csb0),
        .web0   (sram0_web0),
        .wmask0 (sram0_wmask0),
        .addr0  (sram0_addr0),
        .din0   (sram0_din0),
        .dout0  (sram0_dout0),
        // Port 1: R
        .clk1   (sram0_clk1),
        .csb1   (sram0_csb1),
        .addr1  (sram0_addr1),
        .dout1  (sram0_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst1 (
        // Port 0: RW
        .clk0   (sram1_clk0),
        .csb0   (sram1_csb0),
        .web0   (sram1_web0),
        .wmask0 (sram1_wmask0),
        .addr0  (sram1_addr0),
        .din0   (sram1_din0),
        .dout0  (sram1_dout0),
        // Port 1: R
        .clk1   (sram1_clk1),
        .csb1   (sram1_csb1),
        .addr1  (sram1_addr1),
        .dout1  (sram1_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst2 (
        // Port 0: RW
        .clk0   (sram2_clk0),
        .csb0   (sram2_csb0),
        .web0   (sram2_web0),
        .wmask0 (sram2_wmask0),
        .addr0  (sram2_addr0),
        .din0   (sram2_din0),
        .dout0  (sram2_dout0),
        // Port 1: R
        .clk1   (sram2_clk1),
        .csb1   (sram2_csb1),
        .addr1  (sram2_addr1),
        .dout1  (sram2_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst3 (
        // Port 0: RW
        .clk0   (sram3_clk0),
        .csb0   (sram3_csb0),
        .web0   (sram3_web0),
        .wmask0 (sram3_wmask0),
        .addr0  (sram3_addr0),
        .din0   (sram3_din0),
        .dout0  (sram3_dout0),
        // Port 1: R
        .clk1   (sram3_clk1),
        .csb1   (sram3_csb1),
        .addr1  (sram3_addr1),
        .dout1  (sram3_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst4 (
        // Port 0: RW
        .clk0   (sram4_clk0),
        .csb0   (sram4_csb0),
        .web0   (sram4_web0),
        .wmask0 (sram4_wmask0),
        .addr0  (sram4_addr0),
        .din0   (sram4_din0),
        .dout0  (sram4_dout0),
        // Port 1: R
        .clk1   (sram4_clk1),
        .csb1   (sram4_csb1),
        .addr1  (sram4_addr1),
        .dout1  (sram4_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst5 (
        // Port 0: RW
        .clk0   (sram5_clk0),
        .csb0   (sram5_csb0),
        .web0   (sram5_web0),
        .wmask0 (sram5_wmask0),
        .addr0  (sram5_addr0),
        .din0   (sram5_din0),
        .dout0  (sram5_dout0),
        // Port 1: R
        .clk1   (sram5_clk1),
        .csb1   (sram5_csb1),
        .addr1  (sram5_addr1),
        .dout1  (sram5_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst6 (
        // Port 0: RW
        .clk0   (sram6_clk0),
        .csb0   (sram6_csb0),
        .web0   (sram6_web0),
        .wmask0 (sram6_wmask0),
        .addr0  (sram6_addr0),
        .din0   (sram6_din0),
        .dout0  (sram6_dout0),
        // Port 1: R
        .clk1   (sram6_clk1),
        .csb1   (sram6_csb1),
        .addr1  (sram6_addr1),
        .dout1  (sram6_dout1)
    );
    
    sky130_sram_2kbyte_1rw1r_32x512_8 #(
        .VERBOSE    ( VERBOSE         ),
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) sram_inst7 (
        // Port 0: RW
        .clk0   (sram7_clk0),
        .csb0   (sram7_csb0),
        .web0   (sram7_web0),
        .wmask0 (sram7_wmask0),
        .addr0  (sram7_addr0),
        .din0   (sram7_din0),
        .dout0  (sram7_dout0),
        // Port 1: R
        .clk1   (sram7_clk1),
        .csb1   (sram7_csb1),
        .addr1  (sram7_addr1),
        .dout1  (sram7_dout1)
    );
    
    sky130_rom_4kbyte_1r_32x1024 #(
        .VERBOSE    ( VERBOSE        ),
        .INIT_FILE  ( INIT_FILE0     ),
        .DATA_WIDTH ( ROM_DATA_WIDTH ),
        .ADDR_WIDTH ( ROM_ADDR_WIDTH )
    ) rom_inst0 (
        // Port 0: R
        .clk    (rom0_clk),
        .cs     (rom0_cs),
        .addr   (rom0_addr),
        .dout   (rom0_dout)
    );
    
    sky130_rom_4kbyte_1r_32x1024 #(
        .VERBOSE    ( VERBOSE        ),
        .INIT_FILE  ( INIT_FILE1     ),
        .DATA_WIDTH ( ROM_DATA_WIDTH ),
        .ADDR_WIDTH ( ROM_ADDR_WIDTH )
    ) rom_inst1 (
        // Port 0: R
        .clk    (rom1_clk),
        .cs     (rom1_cs),
        .addr   (rom1_addr),
        .dout   (rom1_dout)
    );

    ibex_soc #(
        .SRAM_NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .SRAM_DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .SRAM_ADDR_WIDTH ( SRAM_ADDR_WIDTH ),

        .ROM_DATA_WIDTH ( ROM_DATA_WIDTH ),
        .ROM_ADDR_WIDTH ( ROM_ADDR_WIDTH )
    ) ibex_soc_inst (
        .sys_clk_i  ( sys_clk_i ),
        .sys_rst_ni ( sys_rst_ni ),

        .uart_rx_i  ( uart_rx_i ),
        .uart_tx_o  ( uart_tx_o ),
        
        .led        ( led ),
        
        // SRAM 0 interface
        .sram0_clk0       ( sram0_clk0 ),
        .sram0_csb0       ( sram0_csb0 ),
        .sram0_web0       ( sram0_web0 ),
        .sram0_wmask0     ( sram0_wmask0 ),
        .sram0_addr0      ( sram0_addr0 ),
        .sram0_din0       ( sram0_din0 ),
        .sram0_dout0      ( sram0_dout0 ),
        .sram0_clk1       ( sram0_clk1 ),
        .sram0_csb1       ( sram0_csb1 ),
        .sram0_addr1      ( sram0_addr1 ),
        .sram0_dout1      ( sram0_dout1 ),
        
        // SRAM 1 interface
        .sram1_clk0       ( sram1_clk0 ),
        .sram1_csb0       ( sram1_csb0 ),
        .sram1_web0       ( sram1_web0 ),
        .sram1_wmask0     ( sram1_wmask0 ),
        .sram1_addr0      ( sram1_addr0 ),
        .sram1_din0       ( sram1_din0 ),
        .sram1_dout0      ( sram1_dout0 ),
        .sram1_clk1       ( sram1_clk1 ),
        .sram1_csb1       ( sram1_csb1 ),
        .sram1_addr1      ( sram1_addr1 ),
        .sram1_dout1      ( sram1_dout1 ),
        
        // SRAM 2 interface
        .sram2_clk0       ( sram2_clk0 ),
        .sram2_csb0       ( sram2_csb0 ),
        .sram2_web0       ( sram2_web0 ),
        .sram2_wmask0     ( sram2_wmask0 ),
        .sram2_addr0      ( sram2_addr0 ),
        .sram2_din0       ( sram2_din0 ),
        .sram2_dout0      ( sram2_dout0 ),
        .sram2_clk1       ( sram2_clk1 ),
        .sram2_csb1       ( sram2_csb1 ),
        .sram2_addr1      ( sram2_addr1 ),
        .sram2_dout1      ( sram2_dout1 ),
        
        // SRAM 3 interface
        .sram3_clk0       ( sram3_clk0 ),
        .sram3_csb0       ( sram3_csb0 ),
        .sram3_web0       ( sram3_web0 ),
        .sram3_wmask0     ( sram3_wmask0 ),
        .sram3_addr0      ( sram3_addr0 ),
        .sram3_din0       ( sram3_din0 ),
        .sram3_dout0      ( sram3_dout0 ),
        .sram3_clk1       ( sram3_clk1 ),
        .sram3_csb1       ( sram3_csb1 ),
        .sram3_addr1      ( sram3_addr1 ),
        .sram3_dout1      ( sram3_dout1 ),
        
        // SRAM 4 interface
        .sram4_clk0       ( sram4_clk0 ),
        .sram4_csb0       ( sram4_csb0 ),
        .sram4_web0       ( sram4_web0 ),
        .sram4_wmask0     ( sram4_wmask0 ),
        .sram4_addr0      ( sram4_addr0 ),
        .sram4_din0       ( sram4_din0 ),
        .sram4_dout0      ( sram4_dout0 ),
        .sram4_clk1       ( sram4_clk1 ),
        .sram4_csb1       ( sram4_csb1 ),
        .sram4_addr1      ( sram4_addr1 ),
        .sram4_dout1      ( sram4_dout1 ),
        
        // SRAM 5 interface
        .sram5_clk0       ( sram5_clk0 ),
        .sram5_csb0       ( sram5_csb0 ),
        .sram5_web0       ( sram5_web0 ),
        .sram5_wmask0     ( sram5_wmask0 ),
        .sram5_addr0      ( sram5_addr0 ),
        .sram5_din0       ( sram5_din0 ),
        .sram5_dout0      ( sram5_dout0 ),
        .sram5_clk1       ( sram5_clk1 ),
        .sram5_csb1       ( sram5_csb1 ),
        .sram5_addr1      ( sram5_addr1 ),
        .sram5_dout1      ( sram5_dout1 ),
        
        // SRAM 6 interface
        .sram6_clk0       ( sram6_clk0 ),
        .sram6_csb0       ( sram6_csb0 ),
        .sram6_web0       ( sram6_web0 ),
        .sram6_wmask0     ( sram6_wmask0 ),
        .sram6_addr0      ( sram6_addr0 ),
        .sram6_din0       ( sram6_din0 ),
        .sram6_dout0      ( sram6_dout0 ),
        .sram6_clk1       ( sram6_clk1 ),
        .sram6_csb1       ( sram6_csb1 ),
        .sram6_addr1      ( sram6_addr1 ),
        .sram6_dout1      ( sram6_dout1 ),
        
        // SRAM 7 interface
        .sram7_clk0       ( sram7_clk0 ),
        .sram7_csb0       ( sram7_csb0 ),
        .sram7_web0       ( sram7_web0 ),
        .sram7_wmask0     ( sram7_wmask0 ),
        .sram7_addr0      ( sram7_addr0 ),
        .sram7_din0       ( sram7_din0 ),
        .sram7_dout0      ( sram7_dout0 ),
        .sram7_clk1       ( sram7_clk1 ),
        .sram7_csb1       ( sram7_csb1 ),
        .sram7_addr1      ( sram7_addr1 ),
        .sram7_dout1      ( sram7_dout1 ),
        
        // ROM 0 interface
        .rom0_clk   ( rom0_clk  ),
        .rom0_cs    ( rom0_cs   ),
        .rom0_addr  ( rom0_addr ),
        .rom0_dout  ( rom0_dout ),
        
        // ROM 1 interface
        .rom1_clk   ( rom1_clk  ),
        .rom1_cs    ( rom1_cs   ),
        .rom1_addr  ( rom1_addr ),
        .rom1_dout  ( rom1_dout )
    );

    // Cipher
    
    // Slave interface for register configuration
    wire slave_req;
    wire slave_gnt;
    wire [31:0] slave_addr;
    wire slave_we;
    wire [3:0] slave_be;
    wire slave_rvalid;
    wire [31:0] slave_wdata;
    wire [31:0] slave_rdata;
    wire slave_err;

    // Master interface for DMA
    wire master_req;
    wire master_gnt;
    wire [31:0] master_addr;
    wire master_we;
    wire [3:0] master_be;
    wire master_rvalid;
    wire [31:0] master_wdata;
    wire [31:0] master_rdata;
    wire master_err;

    cipher_wrapper_ex2 cipher_wrapper_ex2_inst (
`ifdef USE_POWER_PINS
		.VPWR(VPWR),
		.VGND(VGND),
`endif

        .clk_i (sys_clk_i),
        .rst_ni (sys_rst_ni),

        // Slave interface for register configuration
        .slave_req,
        .slave_gnt,
        .slave_addr,
        .slave_we,
        .slave_be,
        .slave_rvalid,
        .slave_wdata,
        .slave_rdata,
        .slave_err,

        // Master interface for DMA
        .master_req,
        .master_gnt,
        .master_addr,
        .master_we,
        .master_be,
        .master_rvalid,
        .master_wdata,
        .master_rdata,
        .master_err
    );

endmodule

