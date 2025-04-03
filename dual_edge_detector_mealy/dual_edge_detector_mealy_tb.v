`timescale 1ns / 1ps

module dual_edge_detector_mealy_tb;

    // Testbench sinyalleri
    reg clk, reset;
    reg level;
    wire tick;

    // DUT (Device Under Test) instantiate
    dual_edge_detector_mealy uut (
        .clk(clk),
        .reset(reset),
        .level(level),
        .tick(tick)
    );

    // Saat üretimi (clock): 100 MHz → 10 ns period
    always begin
        #5 clk = ~clk;
    end

    // Test senaryosu
    initial begin
        // Başlangıç ayarları
        clk = 0;
        reset = 1;
        level = 0;

        // Reset bırak
        #20;
        reset = 0;

        // === Test Pattern ===
        // Girişte değişim → tick = 1 beklentisi
        #20 level = 1;   // Rising edge → tick = 1
        #40 level = 0;   // Falling edge → tick = 1
        #40 level = 1;   // Rising edge → tick = 1
        #40 level = 1;   // No change → tick = 0
        #40 level = 0;   // Falling edge → tick = 1
        #40 level = 0;   // No change → tick = 0
        #40 level = 1;   // Rising edge → tick = 1
        #40 level = 0;   // Falling edge → tick = 1

        #100;
        $finish;
    end

endmodule
