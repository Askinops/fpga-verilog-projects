`timescale 1ns / 1ps

module fifo_tb;

    // === Parameters ===
    parameter B = 8; // Data width
    parameter W = 3; // Address width → FIFO depth = 2^W = 8

    // === Testbench Signals ===
    reg clk, reset;
    reg rd, wr;
    reg [B-1:0] w_data;
    wire [B-1:0] r_data;
    wire full, empty;

    // === Instantiate the FIFO module
    fifo #(.B(B), .W(W)) uut (
        .clk(clk),
        .reset(reset),
        .rd(rd),
        .wr(wr),
        .w_data(w_data),
        .r_data(r_data),
        .full(full),
        .empty(empty)
    );

    // === Clock generation (10ns period)
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    // === Test sequence
    initial begin
        // Initial values
        wr = 0; rd = 0; w_data = 0;
        reset = 1;
        #20;
        reset = 0;

        // === WRITE PHASE: Write 5 random values to FIFO
        @(negedge clk);
        repeat (5) begin
            wr = 1;
            w_data = $random;
            @(negedge clk);
        end
        wr = 0;

        // === WAIT UNTIL FIFO IS NOT EMPTY
        wait (!empty); // Ensure FIFO has data before reading

        // === READ PHASE: Read 3 values from FIFO
        repeat (3) begin
            rd = 1;
            @(negedge clk);
        end
        rd = 0;

        // === SIMULTANEOUS READ & WRITE
        repeat (2) begin
            wr = 1;
            rd = 1;
            w_data = $random;
            @(negedge clk);
        end
        wr = 0; rd = 0;

        // === FINAL DRAIN: Read remaining data until FIFO is empty
        while (!empty) begin
            rd = 1;
            @(negedge clk);
        end
        rd = 0;

        // === Simulation ends
        $stop;
    end

endmodule
