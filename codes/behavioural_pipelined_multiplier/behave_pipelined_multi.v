//BEHAVIOURAL PIPELINED MULTIPLIER MODULE 

module pipelined_multi(input clk,
                       input reset,
                       input [7:0] A,
                       input [7:0] B,
                       output reg [15:0] product);

    reg [7:0] A_reg;
    reg [7:0] B_reg;
    reg [15:0] product_reg;

    always @(posedge clk) begin

        if(reset) begin

            A_reg <= 8'd0;
            B_reg <= 8'd0;
            product_reg <= 16'd0;
            product <= 16'd0;
        end

        else begin

            //STAGE 1
            A_reg <= A;
            B_reg <= B;

            //STAGE 2
            product_reg <= A_reg * B_reg;

            //STAGE 3
            product <= product_reg;
        end
    end

endmodule