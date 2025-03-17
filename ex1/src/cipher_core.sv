/**
 * Module: Cipher
 *
 * Implements the top level module of your cipher
 *
 */

`default_nettype none;

import cipher_pkg::*;

module cipher_core (
    input  logic                   clk_i,           // Rising edge active clk.
    input  logic                   rst_ni,          // Active low reset.
    input  logic [KEY_LENGTH-1:0]  key_i,           // Encryption key.
    input  logic [DATA_LENGTH-1:0] nonce_i,         // Nonce.
    input  logic [LENGTH-1:0]      data_len_i,      // # of data blocks.
    input  logic [LENGTH-1:0]      ad_len_i,        // # of ad blocks.
    input  logic [DATA_LENGTH-1:0] indata_i,        // Plaintext and AD.
    input  logic                   indata_valid_i,  // Master valid.
    output logic                   indata_ready_o,  // Slave ready.
    output logic [DATA_LENGTH-1:0] outdata_o,       // Ciphertext.
    output logic                   outdata_valid_o, // Slave valid.
    input  logic                   outdata_ready_i, // Master ready.
    output logic [DATA_LENGTH-1:0] tag_o,           // Tag.
    input  logic                   start_i,         // Start signal.
    output logic                   busy_o,          // Cipher busy. 
    output logic                   finish_o         // Cipher finish.
);

    // TODO Your implementation!

    logic [3:0] counter_value;

    counter counter_i (
        .clk_i              (clk_i),  // Clock input
        .reset_i            (!rst_ni),  // Active-high synchronous reset
        .enable_i           (start_i),  // Enable input
        .counter_value_o    (counter_value),  // 4-bit counter output
        .done_o             (finish_o)   // Done output
    );

    assign indata_ready_o = 1'b0;
    assign outdata_o = {{DATA_LENGTH-4{1'b0}}, counter_value};
    assign outdata_valid_o = 1'b0;
    assign tag_o = {DATA_LENGTH{1'b0}};
    assign busy_o = 1'b0;

endmodule
