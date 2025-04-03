`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 20:57:10
// Design Name: 
// Module Name: tick_generator
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


module tick_generator
#(parameter N=4)
(
    input wire clk,reset,
    output reg tick
    );
    
    reg [N-1:0] count_reg;
    wire [N-1:0] count_next;
    
    // counter logic 
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            count_reg <= 0;
            tick<=0;
        end else if (count_next == 0) begin
            tick <= 1;
            count_reg <=0;
        end else begin
            tick <= 0;
            count_reg <= count_next;
        end
           
    end    
    
    assign count_next = count_reg +1;
    
    
    
endmodule
