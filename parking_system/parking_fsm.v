`timescale 1ns / 1ps

module parking_fsm(
    input wire clk, reset,
    input wire a, b,         // photo sensor inputs
    output reg enter, exit   // 1-clock pulse outputs
    );

    // symbolic states
    parameter [1:0]
        s0 = 2'b00,  // idle
        s1 = 2'b01,  // first sensor triggered
        s2 = 2'b10,  // both sensors triggered
        s3 = 2'b11;  // final stage before decision

    reg [1:0] state_reg, state_next;

    reg dir, dir_next; // 0 = enter, 1 = exit

    // state register
    always @(posedge clk or posedge reset)
        if (reset) begin
            state_reg <= s0;
            dir <= 0;
        end else begin
            state_reg <= state_next;
            dir <= dir_next;
        end

    // next-state logic and output
    always @* begin
        // defaults
        state_next = state_reg;
        dir_next = dir;
        enter = 0;
        exit = 0;

        case (state_reg)
            s0: begin
                if (a && !b) begin
                    state_next = s1;
                    dir_next = 0;  // entering
                end
                else if (!a && b) begin
                    state_next = s3;
                    dir_next = 1;  // exiting
                end
            end

            s1: begin
                if (a && b)
                    state_next = s2;
            end

            s2: begin
                if (!a && b)
                    state_next = s3;
                else if (a && !b)
                    state_next = s1;
            end

            s3: begin
                if (!a && !b) begin
                    state_next = s0;
                    if (dir == 0)
                        enter = 1;
                    else
                        exit = 1;
                end
            end

            default: state_next = s0;
        endcase
    end

endmodule
