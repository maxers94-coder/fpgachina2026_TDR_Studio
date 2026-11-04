`timescale 1ns/1ps

// Connect the tested pulse source to the new frame checker with the two
// 100 MHz MMCM output phases. ADC codes are deterministic stand-ins; this
// test checks control/data alignment, not the analogue board interface.
module tb_pulse_frame_integration #(parameter integer PN_ENABLE=0);
    reg clk_dac=0, clk_acq=0, rst=1, ready=0;
    reg start_acq=0;
    reg [2:0] source_start_delay=0;
    reg start_dac=0;
    always #5 clk_dac=~clk_dac;
    initial begin
        #9.875;
        forever #5 clk_acq=~clk_acq;
    end

    wire repeat_enable, burst_active, source_owned, source_marker;
    wire source_tx_active, source_frame_active, source_frame_start;
    wire source_frame_last, engine_busy;
    wire [8:0] source_index;
    wire [15:0] source_frame_id;
    wire [2:0] source_mode;
    wire signed [15:0] source_sample;
    wire [5:0] frames_sent;
    reg [31:0] launch_meta=0, frame_meta=0;
    reg launch_marker=0, tx_marker=0;
    reg [13:0] rise_sample=0, fall_sample=0;
    wire avg_busy, done, error_pulse, error_sticky;
    wire [5:0] frames_seen;
    wire rise_we, fall_we;
    wire [8:0] rise_addr, fall_addr;
    wire signed [15:0] rise_q2, fall_q2;
    integer rise_count=0, fall_count=0;

    pulse_burst_32 burst_i (
        .clk(clk_dac),.rst(rst),.start(start_dac),.ready(ready),
        .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last),
        .repeat_enable(repeat_enable),.active(burst_active),
        .frames_sent(frames_sent)
    );
    sync_pulse_engine engine_i (
        .clk(clk_dac),.rst(rst),.ready(ready),
        .requested_mode(3'd5),.requested_width(6'd4),
        .requested_pn(PN_ENABLE != 0),
        .single_request(1'b0),.repeat_enable(repeat_enable),
        .clear_request(1'b0),.busy(engine_busy),.clear_accepted(),
        .rejected_sticky(),.aborted_sticky(),.completed_count(),
        .rejected_count(),.aborted_count(),.source_owned(source_owned),
        .source_sample(source_sample),.source_marker(source_marker),
        .source_tx_active(source_tx_active),
        .source_frame_active(source_frame_active),
        .source_frame_start(source_frame_start),
        .source_frame_last(source_frame_last),
        .source_index(source_index),.source_frame_id(source_frame_id),
        .source_mode(source_mode)
    );
    always @(posedge clk_dac) begin
        if (rst) begin
            launch_meta <= 0;
            launch_marker <= 0;
            start_dac <= 0;
            source_start_delay <= 0;
        end else begin
            launch_meta <= {source_frame_id,source_mode,
                (source_tx_active && source_owned && ready),
                (source_frame_last && source_owned && ready),
                (source_frame_start && source_owned && ready),
                (source_frame_active && source_owned && ready),
                source_index};
            launch_marker <= source_marker && source_owned && ready;
            start_dac <= 0;
            if (start_acq) source_start_delay <= 3'd4;
            else if (source_start_delay!=0) begin
                source_start_delay <= source_start_delay-1'b1;
                if (source_start_delay==1) start_dac <= 1;
            end
        end
    end
    always @(posedge clk_acq) begin
        if (rst) begin
            frame_meta <= 0;
            tx_marker <= 0;
            rise_sample <= 0;
            fall_sample <= 0;
        end else begin
            frame_meta <= launch_meta;
            tx_marker <= launch_marker;
            rise_sample <= 14'd8192 + launch_meta[8:0];
            fall_sample <= 14'd8292 + launch_meta[8:0];
        end
    end

    frame_average_pair_bram average_i (
        .clk_acq(clk_acq),.rst_acq(rst),.start_pulse(start_acq),
        .sample_rise_u14(rise_sample),.sample_fall_u14(fall_sample),
        .pair_valid(1'b1),.sample_clip(1'b0),
        .tx_marker(tx_marker),.frame_meta(frame_meta),
        .busy(avg_busy),.group_done_pulse(done),
        .frame_error_pulse(error_pulse),
        .frame_error_sticky(error_sticky),.frames_seen(frames_seen),
        .clip_flag_snapshot(),.overflow_count(),
        .rise_wr_en(rise_we),.rise_wr_addr(rise_addr),
        .rise_wr_data_q2(rise_q2),
        .fall_wr_en(fall_we),.fall_wr_addr(fall_addr),
        .fall_wr_data_q2(fall_q2)
    );

    always @(posedge clk_acq) begin
        if (error_pulse) $fatal(1,"frame checker rejected engine frame at %0d",frames_seen);
        if (rise_we) begin
            if (rise_addr!==rise_count[8:0] || rise_q2!==4*rise_count)
                $fatal(1,"rise average addr=%0d q2=%0d at %0d",
                    rise_addr,rise_q2,rise_count);
            rise_count=rise_count+1;
        end
        if (fall_we) begin
            if (fall_addr!==fall_count[8:0] || fall_q2!==4*(fall_count+100))
                $fatal(1,"fall average addr=%0d q2=%0d at %0d",
                    fall_addr,fall_q2,fall_count);
            fall_count=fall_count+1;
        end
        if (done) begin
            if (frames_seen!==32 || frames_sent!==32 ||
                rise_count!==512 || fall_count!==512)
                $fatal(1,"incomplete average frames=%0d sent=%0d rise=%0d fall=%0d",
                    frames_seen,frames_sent,rise_count,fall_count);
            $display("PASS: pulse engine metadata and dual-lane 32-frame average aligned");
            $finish;
        end
    end
    initial begin
        repeat (8) @(negedge clk_dac);
        rst=0; ready=1;
        repeat (8) @(negedge clk_acq);
        start_acq=1;
        @(negedge clk_acq); start_acq=0;
    end
    initial begin #800_000; $fatal(1,"integration timeout"); end
endmodule

module tb_pn_frame_integration;
    tb_pulse_frame_integration #(.PN_ENABLE(1)) test();
endmodule
