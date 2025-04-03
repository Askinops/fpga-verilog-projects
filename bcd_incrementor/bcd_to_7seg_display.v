module bcd_to_7seg_display(
    input wire [11:0] bcd,
    output wire [7:0] sseg0,
    output wire [7:0] sseg1,
    output wire [7:0] sseg2
);

    wire [3:0] d0 = bcd[3:0];   // ones
    wire [3:0] d1 = bcd[7:4];   // tens
    wire [3:0] d2 = bcd[11:8];  // hundreds

    // dp (decimal point) hep kapalı (1)
    hex_to_7seg disp0 (.hex(d0), .dp(1'b1), .seg(sseg0));
    hex_to_7seg disp1 (.hex(d1), .dp(1'b1), .seg(sseg1));
    hex_to_7seg disp2 (.hex(d2), .dp(1'b1), .seg(sseg2));

endmodule
