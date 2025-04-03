`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 02:57:04
// Design Name: 
// Module Name: dual_edge_detector_mealy
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


module dual_edge_detector_mealy(
    input wire clk,reset,
    input wire level,
    output reg tick
    );
    
    //symbolic state declarations
    parameter zero=1'b0, one=1'b1;
    
    //state register
    reg state_reg, state_next;
       
    // state register logic
    always@(posedge clk or posedge reset)
        if(reset)
            state_reg <= zero;
        else
            state_reg<=state_next;
            
            
    // Next-state and Mealy output logic
    always @* begin
        tick = 1'b0; //default: no tick
        state_next = state_reg; // state in current state
        
        case(state_reg)
            zero: 
                if(level) begin
                    tick=1'b1;   // rising edge detected
                    state_next =one;
                end
                
            one : 
                if(~level) begin
                    tick=1'b1;
                    state_next=zero;
                end    
            
            default:
                state_next = zero;    
        
        endcase
    
    end
            
            
    
    
    
    
endmodule
