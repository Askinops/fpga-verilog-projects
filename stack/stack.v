`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 15:26:01
// Design Name: 
// Module Name: stack
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


module stack
#(parameter B=8, // data width
parameter W=4 // adress width    
)
(
    input wire clk,reset,
    input wire push, // push signal(write to stack)
    input wire pop, // pop signal(read from stack)
    input wire [B-1:0] w_data, // data to be pushed
    output wire [B-1:0] r_data, //data popped from top
    output wire full,
    output wire empty
    );
    
    // internal memory (register file)
    reg [B-1:0] stack_mem [0:(1<<W)-1]; 
    // initialize memory for simulation
    integer i;
    initial begin
        for(i=0; i < (1<<W); i=i+1)
            stack_mem[i]=8'h00;   
        
    end
    //stack pointer
    reg[W-1:0] sp_reg, sp_next;
    //status flags
    reg full_reg, full_next,empty_reg,empty_next;
    
    //write condition
    wire push_en;
    
    // enable write when pushing and not full 
      
    assign push_en = push & ~full_reg;
    
    // stacj write operation
    always @(posedge clk) begin
        if(push_en)
            stack_mem[sp_reg]<= w_data;
    end
    
    // stack read : read from top of stack 
    
    assign r_data= stack_mem[sp_next];
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sp_reg<=0;
            full_reg <= 1'b0;
            empty_reg <= 1'b1;
        end else begin 
            sp_reg <= sp_next;
            full_reg <= full_next;
            empty_reg <= empty_next;           
            end
    end   
    
    // Combinational logic for next state
    always @* begin
        // defaults 
        sp_next = sp_reg;
        full_next = full_reg;
        empty_next= empty_reg;
        
        case({push, pop})
            2'b00: ; // no operation
            2'b01: //pop only 
            
                if(~empty_reg) begin
                    sp_next = sp_reg-1;
                    full_next = 1'b0;
                    if(sp_reg == 1)
                    empty_next =1'b1;                
                end
            
            2'b10: // push only 
                if(~full_reg) begin
                    sp_next = sp_reg +1;
                    empty_next = 1'b0;
                    if(sp_reg == (1<<W)-1)
                        full_next = 1'b1;                   
                end
            2'b11: ; // invalid: push&pop at same time (do nothing or customize)    
                
        endcase
    end
    
    // output flag
    assign full= full_reg;
    assign empty = empty_reg;    
    
endmodule
