// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module rom_wrapper #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
) (
    input  logic clk_i,
    input  logic rst_ni,
    bus_if.slave bus,
    
    // ROM 0 interface
    output logic                  rom0_clk,   // clock
    output logic                  rom0_cs,   // active low chip select
    output logic [ADDR_WIDTH-1:0] rom0_addr,
    input  logic [DATA_WIDTH-1:0] rom0_dout,
    
    // ROM 1 interface
    output logic                  rom1_clk,   // clock
    output logic                  rom1_cs,   // active low chip select
    output logic [ADDR_WIDTH-1:0] rom1_addr,
    input  logic [DATA_WIDTH-1:0] rom1_dout
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
    
    // ROM selection logic
    logic rom0_select;
    logic rom1_select;
    logic rom0_select_d;
    logic rom1_select_d;
    
    assign rom0_select = bus.req && !bus.addr[ADDR_WIDTH+2];
    assign rom1_select = bus.req &&  bus.addr[ADDR_WIDTH+2];
    
    // Delay selection logic by one cycle
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            rom0_select_d <= 1'b0;
            rom1_select_d <= 1'b0;
        end else begin
            rom0_select_d <= rom0_select;
            rom1_select_d <= rom1_select;
        end
    end

    // ROM 0

    // Use port 0 for read/write
    assign rom0_clk = clk_i;
    assign rom0_cs = 1'b1;
    assign rom0_addr = rom0_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    
    // ROM 1
    
    // Use port 0 for read/write
    assign rom1_clk = clk_i;
    assign rom1_cs = 1'b1;
    assign rom1_addr = rom1_select ? bus.addr[ADDR_WIDTH+1:2] : '0;
    
    // Multiplex rdata with delayed selection
    assign bus.rdata = rom0_select_d ? rom0_dout : rom1_select_d ? rom1_dout : '0;

endmodule
