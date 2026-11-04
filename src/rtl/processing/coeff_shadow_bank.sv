`timescale 1ns/1ps

// Processing-domain active/shadow storage for baseline or template data.
// Software writes only the inactive bank. A commit is accepted only in IDLE
// and switches the active bank atomically in one processing clock.
module coeff_shadow_bank #(
    parameter integer DEPTH = 1024,
    parameter integer WIDTH = 16,
    parameter integer ADDR_W = $clog2(DEPTH)
) (
    input  logic                         clk_proc,
    input  logic                         rst_proc,
    input  logic                         processing_idle,

    input  logic                         shadow_wr_en,
    input  logic [ADDR_W-1:0]            shadow_wr_addr,
    input  logic signed [WIDTH-1:0]      shadow_wr_data,
    input  logic                         commit_pulse,

    input  logic                         active_rd_en,
    input  logic [ADDR_W-1:0]            active_rd_addr,
    output logic signed [WIDTH-1:0]      active_rd_data,

    output logic                         active_bank,
    output logic                         commit_accepted,
    output logic                         commit_rejected
);

    (* ram_style = "block" *) logic signed [WIDTH-1:0] bank_0 [0:DEPTH-1];
    (* ram_style = "block" *) logic signed [WIDTH-1:0] bank_1 [0:DEPTH-1];
    logic signed [WIDTH-1:0] bank_0_rd_data;
    logic signed [WIDTH-1:0] bank_1_rd_data;

    assign active_rd_data = active_bank ? bank_1_rd_data : bank_0_rd_data;

    // Keeping each physical bank in its own synchronous process allows
    // Vivado to infer one simple dual-port block RAM per bank. While one bank
    // is active/read-only, software writes only the other bank.
    always_ff @(posedge clk_proc) begin
        if (shadow_wr_en && active_bank)
            bank_0[shadow_wr_addr] <= shadow_wr_data;
        if (active_rd_en && !active_bank)
            bank_0_rd_data <= bank_0[active_rd_addr];
    end

    always_ff @(posedge clk_proc) begin
        if (shadow_wr_en && !active_bank)
            bank_1[shadow_wr_addr] <= shadow_wr_data;
        if (active_rd_en && active_bank)
            bank_1_rd_data <= bank_1[active_rd_addr];
    end

    always_ff @(posedge clk_proc) begin
        if (rst_proc) begin
            active_bank <= 1'b0;
            commit_accepted <= 1'b0;
            commit_rejected <= 1'b0;
        end else begin
            commit_accepted <= 1'b0;
            commit_rejected <= 1'b0;

            if (commit_pulse) begin
                if (processing_idle) begin
                    active_bank <= ~active_bank;
                    commit_accepted <= 1'b1;
                end else begin
                    commit_rejected <= 1'b1;
                end
            end
        end
    end

endmodule

