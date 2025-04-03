`timescale 1ns / 1ps

module tb_sign_mag_add;

    // Parametre
    parameter N = 4;

    // Test sinyalleri
    reg  [N-1:0] a, b;
    wire [N-1:0] sum;

    // Modül instansı
    sign_mag_add #(.N(N)) uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $display("Zaman\t a\t b\t sum");
        $monitor("%4dns\t%b\t%b\t%b", $time, a, b, sum);

        // Test 1: +3 + +2 = +5
        a = 4'b0011; // +3
        b = 4'b0010; // +2
        #10;

        // Test 2: -3 + -2 = -5
        a = 4'b1011; // -3
        b = 4'b1010; // -2
        #10;

        // Test 3: +5 + -2 = +3
        a = 4'b0101; // +5
        b = 4'b1010; // -2
        #10;

        // Test 4: -5 + +2 = -3
        a = 4'b1101; // -5
        b = 4'b0010; // +2
        #10;

        // Test 5: +5 + -5 = 0
        a = 4'b0101; // +5
        b = 4'b1101; // -5
        #10;

        // Test 6: -7 + -1 = -8
        a = 4'b1111; // -7
        b = 4'b1001; // -1
        #10;

        // Test 7: +0 + -2 = -2
        a = 4'b0000; // +0
        b = 4'b1010; // -2
        #10;

        $finish;
    end

endmodule
