`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: stop_watch_cascade
// Description: 3-digit (000-999) stopwatch using cascaded BCD counters
//////////////////////////////////////////////////////////////////////////////////

module stop_watch_cascade
#(parameter DVSR = 5000000)  // Number of clock ticks per unit increment
(
    input wire clk,          // Clock input
    input wire go,           // Start/stop control
    input wire clr,          // Clear/reset control
    output wire [3:0] d2,    // Hundreds digit
    output wire [3:0] d1,    // Tens digit
    output wire [3:0] d0     // Ones digit
);

    // Divider for time base (generates ms_tick)
    reg [22:0] ms_reg = 0;
    wire [22:0] ms_next;
    wire ms_tick;

    // BCD digit registers
    reg [3:0] d0_reg = 0, d1_reg = 0, d2_reg = 0;
    wire [3:0] d0_next, d1_next, d2_next;

    wire d0_tick, d1_tick;
    wire d0_en, d1_en, d2_en;

    // Divider logic
    assign ms_next = (clr || (ms_reg == DVSR && go)) ? 23'd0 :
                     (go) ? ms_reg + 1 : ms_reg;

    assign ms_tick = (ms_reg == DVSR) ? 1'b1 : 1'b0;

    // Enable signals
    assign d0_en = ms_tick;
    assign d0_tick = (d0_reg == 9);
    assign d1_en = ms_tick & d0_tick;
    assign d1_tick = (d1_reg == 9);
    assign d2_en = ms_tick & d0_tick & d1_tick;

    // BCD logic for next state
    assign d0_next = (clr || (d0_en && d0_reg == 9)) ? 4'd0 :
                     (d0_en) ? d0_reg + 1 : d0_reg;

    assign d1_next = (clr || (d1_en && d1_reg == 9)) ? 4'd0 :
                     (d1_en) ? d1_reg + 1 : d1_reg;

    assign d2_next = (clr || (d2_en && d2_reg == 9)) ? 4'd0 :
                     (d2_en) ? d2_reg + 1 : d2_reg;

    // Register updates
    always @(posedge clk) begin
        ms_reg <= ms_next;
        d0_reg <= d0_next;
        d1_reg <= d1_next;
        d2_reg <= d2_next;
    end

    // Output assignments
    assign d0 = d0_reg;
    assign d1 = d1_reg;
    assign d2 = d2_reg;

endmodule
