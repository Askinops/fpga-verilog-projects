`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2025 02:20:17
// Design Name: 
// Module Name: rotate_right
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: rotate_right(a, amt) = (a >> amt) | (a << (N - amt))

// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rotate_right(
    input wire [7:0] a,
    input wire [2:0] amt,
    output reg [7:0] r_out
    );
    
    always @* begin 
        
        r_out = (a>> amt)| (a<<(8 - amt));
    end
    
endmodule