`timescale 1ns / 1ps

module heartbeat_tb;

    // === Clock and reset signals
    reg clk;
    reg reset;

    // === Outputs from DUT
    wire [3:0] an;
    wire [7:0] sseg;

    // === Instantiate the DUT
    heartbeat uut (
        .clk(clk),
        .reset(reset),
        .an(an),
        .sseg(sseg)
    );

    // === Clock generator (100 MHz = 10 ns period)
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    // === Simulation sequence
    initial begin
        // Apply reset
        reset = 1;
        #50;
        reset = 0;

        // Let animation run for a while (~100 ms)
        #100000000;

        // End simulation
        $stop;
    end

endmodule
