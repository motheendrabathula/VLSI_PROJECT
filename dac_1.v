`timescale 1ns / 1ps
module dac_1 (
    input  wire clk,
    input  wire [7:0] digital_value,
    output reg  pwm_out
);
    reg [8:0] accumulator = 0;

    always @(posedge clk) begin
        accumulator <= accumulator[7:0] + digital_value;
        pwm_out <= accumulator[8];
    end
endmodule
