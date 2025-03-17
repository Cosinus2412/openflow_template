`default_nettype none

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

    assign slave_gnt    = 1'b0;
    assign slave_rvalid = 1'b0;
    assign slave_rdata  = 32'b0;
    assign slave_err    = 1'b0;

    assign master_req   = 1'b0;
    assign master_addr  = 32'b0;
    assign master_we    = 1'b0;
    assign master_be    = 4'b0;
    assign master_wdata = 3'b0;

endmodule
