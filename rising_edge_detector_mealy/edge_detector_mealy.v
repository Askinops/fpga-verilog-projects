`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 16:22:51
// Design Name: 
// Module Name: edge_detector_mealy
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


module edge_detector_mealy(
    input wire clk,reset,
    input wire level,
    output reg tick

    );
    
    //symbolic state declaration
    parameter zero=1'b0, one= 1'b1;
    
    //signal decleration
    
    reg state_reg, state_next;
    //state register
    always @(posedge clk or posedge reset)
        if(reset)
            state_reg <=0;
        else 
            state_reg <= state_next;    
            
    
    //state register
    
    always @* begin
        state_next= state_reg; // deafult state: the same 
        tick= 1'b0; // default output: 
        case(state_reg)
            zero:
                if(level) begin
                    tick=1'b1;
                    state_next=one;
                end
            one: 
                if(~level)
                  state_next=zero;  
                          
                
            default: state_next = zero;
        
        endcase 
    end
    
endmodule
