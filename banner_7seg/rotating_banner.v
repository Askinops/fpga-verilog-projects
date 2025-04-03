`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2025 14:27:58
// Design Name: 
// Module Name: rotating_banner
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


module rotating_banner(
    input wire clk, reset, en,dir,
    output wire [3:0] an,
    output wire [7:0] sseg
    );
    // Parameter
    parameter N=4; // for slow scroll effect
    parameter max_pos = 6; // number of scroll positions 
    
    // tick generator
    wire tick;
    tick_generator #(.N(N)) tick_gen_unit (
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );
    // === Scroll controller
    wire [2:0] pos;
    scroll_controller #(.max_pos(max_pos)) scroll_controller(
        .clk(clk),
        .reset(reset),
        .en(en),
        .dir(dir),
        .tick(tick),
        .pos(pos)
    );
    
    // === Message ROM (10 characters: 0-9)
    reg [3:0] message[0:9];
    initial begin
        message[0] = 4'd0;
        message[1] = 4'd1;
        message[2] = 4'd2;
        message[3] = 4'd3;
        message[4] = 4'd4;
        message[5] = 4'd5;
        message[6] = 4'd6;
        message[7] = 4'd7;
        message[8] = 4'd8;
        message[9] = 4'd9;
    end
    // === Extract current 4-character window from message
    wire [3:0] hex0, hex1, hex2, hex3;

    assign hex0 = message[pos];
    assign hex1 = message[pos + 1];
    assign hex2 = message[pos + 2];
    assign hex3 = message[pos + 3];

    // === Convert to 7-segment format
    wire [7:0] seg0, seg1, seg2, seg3;

    hex_to_7segg seg_unit0 (.hex(hex0), .dp(1'b0), .sseg(seg0));
    hex_to_7segg seg_unit1 (.hex(hex1), .dp(1'b0), .sseg(seg1));
    hex_to_7segg seg_unit2 (.hex(hex2), .dp(1'b0), .sseg(seg2));
    hex_to_7segg seg_unit3 (.hex(hex3), .dp(1'b0), .sseg(seg3));

    // === Display multiplexer
    disp_mux display_unit (
        .clk(clk),
        .reset(reset),
        .in3(seg3),
        .in2(seg2),
        .in1(seg1),
        .in0(seg0),
        .dp_in(4'b0000),   // no decimal points
        .an(an),
        .sseg(sseg)
    );
    
    
    
endmodule
