`timescale 1ns/1ps

// Acquisition-domain frame averager with a synchronous block-RAM read stage.
// The final frame is rounded and written directly into the dual-clock average
// frame RAM. group_done_pulse is deliberately delayed one acquisition clock
// after the final average write.
module frame_average_bram #(
    parameter integer N = 1024,
    parameter integer M = 32,
    parameter integer ADDR_W = $clog2(N),
    parameter integer FRAME_W = $clog2(M)
) (
    input  logic                    clk_acq,
    input  logic                    rst_acq,
    input  logic                    start_pulse,
    input  logic                    sample_valid,
    input  logic [13:0]             sample_u14,
    input  logic                    sample_clip,

    output logic                    busy,
    output logic                    group_done_pulse,
    output logic                    clip_flag_snapshot,
    output logic [31:0]             overflow_count,

    output logic                    avg_wr_en,
    output logic [ADDR_W-1:0]       avg_wr_addr,
    output logic signed [15:0]      avg_wr_data_q2
);

    localparam integer AVG_SHIFT = $clog2(M) - 2;
    localparam logic signed [22:0] ACC_MAX_EXT = 23'sd2097151;
    localparam logic signed [22:0] ACC_MIN_EXT = -23'sd2097152;

    logic [ADDR_W-1:0] input_addr;
    logic [FRAME_W-1:0] input_frame;
    logic input_complete;

    logic pipe_valid;
    logic [ADDR_W-1:0] pipe_addr;
    logic [FRAME_W-1:0] pipe_frame;
    logic signed [13:0] pipe_sample_s14;

    logic read_valid;
    logic [ADDR_W-1:0] read_addr;
    logic [FRAME_W-1:0] read_frame;
    logic signed [13:0] read_sample_s14;
    logic signed [21:0] read_accum_s22;

    logic raw_sum_valid;
    logic [ADDR_W-1:0] raw_sum_addr;
    logic [FRAME_W-1:0] raw_sum_frame;
    logic signed [22:0] raw_sum_ext;

    logic sum_valid;
    logic [ADDR_W-1:0] sum_addr;
    logic [FRAME_W-1:0] sum_frame;
    logic signed [21:0] sum_data_s22;
    logic sum_overflow_reg;

    logic accept_sample;
    logic signed [13:0] sample_s14;
    logic clip_now;
    logic clip_flag_work;
    logic finish_pending;

    logic acc_rd_en;
    logic [ADDR_W-1:0] acc_rd_addr;
    logic signed [21:0] acc_rd_data;
    logic acc_wr_en;
    logic [ADDR_W-1:0] acc_wr_addr;
    logic signed [21:0] acc_wr_data;

    logic signed [22:0] sum_ext;
    logic signed [21:0] sum_s22;
    logic sum_overflow;

    assign sample_s14 = $signed({~sample_u14[13], sample_u14[12:0]});
    assign clip_now = sample_clip
                   || (sample_u14 == 14'd0)
                   || (sample_u14 == 14'd16383);
    assign accept_sample = busy && !input_complete && sample_valid;
    assign acc_rd_en = accept_sample;
    assign acc_rd_addr = input_addr;

    accum_tdp_bram #(
        .DEPTH(N),
        .ADDR_W(ADDR_W),
        .WIDTH(22)
    ) accum_ram (
        .clk(clk_acq),
        .rd_en(acc_rd_en),
        .rd_addr(acc_rd_addr),
        .rd_data(acc_rd_data),
        .wr_en(acc_wr_en),
        .wr_addr(acc_wr_addr),
        .wr_data(acc_wr_data)
    );

    always_comb begin
        sum_ext = {read_accum_s22[21], read_accum_s22}
                + {{9{read_sample_s14[13]}}, read_sample_s14};

        sum_overflow = 1'b0;
        if (raw_sum_ext > ACC_MAX_EXT) begin
            sum_s22 = 22'sh1F_FFFF;
            sum_overflow = 1'b1;
        end else if (raw_sum_ext < ACC_MIN_EXT) begin
            sum_s22 = -22'sd2097152;
            sum_overflow = 1'b1;
        end else begin
            sum_s22 = raw_sum_ext[21:0];
        end
    end

    function automatic logic signed [15:0] average_q2_ties_even(
        input logic signed [21:0] value
    );
        logic signed [21:0] quotient_floor;
        logic [21:0] remainder;
        logic [21:0] half;
        logic [21:0] mask;
        logic round_up;
        logic signed [21:0] rounded;
        begin
            // Arithmetic shift gives floor(value/2^S). The low S bits are
            // therefore a non-negative remainder for both signs. Incrementing
            // the floor on >half or an odd tie implements round-to-nearest-even.
            quotient_floor = value >>> AVG_SHIFT;
            mask = (22'd1 << AVG_SHIFT) - 1'b1;
            half = 22'd1 << (AVG_SHIFT - 1);
            remainder = $unsigned(value) & mask;
            round_up = (remainder > half)
                     || ((remainder == half) && quotient_floor[0]);
            rounded = quotient_floor + round_up;
            average_q2_ties_even = rounded[15:0];
        end
    endfunction

    initial begin
        if ((M != 16) && (M != 32) && (M != 64))
            $error("frame_average_bram supports M=16, 32, or 64");
    end

    always_ff @(posedge clk_acq) begin
        if (rst_acq) begin
            busy <= 1'b0;
            group_done_pulse <= 1'b0;
            clip_flag_snapshot <= 1'b0;
            clip_flag_work <= 1'b0;
            overflow_count <= '0;
            input_addr <= '0;
            input_frame <= '0;
            input_complete <= 1'b0;
            pipe_valid <= 1'b0;
            pipe_addr <= '0;
            pipe_frame <= '0;
            pipe_sample_s14 <= '0;
            read_valid <= 1'b0;
            read_addr <= '0;
            read_frame <= '0;
            read_sample_s14 <= '0;
            read_accum_s22 <= '0;
            raw_sum_valid <= 1'b0;
            raw_sum_addr <= '0;
            raw_sum_frame <= '0;
            raw_sum_ext <= '0;
            sum_valid <= 1'b0;
            sum_addr <= '0;
            sum_frame <= '0;
            sum_data_s22 <= '0;
            sum_overflow_reg <= 1'b0;
            finish_pending <= 1'b0;
            acc_wr_en <= 1'b0;
            acc_wr_addr <= '0;
            acc_wr_data <= '0;
            avg_wr_en <= 1'b0;
            avg_wr_addr <= '0;
            avg_wr_data_q2 <= '0;
        end else begin
            group_done_pulse <= 1'b0;
            acc_wr_en <= 1'b0;
            avg_wr_en <= 1'b0;

            if (start_pulse && !busy) begin
                busy <= 1'b1;
                clip_flag_work <= 1'b0;
                clip_flag_snapshot <= 1'b0;
                overflow_count <= '0;
                input_addr <= '0;
                input_frame <= '0;
                input_complete <= 1'b0;
                pipe_valid <= 1'b0;
                read_valid <= 1'b0;
                raw_sum_valid <= 1'b0;
                sum_valid <= 1'b0;
                finish_pending <= 1'b0;
            end

            pipe_valid <= accept_sample;
            if (accept_sample) begin
                pipe_addr <= input_addr;
                pipe_frame <= input_frame;
                pipe_sample_s14 <= sample_s14;
                clip_flag_work <= clip_flag_work | clip_now;

                if (input_addr == N-1) begin
                    input_addr <= '0;
                    if (input_frame == M-1) begin
                        input_complete <= 1'b1;
                    end else begin
                        input_frame <= input_frame + 1'b1;
                    end
                end else begin
                    input_addr <= input_addr + 1'b1;
                end
            end

            // Explicitly register the synchronous BRAM output before the
            // saturating adder. This keeps the 200 MHz BRAM clock-to-out delay
            // and the 22-bit carry chain in separate pipeline stages.
            read_valid <= pipe_valid;
            if (pipe_valid) begin
                read_addr <= pipe_addr;
                read_frame <= pipe_frame;
                read_sample_s14 <= pipe_sample_s14;
                read_accum_s22 <= (pipe_frame == 0) ? '0 : acc_rd_data;
            end

            // Register the raw 23-bit addition before range checking. The
            // following stage performs only saturation and metadata transfer.
            raw_sum_valid <= read_valid;
            if (read_valid) begin
                raw_sum_addr <= read_addr;
                raw_sum_frame <= read_frame;
                raw_sum_ext <= sum_ext;
            end

            sum_valid <= raw_sum_valid;
            if (raw_sum_valid) begin
                sum_addr <= raw_sum_addr;
                sum_frame <= raw_sum_frame;
                sum_data_s22 <= sum_s22;
                sum_overflow_reg <= sum_overflow;
            end

            if (sum_valid) begin
                acc_wr_en <= 1'b1;
                acc_wr_addr <= sum_addr;
                acc_wr_data <= sum_data_s22;
                if (sum_overflow_reg)
                    overflow_count <= overflow_count + 1'b1;

                if (sum_frame == M-1) begin
                    avg_wr_en <= 1'b1;
                    avg_wr_addr <= sum_addr;
                    avg_wr_data_q2 <= average_q2_ties_even(sum_data_s22);
                end

                if ((sum_frame == M-1) && (sum_addr == N-1)) begin
                    finish_pending <= 1'b1;
                    clip_flag_snapshot <= clip_flag_work;
                end
            end

            if (finish_pending) begin
                finish_pending <= 1'b0;
                busy <= 1'b0;
                group_done_pulse <= 1'b1;
            end
        end
    end

endmodule

