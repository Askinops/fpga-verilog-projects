`timescale 1ns / 1ps

module tb_dual_priority_test_display;

  // Giriş
  reg [11:0] req;

  // Çıkışlar
  wire [7:0] sseg1;  // first için
  wire [7:0] sseg2;  // second için

  // DUT (Device Under Test)
  dual_priority_test_display uut (
    .req(req),
    .sseg1(sseg1),
    .sseg2(sseg2)
  );

  initial begin
    $dumpfile("test_display.vcd");
    $dumpvars(0, tb_dual_priority_test_display);

    // Test 1: sadece bit 2 ve 0 aktif
    req = 12'b000000000101;  #10;
    // first = 2, second = 0

    // Test 2: bit 10, 6, 3 aktif
    req = 12'b010000100100;  #10;
    // first = 10, second = 6

    // Test 3: sadece bit 11 aktif
    req = 12'b100000000000;  #10;
    // first = 11, second = 0

    // Test 4: hiçbir bit aktif değil
    req = 12'b000000000000;  #10;
    // first = 0, second = 0

    $finish;
  end

endmodule
