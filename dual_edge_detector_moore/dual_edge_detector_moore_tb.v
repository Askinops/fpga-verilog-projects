`timescale 1ns / 1ps

module dual_edge_detector_moore_tb;

    // Testbench signals
    reg clk, reset;
    reg level;
    wire tick;

    // Instantiate the DUT (Device Under Test)
    dual_edge_detector_moore uut (
        .clk(clk),
        .reset(reset),
        .level(level),
        .tick(tick)
    );

    // Clock generation: 10ns period → 100MHz
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initial setup
        clk = 0;
        reset = 1;
        level = 0;

        // Wait a bit and release reset
        #20;
        reset = 0;

        // Apply test inputs
        // At each rising/falling edge, we expect tick = 1 for 1 clock

        // Initial: level = 0
        #20 level = 1;   // Rising edge → tick expected
        #40 level = 0;   // Falling edge → tick expected
        #40 level = 1;   // Rising edge → tick expected
        #40 level = 1;   // No edge → tick not expected
        #40 level = 0;   // Falling edge → tick expected
        #40 level = 0;   // No edge → tick not expected
        #40 level = 1;   // Rising edge → tick expected
        #40 level = 0;   // Falling edge → tick expected

        // Wait and finish simulation
        #100;
        $finish;
    end

endmodule
