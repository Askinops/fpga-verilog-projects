`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_disp_mux
// Description: Testbench for Display Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module tb_disp_mux;

    // Parameters
    parameter N = 2;  // 2-bit counter for 4 displays

    // Testbench signals
    reg clk, reset;
    reg [7:0] in3, in2, in1, in0;
    wire [3:0] an;
    wire [7:0] sseg;

    // Instantiate the Display Multiplexer (DUT)
    disp_mux #(N) uut (
        .clk(clk),
        .reset(reset),
        .in3(in3),
        .in2(in2),
        .in1(in1),
        .in0(in0),
        .an(an),
        .sseg(sseg)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;  // 10ns period for the clock

    // Test sequence
    initial begin
        // Display starting message
        $display("Starting Display Multiplexer Test...");
        $monitor("Time = %0dns | an = %b | sseg = %b", $time, an, sseg);

        // Initialize signals
        clk = 0;
        reset = 1;
        in3 = 8'b11001100;  // Test values for displays
        in2 = 8'b10101010;
        in1 = 8'b11110000;
        in0 = 8'b01100110;

        // Reset active for some time
        #10 reset = 0;
        
        // Wait for the counter to cycle
        #150;  // Let the multiplexer cycle through all displays
        
        // Reset again and observe behavior
        reset = 1;
        #10 reset = 0;

        #60;

        $finish;  // End the simulation
    end

endmodule
