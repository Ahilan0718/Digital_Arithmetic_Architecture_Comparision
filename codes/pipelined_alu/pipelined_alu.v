//PIPELINED ALU MODULE

module pipe_alu(input clk,
                input reset,
                input [7:0] A,
                input [7:0] B,
                input [2:0] opcode,
                output reg [7:0] result,
                output reg carry,
                output reg zero);
    
    reg [7:0] A_reg;
    reg [7:0] B_reg;
    reg [2:0] opcode_reg;
    reg [7:0] result_reg;
    reg carry_reg;
    reg zero_reg;

    always @(posedge clk) begin

        if(reset) begin

            A_reg <= 8'd0;
            B_reg <= 8'd0;
            opcode_reg <= 3'd0;
            result_reg <= 8'd0;
            carry_reg <= 1'b0;
            zero_reg <= 1'b0;
        end

        else begin

            //STAGE 1
            A_reg <= A;
            B_reg <= B;
            opcode_reg <= opcode;

            //STAGE 2
            case(opcode_reg) 

                3'b000: begin //ADD

                    {carry_reg, result_reg} <= A_reg + B_reg;
                    zero_reg <= ((A_reg + B_reg) == 8'd0);
                end

                3'b001: begin //SUB

                    {carry_reg, result_reg} <= A_reg - B_reg;
                    zero_reg <= ((A_reg - B_reg) == 8'd0);
                end

                3'b010: begin //AND
                
                    result_reg <= A_reg & B_reg;
                    carry_reg <= 1'b0;
                    zero_reg <= ((A_reg & B_reg) == 8'd0);
                end

                3'b011: begin //OR

                    result_reg <= A_reg | B_reg;
                    carry_reg <= 1'b0;
                    zero_reg <= ((A_reg | B_reg) == 8'd0);
                end

                3'b100: begin //XOR

                    result_reg <= A_reg ^ B_reg;
                    carry_reg <= 1'b0;
                    zero_reg <= ((A_reg ^ B_reg) == 8'd0);
                end

                3'b101: begin //NOT(A)

                    result_reg <= ~A_reg;
                    carry_reg <= 1'b0;
                    zero_reg <= ((~A_reg) == 8'd0);
                end

                3'b110: begin //INC(A)

                    {carry_reg, result_reg} <= A_reg + 8'd1;
                    zero_reg <= ((A_reg + 8'd1) == 8'd0);
                end

                3'b111: begin //DEC(A)

                    {carry_reg, result_reg} <= A_reg - 8'd1;
                    zero_reg <= ((A_reg - 8'd1) == 8'd0);
                end

                default: begin

                    result_reg <= 8'd0;
                    carry_reg <= 1'b0;
                    zero_reg <= 1'b1;
                end
            endcase

            //STAGE 3
            result <= result_reg;
            carry <= carry_reg;
            zero <= zero_reg;
        
        end
    end

endmodule