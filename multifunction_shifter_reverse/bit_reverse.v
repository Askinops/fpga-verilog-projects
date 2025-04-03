`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2025 03:25:35
// Design Name: 
// Module Name: bit_reverse
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


module bit_reverse(
    input wire [7:0] in,
    output wire [7:0] out
    );
    
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
    
    
    
    
    
    
    
    
endmodule
