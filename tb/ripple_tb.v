//RIPPLE CARRY ADDER TB
`timescale 1ns/1ps

module ripple_test;

reg [7:0] A;
reg [7:0] B;
reg cin;

wire [7:0] sum;
wire cout;

RCA uut(.A(A),
        .B(B),
        .cin(cin),
        .sum(sum),
        .cout(cout));

    initial begin

        $dumpfile("dump_rca.vcd");
        $dumpvars(0, ripple_test);
        $monitor("TIME: %0t, A: %d, B: %d, SUM: %d, COUT: %b", $time, A, B, sum, cout);
        
        A = 8'd0;
        B = 8'd0;
        cin = 1'b0;
        #10;

        A = 8'd15;
        B = 8'd10;
        #10;

        A = 8'd100;
        B = 8'd50;
        #10;

        A = 8'd255;
        B = 8'd1;
        #10;

        A = 8'd200;
        B = 8'd55;
        #10;

        $finish;
    end

endmodule
