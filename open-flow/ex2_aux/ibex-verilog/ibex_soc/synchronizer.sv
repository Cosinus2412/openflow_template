// SPDX-FileCopyrightText: © 2023 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module synchronizer #(
    parameter int FF_COUNT = 3
) (
    input clk,
    input resetn,
    input in,

    output logic out
);

    reg [FF_COUNT-1:0] pipe;

    always_ff @(posedge clk) begin
        if (!resetn) begin
            pipe <= 0;
        end else begin

            pipe[0] <= in;
            for (int i = 0; i < FF_COUNT - 1; i++) begin : loopName
                pipe[i+1] <= pipe[i];
            end
            out <= pipe[FF_COUNT-1];
        end
    end

endmodule
