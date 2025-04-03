module multifunction_shifter_reverse (
    input  wire [7:0] a,
    input  wire [2:0] amt,
    input  wire       lr,     // 1: rotate right, 0: rotate left
    output wire [7:0] y
);

wire [7:0] a_rev;
wire [7:0] r1_out;
wire [7:0] r2_out;

// Bit tersleme modülü (giriş verisini tersler)
bit_reverse br1 (
    .in(a),
    .out(a_rev)
);

// Rotate right modülü
rotate_right rr (
    .a(lr ? a : a_rev),  // Eğer lr=1 ise direkt a, lr=0 ise terslenmiş hali
    .amt(amt),
    .y(r1_out)
);

// Eğer lr = 1 ise rotate right sonucu direkt çıkışa gider,
// değilse tekrar terslenmiş hali çıkış olur (rotate left etkisi)
bit_reverse br2 (
    .in(r1_out),
    .out(r2_out)
);

assign y = lr ? r1_out : r2_out;

endmodule
