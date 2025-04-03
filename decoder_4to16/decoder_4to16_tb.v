`timescale 1ns / 1ps

module decoder_4to16_tb;

  reg [3:0] a;
  reg enable;
  wire [15:0] y;

  decoder_4to16 uut (
    .a(a),
    .enable(enable),
    .y(y)
  );

  initial begin
    $dumpfile("decoder_4to16_tb.vcd");
    $dumpvars(0, decoder_4to16_tb);

    enable = 0; a = 4'b0000; #10;
    enable = 1; a = 4'b0000; #10;
    enable = 1; a = 4'b0001; #10;
    enable = 1; a = 4'b0010; #10;
    enable = 1; a = 4'b0111; #10;
    enable = 1; a = 4'b1111; #10;
    
    $display("Test tamamlandı.");
    $finish;
  end

endmodule
