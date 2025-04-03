`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 22:17:23
// Design Name: 
// Module Name: parking_system_tb
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


module parking_system_tb;


    // clock and reset 
    reg clk,reset;

    // sensor signal 
    reg a,b;
    
    //fsm otputs
    wire enter, exit;
    
    // counter output 
    wire[3:0] count;
    
    // clock generation
    always #5 clk = ~clk;
     
    // FSM instance
    parking_fsm fsm_inst (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .enter(enter),
        .exit(exit)
    );

    // Counter instance
    parking_counter counter_inst (
        .clk(clk),
        .reset(reset),
        .inc(enter),
        .dec(exit),
        .count(count)
    );

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        a = 0;
        b = 0;

        #20 reset = 0;

        // === VEHICLE ENTRY ===
        #20 a = 1; b = 0;   // S1: sensor A triggered
        #20 a = 1; b = 1;   // S2: both sensors triggered
        #20 a = 0; b = 1;   // S3: sensor B only
        #20 a = 0; b = 0;   // S0: vehicle passed → enter pulse expected

        // === ANOTHER VEHICLE ENTRY ===
        #40 a = 1; b = 0;
        #20 a = 1; b = 1;
        #20 a = 0; b = 1;
        #20 a = 0; b = 0;

        // === VEHICLE EXIT ===
        #40 a = 0; b = 1;   // S3: sensor B triggered
        #20 a = 1; b = 1;   // S2
        #20 a = 1; b = 0;   // S1
        #20 a = 0; b = 0;   // S0 → exit pulse expected

        // === INVALID MOVEMENT (aborted entry) ===
        #40 a = 1; b = 0;   // starts entry
        #20 a = 0; b = 0;   // goes back → should not trigger any pulse

        // End simulation
        #100 $finish;
    end



endmodule
