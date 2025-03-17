`default_nettype none

import cipher_pkg::*;

module cipher_peripheral (
    input  logic      clk_i,
    input  logic      rst_ni,

    // Slave interface for registers
    bus_if.slave      bus_slave,

    // Master interface for DMA
    bus_if.master     bus_master
);

    // TODO Implement your peripheral

    assign bus_slave.gnt = bus_slave.req; // to make the disconnected pins checker happy
    assign bus_slave.rvalid = 1'b0;
    assign bus_slave.rdata = 32'b0;
    assign bus_slave.err = 1'b0;

    assign bus_master.req = 1'b0;
    assign bus_master.addr = 32'b0;
    assign bus_master.we = 1'b0;
    assign bus_master.be = 4'b0;
    assign bus_master.wdata = 32'b0;

endmodule
