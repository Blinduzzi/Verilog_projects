`timescale 1ns / 1ps

module NUM(
        input ck,
        input reset,
        output reg [3:0] out
    );
    
 always @ ( posedge ck)
 
 if(reset) out <= 0;
 else out <= out + 1;
 
    
endmodule
