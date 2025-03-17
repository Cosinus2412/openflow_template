// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module blinky_wrapper (
    input  logic clk_i,
    input  logic rst_ni,
    bus_if.slave bus,

    output logic led,
);
    // Stores the current state
    logic blinky;
    
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
    
    // Read logic
    logic [31:0] uart_rdata;
    always_ff @(posedge clk_i) begin
        bus.rdata <= '0;
        if (bus.req && !bus.we) begin
            bus.rdata <= blinky;
        end
    end
    
    // Write logic
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            blinky <= '0;
        end else begin
            if (bus.req && bus.we) begin
                blinky <= bus.wdata[0];
            end
        end
    end
    
    assign led = blinky;

endmodule
