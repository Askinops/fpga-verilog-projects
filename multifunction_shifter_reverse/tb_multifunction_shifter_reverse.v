`timescale 1ns / 1ps

module tb_multifunction_shifter_reverse;

reg [7:0] a;
reg [2:0] amt;
reg lr;
wire [7:0] y;

// DUT - Device Under Test
multifunction_shifter_reverse uut (
    .a(a),
    .amt(amt),
    .lr(lr),
    .y(y)
);

initial begin
    $display("Time\t lr a\t amt y");
    $monitor("%0dns\t %b %h\t %0d  %h", $time, lr, a, amt, y);

    // Test 1: Rotate right by 1
    a = 8'b10110011; amt = 3'd1; lr = 1; #10;

    // Test 2: Rotate right by 3
    a = 8'b11001010; amt = 3'd3; lr = 1; #10;

    // Test 3: Rotate left by 2 (reverse method)
    a = 8'b01101100; amt = 3'd2; lr = 0; #10;

    // Test 4: Rotate left by 4
    a = 8'b10011001; amt = 3'd4; lr = 0; #10;

    // Test 5: Rotate left by 0
    a = 8'b11110000; amt = 3'd0; lr = 0; #10;

    // Test 6: Rotate right by 0
    a = 8'b11110000; amt = 3'd0; lr = 1; #10;

    $finish;
end

endmodule
