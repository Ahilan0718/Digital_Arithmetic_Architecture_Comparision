//4-bit CARRY LOOKAHEAD ADDER MODULE

module CLA4(input [3:0] A,
            input [3:0] B,
            input cin,
            output [3:0] sum,
            output cout);

    wire [3:0] G;
    wire [3:0] P;

    assign G = A&B;
    assign P = A^B;

    wire C1, C2, C3, C4;

    assign C1 = G[0] | (P[0]&cin);

    assign C2 = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C1);

    assign C3 = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C2);

    assign C4 = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C3);

    assign sum[0] = P[0]^cin;
    assign sum[1] = P[1]^C1;
    assign sum[2] = P[2]^C2;
    assign sum[3] = P[3]^C3;

    assign cout = C4;

endmodule