`timescale 1ns / 1ps

module TOPmare(
        input [3:0] A,
        input [3:0] B,
        input [3:0] C,
        output [3:0] OUT1,
        output [3:0] OUT2,
        output [3:0] OUT3
    );

wire [3:0] w0, w1, w2;

TOPmic t0 (.a(A),
           .b(B),
           .min(w1),
           .max(w0));
           
TOPmic t1 (.a(w1),
           .b(C),
           .min(OUT1),
           .max(w2));

TOPmic t2 (.a(w2),
           .b(w0),
           .min(OUT2),
           .max(OUT3));
endmodule
