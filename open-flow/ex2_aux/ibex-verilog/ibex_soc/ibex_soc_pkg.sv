// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

package ibex_soc_pkg;

    parameter logic [31:0] ROM_START = 32'h00000000;
    parameter logic [31:0] ROM_SIZE  = 32'h00002000;
    parameter logic [31:0] ROM_MASK  = (~(ROM_SIZE-1));
    
    parameter logic [31:0] RAM_START = 32'h00020000;
    parameter logic [31:0] RAM_SIZE  = 32'h00004000;
    parameter logic [31:0] RAM_MASK  = (~(RAM_SIZE-1));

    parameter logic [31:0] UART_START = 32'h10000000;
    parameter logic [31:0] UART_SIZE  = 32'h00000010;
    parameter logic [31:0] UART_MASK  = (~(UART_SIZE-1));
    
    parameter logic [31:0] BLINKY_START = 32'h20000000;
    parameter logic [31:0] BLINKY_SIZE  = 32'h00000001;
    parameter logic [31:0] BLINKY_MASK  = (~(BLINKY_SIZE-1));
    
    parameter logic [31:0] PARIO_START = 32'h30000000;
    parameter logic [31:0] PARIO_SIZE  = 32'h00000008;
    parameter logic [31:0] PARIO_MASK  = (~(PARIO_SIZE-1));
    
    parameter logic [31:0] EOC_START = 32'h40000000;
    parameter logic [31:0] EOC_SIZE  = 32'h00000001;
    parameter logic [31:0] EOC_MASK  = (~(EOC_SIZE-1));
    
    parameter logic [31:0] CIPHER_START = 32'h50000000;
    parameter logic [31:0] CIPHER_SIZE  = 32'h10000000;
    parameter logic [31:0] CIPHER_MASK  = (~(CIPHER_SIZE-1));

endpackage
