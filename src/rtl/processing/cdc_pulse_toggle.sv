`timescale 1ns/1ps

// Transfers isolated one-cycle events between unrelated clock domains.
// The source must not issue another pulse until the system-level transaction
// has completed; the P0 serial scheduler guarantees this condition.
module cdc_pulse_toggle (
    input  logic src_clk,
    input  logic src_rst,
    input  logic src_pulse,

    input  logic dst_clk,
    input  logic dst_rst,
    output logic dst_pulse
);

    logic src_toggle;
    (* ASYNC_REG = "TRUE" *) logic dst_sync_1;
    (* ASYNC_REG = "TRUE" *) logic dst_sync_2;
    logic dst_sync_2_d;

    always_ff @(posedge src_clk) begin
        if (src_rst)
            src_toggle <= 1'b0;
        else if (src_pulse)
            src_toggle <= ~src_toggle;
    end

    always_ff @(posedge dst_clk) begin
        if (dst_rst) begin
            dst_sync_1 <= 1'b0;
            dst_sync_2 <= 1'b0;
            dst_sync_2_d <= 1'b0;
            dst_pulse <= 1'b0;
        end else begin
            dst_sync_1 <= src_toggle;
            dst_sync_2 <= dst_sync_1;
            dst_sync_2_d <= dst_sync_2;
            dst_pulse <= dst_sync_2 ^ dst_sync_2_d;
        end
    end

endmodule

