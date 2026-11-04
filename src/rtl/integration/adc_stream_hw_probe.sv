`timescale 1ns/1ps

// Hardware-only observation wrapper for adc_pl_data_path.  VIO controls allow
// the operator to stop the AXI sink deliberately and verify that FIFO pressure,
// overflow reporting and recovery behave as designed.  All ILA probes are in
// clk_axis; acquisition-domain status bits are synchronized before probing.
module adc_stream_hw_probe #(
    parameter integer FRAME_WORDS = 4096,
    parameter integer ASYNC_COUNT_W = 11
) (
    input  logic        clk_acq,
    input  logic        rst_acq,
    input  logic        clk_axis,
    input  logic        rst_axis,
    input  logic        adc_ready,
    input  logic        pair_valid,
    input  logic [13:0] sample_rise_u14,
    input  logic [13:0] sample_fall_u14,
    input  logic        sample_clip
);

    logic stream_enable_axis;
    logic stream_ready_axis;
    logic clear_stats_axis;
    (* ASYNC_REG = "TRUE" *) logic [1:0] stream_enable_acq_sync = 2'b00;
    (* ASYNC_REG = "TRUE" *) logic [1:0] clear_stats_acq_sync = 2'b00;

    logic [31:0] axis_tdata;
    logic        axis_tvalid;
    logic        axis_tlast;
    logic [31:0] source_word_count;
    logic [31:0] frontend_stream_word_count;
    logic [31:0] dropped_word_count;
    logic        overflow_sticky;
    logic [6:0]  frontend_fifo_level;
    logic [ASYNC_COUNT_W-1:0] async_write_level;
    logic [ASYNC_COUNT_W-1:0] async_read_level;
    logic        async_almost_full;
    logic        async_write_reset_busy;
    logic        async_read_reset_busy;

    (* ASYNC_REG = "TRUE" *) logic [1:0] overflow_axis_sync = 2'b00;
    (* ASYNC_REG = "TRUE" *) logic [1:0] almost_full_axis_sync = 2'b00;
    (* ASYNC_REG = "TRUE" *) logic [1:0] write_reset_busy_axis_sync = 2'b11;

    logic [31:0] axis_transfer_count = 32'd0;
    logic [31:0] axis_frame_count = 32'd0;
    logic [15:0] axis_status;
    logic [18:0] axis_trace_control;

    always_ff @(posedge clk_acq) begin
        if (rst_acq) begin
            stream_enable_acq_sync <= 2'b00;
            clear_stats_acq_sync <= 2'b00;
        end else begin
            stream_enable_acq_sync <= {
                stream_enable_acq_sync[0], stream_enable_axis
            };
            clear_stats_acq_sync <= {
                clear_stats_acq_sync[0], clear_stats_axis
            };
        end
    end

    always_ff @(posedge clk_axis) begin
        if (rst_axis) begin
            overflow_axis_sync <= 2'b00;
            almost_full_axis_sync <= 2'b00;
            write_reset_busy_axis_sync <= 2'b11;
        end else begin
            overflow_axis_sync <= {
                overflow_axis_sync[0], overflow_sticky
            };
            almost_full_axis_sync <= {
                almost_full_axis_sync[0], async_almost_full
            };
            write_reset_busy_axis_sync <= {
                write_reset_busy_axis_sync[0], async_write_reset_busy
            };
        end
    end

    always_ff @(posedge clk_axis) begin
        if (rst_axis || clear_stats_axis) begin
            axis_transfer_count <= 32'd0;
            axis_frame_count <= 32'd0;
        end else if (axis_tvalid && stream_ready_axis) begin
            axis_transfer_count <= axis_transfer_count + 1'b1;
            if (axis_tlast)
                axis_frame_count <= axis_frame_count + 1'b1;
        end
    end

    assign axis_status = {
        stream_enable_axis,
        async_read_reset_busy,
        write_reset_busy_axis_sync[1],
        almost_full_axis_sync[1],
        overflow_axis_sync[1],
        async_read_level
    };
    assign axis_trace_control = {
        axis_status,
        axis_tlast,
        stream_ready_axis,
        axis_tvalid
    };

    adc_pl_data_path #(
        .FRAME_WORD_W(16),
        .FRONTEND_FIFO_DEPTH(64),
        .ASYNC_FIFO_DEPTH(1024)
    ) data_path_i (
        .clk_acq(clk_acq),
        .rst_acq(rst_acq),
        .clk_axis(clk_axis),
        .rst_axis(rst_axis),
        .capture_enable(stream_enable_acq_sync[1]),
        .clear_stats(clear_stats_acq_sync[1]),
        .cfg_frame_words(FRAME_WORDS[15:0]),
        .adc_ready(adc_ready),
        .pair_valid(pair_valid),
        .sample_rise_u14(sample_rise_u14),
        .sample_fall_u14(sample_fall_u14),
        .sample_clip(sample_clip),
        .m_axis_tdata(axis_tdata),
        .m_axis_tvalid(axis_tvalid),
        .m_axis_tready(stream_ready_axis),
        .m_axis_tlast(axis_tlast),
        .proc_pair_valid(),
        .proc_rise_u14(),
        .proc_fall_u14(),
        .proc_pair_clip(),
        .proc_average_valid(),
        .proc_average_u14(),
        .proc_average_clip(),
        .source_word_count(source_word_count),
        .stream_word_count(frontend_stream_word_count),
        .dropped_word_count(dropped_word_count),
        .overflow_sticky(overflow_sticky),
        .frontend_fifo_level(frontend_fifo_level),
        .async_write_level(async_write_level),
        .async_read_level(async_read_level),
        .async_almost_full(async_almost_full),
        .async_write_reset_busy(async_write_reset_busy),
        .async_read_reset_busy(async_read_reset_busy)
    );

    // Defaults after programming: capture enabled, sink ready, counters run.
    vio_stream_control stream_control_i (
        .clk(clk_axis),
        .probe_in0(axis_transfer_count),
        .probe_in1(axis_frame_count),
        .probe_in2(axis_status),
        .probe_out0(stream_enable_axis),
        .probe_out1(stream_ready_axis),
        .probe_out2(clear_stats_axis)
    );

    ila_adc_stream stream_ila_i (
        .clk(clk_axis),
        .probe0(axis_tdata),
        .probe1(axis_trace_control),
        .probe2(axis_transfer_count),
        .probe3(axis_frame_count)
    );

endmodule
