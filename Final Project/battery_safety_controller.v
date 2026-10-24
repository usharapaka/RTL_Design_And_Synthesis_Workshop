module battery_safety_controller #(
    parameter FAULT_THRESHOLD = 3
)(
    input wire clk,
    input wire reset,
    input wire battery_present,
    input wire temp_fault,
    input wire voltage_fault,
    input wire damage_detected,
    output reg safe,
    output reg warning,
    output reg isolate,
    output reg alert
);

localparam SAFE = 2'b00,
           MONITORING = 2'b01,
           WARNING = 2'b10,
           ISOLATE = 2'b11;

reg [1:0] state;
reg [3:0] fault_count;

wire fault_detected = temp_fault | voltage_fault | damage_detected;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= SAFE;
        fault_count <= 4'd0;
    end else begin
        case (state)
            SAFE: begin
                fault_count <= 0;
                if (battery_present && fault_detected)
                    state <= MONITORING;
            end

            MONITORING: begin
                if (!battery_present || !fault_detected) begin
                    state <= SAFE;
                    fault_count <= 0;
                end else if (fault_count >= FAULT_THRESHOLD-1) begin
                    state <= WARNING;
                    fault_count <= fault_count + 1'b1;
                end else begin
                    fault_count <= fault_count + 1'b1;
                end
            end

            WARNING: begin
                if (!battery_present || !fault_detected) begin
                    state <= SAFE;
                    fault_count <= 0;
                end else if (fault_count >= FAULT_THRESHOLD) begin
                    state <= ISOLATE;
                end else begin
                    fault_count <= fault_count + 1'b1;
                end
            end

            ISOLATE: begin
                if (!battery_present || !fault_detected) begin
                    state <= SAFE;
                    fault_count <= 0;
                end
            end

            default: begin
                state <= SAFE;
                fault_count <= 0;
            end
        endcase
    end
end

always @(*) begin
    safe = 0;
    warning = 0;
    isolate = 0;
    alert = 0;

    case (state)
        SAFE, MONITORING: safe = 1;

        WARNING: warning = 1;

        ISOLATE: begin
            isolate = 1;
            alert = 1;
        end

        default: safe = 1;
    endcase
end

endmodule
