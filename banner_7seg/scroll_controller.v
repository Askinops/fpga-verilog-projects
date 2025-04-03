`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 14:15:49
// Design Name: 
// Module Name: scroll_controller
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


module scroll_controller#(parameter max_pos=6) // number of scrollable positions: message lenght-4
(
    input wire clk,reset,
    input wire en, // enable scrolling
    input wire dir, // direction : 1=right, 0=left
    input wire tick,    // scroll trigger signal
    output reg [2:0] pos // current scroll position (0 to max-pos)
    );
    always @(posedge clk or posedge reset) begin
        if(reset)
            pos <= 0; 
        else if (tick && en) begin
                if(dir) begin
                    //scroll right 
                    if(pos==max_pos)
                        pos<=0;
                    else
                        pos <= pos+1;    
                        
                end else begin 
                    // scroll left
                        if(pos==0)
                            pos <= max_pos; // wrap around
                        else 
                            pos <= pos -1;    
                    end        
            end    
        
    end
    
    
    
    
    
endmodule
