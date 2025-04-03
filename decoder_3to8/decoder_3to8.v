`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2025 04:21:12
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
    input wire [2:0] a,
    input wire enable,
    output wire [7:0] y
    );
    
    
    wire enable_lower, enable_upper;
    
    assign enable_lower = enable & ~a[2];
    assign enable_upper = enable &  a[2]; 
    
    
    decoder_2to4 decoder_low(
        .a(a[1:0]),
        .enable(enable_lower),
        .y(y[3:0])
        
    );
   
    decoder_2to4 decoder_high(
    
        .a(a[1:0]),
        .enable(enable_upper),
        .y(y[7:4])
    
    );
    
    
endmodule
