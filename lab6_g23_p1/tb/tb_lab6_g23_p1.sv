`timescale 1ns/1ps

module tb_lab6_g23_p1();
   logic [4:0] rs1   ;
   logic [4:0] rs2   ;
   logic [31:0] komut;
   logic [6:0] opcode;
   logic [3:0] aluop ;
   logic [4:0] rd    ;
   logic [31:0] imm  ;
   logic hata,we;

lab6_g23_p1 uut0(
 .rs1(rs1), .rs2(rs2), .we(we), .komut(komut), .opcode(opcode), .aluop(aluop), .rd(rd), .imm(imm), .hata(hata)
);
initial begin 

komut = 32'b10011000001011011001110100000001;#10;
komut = 32'b00101100111001101001101000000011;#10;
komut = 32'b11101010001100100011101100000111;#10;
komut = 32'b01010100010001000001101110001111;#10;
komut = 32'b01010100010001000001101110011111;#10;
$stop;
end

endmodule