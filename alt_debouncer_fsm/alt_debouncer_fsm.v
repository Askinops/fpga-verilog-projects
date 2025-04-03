`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 20:24:33
// Design Name: 
// Module Name: alt_debouncer_fsm
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

// Alternative debounce circuit using FSM.
// Reacts immediately to sw == 1 (rising edge), then ignores glitches for ~30ms.

module alt_debouncer_fsm(
    input wire clk,reset,
    input wire sw, // raw switch input
    output reg db //debounced output
    
    );
    // state encoding 
    parameter [2:0] 
        zero = 3'b000, // sw=1
        edg = 3'b001, // sw=1 detected db=1
        wait_1 = 3'b010, //wait 10ms
        wait_2 = 3'b011, //wait 10ms    
        check = 3'b100; // after 30ms check for falling edge 
        
    //parameter: timer bit size 
    parameter n=19;  // for ~10ms at 50MHz
           
    // signal
    
    reg [n-1:0] q_reg;
    wire [n-1:0] q_next;
    wire m_tick;
    
    reg [2:0] state_reg,state_next;
    
    // tick generator: counts when from to 2^n-1 => m_tick when q_reg==0
    always @(posedge clk)
        q_reg <= q_next;
         
    assign q_next = q_reg +1;
    assign m_tick = (q_reg == 0);
    
    // fsm state register
    always @(posedge clk or posedge reset)
        if(reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    
    // fsm next-state logic and output logic
    always @* begin
        state_next=state_reg;   // default: stay
        db=1'b0;    //default output
        
        case(state_reg)
            zero: 
                if(sw)
                    state_next = edg;
            
            edg: 
                begin
                    db=1'b1;
                    if(m_tick)
                        state_next = wait_1;        
                end
            
            wait_1: 
                begin
                    db=1'b1;
                    if(m_tick)
                        state_next= wait_2;
                
                end
            
            wait_2: 
                begin
                    db=1'b1;
                    if(m_tick)
                        state_next = check; 
         
                end 
            
            check: 
                begin
                    db=1'b1;
                    if(~sw)
                        state_next = zero;
                end   
               
            
            default: state_next = zero;
                          
        endcase
        
        
    end
endmodule
