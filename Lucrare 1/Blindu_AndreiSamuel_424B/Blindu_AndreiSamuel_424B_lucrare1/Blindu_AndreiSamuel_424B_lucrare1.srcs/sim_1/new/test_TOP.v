`timescale 1ns / 1ps

module test_TOP(

    );
reg [2:0] sa_in, sb_in;
reg sen_in;
wire [2:0] s3_out, s2_out;
wire scf_out, s1_out, s0_out;

TOP dut (.A(sa_in),
         .B(sb_in),
         .EN(sen_in),
         .OUT3(s3_out),
         .OUT2(s2_out),
         .CFLAG(scf_out),
         .OUT1(s1_out),
         .OUT0(s0_out));
initial begin
    sa_in = 0;
#20 sa_in = 7;
#20 sa_in = 2;
#20 sa_in = 1;
#20 sa_in = 4;
#20  $stop;
end

initial begin
    sb_in = 2;
#20 sb_in = 1;
#20 sb_in = 5;
#20 sb_in = 3;
#20 sb_in = 0;
#20  $stop;
end

initial begin
    sen_in = 1;
#50 sen_in = 0;
#50   $stop;
end

//pe s3_out o sa vedem mereu rezultatul compararii lui a si b ca numere zecimale
//s3_out functioneaza ca un decodor, care pune 1 pe iesirea corespunzatoare ( greater than, equal sau lower than intre a si b)

// in cazul in care EN este 1
//daca a si b sunt egale, pe  s2_out vedem rezultatul a ^ b
//daca a si b sunt diferite, pe s2_out vedem suma lor, cu carryul respectiv pe scf_out

//in cazul in care EN este 0, pe s2_out vedem intotdeauna suma lui a si b cu carryul respectiv, daca este cazul
// la suma e de precizat, cum e in cazul 7 + 1, ca rezultatul va fi 0 pe s2_out si carry 1

// pe s0_out vedem rezultatul SAU dintre primul bit a lui a si primul a lui b
endmodule
