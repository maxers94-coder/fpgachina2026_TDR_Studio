`timescale 1ns/1ps

// Generates registered DAC words plus matching source metadata.  A downstream
// launch register must delay metadata by one clk, matching the ODDR sampling
// of source_sample at that edge. No analog converter latency is assumed here.
module sync_pulse_engine #(
    parameter integer FRAME_PAIRS = 512,
    parameter integer PRETRIGGER_PAIRS = 64,
    parameter integer REPEAT_CYCLES = 2000,
    parameter integer MAX_WIDTH = 32,
    parameter integer AMPLITUDE = 4096,
    parameter integer INDEX_W = $clog2(FRAME_PAIRS)
) (
    input  wire clk, rst, ready,
    input  wire [2:0] requested_mode,
    input  wire [5:0] requested_width,
    input  tri0 requested_pn,
    input  wire single_request, repeat_enable, clear_request,
    output wire busy,
    output reg clear_accepted = 0,
    output reg rejected_sticky = 0, aborted_sticky = 0,
    output reg [31:0] completed_count = 0,
    output reg [31:0] rejected_count = 0,
    output reg [31:0] aborted_count = 0,
    output reg source_owned = 0,
    output reg signed [15:0] source_sample = 0,
    output reg source_marker = 0, source_tx_active = 0,
    output reg source_frame_active = 0,
    output reg source_frame_start = 0, source_frame_last = 0,
    output reg [INDEX_W-1:0] source_index = 0,
    output reg [15:0] source_frame_id = 0,
    output reg [2:0] source_mode = 0
);
    localparam integer COUNT_W = $clog2(REPEAT_CYCLES);
    reg running = 0;
    reg [COUNT_W-1:0] cycle_index = 0;
    reg [2:0] mode_latched = 5;
    reg [5:0] width_latched = 4;
    reg pn_latched = 0;
    reg [6:0] pn_state = 7'h7f;
    reg pn_hold = 0;
    reg [15:0] frame_id = 0;
    reg single_d = 0, clear_d = 0;
    wire single_edge = single_request && !single_d;
    wire clear_edge = clear_request && !clear_d;
    wire config_valid = requested_mode >= 5 && requested_width >= 1 &&
                        requested_width <= MAX_WIDTH &&
                        (requested_mode != 7 || !requested_width[0]) &&
                        (!requested_pn || (requested_mode == 5 &&
                         PRETRIGGER_PAIRS + 254 < FRAME_PAIRS));
    wire in_frame = cycle_index < FRAME_PAIRS;
    wire pulse_on = in_frame && cycle_index >= PRETRIGGER_PAIRS &&
                    cycle_index < PRETRIGGER_PAIRS + (pn_latched ? 254 : width_latched);
    assign busy = running;

    function automatic [31:0] increment_sat(input [31:0] value);
        increment_sat = (&value) ? value : value + 1'b1;
    endfunction

    initial begin
        if (FRAME_PAIRS < 4 || PRETRIGGER_PAIRS < 1 ||
            PRETRIGGER_PAIRS + MAX_WIDTH >= FRAME_PAIRS ||
            REPEAT_CYCLES <= FRAME_PAIRS || MAX_WIDTH > 63 ||
            AMPLITUDE < 1 || AMPLITUDE > 8192)
            $fatal(1, "Invalid pulse/frame parameters");
    end

    always @(posedge clk) begin
        single_d <= single_request;
        clear_d <= clear_request;
        clear_accepted <= 0;
        source_owned <= 0;
        source_sample <= 0;
        source_marker <= 0;
        source_tx_active <= 0;
        source_frame_active <= 0;
        source_frame_start <= 0;
        source_frame_last <= 0;
        source_index <= 0;
        if (rst) begin
            running <= 0;
            cycle_index <= 0;
            mode_latched <= 5;
            width_latched <= 4;
            pn_latched <= 0;
            pn_state <= 7'h7f;
            pn_hold <= 0;
            frame_id <= 0;
            source_frame_id <= 0;
            source_mode <= 0;
            single_d <= 0;
            clear_d <= 0;
            rejected_sticky <= 0;
            aborted_sticky <= 0;
            completed_count <= 0;
            rejected_count <= 0;
            aborted_count <= 0;
        end else if (clear_edge && !running && !source_owned) begin
            // Clear is an idle-only operation. Simultaneous START is consumed.
            clear_accepted <= 1;
            frame_id <= 0;
            source_frame_id <= 0;
            completed_count <= 0;
            rejected_count <= 0;
            aborted_count <= 0;
            rejected_sticky <= 0;
            aborted_sticky <= 0;
        end else if (!ready) begin
            if (running) begin
                aborted_count <= increment_sat(aborted_count);
                aborted_sticky <= 1;
            end
            running <= 0;
            cycle_index <= 0;
            if (single_edge || clear_edge) begin
                rejected_count <= increment_sat(rejected_count);
                rejected_sticky <= 1;
            end
        end else if (running) begin
            // Configuration is frozen for the entire current frame/gap.
            source_owned <= 1;
            source_frame_id <= frame_id;
            source_mode <= mode_latched;
            source_frame_active <= in_frame;
            source_frame_start <= in_frame && cycle_index == 0;
            source_frame_last <= in_frame && cycle_index == FRAME_PAIRS-1;
            if (in_frame) source_index <= cycle_index[INDEX_W-1:0];
            if (pulse_on) begin
                source_tx_active <= 1;
                source_marker <= cycle_index == PRETRIGGER_PAIRS;
                if (pn_latched) begin
                    source_sample <= pn_state[6] ? AMPLITUDE : -AMPLITUDE;
                    pn_hold <= ~pn_hold;
                    if (pn_hold)
                        pn_state <= {pn_state[5:0], pn_state[6] ^ pn_state[5]};
                end else if (mode_latched == 6 ||
                    (mode_latched == 7 &&
                     cycle_index - PRETRIGGER_PAIRS >= (width_latched >> 1)))
                    source_sample <= -AMPLITUDE;
                else
                    source_sample <= AMPLITUDE;
            end
            if (single_edge || clear_edge) begin
                rejected_count <= increment_sat(rejected_count);
                rejected_sticky <= 1;
            end
            if (cycle_index == FRAME_PAIRS-1)
                completed_count <= increment_sat(completed_count);
            if ((!repeat_enable && cycle_index >= FRAME_PAIRS-1) ||
                (cycle_index == REPEAT_CYCLES-1 && !config_valid)) begin
                running <= 0;
                cycle_index <= 0;
            end else if (cycle_index == REPEAT_CYCLES-1) begin
                cycle_index <= 0;
                mode_latched <= requested_mode;
                width_latched <= requested_width;
                pn_latched <= requested_pn;
                pn_state <= 7'h7f;
                pn_hold <= 0;
                frame_id <= frame_id + 1'b1;
            end else begin
                cycle_index <= cycle_index + 1'b1;
            end
        end else begin
            // Held SINGLE cannot retrigger. REPEAT waits for ready/config.
            if (single_edge && !config_valid) begin
                rejected_count <= increment_sat(rejected_count);
                rejected_sticky <= 1;
            end else if ((single_edge || repeat_enable) && config_valid) begin
                running <= 1;
                cycle_index <= 0;
                mode_latched <= requested_mode;
                width_latched <= requested_width;
                pn_latched <= requested_pn;
                pn_state <= 7'h7f;
                pn_hold <= 0;
                frame_id <= frame_id + 1'b1;
            end
        end
    end
endmodule
