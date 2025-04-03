`timescale 1ns / 1ps

module tb_multifunction_shifter_16;

  // Girişler
  reg [15:0] a;
  reg [3:0] amt;
  reg lr;

  // Çıkış
  wire [15:0] y;

  // DUT - Design Under Test
  multifunction_shifter_16 uut (
    .a(a),
    .amt(amt),
    .lr(lr),
    .y(y)
  );

  initial begin
    $display("Time\t lr a\t\t amt y");
    $monitor("%0dns\t %b %b\t %0d  %b", $time, lr, a, amt, y);

    // Test 1: Rotate right by 1
    a = 16'b1011001111001101; amt = 4'd1; lr = 0; #10;

    // Test 2: Rotate right by 4
    a = 16'b1011001111001101; amt = 4'd4; lr = 0; #10;

    // Test 3: Rotate left by 1
    a = 16'b1011001111001101; amt = 4'd1; lr = 1; #10;

    // Test 4: Rotate left by 7
    a = 16'b1110001110101010; amt = 4'd7; lr = 1; #10;

    // Test 5: Rotate right by 0
    a = 16'b0000111100001111; amt = 4'd0; lr = 0; #10;

    // Test 6: Rotate left by 0
    a = 16'b1111000011110000; amt = 4'd0; lr = 1; #10;

    $finish;
  end

endmodule
