`timescale 1ns / 1ps

module TOP(
    input [2:0] A,
    input [2:0] B,
    input EN,
    output [2:0] OUT3,
    output [2:0] OUT2,
    output CFLAG,
    output OUT1,
    output OUT0
    );

wire [7:0] w0;
wire w1;
wire [2:0] w2, w3; 
DMUX dmux (.en(EN),
           .sel(A),
           .out(w0));

MUX mux (.in(w0),
         .sel(B),
         .out(w1));
assign OUT1 = w1;
sumator s (.a(A),
           .b(B),
           .out(w2),
           .co(CFLAG));

XORO soro (.a(A),
           .b(B),
           .out(w3));
           
MUXX muxx (.in1(w3),
           .in0(w2),
           .sel(w1),
           .out(OUT2));

comparator c (.a(A),
              .b(B),
              .out(OUT3));
or p0 (OUT0, A[0], B[0]);              
                    
endmodule
