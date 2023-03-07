`timescale 1ns / 1ps

module FF(
    input ck,
    input in,
    output reg out
    );
 always @ ( posedge ck )
    out <= in ;   
endmodule
