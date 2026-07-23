//FULL ADDER MODULE

module FA(input A,
          input B,
          input cin,
          output sum,
          output cout);

    assign sum = A^B^cin;
    assign cout = (cin&(A^B))|(A&B);

endmodule