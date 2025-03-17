`default_nettype none

import cipher_pkg::*;

module cipher_wrapper_ex2 (
    input  logic      clk_i,
    input  logic      rst_ni,

    // Slave interface for register configuration
    input  slave_req,
    output slave_gnt,
    input  [31:0] slave_addr,
    input  slave_we,
    input  [3:0] slave_be,
    output slave_rvalid,
    input  [31:0] slave_wdata,
    output [31:0] slave_rdata,
    output slave_err,

    // Master interface for DMA
    output master_req,
    input  master_gnt,
    output [31:0] master_addr,
    output master_we,
    output [3:0] master_be,
    input  master_rvalid,
    output [31:0] master_wdata,
    input  [31:0] master_rdata,
    input  master_err
);

    bus_if bus_slave();
    bus_if bus_master();

    assign bus_slave.req = slave_req;
    assign slave_gnt = bus_slave.gnt;
    assign bus_slave.addr = slave_addr;
    assign bus_slave.we = slave_we;
    assign bus_slave.be = slave_be;
    assign slave_rvalid = bus_slave.rvalid;
    assign bus_slave.wdata = slave_wdata;
    assign slave_rdata = bus_slave.rdata;
    assign slave_err = bus_slave.err;

    assign master_req = bus_master.req;
    assign bus_master.gnt = master_gnt;
    assign master_addr = bus_master.addr;
    assign master_we = bus_master.we;
    assign master_be = bus_master.be;
    assign bus_master.rvalid = master_rvalid;
    assign master_wdata = bus_master.wdata;
    assign bus_master.rdata = master_rdata;
    assign bus_master.err = master_err;

    cipher_peripheral cipher_peripheral_inst (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .bus_slave  (bus_slave),
        .bus_master (bus_master)
    );

endmodule
