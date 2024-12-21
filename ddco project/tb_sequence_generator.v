`timescale 1ns / 1ps

module tb_sequence_generator; 

    reg clk;             // Testbench clock signal
    reg reset;           // Testbench reset signal
    wire [3:0] count;    // Output from the sequence generator

    // Instantiate the sequence generator
    sequence_generator uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate a clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Monitor the count value
        $monitor("Time: %0t | Reset: %b | Count: %b", $time, reset, count);
        
        // VCD file generation for GTKWave
        $dumpfile("sequence_generator_tb.vcd"); // Set output VCD file name
        $dumpvars(0, tb_sequence_generator);    // Dump variables in the current module

        // Initialize
        reset = 1;          // Assert reset
        #15;                // Wait for a while
        reset = 0;          // Deassert reset

        // Wait for a few clock cycles
        #100;               // Allow the counter to count
        
        // Finish simulation
        $finish;
    end

endmodule
