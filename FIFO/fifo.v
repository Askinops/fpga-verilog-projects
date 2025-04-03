`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: You
// Module: fifo
// Description: Parameterized FIFO (First-In First-Out) buffer with full/empty flags.
//              Includes memory reset for clean simulation startup.
//
// Parameters:
// - B: Data width (e.g., 8 bits)
// - W: Address width (FIFO depth = 2^W entries)
//
// Ports:
// - clk: Clock input
// - reset: Synchronous reset
// - rd: Read enable
// - wr: Write enable
// - w_data: Data input
// - r_data: Data output
// - full: FIFO is full
// - empty: FIFO is empty
//////////////////////////////////////////////////////////////////////////////////

module fifo
#(parameter B = 8, W = 4)  // B = data width, W = address width
(
    input wire clk,
    input wire reset,
    input wire rd, wr,
    input wire [B-1:0] w_data,
    output wire empty, full,
    output wire [B-1:0] r_data
);

    // Internal memory array (FIFO buffer)
    reg [B-1:0] array_reg [2**W-1:0];

    // Write and read pointers
    reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
    reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;

    // Status flags
    reg full_reg, empty_reg;
    reg full_next, empty_next;

    // Write enable logic
    wire wr_en;

    // Optional: integer for memory initialization
    integer i;

    // Synchronous write operation
    always @(posedge clk)
        if (wr_en)
            array_reg[w_ptr_reg] <= w_data;

    // Asynchronous read operation
    assign r_data = array_reg[r_ptr_reg];

    // Enable writing only if FIFO is not full
    assign wr_en = wr & ~full_reg;

    // Synchronous control logic
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            w_ptr_reg <= 0;
            r_ptr_reg <= 0;
            full_reg <= 1'b0;
            empty_reg <= 1'b1;

            // Clear memory during reset to avoid 'x' on output
            for (i = 0; i < 2**W; i = i + 1)
                array_reg[i] <= {B{1'b0}};
        end
        else begin
            w_ptr_reg <= w_ptr_next;
            r_ptr_reg <= r_ptr_next;
            full_reg  <= full_next;
            empty_reg <= empty_next;
        end
    end

    // Next-state logic for pointers and flags
    always @* begin
        // Default assignments (no operation)
        w_ptr_succ = w_ptr_reg + 1;
        r_ptr_succ = r_ptr_reg + 1;

        w_ptr_next = w_ptr_reg;
        r_ptr_next = r_ptr_reg;
        full_next = full_reg;
        empty_next = empty_reg;

        case ({wr, rd})
            2'b00: ; // No operation
            2'b01: // Read only
                if (~empty_reg) begin
                    r_ptr_next = r_ptr_succ;
                    full_next = 1'b0;
                    if (r_ptr_succ == w_ptr_reg)
                        empty_next = 1'b1;
                end
            2'b10: // Write only
                if (~full_reg) begin
                    w_ptr_next = w_ptr_succ;
                    empty_next = 1'b0;
                    if (w_ptr_succ == r_ptr_reg)
                        full_next = 1'b1;
                end
            2'b11: begin // Simultaneous read and write
                w_ptr_next = w_ptr_succ;
                r_ptr_next = r_ptr_succ;
                // Flags remain unchanged
            end
        endcase
    end

    // Output assignments
    assign full = full_reg;
    assign empty = empty_reg;

endmodule
