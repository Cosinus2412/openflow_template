// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module uart_wrapper #(
    parameter FREQUENCY    = 40_000_000,
    parameter BAUDRATE     = 9600
) (
    input  logic clk_i,
    input  logic rst_ni,
    bus_if.slave bus,

    input  logic uart_rx,
    output logic uart_tx
);
    
    /*
        Register Map
        
        0x00: uart status |rx_flag|tx_busy|
        0x04: uart rx
        0x08: uart tx
        0x0C: baudrate configuration |wait_cycles|
    */
    
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
        uart_rdata <= '0;
        if (bus.req && !bus.we) begin
            case (bus.addr[3:0])
                4'h0: uart_rdata <= {{30{1'b0}}, tx_busy, rx_flag};
                4'h4: uart_rdata <= rx_data_d;
                4'h8: uart_rdata <= '0;
                4'hC: uart_rdata <= {{16{1'b0}}, wait_cycles};
            endcase
        end
    end
    
    assign bus.rdata = uart_rdata;
    
    localparam DEFAULT_WAIT_CYCLES = FREQUENCY / BAUDRATE;
    logic [15:0] wait_cycles;
    
    // Write logic
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            wait_cycles <= DEFAULT_WAIT_CYCLES;
        end else begin
            if (bus.req && bus.we) begin
                case (bus.addr[3:0])
                    4'h0: ;
                    4'h4: ;
                    4'h8: ;
                    4'hC: begin
                        if (bus.be[0]) wait_cycles[ 7:0] <= bus.wdata[ 7:0];
                        if (bus.be[1]) wait_cycles[15:8] <= bus.wdata[15:8];
                    end
                endcase
            end
        end
    end
    
    // Synchronize input
    logic uart_rx_sync;

    synchronizer #(
        .FF_COUNT(3)
    ) synchronizer (
        .clk(clk_i),
        .resetn(rst_ni),
        .in(uart_rx),

        .out(uart_rx_sync)
    );
    
    logic rx_flag;
    logic [7:0] rx_data_d;
    
    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            rx_flag  <= 1'b0;
            rx_data_d <= '0;
        end else begin
            if (!rx_done_delayed && rx_done) begin
                rx_data_d <= rx_data;
                rx_flag <= 1'b1;
            end
            else if (bus.req && !bus.we && bus.addr[3:0] == 4'h0) rx_flag <= 1'b0;
        end
    end
    
    logic [7:0] rx_data;
    logic rx_done;
    logic rx_done_delayed;

    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            rx_done_delayed <= 1'b0;
        end else begin
            rx_done_delayed <= rx_done;
        end
    end
    
    uart_rx uart_rx_inst (
        .clk    (clk_i),
        .rst    (!rst_ni),
        .rx     (uart_rx),
        .data   (rx_data),
        .valid  (rx_done),
        
        .wait_cycles(wait_cycles)
    );

    logic tx_busy;

    uart_tx uart_tx_inst (
        .clk    (clk_i),
        .rst    (!rst_ni),
        .data   (bus.wdata[7:0]),
        .start  (bus.req && bus.we && bus.addr[3:0] == 4'h8),
        .tx     (uart_tx),
        .busy   (tx_busy),
        
        .wait_cycles(wait_cycles)
    );

endmodule
