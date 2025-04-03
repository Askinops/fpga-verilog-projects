`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: float_gt
// Description: Floating-point greater-than comparator
//////////////////////////////////////////////////////////////////////////////////

module float_gt(
    input wire [12:0] a,   // floating-point number a
    input wire [12:0] b,   // floating-point number b
    output reg gt          // a > b ?
    );

    wire sign_a, sign_b;
    wire [3:0] exp_a, exp_b;
    wire [7:0] frac_a, frac_b;

    // Extract fields
    assign sign_a = a[12];
    assign exp_a = a[11:8];
    assign frac_a = a[7:0];

    assign sign_b = b[12];
    assign exp_b = b[11:8];
    assign frac_b = b[7:0];

    always @* begin
        // Different signs
        if (sign_a != sign_b) begin
            gt = (sign_a == 0) ? 1'b1 : 1'b0;
        end
        else begin
            // Both positive
            if (sign_a == 0) begin
                if (exp_a > exp_b) gt = 1'b1;
                else if (exp_a < exp_b) gt = 1'b0;
                else gt = (frac_a > frac_b) ? 1'b1 : 1'b0;
            end
            // Both negative
            else begin
                if (exp_a < exp_b) gt = 1'b1;
                else if (exp_a > exp_b) gt = 1'b0;
                else gt = (frac_a < frac_b) ? 1'b1 : 1'b0;
            end
        end
    end

endmodule
