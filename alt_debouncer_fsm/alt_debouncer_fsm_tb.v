`timescale 1ns / 1ps

module alt_debouncer_fsm_tb;

    // Testbench sinyalleri
    reg clk, reset;
    reg sw;         // raw switch input
    wire db;        // debounced output

    // DUT instantiate
    alt_debouncer_fsm uut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .db(db)
    );

    // Clock üretimi: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Başlangıç değerleri
        clk = 0;
        reset = 1;
        sw = 0;

        // Reset bırak
        #20 reset = 0;

        // === Test senaryosu ===

        // Simulate a clean press with bounce
        #30  sw = 1;   // butona basıldı
        #10  sw = 0;   // bounce oldu
        #10  sw = 1;   // tekrar bastı (hala basılı)
        #10  sw = 0;   // bir daha bounce
        #10  sw = 1;   // stabilize oldu

        // FSM artık edge'e cevap verdi, 3x tick bekleyecek (~30ms)
        #500000;       // bekleme süresi (30ms ≈ 1.5 milyon ns @ 50MHz)

        // Tuş bırakılıyor
        sw = 0;

        // bir süre daha bekle
        #50000;

        $finish;
    end

endmodule
