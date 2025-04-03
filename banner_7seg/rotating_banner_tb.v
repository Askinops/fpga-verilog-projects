`timescale 1ns / 1ps

module rotating_banner_tb;

    // === Testbench sinyalleri
    reg clk;
    reg reset;
    reg en;
    reg dir;
    wire [3:0] an;
    wire [7:0] sseg;

    // === DUT instance
    rotating_banner uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .dir(dir),
        .an(an),
        .sseg(sseg)
    );

    // === Clock generation: 100 MHz
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    // === Test procedure
    initial begin
        // Initial values
        reset = 1;
        en = 0;
        dir = 1;     // start scrolling to right
        #20;

        reset = 0;
        en = 1;      // start scrolling
        #2000;

        // Change direction
        dir = 0;
        #2000;

        // Pause scrolling
        en = 0;
        #1000;

        // Resume scrolling
        en = 1;
        #2000;

        $stop;
    end

endmodule
