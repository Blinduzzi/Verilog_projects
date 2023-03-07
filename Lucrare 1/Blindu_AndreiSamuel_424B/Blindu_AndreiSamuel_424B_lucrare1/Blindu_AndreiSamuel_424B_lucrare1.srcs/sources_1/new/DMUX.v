`timescale 1ns / 1ps

module DMUX(
        input en,
        input [2:0] sel,
        output [7:0] out
    );
 
 assign out = en << sel;
    
endmodule
