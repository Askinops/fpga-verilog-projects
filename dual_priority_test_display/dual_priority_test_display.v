module dual_priority_test_display(
    input wire [11:0] req,
    output wire [7:0] sseg1,   // first için
    output wire [7:0] sseg2    // second için
);

    wire [3:0] first, second;

    // Priority encoder
    dual_piority_encoder u0 (
        .req(req),
        .first(first),
        .second(second)
    );

    // First değeri 7 segment'e çevir
    hex_to_sseg u1 (
        .hex(first),
        .dp(1'b1),          // nokta kapalı
        .sseg(sseg1)
    );

    // Second değeri 7 segment'e çevir
    hex_to_sseg u2 (
        .hex(second),
        .dp(1'b1),
        .sseg(sseg2)
    );

endmodule
