`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 02:21:16
// Design Name: 
// Module Name: dual_edge_detector_moore
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

// Dual-edge detector using Moore FSM architecture.
// The output 'tick' is asserted for one clock cycle on both rising and falling edges of the input signal.

module dual_edge_detector_moore(
    input wire clk,reset,
    input wire level,
    output reg tick // one clock cylcle output pulse on my edge 
    
    );
    
    // Symbolic state declarations
    // zero      : input has been stable at 0
    // edge_up   : rising edge detected (0 -> 1)
    // one       : input has been stable at 1
    // edge_down : falling edge detected (1 -> 0)
    parameter [1:0] zero= 2'b00, edge_up = 2'b01,
                    one = 2'b10, edge_down = 2'b11;    
    
    
    // state register
    reg  [1:0] state_reg, state_next;
    
    // state update logic 
    always @(posedge clk or posedge reset)
        if(reset)
                state_reg <= zero;
        else 
            state_reg <= state_next;
        
  
  
    always @* begin 
    
        state_next = state_reg; //default : stay in current state
        
        case(state_reg)
            zero: 
                if(level)
                    state_next = edge_up; // rising edge detected
             
             edge_up:
                state_next = one;        // Transition to 'one' state

            
            one: 
                if(~level)
                    state_next = edge_down; //falling edge detected
                       
            edge_down: 
                state_next = zero;  // return to zero state
                
                
            default: 
                state_next = zero;  //safety fallback
                     
        endcase   
            
      end
        
    always @* begin
        case(state_reg)
            edge_up,
            edge_down: tick=1'b1;  // output tick only during edge states 
            default: tick = 1'b0; 
        endcase   
    end                      
        
  
              
    
endmodule
