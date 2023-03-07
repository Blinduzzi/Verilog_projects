`timescale 1ns / 1ps

module XORO(
        input [2:0] a,
        input [2:0] b,
        output [2:0] out
    );
 assign out = a ^ b;
endmodule
