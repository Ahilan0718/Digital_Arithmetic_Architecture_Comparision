//STURCTURED PIPELINED MULTIPLIER TB
`timescale 1ns/1ps

module struct_multi_test;

reg clk;
reg reset;
reg [7:0] A;
reg [7:0] B;

wire [15:0] product;

pipelined_struct_multi DUT(.clk(clk),
                           .reset(reset),
                           .A(A),
                           .B(B),
                           .product(product));
    
    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump_struct_multi.vcd");
        $dumpvars(0, struct_multi_test);
        $monitor("TIME: %0t, A: %d, B: %d, PRODUCT: %d", $time, A, B, product);

        clk = 1'b0;
        reset = 1'b1;
        A = 8'd0;
        B = 8'd0;
        #10;

        reset = 1'b0;
        A = 8'd2;
        B = 8'd3;
        #10;

        A = 8'd5;
        B = 8'd4;
        #10;

        A = 8'd10;
        B = 8'd20;
        #10;

        A = 8'd20;
        B = 8'd7;
        #10;

        A = 8'd255;
        B = 8'd2;
        #10;

        A = 8'd0;
        B = 8'd0;
        #60;

        $finish;
    end

endmodule



