`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 03:46:14
// Design Name: 
// Module Name: heartbeat
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Displays a heartbeat animation across 4-digit 7-segment display
//              using a circular shift register. Updates occur at ~72 Hz.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module heartbeat(
    input wire clk,reset,
    output reg [3:0] an,  //anode control for 4-digit 7 segment 
    output reg [7:0] sseg
    );
    
    parameter N=21;  // 2^21 / 100 MHz = 0.02s(50Hz)
    reg[N-1:0] clk_reg;
    wire tick;
    
    
    always @(posedge clk or posedge reset) begin
        if(reset)
            clk_reg<=0;
        else 
            clk_reg<=clk_reg+1;    
            
    end
    
    assign tick = (clk_reg == 0);
    
    //circular shift register
    
    always @(posedge clk)
        if(reset)
            an<= 4'b1110;   //start from digit 0
        else if(tick)
            an<= {an[2:0],an[3]};  //rotate left circuit    
                
        always @* begin
            case(an)
                4'b1110: sseg = 8'b11000000; //0      
                4'b1101: sseg = 8'b11111001; // 1
                4'b1011: sseg = 8'b10100100; // 2
                4'b0111: sseg = 8'b10110000; // 3
                default: sseg = 8'b11111111; // all off them
            endcase           
           
            
        end
endmodule
