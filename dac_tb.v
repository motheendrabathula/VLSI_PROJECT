`timescale 1ns / 1ps
module dac_tb;

reg clk;
reg [7:0] digital_value;
wire pwm_out;

// Instantiate DUT
dac_1 uut (
    .clk(clk),
    .digital_value(digital_value),
    .pwm_out(pwm_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz
end

// Stimulus
initial begin
    digital_value = 8'd0;

    #100 digital_value = 8'd20;   // low duty
    #100 digital_value = 8'd100;  // 40% duty
    #100 digital_value = 8'd150;  // 60% duty
    #100 digital_value = 8'd200;  // 78% duty
    #100 digital_value = 8'd255;  // 100% duty
    #200 $finish;
end

endmodule
