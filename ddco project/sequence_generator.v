module sequence_generator (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    output reg [3:0] count // 4-bit output count
);

    // Always block that triggers on the rising edge of the clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000; // Reset count to 0000
        end else begin
            count <= count + 1; // Increment count by 1
        end
    end

endmodule
