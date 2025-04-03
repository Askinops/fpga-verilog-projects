`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 16:39:43
// Design Name: 
// Module Name: edge_detected_gate
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


module edge_detected_gate(
    input wire clk,reset,
    input wire level,
    output tick
    
    );
    
    // signal decleration
    reg delay_reg;
    
    //delay register
    always @(posedge clk or posedge reset)
        if(reset)
            delay_reg <= 1'b0;
        else 
            delay_reg <= level;
            
    // decoding logic
    assign tick = ~delay_reg & level;
                
            
    
    
    
endmodule
