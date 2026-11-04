`timescale 1ns/1ps

module corr_mac #(
    parameter integer N = 1024,
    parameter integer L = 640,
    parameter integer K = 256,
    parameter integer LAG_MIN = 0,
    parameter integer N_ADDR_W = $clog2(N),
    parameter integer L_ADDR_W = $clog2(L),
    parameter integer K_ADDR_W = $clog2(K)
) (
    input  logic                    clk,
    input  logic                    rst,

    input  logic                    diff_wr_valid,
    input  logic [N_ADDR_W-1:0]     diff_wr_addr,
    input  logic signed [16:0]      diff_wr_data_q2,
    input  logic                    template_wr_valid,
    input  logic [L_ADDR_W-1:0]     template_wr_addr,
    input  logic signed [15:0]      template_wr_data_q14,

    input  logic                    start,
    output logic                    busy,
    output logic                    done,
    output logic                    result_valid,
    output logic [N_ADDR_W-1:0]     result_lag,
    output logic signed [63:0]      result_q16,
    output logic [31:0]             overflow_count
);

    localparam logic signed [48:0] ACC_MAX_EXT = 49'sd140737488355327;
    localparam logic signed [48:0] ACC_MIN_EXT = -49'sd140737488355328;

    (* ram_style = "block" *) logic signed [16:0] difference_mem [0:N-1];
    (* ram_style = "block" *) logic signed [15:0] template_mem [0:L-1];

    logic [K_ADDR_W-1:0] request_lag_index;
    logic [L_ADDR_W-1:0] request_tap_index;
    logic requests_done;
    logic read_valid;
    logic [K_ADDR_W-1:0] response_lag_index;
    logic [L_ADDR_W-1:0] response_tap_index;
    logic signed [16:0] difference_rd_data;
    logic signed [15:0] template_rd_data;
    logic product_valid;
    logic [K_ADDR_W-1:0] product_lag_index;
    logic [L_ADDR_W-1:0] product_tap_index;
    logic signed [32:0] product_reg;
    logic signed [47:0] accumulator;

    logic [N_ADDR_W-1:0] read_index;
    logic signed [32:0] product;
    logic signed [48:0] accumulator_ext;
    logic signed [47:0] accumulator_next;
    logic accumulator_overflow;

    assign read_index = LAG_MIN + request_lag_index + request_tap_index;
    assign product = $signed(difference_rd_data) * $signed(template_rd_data);

    always_comb begin
        accumulator_ext = {{1{accumulator[47]}}, accumulator}
                        + {{16{product_reg[32]}}, product_reg};
        accumulator_overflow = 1'b0;
        if (accumulator_ext > ACC_MAX_EXT) begin
            accumulator_next = 48'sh7FFF_FFFF_FFFF;
            accumulator_overflow = 1'b1;
        end else if (accumulator_ext < ACC_MIN_EXT) begin
            accumulator_next = -48'sd140737488355328;
            accumulator_overflow = 1'b1;
        end else begin
            accumulator_next = accumulator_ext[47:0];
        end
    end

    initial begin
        if (LAG_MIN < 0 || (LAG_MIN + K - 1 + L - 1) >= N)
            $error("Illegal linear-correlation window");
    end

    always_ff @(posedge clk) begin
        if (diff_wr_valid)
            difference_mem[diff_wr_addr] <= diff_wr_data_q2;
        if (template_wr_valid)
            template_mem[template_wr_addr] <= template_wr_data_q14;

        if (rst) begin
            busy <= 1'b0;
            done <= 1'b0;
            result_valid <= 1'b0;
            result_lag <= '0;
            result_q16 <= '0;
            overflow_count <= '0;
            request_lag_index <= '0;
            request_tap_index <= '0;
            requests_done <= 1'b0;
            read_valid <= 1'b0;
            response_lag_index <= '0;
            response_tap_index <= '0;
            difference_rd_data <= '0;
            template_rd_data <= '0;
            product_valid <= 1'b0;
            product_lag_index <= '0;
            product_tap_index <= '0;
            product_reg <= '0;
            accumulator <= '0;
        end else begin
            done <= 1'b0;
            result_valid <= 1'b0;

            if (start && !busy) begin
                busy <= 1'b1;
                request_lag_index <= '0;
                request_tap_index <= '0;
                requests_done <= 1'b0;
                read_valid <= 1'b0;
                product_valid <= 1'b0;
                accumulator <= '0;
                overflow_count <= '0;
            end else if (busy) begin
                // One synchronous BRAM read request is issued per cycle.
                // read_valid and the response indices describe the data that
                // was registered by the previous request.
                if (!requests_done) begin
                    difference_rd_data <= difference_mem[read_index];
                    template_rd_data <= template_mem[request_tap_index];
                    read_valid <= 1'b1;
                    response_lag_index <= request_lag_index;
                    response_tap_index <= request_tap_index;

                    if (request_tap_index == L-1) begin
                        request_tap_index <= '0;
                        if (request_lag_index == K-1) begin
                            requests_done <= 1'b1;
                        end else begin
                            request_lag_index <= request_lag_index + 1'b1;
                        end
                    end else begin
                        request_tap_index <= request_tap_index + 1'b1;
                    end
                end else begin
                    read_valid <= 1'b0;
                end

                // Register the multiplier result so the BRAM/DSP delay and
                // the 48-bit accumulator carry chain are in separate cycles.
                product_valid <= read_valid;
                if (read_valid) begin
                    product_reg <= product;
                    product_lag_index <= response_lag_index;
                    product_tap_index <= response_tap_index;
                end

                if (product_valid) begin
                    if (accumulator_overflow)
                        overflow_count <= overflow_count + 1'b1;

                    if (product_tap_index == L-1) begin
                        result_valid <= 1'b1;
                        result_lag <= LAG_MIN + product_lag_index;
                        result_q16 <= {{16{accumulator_next[47]}}, accumulator_next};
                        accumulator <= '0;

                        if (product_lag_index == K-1) begin
                            busy <= 1'b0;
                            done <= 1'b1;
                        end
                    end else begin
                        accumulator <= accumulator_next;
                    end
                end
            end
        end
    end

endmodule

