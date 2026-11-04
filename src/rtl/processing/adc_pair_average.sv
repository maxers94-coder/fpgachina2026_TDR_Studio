`timescale 1ns/1ps

// Convert one ADS5474 DDR output pair into the 200 MSPS offset-binary stream
// consumed by echo_pipeline_top. Arithmetic is performed in signed space:
//   y = (signed(rise) + signed(fall)) >>> 1
// The arithmetic shift is intentional and matches the frozen golden-model
// convention for negative odd sums.
module adc_pair_average (
    input  logic        clk,
    input  logic        rst,
    input  logic        in_valid,
    input  logic [13:0] sample_rise_u14,
    input  logic [13:0] sample_fall_u14,

    output logic        out_valid,
    output logic [13:0] sample_u14,
    output logic        clip_event
);

    logic signed [13:0] rise_s14;
    logic signed [13:0] fall_s14;
    logic signed [14:0] pair_sum_s15;
    logic signed [13:0] pair_average_s14;

    always_comb begin
        // ADS5474 output format is offset binary. Flipping the MSB gives the
        // corresponding 14-bit two's-complement value without an adder.
        rise_s14 = $signed({~sample_rise_u14[13], sample_rise_u14[12:0]});
        fall_s14 = $signed({~sample_fall_u14[13], sample_fall_u14[12:0]});
        pair_sum_s15 = {rise_s14[13], rise_s14}
                     + {fall_s14[13], fall_s14};
        pair_average_s14 = pair_sum_s15 >>> 1;
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            out_valid <= 1'b0;
            sample_u14 <= 14'd8192;
            clip_event <= 1'b0;
        end else begin
            out_valid <= in_valid;
            clip_event <= 1'b0;
            if (in_valid) begin
                sample_u14 <= {
                    ~pair_average_s14[13],
                    pair_average_s14[12:0]
                };
                // Preserve clipping information from either physical edge.
                // Looking only at the averaged sample could hide a clipped
                // edge when the other edge pulls the average back in range.
                clip_event <= (sample_rise_u14 == 14'd0)
                           || (sample_rise_u14 == 14'd16383)
                           || (sample_fall_u14 == 14'd0)
                           || (sample_fall_u14 == 14'd16383);
            end
        end
    end

endmodule
