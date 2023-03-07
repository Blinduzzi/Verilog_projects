`timescale 1ns / 1ps

module MUXX(
    input [2:0] in1,
    input [2:0] in0,
    input  sel,
    output reg [2:0] out
    );
 
 always @ (*)
 if ( sel )
     out = in1;
 else
     out = in0;  
endmodule
