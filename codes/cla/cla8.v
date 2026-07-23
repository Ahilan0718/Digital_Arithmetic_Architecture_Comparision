//8-bit CARRY LOOKAHEAD ADDER MODULE
module CLA8(input [7:0] A,
            input [7:0] B,
            input cin,
            output [7:0] sum,
            output cout);

    wire C4;

CLA4 lower(.A(A[3:0]),
           .B(B[3:0]),
           .cin(cin),
           .sum(sum[3:0]),
           .cout(C4));

CLA4 upper(.A(A[7:4]),
           .B(B[7:4]),
           .cin(C4),
           .sum(sum[7:4]),
           .cout(cout));

endmodule