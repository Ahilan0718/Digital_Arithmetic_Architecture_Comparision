//RIPPLE CARRY ADDER MODULE

module RCA(input [7:0] A,
           input [7:0] B,
           input cin,
           output [7:0] sum,
           output cout);

    wire c0, c1, c2, c3, c4, c5, c6;

    FA FA1(.A(A[0]), 
           .B(B[0]),
           .cin(cin),
           .sum(sum[0]),
           .cout(c0));

    FA FA2(.A(A[1]), 
           .B(B[1]),
           .cin(c0),
           .sum(sum[1]),
           .cout(c1));

    FA FA3(.A(A[2]), 
           .B(B[2]),
           .cin(c1),
           .sum(sum[2]),
           .cout(c2));

    FA FA4(.A(A[3]), 
           .B(B[3]),
           .cin(c2),
           .sum(sum[3]),
           .cout(c3));

    FA FA5(.A(A[4]), 
           .B(B[4]),
           .cin(c3),
           .sum(sum[4]),
           .cout(c4));

    FA FA6(.A(A[5]), 
           .B(B[5]),
           .cin(c4),
           .sum(sum[5]),
           .cout(c5));

    FA FA7(.A(A[6]), 
           .B(B[6]),
           .cin(c5),
           .sum(sum[6]),
           .cout(c6));

    FA FA8(.A(A[7]), 
           .B(B[7]),
           .cin(c6),
           .sum(sum[7]),
           .cout(cout));

endmodule

