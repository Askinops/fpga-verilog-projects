`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2025 04:16:03
// Design Name: 
// Module Name: multifunction_shifter_16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multifunction_shifter_16(
    input wire [15:0] a,
    input wire [3:0] amt,
    input wire lr,
    output wire [15:0] y 
    
    );
    
    
    wire [15:0] y_r, y_l;
    
    
    rotate_right_16 u1(
        .a(a),
        .amt(amt),
        .y(y_r)
    
    );
    
    rotate_left_16  u2(
        .a(a),
        .amt(amt),
        .y(y_l)
    
    );
    
    assign y = (lr == 1'b0) ? y_r : y_l;
    
    
endmodule
