`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: [Şirket Adı veya Üniversite]
// Engineer: [Adınız]
// 
// Create Date: 26.03.2025
// Design Name: Sign-Magnitude Adder
// Module Name: sign_mag_add
// Description: 
//   Sign-magnitude formatında iki sayının toplanmasını sağlar.
//   Eğer işaretler aynıysa toplar, farklıysa büyükten küçüğü çıkarır.
//
// Dependencies: None
//
//////////////////////////////////////////////////////////////////////////////////

module sign_mag_add 
#(
    parameter N = 4  // Toplam bit sayısı: 1 bit işaret + (N-1) bit büyüklük
)
(   
    input  wire [N-1:0] a, b,
    output reg  [N-1:0] sum
);
    
    reg [N-2:0] mag_a, mag_b, mag_sum, max, min;
    reg        sign_a, sign_b, sign_sum;
    
    always @* begin
        // İşaret ve büyüklük ayrımı
        mag_a  = a[N-2:0];
        mag_b  = b[N-2:0];
        sign_a = a[N-1];
        sign_b = b[N-1];

        // Büyük olan büyüklük seçilir
        if (mag_a > mag_b) begin
            max       = mag_a;
            min       = mag_b;
            sign_sum  = sign_a;
        end else begin
            max       = mag_b;
            min       = mag_a;
            sign_sum  = sign_b;
        end

        // Aynı işaretse: toplama, farklıysa: çıkarma
        if (sign_a == sign_b)
            mag_sum = mag_a + mag_b;
        else
            mag_sum = max - min;

        // Çıkış oluşturuluyor
        sum = {sign_sum, mag_sum};
    end

endmodule
