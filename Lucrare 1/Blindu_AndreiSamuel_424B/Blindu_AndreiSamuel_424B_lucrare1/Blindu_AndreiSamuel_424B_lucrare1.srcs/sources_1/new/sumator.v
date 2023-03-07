`timescale 1ns / 1ps

module sumator(
        input [2:0] a,
        input [2:0] b,
        output [2:0] out,
        output co
    );
 assign {co,out} = a + b ;
endmodule
