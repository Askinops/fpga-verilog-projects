`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 22:02:40
// Design Name: 
// Module Name: parking_counter
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

// Simple counter for parking lot
// Increments on 'inc', decrements on 'dec'
module parking_counter(
    input wire clk,reset,
    input wire inc, dec,
    output reg [3:0] count
    );
    
    always @(posedge clk or posedge reset)
        if(reset)
            count <= 0;
        else begin
            case ({inc,dec})
                2'b10: if(count < 15) // increment only
                    count <= count +1;
                
                2'b01: if(count > 0) // decrement only
                    count <= count - 1;
                    
                default: count <= count;     
                
            endcase
        end    
                
    
    
    
endmodule
