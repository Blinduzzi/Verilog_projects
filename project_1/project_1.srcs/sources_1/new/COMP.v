`timescale 1ns / 1ps


module COMP(
        input [3:0] in1,
        input [3:0] in0,
        output reg en
    );
always @(*)
    if(in1 < in0)
        en = 1;
    else
        en = 0;
endmodule
