`timescale 1ns / 1ps

module test_TOP(

    );
    
 reg sreset, sck;
 reg [2:0] sadr;
 reg[3:0] sdin;
 wire [3:0] sdout;
 
 TOP dut (.CK(sck),
          .RESET(sreset),
          .ADR(sadr),
          .DIN(sdin),
          .DOUT(sdout));
 
 initial begin
    sck = 0;
    forever #10 sck = ~sck;
 end
 
 initial begin
    sreset = 1;
    sadr = 1;
    sdin = 7;
    #15 sreset = 0;
    #312 sadr = 6;
    sdin = 5;
    #18 sadr = 2;
    sdin = 3;
    #20 sadr = 3;
    sdin = 4;
    #20 sadr = 2;
    #20 sadr = 6;
    #110 $stop;
 end                  
endmodule


//numaratorul incepe sa numere de la valoarea 0, avand doar reset, pe frontul pozitiv al ceasului
//acesta poate sa numere maxim pana la 2^4 - 1, adica pana la 15, dupa care trece inapoi la valoarea 0
//valorile de pe iesirea numaratorului sunt "filtrate" de catre comparator, care permite trecerea valorii 1
//doar daca out are valoarea 14 sau 15
//dupa resetul initial, abia dupa 14 fronturi pozitive ale ceasului FF va primi valoarea 1, pe care acesta o memoreaza timp de 2 fronturi,
//dar decaland cu 1 numaratoarea, astfel se poate citi pe fronturile care corespund valorilor 15, 0 si 1 ale numaratorului
//valoarea de iesire de pe FF este write eanble-ul memoriei RAM, insemnand ca se poate scrie in memorie o valoare data de noi, abia dupa 
//primele 14 fronturi, la adresa data la intrare de noi
//cat timp write enableul este inactiv apoi, putem citi din memorie pe fronturile pozitive ce urmeaza 

//in exemplul prezentat, am incercat sa citesc la adresa 1 valoarea 7, si am citit la adresa 6 valoarea 5, si la adresa 2 valoarea 3
//se remarca faptul ca valoarile de pe frontul ceasului in care exista salturi ale lui write enable de la 0 la 1 nu vor citi, deoarece in simulator acesteri treceri
//se fac instant si we este inca 0 pe frontul respectiv
//dupa ce am citit cele doua valori, le-am afisat in ordinea crescatoare a adreselor pe sdout

//daca am face citirea pe frontul negativ al ceasului, circuitul ar putea scrie in memorie cate 2 valori pe fronturi consecutive, care
//au un numar de ordine de tipul 14k si 14k + 1, k numar natural, atat timp cat nu este dat vreun alt reset. ( numar de ordine insemnand grad al numerotarii fronturilor negative)
//abia dupa ce scriem niste valori in memorie, putem citi din aceasta si afisa pe dout

//rezumat: exemplul meu citeste pe fronturile corespunzatoare valorilor 0 si 1 ale numaratorului valorile 5 si 3 la adresele 6 si 2
//dupa care le afiseaza in ordinea adreselor 
