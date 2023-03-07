`timescale 1ns / 1ps

module comparator(
        input [2:0] a,
        input [2:0] b,
        output reg [2:0] out
    );   
 always @ (*)
 if( a > b)
    out = 3'b100;
 else if ( a == b )
    out = 3'b010;
 else 
    out = 3'b001;
endmodule
