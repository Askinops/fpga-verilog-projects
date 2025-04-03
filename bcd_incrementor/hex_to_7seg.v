`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 21:33:48
// Design Name: 
// Module Name: disp_mux
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


module disp_mux
#(parameter N=4)
(    
    
    input wire clk,reset,
    input wire [7:0] in3,in2,in1,in0,  // 7-segment data 
    input wire [3:0] dp_in,            // decimal point control
    output reg [3:0] an,               // active - low anode
    output reg [7:0] sseg              // active - low 7-segment
    
    );
    
    // clock divider
    reg [N-1:0] q_reg;
    wire [N-1:0] q_next;
    
    always @(posedge clk or posedge reset)
    
        if(reset)
            q_reg<=0;
        else 
            q_reg <= q_next;
    
    
    assign q_next = q_reg +1;
    
    // 2MSB to select display position (0 to3)
    wire [1:0] sel;
    assign sel = q_reg[N-1:N-2];
    // === Display multiplexer
    always @* begin
        case(sel)
            2'b00: begin
                an = 4'b1110;      // enable digit 0
                sseg = in0;
                sseg[7] = ~dp_in[0]; // active-low dp
            end
            2'b01: begin
                an = 4'b1101;      // enable digit 1
                sseg = in1;
                sseg[7] = ~dp_in[1];
            end
            2'b10: begin
                an = 4'b1011;      // enable digit 2
                sseg = in2;
                sseg[7] = ~dp_in[2];
            end
            default: begin
                an = 4'b0111;      // enable digit 3
                sseg = in3;
                sseg[7] = ~dp_in[3];
            end
        endcase
    end
    
endmodule
