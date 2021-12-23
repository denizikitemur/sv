module lab6_g23_p1 (
input logic [31:0] komut,
output logic [6:0] opcode,
output logic we,
output logic [3:0] aluop,
output logic [4:0] rs1,
output logic [4:0] rs2,
output logic [4:0] rd,
output logic [31:0] imm,
output logic hata
);

assign opcode = komut[6:0];

always_comb
begin

hata = 0;


     if(opcode == 7'b0000001)
	begin
	rs1 = komut[19:15];
	rs2 = komut[24:20];
	rd =  komut[11:7] ;
	aluop = {komut[30],komut[14],komut[13],komut[12]};
	imm = 32'b0;
	if(rs1 == komut[19:15] &
	rs2 == komut[24:20] &
	rd ==  komut[11:7] &
	aluop == {komut[30],komut[14],komut[13],komut[12]} &
	imm == 32'b0)
		we=1;
      end

     else if(opcode == 7'b0000011)
	begin
	rs1 = komut[19:15];
	rd =  komut[11:7] ;
	aluop = {1'b0,komut[14],komut[13],komut[12] };
	imm = {20'b0 , komut[31:20] };
	rs2 = 5'b0;
	if(rs1 == komut[19:15]&
	rd == komut[11:7] &
	aluop == {1'b0,komut[14],komut[13],komut[12] }&
	imm == {20'b0 , komut[31:20] }&
	rs2 == 5'b0)
	we=1;
      end

     else if(opcode == 7'b0000111)
	begin
	rd =  komut[11:7] ;
	imm = {12'b0 , komut[31:12] };
	rs1 = 5'b0;
	rs2 = 5'b0;
	aluop = 4'b0; 
	if(rd == komut[11:7] &
	imm == {12'b0 , komut[31:12] }&
	rs1 == 5'b0 &
	rs2 == 5'b0 &
	aluop == 4'b0  )
	we=1;
      end
	
     else if(opcode == 7'b0001111)
	begin
	rs1 = komut[19:15];
	rs2 = komut[24:20];
	aluop = {1'b0,komut[14],komut[13],komut[12]};
	imm = {19'b0,komut[31:25],komut[11:7],1'b0};
	rd = 5'b0;
	 if(rs1 == komut[19:15] &
	rs2 == komut[24:20] &
	aluop == {1'b0,komut[14],komut[13],komut[12]} &
	imm == {19'b0,komut[31:25],komut[11:7],1'b0} &
	rd == 5'b0)
      end
	
	else
	begin
	
	hata = 1;
	we=0;
	rs1 = 5'b0;
	rs2 = 5'b0;
	aluop = 4'b0;
	imm = 32'b0;
	rd = 5'b0;
	
	end
end
endmodule