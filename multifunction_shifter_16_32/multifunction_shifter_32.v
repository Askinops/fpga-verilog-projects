`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2025 04:51:16
// Design Name: 
// Module Name: multifunction_shifter_32
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


module multifunction_shifter_32(
    input wire [31:0] a,
    input wire [4:0] amt,
    input lr,
    output wire [31:0] y

    );
    
    wire [31:0] y_r ,y_l;
    
    rotate_right_32 u1(
        .a(a),
        .amt(amt),
        .y(y_r)
    );
    
    rotate_left_32 u2(
        .a(a),
        .amt(amt),
        .y(y_l)
    );
    
    
    assign y = (lr == 1'b0) ? y_r:y_l;
    
    
endmodule
