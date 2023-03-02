`timescale 1ns / 1ps

module TOPmic(
    input [3:0] a,
    input [3:0] b,
    output [3:0] min,
    output [3:0] max
    );

wire w;
COMP c (.in1(a),
        .in0(b),
        .en(w));
MUX minmux (.in1(a),
         .in0(b),
         .en(w),
         .out(min));
MUX maxmux (.in1(b),
         .in0(a),
         .en(w),
         .out(max));         
endmodule
