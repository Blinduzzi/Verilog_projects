`timescale 1ns / 1ps

module comp(
    input [3:0] in,
    output reg out
    );
  always @ (*)  
  if( in < 14 )
    out = 0;
  else
    out = 1;  
endmodule
