`timescale 1ns / 1ps

module test_TOPmare(

    );
reg [3:0] sa_in, sb_in, sc_in;
wire [3:0] s1_out, s2_out, s3_out;

TOPmare dut (.A(sa_in),
             .B(sb_in),
             .C(sc_in),
             .OUT1(s1_out),
             .OUT2(s2_out),
             .OUT3(s3_out));
             
initial begin
    sa_in = 3;
#20 sa_in = 12;
#20 sa_in = 5;
#20 $stop;
end

initial begin
    sb_in = 5;
#20 sb_in = 2;
#20 sb_in = 15;
#20 $stop;
end

initial begin
    sc_in = 7;
#20 sc_in = 1;
#20 sc_in = 14;
#20 $stop;
end
endmodule
