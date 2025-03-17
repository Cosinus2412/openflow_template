// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module ram_wrapper #(
    // For one instance
    parameter NUM_WMASKS = 4,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 9
) (
    input  logic clk_i,
    input  logic rst_ni,
    bus_if.slave bus,
    
    // SRAM 0 interface
    output logic                  sram0_clk0,   // clock
    output logic                  sram0_csb0,   // active low chip select
    output logic                  sram0_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram0_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram0_addr0,
    output logic [DATA_WIDTH-1:0] sram0_din0,
    input  logic [DATA_WIDTH-1:0] sram0_dout0,

    output logic                  sram0_clk1,   // clock
    output logic                  sram0_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram0_addr1,
    input  logic [DATA_WIDTH-1:0] sram0_dout1,
    
    // SRAM 1 interface
    output logic                  sram1_clk0,   // clock
    output logic                  sram1_csb0,   // active low chip select
    output logic                  sram1_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram1_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram1_addr0,
    output logic [DATA_WIDTH-1:0] sram1_din0,
    input  logic [DATA_WIDTH-1:0] sram1_dout0,

    output logic                  sram1_clk1,   // clock
    output logic                  sram1_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram1_addr1,
    input  logic [DATA_WIDTH-1:0] sram1_dout1,
    
    // SRAM 2 interface
    output logic                  sram2_clk0,   // clock
    output logic                  sram2_csb0,   // active low chip select
    output logic                  sram2_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram2_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram2_addr0,
    output logic [DATA_WIDTH-1:0] sram2_din0,
    input  logic [DATA_WIDTH-1:0] sram2_dout0,

    output logic                  sram2_clk1,   // clock
    output logic                  sram2_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram2_addr1,
    input  logic [DATA_WIDTH-1:0] sram2_dout1,
    
    // SRAM 3 interface
    output logic                  sram3_clk0,   // clock
    output logic                  sram3_csb0,   // active low chip select
    output logic                  sram3_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram3_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram3_addr0,
    output logic [DATA_WIDTH-1:0] sram3_din0,
    input  logic [DATA_WIDTH-1:0] sram3_dout0,

    output logic                  sram3_clk1,   // clock
    output logic                  sram3_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram3_addr1,
    input  logic [DATA_WIDTH-1:0] sram3_dout1,
    
    // SRAM 4 interface
    output logic                  sram4_clk0,   // clock
    output logic                  sram4_csb0,   // active low chip select
    output logic                  sram4_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram4_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram4_addr0,
    output logic [DATA_WIDTH-1:0] sram4_din0,
    input  logic [DATA_WIDTH-1:0] sram4_dout0,

    output logic                  sram4_clk1,   // clock
    output logic                  sram4_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram4_addr1,
    input  logic [DATA_WIDTH-1:0] sram4_dout1,
    
    // SRAM 5 interface
    output logic                  sram5_clk0,   // clock
    output logic                  sram5_csb0,   // active low chip select
    output logic                  sram5_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram5_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram5_addr0,
    output logic [DATA_WIDTH-1:0] sram5_din0,
    input  logic [DATA_WIDTH-1:0] sram5_dout0,

    output logic                  sram5_clk1,   // clock
    output logic                  sram5_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram5_addr1,
    input  logic [DATA_WIDTH-1:0] sram5_dout1,
    
    // SRAM 6 interface
    output logic                  sram6_clk0,   // clock
    output logic                  sram6_csb0,   // active low chip select
    output logic                  sram6_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram6_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram6_addr0,
    output logic [DATA_WIDTH-1:0] sram6_din0,
    input  logic [DATA_WIDTH-1:0] sram6_dout0,

    output logic                  sram6_clk1,   // clock
    output logic                  sram6_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram6_addr1,
    input  logic [DATA_WIDTH-1:0] sram6_dout1,
    
    // SRAM 7 interface
    output logic                  sram7_clk0,   // clock
    output logic                  sram7_csb0,   // active low chip select
    output logic                  sram7_web0,   // active low write control
    output logic [NUM_WMASKS-1:0] sram7_wmask0, // write mask
    output logic [ADDR_WIDTH-1:0] sram7_addr0,
    output logic [DATA_WIDTH-1:0] sram7_din0,
    input  logic [DATA_WIDTH-1:0] sram7_dout0,

    output logic                  sram7_clk1,   // clock
    output logic                  sram7_csb1,   // active low chip select
    output logic [ADDR_WIDTH-1:0] sram7_addr1,
    input  logic [DATA_WIDTH-1:0] sram7_dout1
);

    // Immediately assign a grant
    assign bus.gnt = bus.req;

    // We do not generate errors
    assign bus.err = 1'b0;

    // Delay rvalid by one cycle
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            bus.rvalid <= '0;
        end else begin
            bus.rvalid <= bus.req;
        end
    end

    // SRAM selection logic
    logic sram0_select;
    logic sram1_select;
    logic sram2_select;
    logic sram3_select;
    logic sram4_select;
    logic sram5_select;
    logic sram6_select;
    logic sram7_select;
    
    logic sram0_select_d;
    logic sram1_select_d;
    logic sram2_select_d;
    logic sram3_select_d;
    logic sram4_select_d;
    logic sram5_select_d;
    logic sram6_select_d;
    logic sram7_select_d;
    
    assign sram0_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd0;
    assign sram1_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd1;
    assign sram2_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd2;
    assign sram3_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd3;
    assign sram4_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd4;
    assign sram5_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd5;
    assign sram6_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd6;
    assign sram7_select = bus.req && bus.addr[ADDR_WIDTH+5:ADDR_WIDTH+2] == 4'd7;
    
    // Delay selection logic by one cycle
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            sram0_select_d <= 1'b0;
            sram1_select_d <= 1'b0;
            sram2_select_d <= 1'b0;
            sram3_select_d <= 1'b0;
            sram4_select_d <= 1'b0;
            sram5_select_d <= 1'b0;
            sram6_select_d <= 1'b0;
            sram7_select_d <= 1'b0;
        end else begin
            sram0_select_d <= sram0_select;
            sram1_select_d <= sram1_select;
            sram2_select_d <= sram2_select;
            sram3_select_d <= sram3_select;
            sram4_select_d <= sram4_select;
            sram5_select_d <= sram5_select;
            sram6_select_d <= sram6_select;
            sram7_select_d <= sram7_select;
        end
    end

    // SRAM 0

    // Use port 0 for read/write
    assign sram0_clk0   = clk_i;
    assign sram0_csb0   = 1'b0;
    assign sram0_web0   = sram0_select ? !bus.we : 1'b1;
    assign sram0_wmask0 = sram0_select ? bus.be : 4'b0;
    assign sram0_addr0  = sram0_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram0_din0   = sram0_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram0_clk1   = 1'b0;
    assign sram0_csb1   = 1'b1;
    assign sram0_addr1  = '0;
    
    // SRAM 1

    // Use port 0 for read/write
    assign sram1_clk0   = clk_i;
    assign sram1_csb0   = 1'b0;
    assign sram1_web0   = sram1_select ? !bus.we : 1'b1;
    assign sram1_wmask0 = sram1_select ? bus.be : 4'b0;
    assign sram1_addr0  = sram1_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram1_din0   = sram1_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram1_clk1   = 1'b0;
    assign sram1_csb1   = 1'b1;
    assign sram1_addr1  = '0;
    
    // SRAM 2

    // Use port 0 for read/write
    assign sram2_clk0   = clk_i;
    assign sram2_csb0   = 1'b0;
    assign sram2_web0   = sram2_select ? !bus.we : 1'b1;
    assign sram2_wmask0 = sram2_select ? bus.be : 4'b0;
    assign sram2_addr0  = sram2_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram2_din0   = sram2_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram2_clk1   = 1'b0;
    assign sram2_csb1   = 1'b1;
    assign sram2_addr1  = '0;
    
    // SRAM 3

    // Use port 0 for read/write
    assign sram3_clk0   = clk_i;
    assign sram3_csb0   = 1'b0;
    assign sram3_web0   = sram3_select ? !bus.we : 1'b1;
    assign sram3_wmask0 = sram3_select ? bus.be : 4'b0;
    assign sram3_addr0  = sram3_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram3_din0   = sram3_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram3_clk1   = 1'b0;
    assign sram3_csb1   = 1'b1;
    assign sram3_addr1  = '0;
    
    // SRAM 4

    // Use port 0 for read/write
    assign sram4_clk0   = clk_i;
    assign sram4_csb0   = 1'b0;
    assign sram4_web0   = sram4_select ? !bus.we : 1'b1;
    assign sram4_wmask0 = sram4_select ? bus.be : 4'b0;
    assign sram4_addr0  = sram4_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram4_din0   = sram4_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram4_clk1   = 1'b0;
    assign sram4_csb1   = 1'b1;
    assign sram4_addr1  = '0;
    
    // SRAM 5

    // Use port 0 for read/write
    assign sram5_clk0   = clk_i;
    assign sram5_csb0   = 1'b0;
    assign sram5_web0   = sram5_select ? !bus.we : 1'b1;
    assign sram5_wmask0 = sram5_select ? bus.be : 4'b0;
    assign sram5_addr0  = sram5_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram5_din0   = sram5_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram5_clk1   = 1'b0;
    assign sram5_csb1   = 1'b1;
    assign sram5_addr1  = '0;
    
    // SRAM 6

    // Use port 0 for read/write
    assign sram6_clk0   = clk_i;
    assign sram6_csb0   = 1'b0;
    assign sram6_web0   = sram6_select ? !bus.we : 1'b1;
    assign sram6_wmask0 = sram6_select ? bus.be : 4'b0;
    assign sram6_addr0  = sram6_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram6_din0   = sram6_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram6_clk1   = 1'b0;
    assign sram6_csb1   = 1'b1;
    assign sram6_addr1  = '0;
    
    // SRAM 7

    // Use port 0 for read/write
    assign sram7_clk0   = clk_i;
    assign sram7_csb0   = 1'b0;
    assign sram7_web0   = sram7_select ? !bus.we : 1'b1;
    assign sram7_wmask0 = sram7_select ? bus.be : 4'b0;
    assign sram7_addr0  = sram7_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    assign sram7_din0   = sram7_select ? bus.wdata : '0;
    
    // Port 1 is unused for now
    assign sram7_clk1   = 1'b0;
    assign sram7_csb1   = 1'b1;
    assign sram7_addr1  = '0;
    
    // Multiplex rdata with delayed selection
    assign bus.rdata =  sram0_select_d ? sram0_dout0 : 
                        sram1_select_d ? sram1_dout0 : 
                        sram2_select_d ? sram2_dout0 : 
                        sram3_select_d ? sram3_dout0 :
                        sram4_select_d ? sram4_dout0 : 
                        sram5_select_d ? sram5_dout0 : 
                        sram6_select_d ? sram6_dout0 : 
                        sram7_select_d ? sram7_dout0 : '0;

endmodule
