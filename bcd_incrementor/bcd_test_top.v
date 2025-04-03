`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Top module: bcd_test_top
// Description: Connects BCD incrementor and three 7-segment decoders
//////////////////////////////////////////////////////////////////////////////////

module bcd_test_top(
    input wire [11:0] sw,      // 3-digit BCD input from switches
    output wire [7:0] seg0,    // Segment output for ones digit
    output wire [7:0] seg1,    // Segment output for tens digit
    output wire [7:0] seg2     // Segment output for hundreds digit
    );

    wire [11:0] bcd_inc;        // Incremented BCD output

    wire [3:0] d0, d1, d2;      // BCD digits

    // Instantiate BCD incrementor
    bcd_incrementor uut_inc (
        .bcd_in(sw),
        .bcd_out(bcd_inc)
    );

    // Separate digits
    assign d0 = bcd_inc[3:0];
    assign d1 = bcd_inc[7:4];
    assign d2 = bcd_inc[11:8];

    // Instantiate 7-segment decoders
    hex_to_7seg segdec0 (.hex(d0), .dp(1'b1), .seg(seg0)); // DP off
    hex_to_7seg segdec1 (.hex(d1), .dp(1'b1), .seg(seg1));
    hex_to_7seg segdec2 (.hex(d2), .dp(1'b1), .seg(seg2));

endmodule
