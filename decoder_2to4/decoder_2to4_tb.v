`timescale 1ns / 1ps

module decoder_2to4_tb;

  reg [1:0] a;
  reg enable;
  wire [3:0] y;

  // Test edilecek modülü instantiate ediyoruz
  decoder_2to4 uut (
    .a(a),
    .enable(enable),
    .y(y)
  );

  initial begin
    $dumpfile("decoder_2to4_tb.vcd");
    $dumpvars(0, decoder_2to4_tb);

    $display("Test Başlıyor...");

    enable = 0; a = 2'b00; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    enable = 1; a = 2'b00; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    enable = 1; a = 2'b01; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    enable = 1; a = 2'b10; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    enable = 1; a = 2'b11; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    enable = 0; a = 2'b11; #10;
    $display("enable=%b, a=%b, y=%b", enable, a, y);

    $display("Test Tamamlandı.");
    $finish;
  end

endmodule
