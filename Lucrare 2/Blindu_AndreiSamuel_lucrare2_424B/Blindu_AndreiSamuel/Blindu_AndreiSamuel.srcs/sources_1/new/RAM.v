`timescale 1ns / 1ps

module RAM(
    input ck,
    input we,
    input[2:0] adr,
    input[3:0] din,
    output reg [3:0] dout
    );
    
 reg [3:0] mem [ 0:7 ] ;
 
 //scrierea sincrona
 
 always @ (posedge ck)
 
 if (we == 1)
    mem[adr] <= din;
    
//citirea sincrona

always @ (posedge ck)
    dout <= mem[adr];       
endmodule
