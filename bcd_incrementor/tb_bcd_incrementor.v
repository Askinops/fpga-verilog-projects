`timescale 1ns / 1ps

module tb_bcd_incrementor;

    reg [11:0] bcd_in;
    wire [11:0] bcd_out;

    // DUT (Device Under Test)
    bcd_incrementor uut (
        .bcd_in(bcd_in),
        .bcd_out(bcd_out)
    );

    initial begin
        // VCD dump (optional, bazı simülatörlerde dalga formu görüntülemek için)
        $dumpfile("bcd_incrementor_tb.vcd");
        $dumpvars(0, tb_bcd_incrementor);

        // Başlangıç mesajı
        $display("Starting BCD Incrementor Test...");

        // Test 1: 259 -> 260
        bcd_in = 12'b0010_0101_1001; // 259
        #10;

        // Test 2: 009 -> 010
        bcd_in = 12'b0000_0000_1001; // 009
        #10;

        // Test 3: 199 -> 200
        bcd_in = 12'b0001_1001_1001; // 199
        #10;

        // Test 4: 999 -> 000 (overflow)
        bcd_in = 12'b1001_1001_1001; // 999
        #10;

        // Test 5: 000 -> 001
        bcd_in = 12'b0000_0000_0000; // 000
        #10;

        $display("Test completed.");
        $finish;
    end

endmodule
