`timescale 1ns / 1ps

module tb_multifunction_shifter_32;

  // Girişler
  reg [31:0] a;
  reg [4:0] amt;
  reg lr;

  // Çıkış
  wire [31:0] y;

  // DUT (Design Under Test)
  multifunction_shifter_32 uut (
    .a(a),
    .amt(amt),
    .lr(lr),
    .y(y)
  );

  initial begin
    // VCD dump için (opsiyonel, waveform dosyası için)
    $dumpfile("shifter_32.vcd");
    $dumpvars(0, tb_multifunction_shifter_32);

    // Test 1: Sağ döndürme (lr = 0), 1 bit
    a = 32'hDEADBEEF;
    amt = 5'd1;
    lr = 0;
    #10;

    // Test 2: Sağ döndürme (lr = 0), 4 bit
    a = 32'h12345678;
    amt = 5'd4;
    lr = 0;
    #10;

    // Test 3: Sol döndürme (lr = 1), 8 bit
    a = 32'hAABBCCDD;
    amt = 5'd8;
    lr = 1;
    #10;

    // Test 4: Sol döndürme (lr = 1), 16 bit
    a = 32'hFACEB00C;
    amt = 5'd16;
    lr = 1;
    #10;

    // Test 5: 0 bit döndürme (ne sağ ne sol)
    a = 32'hCAFEBABE;
    amt = 5'd0;
    lr = 1;
    #10;

    $finish;
  end

endmodule
