//STRUCTURED PIPELINED MULTIPLIER MODULE (5-STAGE)

module pipelined_struct_multi(input clk,
                              input reset,
                              input [7:0] A,
                              input [7:0] B,
                              output reg [15:0] product);

    reg [15:0] pp0_reg;
    reg [15:0] pp1_reg;
    reg [15:0] pp2_reg;
    reg [15:0] pp3_reg;
    reg [15:0] pp4_reg;
    reg [15:0] pp5_reg;
    reg [15:0] pp6_reg;
    reg [15:0] pp7_reg;

    reg [15:0] sum0_reg;
    reg [15:0] sum1_reg;
    reg [15:0] sum2_reg;
    reg [15:0] sum3_reg;
    reg [15:0] sum4_reg;
    reg [15:0] sum5_reg;

    reg [15:0] final_sum_reg;


    always @(posedge clk) begin

        if(reset) begin

            pp0_reg <= 16'd0;
            pp1_reg <= 16'd0;
            pp2_reg <= 16'd0;
            pp3_reg <= 16'd0;
            pp4_reg <= 16'd0;
            pp5_reg <= 16'd0;
            pp6_reg <= 16'd0;
            pp7_reg <= 16'd0;

            sum0_reg <= 16'd0;
            sum1_reg <= 16'd0;
            sum2_reg <= 16'd0;
            sum3_reg <= 16'd0;
            sum4_reg <= 16'd0;
            sum5_reg <= 16'd0;

            final_sum_reg <= 16'd0;

            product <= 16'd0;
        end

        else begin

            //STAGE 1
            pp0_reg <= (B[0]) ? {8'd0, A} : 16'd0;
            pp1_reg <= (B[1]) ? {8'd0, A}<<1 : 16'd0;
            pp2_reg <= (B[2]) ? {8'd0, A}<<2 : 16'd0;
            pp3_reg <= (B[3]) ? {8'd0, A}<<3 : 16'd0;
            pp4_reg <= (B[4]) ? {8'd0, A}<<4 : 16'd0;
            pp5_reg <= (B[5]) ? {8'd0, A}<<5 : 16'd0;
            pp6_reg <= (B[6]) ? {8'd0, A}<<6 : 16'd0;
            pp7_reg <= (B[7]) ? {8'd0, A}<<7 : 16'd0;

            //STAGE 2
            sum0_reg <= pp0_reg + pp1_reg;
            sum1_reg <= pp2_reg + pp3_reg;
            sum2_reg <= pp4_reg + pp5_reg;
            sum3_reg <= pp6_reg + pp7_reg;

            //STAGE 3
            sum4_reg <= sum0_reg + sum1_reg;
            sum5_reg <= sum2_reg + sum3_reg;

            //STAGE 4
            final_sum_reg <= sum4_reg + sum5_reg;

            //STAGE 5
            product <= final_sum_reg;        
        end
    end

endmodule

    