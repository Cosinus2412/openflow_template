module multiplier (
    input  logic clk_i,                  // Clock input
    input  logic reset_i,                // Active-high synchronous reset
    input  logic start_i,                // Enable input
    input  logic [KEY_LENGTH-1:0] m1_i,
    input  logic [DATA_LENGTH-1:0] m2_i,
    output logic [DATA_LENGTH-1:0] multiplier_o,  // multiplier out
    output logic done_o                  // Done output
);


typedef enum  { 
    IDLE,
    INIT, 
    MULT,
    DONE
 } state_t;

 state_t state_n, state_p;

 logic [KEY_LENGTH-1:0] m1_n, m1_p;
 logic [DATA_LENGTH-1:0] m2_n, m2_p;
 logic [DATA_LENGTH-1: 0] result_n, result_p;
 
 always_comb begin
    state_n = state_p;
    m1_n = m1_p;
    m2_n = m2_p;
    result_n = result_p;

    case (state_p)
        IDLE:begin
            if(start_i) begin
                state_n = INIT;
            end
        end
        INIT: begin
            m1_n = m1_i;
            m2_n = m2_i;
            state_n = MULT;
        end
        MULT: begin
            result_n = m1_p * m2_p;
            state_n = DONE;
        end
        DONE: begin
            state_n = IDLE;  
        end
    endcase


 end


always_ff @(posedge clk_i or negedge reset_i) begin
    if (reset_i) begin
        state_p <= IDLE;
        m1_p <= 0;
        m2_p <= 0;
        result_p <= 0;
    end else begin
        state_p <= state_n;
        m1_p <= m1_n;
        m2_p <= m2_n; 
        result_p <= result_n;
    end
 end

 assign multiplier_o = result_p;
 assign done_o = (state_p == DONE);

 endmodule