`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2025 00:09:25
// Design Name: 
// Module Name: bcd_incrementor
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


module bcd_incrementor(
    input wire [11:0] bcd_in,
    output reg [11:0] bcd_out
    );
    
    
    reg [3:0] d0,d1,d2; //decimal digits
    
    
    always @* begin 
        
        d0 = bcd_in[3:0]; // ones
        d1 = bcd_in[7:4]; // tens 
        d2 = bcd_in[11:8];// hundreds
        
        d0 = d0 +1;
        if (d0 == 4'd10) begin
            d0 = 4'd0;
            d1 = d1+1;
            if(d1 ==4'd10) begin
                d1= 4'd0;
                d2 = d2+1;
                if(d2==4'd10) begin
                   d2 =4'd0;
                end
            end
        end
        bcd_out = {d2,d1,d0};
    end
    
    
    
    
endmodule
