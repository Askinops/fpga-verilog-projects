`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2025 04:10:39
// Design Name: 
// Module Name: decoder_2to4
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


module decoder_2to4(
    input wire [1:0] a,
    input wire enable,
    output wire [3:0] y

    );
    
    assign y[0] = enable & ~a[1] & ~a[0];
    assign y[1] = enable & ~a[1] &  a[0];
    assign y[2] = enable &  a[1] & ~a[0];
    assign y[3] = enable &  a[1] &  a[0];
    
    
    
endmodule
