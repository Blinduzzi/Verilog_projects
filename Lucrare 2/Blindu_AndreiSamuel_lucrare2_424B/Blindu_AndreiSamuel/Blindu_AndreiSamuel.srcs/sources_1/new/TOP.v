`timescale 1ns / 1ps

module TOP(
    input RESET,
    input CK,
    input[2:0] ADR,
    input[3:0] DIN,
    output[3:0] DOUT
    );
    
wire[3:0] wincomp;
wire woutcomp, wwe;
NUM numul (.ck(CK),
           .reset(RESET),
           .out(wincomp));

comp compul (.in(wincomp),
             .out(woutcomp));

FF flipflopul (.ck(CK),
               .in(woutcomp),
               .out(wwe));
 
RAM ramul (.ck(CK),
           .we(wwe),
           .adr(ADR),
           .din(DIN),
           .dout(DOUT));
                                        
endmodule
