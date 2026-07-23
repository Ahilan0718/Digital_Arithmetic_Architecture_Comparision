//PIPELINED ALU TB

module pipe_alu_test;

reg clk;
reg reset;
reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire carry;
wire zero;

pipe_alu DUT(.clk(clk),
               .reset(reset),
               .A(A),
               .B(B),
               .opcode(opcode),
               .result(result),
               .carry(carry),
               .zero(zero));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump_alu.vcd");
        $dumpvars(0, pipe_alu_test);
        $monitor("TIME: %0t, A: %d, B: %d, OPCODE: %b, RESULT: %d, CARRY: %b, ZERO: %b", $time, A, B, opcode, result, carry, zero);

        clk = 1'b0;
        reset = 1'b1;
        A = 8'd0;
        B = 8'd0;
        opcode = 3'd0;
        #10;

        reset = 1'b0;
        A = 8'd20;
        B = 8'd10;
        opcode = 3'd0;
        #10;

        A = 8'd20;
        B = 8'd5;
        opcode = 3'd1;
        #10;

        A = 8'd12;
        B = 8'd10;
        opcode = 3'd2;
        #10;

        A = 8'd12;
        B = 8'd10;
        opcode = 3'd3;
        #10;

        A = 8'd12;
        B = 8'd10;
        opcode = 3'd4;
        #10;

        A = 8'd12;
        B = 8'd0;
        opcode = 3'd5;
        #10;

        A = 8'd12;
        B = 8'd0;
        opcode = 3'd6;
        #10;

        A = 8'd12;
        B = 8'd0;
        opcode = 3'd7;
        #10;

        A = 8'd255;
        B = 8'd1;
        opcode = 3'd0;
        #10;

        A = 8'd5;
        B = 8'd5;
        opcode = 3'd1;
        #10;

        A = 8'd0;
        B = 8'd0;
        opcode = 3'd0;
        #30;

        $finish;
    end

endmodule



