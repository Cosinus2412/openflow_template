// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module ibex_soc import ibex_soc_pkg::*;
#(
    parameter CLOCK_FREQUENCY = 40_000_000,
    
    // RAM parameters
    parameter SRAM_NUM_WMASKS = 4,
    parameter SRAM_DATA_WIDTH = 32,
    parameter SRAM_ADDR_WIDTH = 9,
    
    // ROM parameters
    parameter ROM_DATA_WIDTH = 32,
    parameter ROM_ADDR_WIDTH = 10
)
(
    input  logic sys_clk_i,
    input  logic sys_rst_ni,

    input  logic uart_rx_i,
    output logic uart_tx_o,
    
    output logic led_o,
    
    output logic       parout_valid_o,
    output logic [7:0] parout_o,
    
    output logic eoc_o,
    
    // SRAM 0 interface
    output logic                       sram0_clk0,
    output logic                       sram0_csb0,
    output logic                       sram0_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram0_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram0_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram0_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram0_dout0,

    output logic                       sram0_clk1,
    output logic                       sram0_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram0_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram0_dout1,
    
    // SRAM 1 interface
    output logic                       sram1_clk0,
    output logic                       sram1_csb0,
    output logic                       sram1_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram1_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram1_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram1_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram1_dout0,

    output logic                       sram1_clk1,
    output logic                       sram1_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram1_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram1_dout1,
    
    // SRAM 2 interface
    output logic                       sram2_clk0,
    output logic                       sram2_csb0,
    output logic                       sram2_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram2_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram2_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram2_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram2_dout0,

    output logic                       sram2_clk1,
    output logic                       sram2_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram2_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram2_dout1,
    
    // SRAM 3 interface
    output logic                       sram3_clk0,
    output logic                       sram3_csb0,
    output logic                       sram3_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram3_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram3_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram3_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram3_dout0,

    output logic                       sram3_clk1,
    output logic                       sram3_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram3_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram3_dout1,
    
    // SRAM 4 interface
    output logic                       sram4_clk0,
    output logic                       sram4_csb0,
    output logic                       sram4_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram4_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram4_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram4_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram4_dout0,

    output logic                       sram4_clk1,
    output logic                       sram4_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram4_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram4_dout1,
    
    // SRAM 5 interface
    output logic                       sram5_clk0,
    output logic                       sram5_csb0,
    output logic                       sram5_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram5_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram5_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram5_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram5_dout0,

    output logic                       sram5_clk1,
    output logic                       sram5_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram5_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram5_dout1,
    
    // SRAM 6 interface
    output logic                       sram6_clk0,
    output logic                       sram6_csb0,
    output logic                       sram6_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram6_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram6_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram6_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram6_dout0,

    output logic                       sram6_clk1,
    output logic                       sram6_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram6_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram6_dout1,
    
    // SRAM 7 interface
    output logic                       sram7_clk0,
    output logic                       sram7_csb0,
    output logic                       sram7_web0,
    output logic [SRAM_NUM_WMASKS-1:0] sram7_wmask0,
    output logic [SRAM_ADDR_WIDTH-1:0] sram7_addr0,
    output logic [SRAM_DATA_WIDTH-1:0] sram7_din0,
    input  logic [SRAM_DATA_WIDTH-1:0] sram7_dout0,

    output logic                       sram7_clk1,
    output logic                       sram7_csb1,
    output logic [SRAM_ADDR_WIDTH-1:0] sram7_addr1,
    input  logic [SRAM_DATA_WIDTH-1:0] sram7_dout1,
    
    // ROM 0 interface
    output logic                      rom0_clk,
    output logic                      rom0_cs,
    output logic [ROM_ADDR_WIDTH-1:0] rom0_addr,
    input  logic [ROM_DATA_WIDTH-1:0] rom0_dout,
    
    // ROM 1 interface
    output logic                      rom1_clk,
    output logic                      rom1_cs,
    output logic [ROM_ADDR_WIDTH-1:0] rom1_addr,
    input  logic [ROM_DATA_WIDTH-1:0] rom1_dout,
    
    // Slave interface for register configuration
    output        slave_req,
    input         slave_gnt,
    output [31:0] slave_addr,
    output        slave_we,
    output [3:0]  slave_be,
    input         slave_rvalid,
    output [31:0] slave_wdata,
    input  [31:0] slave_rdata,
    input         slave_err,

    // Master interface for DMA
    input         master_req,
    output        master_gnt,
    input  [31:0] master_addr,
    input         master_we,
    input  [3:0]  master_be,
    output        master_rvalid,
    input  [31:0] master_wdata,
    output [31:0] master_rdata,
    output        master_err
);

    localparam logic [31:0] MEM_START = 32'h00000000;
    localparam logic [31:0] MEM_MASK  = RAM_SIZE-1;

    logic clk;
    assign clk = sys_clk_i;
    
    logic rst_n;
    assign rst_n = sys_rst_ni;

    // Interrupts
    logic irq_timer, irq_uart_rx, irq_uart_tx;

    assign irq_timer = 1'b0;   // TODO
    assign irq_uart_rx = 1'b0; // TODO
    assign irq_uart_tx = 1'b0; // TODO

    // Interfaces
    bus_if instr_if();
    bus_if data_if();

    assign instr_if.we = '0;
    assign instr_if.be = '0;
    assign instr_if.wdata = '0;

    // Note: if you need to set different parameters
    // you need to convert the Ibex core again to Verilog
    ibex_top ibex_top (
        .clk_i                  ( clk                               ),
        .rst_ni                 ( rst_n                             ),
        
        .test_en_i              ( 1'b0                              ),
        .ram_cfg_i              ( { {1'b0, 4'b0}, {1'b0, 4'b0} }    ),

        .hart_id_i              ( 32'b0                             ),
        .boot_addr_i            ( 32'h00000080                      ),

        .instr_req_o            ( instr_if.req                      ),
        .instr_gnt_i            ( instr_if.gnt                      ),
        .instr_rvalid_i         ( instr_if.rvalid                   ),
        .instr_addr_o           ( instr_if.addr                     ),
        .instr_rdata_i          ( instr_if.rdata                    ),
        .instr_rdata_intg_i     ( 7'b0                              ),
        .instr_err_i            ( instr_if.err                      ),

        .data_req_o             ( data_if.req                       ),
        .data_gnt_i             ( data_if.gnt                       ),
        .data_rvalid_i          ( data_if.rvalid                    ),
        .data_we_o              ( data_if.we                        ),
        .data_be_o              ( data_if.be                        ),
        .data_addr_o            ( data_if.addr                      ),
        .data_wdata_o           ( data_if.wdata                     ),
        .data_wdata_intg_o      (                                   ),
        .data_rdata_i           ( data_if.rdata                     ),
        .data_rdata_intg_i      ( 7'b0                              ),
        .data_err_i             ( data_if.err                       ),

        .irq_software_i         ( 1'b0                              ),
        .irq_timer_i            ( irq_timer                         ),
        .irq_external_i         ( 1'b0                              ),
        .irq_fast_i             ( {13'b0, irq_uart_tx, irq_uart_rx} ),
        .irq_nm_i               ( 1'b0                              ),

        .scramble_key_valid_i   ( 1'b0                              ),
        .scramble_key_i         ( 128'h0                            ),
        .scramble_nonce_i       ( 64'h0                             ),
        .scramble_req_o         (                                   ),

        .debug_req_i            ( 1'b0                              ),
        .crash_dump_o           (                                   ),
        .double_fault_seen_o    (                                   ),
        
        .fetch_enable_i         ( 4'b0101                           ), // IbexMuBiOn
        .alert_minor_o          (                                   ),
        .alert_major_internal_o (                                   ),
        .alert_major_bus_o      (                                   ),
        .core_sleep_o           (                                   ),
        
        .scan_rst_ni            ( 1'b1                              )
    );

    bus_if rom_if();
    bus_if ram_if();
    bus_if slaves[7]();
    bus_if cipher_if();

    bus_arbiter2m1s #(
        .SLAVE_START( ROM_START ),
        .SLAVE_SIZE ( ROM_SIZE  )
    ) arbiter_inst0 (
        .clk_i   ( clk         ),
        .rst_ni  ( rst_n       ),
        .master1 ( instr_if    ),
        .master2 ( slaves[0]   ),
        .slave   ( rom_if      )
    );
    
    bus_arbiter2m1s #(
        .SLAVE_START( RAM_START ),
        .SLAVE_SIZE ( RAM_SIZE  )
    ) arbiter_inst1 (
        .clk_i   ( clk         ),
        .rst_ni  ( rst_n       ),
        .master1 ( cipher_if   ),
        .master2 ( slaves[1]   ),
        .slave   ( ram_if      )
    );
    
    bus_mux1mNs #(
        .N_SLAVES (7),
        .START_ADDR ( '{
            ROM_START,
            RAM_START,
            UART_START,
            BLINKY_START,
            PARIO_START,
            EOC_START,
            CIPHER_START
        } ),
        .MASK ( '{
            ROM_MASK,
            RAM_START,
            UART_MASK,
            BLINKY_MASK,
            PARIO_MASK,
            EOC_MASK,
            CIPHER_MASK
        } )
    ) bus_mux (
        .clk_i  ( clk     ),
        .rst_ni ( rst_n   ),
        .master ( data_if  ),
        .slave  ( slaves  )
    );

    rom_wrapper #(
        .DATA_WIDTH ( ROM_DATA_WIDTH ),
        .ADDR_WIDTH ( ROM_ADDR_WIDTH )
    ) rom_wrapper_inst (
        .clk_i       ( clk         ),
        .rst_ni      ( rst_n       ),
        .bus         ( rom_if      ),
        
        .rom0_clk   ( rom0_clk  ),
        .rom0_cs    ( rom0_cs   ),
        .rom0_addr  ( rom0_addr ),
        .rom0_dout  ( rom0_dout ),
        
        .rom1_clk   ( rom1_clk  ),
        .rom1_cs    ( rom1_cs   ),
        .rom1_addr  ( rom1_addr ),
        .rom1_dout  ( rom1_dout )
    );
    
    ram_wrapper #(
        .NUM_WMASKS ( SRAM_NUM_WMASKS ),
        .DATA_WIDTH ( SRAM_DATA_WIDTH ),
        .ADDR_WIDTH ( SRAM_ADDR_WIDTH )
    ) ram_wrapper_inst (
        .clk_i  ( clk         ),
        .rst_ni ( rst_n       ),
        .bus    ( ram_if      ),
        
        // SRAM 0 interface
        .sram0_clk0   ( sram0_clk0      ),
        .sram0_csb0   ( sram0_csb0      ),
        .sram0_web0   ( sram0_web0      ),
        .sram0_wmask0 ( sram0_wmask0    ),
        .sram0_addr0  ( sram0_addr0     ),
        .sram0_din0   ( sram0_din0      ),
        .sram0_dout0  ( sram0_dout0     ),

        .sram0_clk1   ( sram0_clk1      ),
        .sram0_csb1   ( sram0_csb1      ),
        .sram0_addr1  ( sram0_addr1     ),
        .sram0_dout1  ( sram0_dout1     ),
        
        // SRAM 1 interface
        .sram1_clk0   ( sram1_clk0      ),
        .sram1_csb0   ( sram1_csb0      ),
        .sram1_web0   ( sram1_web0      ),
        .sram1_wmask0 ( sram1_wmask0    ),
        .sram1_addr0  ( sram1_addr0     ),
        .sram1_din0   ( sram1_din0      ),
        .sram1_dout0  ( sram1_dout0     ),

        .sram1_clk1   ( sram1_clk1      ),
        .sram1_csb1   ( sram1_csb1      ),
        .sram1_addr1  ( sram1_addr1     ),
        .sram1_dout1  ( sram1_dout1     ),
        
        // SRAM 2 interface
        .sram2_clk0   ( sram2_clk0      ),
        .sram2_csb0   ( sram2_csb0      ),
        .sram2_web0   ( sram2_web0      ),
        .sram2_wmask0 ( sram2_wmask0    ),
        .sram2_addr0  ( sram2_addr0     ),
        .sram2_din0   ( sram2_din0      ),
        .sram2_dout0  ( sram2_dout0     ),

        .sram2_clk1   ( sram2_clk1      ),
        .sram2_csb1   ( sram2_csb1      ),
        .sram2_addr1  ( sram2_addr1     ),
        .sram2_dout1  ( sram2_dout1     ),
        
        // SRAM 3 interface
        .sram3_clk0   ( sram3_clk0      ),
        .sram3_csb0   ( sram3_csb0      ),
        .sram3_web0   ( sram3_web0      ),
        .sram3_wmask0 ( sram3_wmask0    ),
        .sram3_addr0  ( sram3_addr0     ),
        .sram3_din0   ( sram3_din0      ),
        .sram3_dout0  ( sram3_dout0     ),

        .sram3_clk1   ( sram3_clk1      ),
        .sram3_csb1   ( sram3_csb1      ),
        .sram3_addr1  ( sram3_addr1     ),
        .sram3_dout1  ( sram3_dout1     ),
        
        // SRAM 4 interface
        .sram4_clk0   ( sram4_clk0      ),
        .sram4_csb0   ( sram4_csb0      ),
        .sram4_web0   ( sram4_web0      ),
        .sram4_wmask0 ( sram4_wmask0    ),
        .sram4_addr0  ( sram4_addr0     ),
        .sram4_din0   ( sram4_din0      ),
        .sram4_dout0  ( sram4_dout0     ),

        .sram4_clk1   ( sram4_clk1      ),
        .sram4_csb1   ( sram4_csb1      ),
        .sram4_addr1  ( sram4_addr1     ),
        .sram4_dout1  ( sram4_dout1     ),
        
        // SRAM 5 interface
        .sram5_clk0   ( sram5_clk0      ),
        .sram5_csb0   ( sram5_csb0      ),
        .sram5_web0   ( sram5_web0      ),
        .sram5_wmask0 ( sram5_wmask0    ),
        .sram5_addr0  ( sram5_addr0     ),
        .sram5_din0   ( sram5_din0      ),
        .sram5_dout0  ( sram5_dout0     ),

        .sram5_clk1   ( sram5_clk1      ),
        .sram5_csb1   ( sram5_csb1      ),
        .sram5_addr1  ( sram5_addr1     ),
        .sram5_dout1  ( sram5_dout1     ),
        
        // SRAM 6 interface
        .sram6_clk0   ( sram6_clk0      ),
        .sram6_csb0   ( sram6_csb0      ),
        .sram6_web0   ( sram6_web0      ),
        .sram6_wmask0 ( sram6_wmask0    ),
        .sram6_addr0  ( sram6_addr0     ),
        .sram6_din0   ( sram6_din0      ),
        .sram6_dout0  ( sram6_dout0     ),

        .sram6_clk1   ( sram6_clk1      ),
        .sram6_csb1   ( sram6_csb1      ),
        .sram6_addr1  ( sram6_addr1     ),
        .sram6_dout1  ( sram6_dout1     ),
        
        // SRAM 7 interface
        .sram7_clk0   ( sram7_clk0      ),
        .sram7_csb0   ( sram7_csb0      ),
        .sram7_web0   ( sram7_web0      ),
        .sram7_wmask0 ( sram7_wmask0    ),
        .sram7_addr0  ( sram7_addr0     ),
        .sram7_din0   ( sram7_din0      ),
        .sram7_dout0  ( sram7_dout0     ),
        .sram7_clk1   ( sram7_clk1      ),
        .sram7_csb1   ( sram7_csb1      ),
        .sram7_addr1  ( sram7_addr1     ),
        .sram7_dout1  ( sram7_dout1     )
    );

    uart_wrapper #(
        .FREQUENCY ( CLOCK_FREQUENCY ),
        .BAUDRATE  ( 9600 )
    ) uart_wrapper_inst (
        .clk_i  ( clk         ),
        .rst_ni ( rst_n       ),
        .bus    ( slaves[2]   ),
        
        .uart_rx ( uart_rx_i ),
        .uart_tx ( uart_tx_o )
    );
    
    blinky_wrapper blinky_wrapper_inst (
        .clk_i  ( clk         ),
        .rst_ni ( rst_n       ),
        .bus    ( slaves[3]   ),
        
        .led    ( led_o )
    );
    
    parallel_out parallel_out_inst (
        .clk_i  ( clk         ),
        .rst_ni ( rst_n       ),
        .bus    ( slaves[4]   ),
        
        .parout_valid   ( parout_valid_o ),
        .parout         ( parout_o       )
    );
    
    eoc_controller eoc_controller_inst (
        .clk_i  ( clk         ),
        .rst_ni ( rst_n       ),
        .bus    ( slaves[5]   ),
        
        .eoc_o  ( eoc_o )
    );
    
    cipher_wrapper cipher_wrapper_inst (
        .clk_i      ( clk           ),
        .rst_ni     ( rst_n         ),
    
        .bus_slave  ( slaves[6]     ),
        .bus_master ( cipher_if     ),

        .slave_req,
        .slave_gnt,
        .slave_addr,
        .slave_we,
        .slave_be,
        .slave_rvalid,
        .slave_wdata,
        .slave_rdata,
        .slave_err,

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
