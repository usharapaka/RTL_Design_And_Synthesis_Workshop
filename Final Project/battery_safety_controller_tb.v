`timescale 1ns/1ps

module battery_safety_controller_tb;

reg clk;
reg reset;
reg battery_present;
reg temp_fault;
reg voltage_fault;
reg damage_detected;

wire safe;
wire warning;
wire isolate;
wire alert;

battery_safety_controller dut (
    .clk(clk),
    .reset(reset),
    .battery_present(battery_present),
    .temp_fault(temp_fault),
    .voltage_fault(voltage_fault),
    .damage_detected(damage_detected),
    .safe(safe),
    .warning(warning),
    .isolate(isolate),
    .alert(alert)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("battery_safety_controller.vcd");
    $dumpvars(0, battery_safety_controller_tb);

    clk = 0;
    reset = 1;
    battery_present = 0;
    temp_fault = 0;
    voltage_fault = 0;
    damage_detected = 0;

    #10 reset = 0;

    #10 battery_present = 1;
    temp_fault = 1;

    #50 temp_fault = 0;

    #10 voltage_fault = 1;

    #50 voltage_fault = 0;

    #10 damage_detected = 1;

    #60 damage_detected = 0;

    #20 battery_present = 0;

    #20 $finish;
end

initial begin
    $monitor("Time=%0t | Present=%b | Temp=%b | Voltage=%b | Damage=%b | Safe=%b | Warning=%b | Isolate=%b | Alert=%b",
        $time, battery_present, temp_fault, voltage_fault,
        damage_detected, safe, warning, isolate, alert);
end

endmodule
