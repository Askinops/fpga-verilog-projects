`timescale 1ns / 1ps

module stack_tb;

    // Parameters
    parameter B = 8;
    parameter W = 4;

    // DUT interface
    reg clk, reset;
    reg push, pop;
    reg [B-1:0] w_data;
    wire [B-1:0] r_data;
    wire full, empty;

    // Instantiate DUT
    stack #(.B(B), .W(W)) uut (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .w_data(w_data),
        .r_data(r_data),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end
    
    // Test scenario
    initial begin
        // Initial values
        reset = 1;
        push = 0;
        pop = 0;
        w_data = 8'h00;
        #20;

        reset = 0;

        // === Push 3 elements ===
        repeat (3) begin
            @(negedge clk);
            w_data = $random;
            push = 1;
            pop = 0;
        end

        @(negedge clk); push = 0;

        // === Pop 2 elements ===
        repeat (2) begin
            @(negedge clk);
            push = 0;
            pop = 1;
        end

        @(negedge clk); pop = 0;

        // === Final check ===
        @(negedge clk);
        $display("Final r_data = %h", r_data);
        $display("Full = %b | Empty = %b", full, empty);

        // Stop simulation
        #50;
        $stop;
    end

endmodule
