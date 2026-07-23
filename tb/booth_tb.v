//BOOTH MULTIPLIER TB
`timescale 1ns/1ps

module booth_test;

reg clk;
reg reset;
reg start;
reg signed [3:0] M;
reg signed [3:0] Q;

wire signed [7:0] product;
wire done;

BM uut(.clk(clk),
       .reset(reset),
       .start(start),
       .M(M),
       .Q(Q),
       .product(product),
       .done(done));
    
    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump_booth.vcd");
        $dumpvars(0, booth_test);

        clk = 1'b0;
        reset = 1'b1;
        start = 1'b0;
        M = 4'd0;
        Q = 4'd0;
        #10;

        reset = 1'b0;
        M = 4'sd3;
        Q = 4'sd2;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("3 X 2");
        $display("PRODUCT: %0d", product);
        #20;

        M = -4'sd3;
        Q = 4'sd2;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("-3 X 2");
        $display("PRODUCT: %0d", product);
        #20;

        M = -4'sd4;
        Q = -4'sd2;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("-4 X -2");
        $display("PRODUCT: %0d", product);
        #20;

        M = 4'sd7;
        Q = -4'sd1;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("7 X -1");
        $display("PRODUCT: %0d", product);
        #20;

        M = -4'sd8;
        Q = 4'sd1;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("-8 X 1");
        $display("PRODUCT: %0d", product);
        #20;

        M = 4'sd7;
        Q = 4'sd7;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("7 X 7");
        $display("PRODUCT: %0d", product);
        #20;

        M = -4'sd8;
        Q = -4'sd8;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("-8 X -8");
        $display("PRODUCT: %0d", product);
        #20;

        M = 4'sd0;
        Q = 4'sd5;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("0 X 5");
        $display("PRODUCT: %0d", product);
        #20;

        M = 4'sd5;
        Q = 4'sd0;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("5 X 0");
        $display("PRODUCT: %0d", product);
        #20;

        M = -4'sd8;
        Q = 4'sd7;
        start = 1'b1;
        #10;

        start = 1'b0;
        #10;

        wait(done);

        $display("-8 X 7");
        $display("PRODUCT: %0d", product);
        #20;

        $finish;
    end

endmodule


