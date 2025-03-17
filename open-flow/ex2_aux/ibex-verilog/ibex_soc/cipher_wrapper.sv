// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module cipher_wrapper (
    input  logic clk_i,
    input  logic rst_ni,
    
    // Slave interface for registers
    bus_if.slave      bus_slave,

    // Master interface for DMA
    bus_if.master     bus_master,
    
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

    assign slave_req = bus_slave.req;
    assign bus_slave.gnt = slave_gnt;
    assign slave_addr = bus_slave.addr;
    assign slave_we = bus_slave.we;
    assign slave_be = bus_slave.be;
    assign bus_slave.rvalid = slave_rvalid;
    assign slave_wdata = bus_slave.wdata;
    assign bus_slave.rdata = slave_rdata;
    assign bus_slave.err = slave_err;

    assign bus_master.req = master_req;
    assign master_gnt = bus_master.gnt;
    assign bus_master.addr = master_addr;
    assign bus_master.we = master_we;
    assign bus_master.be = master_be;
    assign master_rvalid = bus_master.rvalid;
    assign bus_master.wdata = master_wdata;
    assign master_rdata = bus_master.rdata;
    assign master_err = bus_master.err;

endmodule
