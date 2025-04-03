`timescale 1ns / 1ps

module hex_to_7seg(
    input wire [3:0] hex,    // 4-bit input (0 to F)
    input wire dp,           // Decimal point control
    output reg [7:0] sseg    // 7-segment display output (active-low)
);

    // Segment encoding: abcdefg.dp (active-low)
    always @* begin
        case(hex)
            4'h0: sseg = 8'b11000000; // 0
            4'h1: sseg = 8'b11111001; // 1
            4'h2: sseg = 8'b10100100; // 2
            4'h3: sseg = 8'b10110000; // 3
            4'h4: sseg = 8'b10011001; // 4
            4'h5: sseg = 8'b10010010; // 5
            4'h6: sseg = 8'b10000010; // 6
            4'h7: sseg = 8'b11111000; // 7
            4'h8: sseg = 8'b10000000; // 8
            4'h9: sseg = 8'b10010000; // 9
            4'hA: sseg = 8'b10001000; // A
            4'hB: sseg = 8'b10000011; // b
            4'hC: sseg = 8'b11000110; // C
            4'hD: sseg = 8'b10100001; // d
            4'hE: sseg = 8'b10000110; // E
            4'hF: sseg = 8'b10001110; // F
            default: sseg = 8'b11111111; // all segments off
        endcase

        // Decimal point control (bit 7 = dp)
        sseg[7] = dp ? 1'b0 : 1'b1;
    end

endmodule
