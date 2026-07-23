//BOOTH MULTIPLIER MODULE

module BM (input clk,
           input reset,
           input start,
           input signed [3:0] M,
           input signed [3:0] Q,
           output reg signed [7:0] product,
           output reg done);

    localparam IDLE = 2'd0;
    localparam EXECUTE = 2'd1;
    localparam SHIFT = 2'd2;
    localparam DONE = 2'd3;

    reg [1:0] state;

    reg signed [4:0] A;
    reg signed [4:0] M_reg;
    reg signed [3:0] Q_reg;
    reg Q_1;

    reg [2:0] count;
    reg signed [9:0] tempo;

    always @(posedge clk) begin

        if(reset) begin

            state <= IDLE;
            M_reg <= 5'd0;
            Q_reg <= 4'd0;
            A <= 5'd0;
            count <= 3'd0;
            Q_1 <= 1'b0;
            product <= 8'd0;
            done <= 1'd0;
        end

        else begin

            case(state) 

                IDLE: begin

                    done <= 1'b0;

                    if(start) begin

                        A <= 5'd0;
                        M_reg <= {M[3], M};
                        Q_reg <= Q;
                        Q_1 <= 1'b0;
                        count <= 3'd4;
                        product <= 8'd0;
                        state <= EXECUTE;
                    end
                end

                EXECUTE: begin

                    case({Q_reg[0], Q_1})

                        2'b00: begin

                            A <= A;
                        end

                        2'b01: begin

                            A <= A + M_reg;
                        end

                        2'b10: begin

                            A <= A - M_reg;
                        end

                        2'b11: begin

                            A <= A;
                        end
                    endcase

                    state <= SHIFT;
                end

                SHIFT: begin

                    tempo = {A, Q_reg, Q_1};
                    tempo = tempo >>> 1;

                    A <= tempo[9:5];
                    Q_reg <= tempo[4:1];
                    Q_1 <= tempo[0];

                    count <= count - 3'd1;

                    if(count == 3'd1) begin

                        state <= DONE;
                    end
                    else begin

                        state <= EXECUTE;
                    end
                end

                DONE : begin

                    product <= {A[3:0], Q_reg};
                    done <= 1'b1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule





