`timescale 1ns / 1ps

module MUX(
        input [3:0] in1,
        input [3:0] in0,
        input en,
        output reg [3:0] out
    );
  always @(*)
    if(en)
        out = in1 ;
    else
        out = in0;
endmodule
