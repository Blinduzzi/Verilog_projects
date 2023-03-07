`timescale 1ns / 1ps


module MUX(
    input [7:0] in,
    input [2:0] sel,
    output out
    );
    
 assign out = in[sel];
endmodule
