`default_nettype none

module cipher_wrapper_ex1 #(
    // Length definitions for the cipher
    parameter KEY_LENGTH  = 128,
    parameter DATA_LENGTH = 128,
    parameter LENGTH      = 32
)(
`ifdef USE_POWER_PINS
    inout VPWR,	// User area 1 1.8V supply
    inout VGND,	// User area 1 digital ground
`endif
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

    cipher_core cipher_core_i (
        .clk_i              (clk_i),
        .rst_ni             (rst_ni),
        .key_i              (key_i),
        .nonce_i            (nonce_i),
        .data_len_i         (data_len_i),
        .ad_len_i           (ad_len_i),
        .indata_i           (indata_i),
        .indata_valid_i     (indata_valid_i),
        .indata_ready_o     (indata_ready_o),
        .outdata_o          (outdata_o),
        .outdata_valid_o    (outdata_valid_o),
        .outdata_ready_i    (outdata_ready_i),
        .tag_o              (tag_o),
        .start_i            (start_i),
        .busy_o             (busy_o),
        .finish_o           (finish_o)
    );

endmodule
