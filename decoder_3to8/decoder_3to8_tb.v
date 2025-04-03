`timescale 1ns / 1ps

module decoder_3to8_tb;

  reg [2:0] a;
  reg enable;
  wire [7:0] y;

  decoder_3to8 uut (
    .a(a),
    .enable(enable),
    .y(y)
  );

  initial begin
    $dumpfile("decoder_3to8_tb.vcd");
    $dumpvars(0, decoder_3to8_tb);

    enable = 0; a = 3'b000; #10;
    enable = 1; a = 3'b000; #10;
    enable = 1; a = 3'b001; #10;
    enable = 1; a = 3'b010; #10;
    enable = 1; a = 3'b011; #10;
    enable = 1; a = 3'b100; #10;
    enable = 1; a = 3'b101; #10;
    enable = 1; a = 3'b110; #10;
    enable = 1; a = 3'b111; #10;

    $display("Test tamamlandı.");
    $finish;
  end

endmodule
