module decoder_4to16 (
    input wire [3:0] a,     // 4 bitlik giriş
    input wire enable,      // Enable sinyali
    output wire [15:0] y    // 16 çıkış
);

    // İç bağlantılar (enable sinyalleri)
    wire enable_lower0;
    wire enable_lower1;
    wire enable_lower2;
    wire enable_lower3;

    // Enable sinyallerini belirleyelim
    assign enable_lower0 = enable & ~a[3] & ~a[2];
    assign enable_lower1 = enable & ~a[3] & a[2];
    assign enable_lower2 = enable & a[3] & ~a[2];
    assign enable_lower3 = enable & a[3] & a[2];

    // 4 tane 2-to-4 decoder bağlıyoruz
    decoder_2to4 decoder0 (
        .a(a[1:0]),
        .enable(enable_lower0),
        .y(y[3:0])
    );

    decoder_2to4 decoder1 (
        .a(a[1:0]),
        .enable(enable_lower1),
        .y(y[7:4])
    );

    decoder_2to4 decoder2 (
        .a(a[1:0]),
        .enable(enable_lower2),
        .y(y[11:8])
    );

    decoder_2to4 decoder3 (
        .a(a[1:0]),
        .enable(enable_lower3),
        .y(y[15:12])
    );

endmodule
