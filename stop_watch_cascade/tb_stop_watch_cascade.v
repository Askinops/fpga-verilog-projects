`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_stop_watch_cascade
// Description: Testbench for 3-digit stopwatch using cascaded BCD counters
//////////////////////////////////////////////////////////////////////////////////

module tb_stop_watch_cascade;

    // Test parameters
    parameter DVSR = 5;  // Reduced for simulation (actual: 5000000)

    // Signals
    reg clk;
    reg go;
    reg clr;
    wire [3:0] d2, d1, d0;

    // Device Under Test (DUT)
    stop_watch_cascade #(DVSR) uut (
        .clk(clk),
        .go(go),
        .clr(clr),
        .d2(d2),
        .d1(d1),
        .d0(d0)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Simulation sequence
    initial begin
        $display("=== Stopwatch Cascade Test ===");
        $monitor("Time = %0dns | d2 = %0d, d1 = %0d, d0 = %0d", $time, d2, d1, d0);

        // Initial state
        clk = 0;
        go  = 0;
        clr = 1;
        #20;

        clr = 0;
        go  = 1;

        // Let the stopwatch run for a while
        #200;

        // Stop counting
        go = 0;
        #30;

        // Reset the counter
        clr = 1;
        #10;
        clr = 0;

        // Start again
        go = 1;
        #150;

        $finish;
    end

endmodule
